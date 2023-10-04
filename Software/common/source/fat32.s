; FAT32/SD interface library
;
; This module requires some RAM workspace to be defined elsewhere:
; 
; fat32_workspace - page-aligned 512-byte workspace
; fat32_variables - 24 bytes of zero-page storage for variables etc
    .include "zeropage.inc"
    .include "spi_sd.inc"


    .export fat32_init
    .export fat32_file_read
    .export fat32_address
    .export fat32_opendirent
    .export fat32_finddirent
    .export fat32_openroot
    .export fat32_errorstage
    .export fat32_workspace


FSTYPE_FAT32 = 12

fat32_fatstart          = fat32_variables + $00  ; 4 bytes
fat32_datastart         = fat32_variables + $04  ; 4 bytes
fat32_rootcluster       = fat32_variables + $08  ; 4 bytes
fat32_sectorspercluster = fat32_variables + $0c  ; 1 byte
fat32_pendingsectors    = fat32_variables + $0d  ; 1 byte
fat32_address           = fat32_variables + $0e  ; 2 bytes
fat32_nextcluster       = fat32_variables + $10  ; 4 bytes
fat32_bytesremaining    = fat32_variables + $14  ; 4 bytes 

fat32_errorstage        = fat32_bytesremaining  ; only used during initialization
fat32_filenamepointer   = fat32_bytesremaining  ; only used when searching for a file

    .BSS

; fat32_workspace:  
;  .res 512 
fat32_workspace = $4000 ; really does need to be 'page aligned' due to math not worrying about carry


fat32_readbuffer = fat32_workspace


    .code

fat32_init:
    ; Initialize the module - read the MBR etc, find the partition,
    ; and set up the variables ready for navigating the filesystem

    ; Read the MBR and extract pertinent information
    ; Returns:
    ;    Carry set on Error. Error code in fat32_errorstage
    .scope 

    lda #0
    sta fat32_errorstage

    ; Sector 0
    lda #0
    sta sd_currentsector
    sta sd_currentsector+1
    sta sd_currentsector+2
    sta sd_currentsector+3

    ; Target buffer
    lda #<fat32_readbuffer
    sta sd_address
    lda #>fat32_readbuffer
    sta sd_address+1

    ; Do the read
    jsr sd_readsector


    inc fat32_errorstage ; stage 1 = boot sector signature check

    ; Check some things
    lda fat32_readbuffer+510 ; Boot sector signature 55
    cmp #$55
    bne fail
    lda fat32_readbuffer+511 ; Boot sector signature aa
    cmp #$aa
    bne fail


    inc fat32_errorstage ; stage 2 = finding partition

    ; Find a FAT32 partition

    ldx #0
    lda fat32_readbuffer+$1c2,x  
    cmp #FSTYPE_FAT32
    beq foundpart
    ldx #16
    lda fat32_readbuffer+$1c2,x
    cmp #FSTYPE_FAT32
    beq foundpart
    ldx #32
    lda fat32_readbuffer+$1c2,x
    cmp #FSTYPE_FAT32
    beq foundpart
    ldx #48
    lda fat32_readbuffer+$1c2,x
    cmp #FSTYPE_FAT32
    beq foundpart

fail:
  jmp error

foundpart:
    ; Read the FAT32 BPB
    lda fat32_readbuffer+$1c6,x 
    sta sd_currentsector
    lda fat32_readbuffer+$1c7,x
    sta sd_currentsector+1
    lda fat32_readbuffer+$1c8,x
    sta sd_currentsector+2
    lda fat32_readbuffer+$1c9,x
    sta sd_currentsector+3

    ; Target buffer
    lda #<fat32_readbuffer
    sta sd_address
    lda #>fat32_readbuffer
    sta sd_address+1


    jsr idle_clock
    jsr idle_clock

    jsr sd_readsector


    inc fat32_errorstage ; stage 3 = BPB signature check

    ; Check some things
    lda fat32_readbuffer + $1FE ; BPB sector signature 55
    cmp #$55
    bne fail
    lda fat32_readbuffer + $1FF ; BPB sector signature aa
    cmp #$aa
    bne fail

    inc fat32_errorstage ; stage 4 = RootEntCnt check

    lda fat32_readbuffer + $11 ; (17) RootEntCnt should be 0 for FAT32
    ora fat32_readbuffer + $12 ; (18)
    bne fail

    inc fat32_errorstage ; stage 5 = TotSec16 check

    lda fat32_readbuffer+19 ; TotSec16 should be 0 for FAT32
    ora fat32_readbuffer+20
    bne fail

    inc fat32_errorstage ; stage 6 = SectorsPerCluster LSB check

    ; Check bytes per filesystem sector, it should be 512 for any SD card that supports FAT32
    lda fat32_readbuffer+11 ; low byte should be zero
    bne fail

    inc fat32_errorstage ; stage 7 = SectorsPerCluster MSB
    lda fat32_readbuffer+12 ; high byte is 2 (512), 4, 8, or 16
    cmp #2
    bne fail

    inc fat32_errorstage ; stage 8 = SectorsPerCluster MSB


    ; Calculate the starting sector of the FAT
    clc
    lda sd_currentsector
    adc fat32_readbuffer + $0E  ; (14) reserved sectors LSB
    sta fat32_fatstart
    sta fat32_datastart
    
    lda sd_currentsector+1
    adc fat32_readbuffer + $0F  ; (15) reserved sectors hi
    sta fat32_fatstart+1
    sta fat32_datastart+1

    lda sd_currentsector+2
    adc #0
    sta fat32_fatstart+2
    sta fat32_datastart+2
    
    lda sd_currentsector+3
    adc #0
    sta fat32_fatstart+3
    sta fat32_datastart+3

    ; Calculate the starting sector of the data area
    ldx fat32_readbuffer+16   ; number of FATs
skipfatsloop:
    clc
    lda fat32_datastart
    adc fat32_readbuffer + $24 ; fatsize 0
    sta fat32_datastart
    lda fat32_datastart+1
    adc fat32_readbuffer + $25 ; fatsize 1
    sta fat32_datastart+1
    lda fat32_datastart+2
    adc fat32_readbuffer + $26 ; fatsize 2
    sta fat32_datastart+2
    lda fat32_datastart+3
    adc fat32_readbuffer + $27 ;
    sta fat32_datastart+3
    dex
    bne skipfatsloop

    ; Sectors-per-cluster is a power of two from 1 to 128
    lda fat32_readbuffer+13
    sta fat32_sectorspercluster

    ; Remember the root cluster
    lda fat32_readbuffer + $2C
    sta fat32_rootcluster
    lda fat32_readbuffer + $2D
    sta fat32_rootcluster+1
    lda fat32_readbuffer + $2E
    sta fat32_rootcluster+2
    lda fat32_readbuffer + $2F
    sta fat32_rootcluster+3


    clc
    rts

error:
    sec         ;  carry set to indicate error
    rts

    .endscope


fat32_seekcluster:
    ; Gets ready to read fat32_nextcluster, and advances it according to the FAT

    ; FAT sector = (cluster*4) / 512 = (cluster*2) / 256
    .scope

    lda fat32_nextcluster
    asl
    lda fat32_nextcluster+1
    rol
    sta sd_currentsector
    lda fat32_nextcluster+2
    rol
    sta sd_currentsector+1
    lda fat32_nextcluster+3
    rol
    sta sd_currentsector+2
    ; note: cluster numbers never have the top bit set, so no carry can occur

    ; Add FAT starting sector
    lda sd_currentsector
    adc fat32_fatstart
    sta sd_currentsector
    lda sd_currentsector+1
    adc fat32_fatstart+1
    sta sd_currentsector+1
    lda sd_currentsector+2
    adc fat32_fatstart+2
    sta sd_currentsector+2
    lda #0
    adc fat32_fatstart+3
    sta sd_currentsector+3

    ; Target buffer
    lda #<fat32_readbuffer
    sta sd_address
    lda #>fat32_readbuffer
    sta sd_address+1

    ; Read the sector from the FAT
    jsr sd_readsector

    ; Before using this FAT data, set currentsector ready to read the cluster itself
    ; We need to multiply the cluster number minus two by the number of sectors per 
    ; cluster, then add the data region start sector

    ; Subtract two from cluster number
    sec
    lda fat32_nextcluster
    sbc #2
    sta sd_currentsector
    lda fat32_nextcluster+1
    sbc #0
    sta sd_currentsector+1
    lda fat32_nextcluster+2
    sbc #0
    sta sd_currentsector+2
    lda fat32_nextcluster+3
    sbc #0
    sta sd_currentsector+3

    ; Multiply by sectors-per-cluster which is a power of two between 1 and 128
    lda fat32_sectorspercluster
spcshiftloop:
    lsr
    bcs spcshiftloopdone
    asl sd_currentsector
    rol sd_currentsector+1
    rol sd_currentsector+2
    rol sd_currentsector+3
    jmp spcshiftloop

spcshiftloopdone:
    ; Add the data region start sector
    clc
    lda sd_currentsector
    adc fat32_datastart
    sta sd_currentsector
    lda sd_currentsector+1
    adc fat32_datastart+1
    sta sd_currentsector+1
    lda sd_currentsector+2
    adc fat32_datastart+2
    sta sd_currentsector+2
    lda sd_currentsector+3
    adc fat32_datastart+3
    sta sd_currentsector+3

    ; That's now ready for later code to read this sector in - tell it how many consecutive
    ; sectors it can now read
    lda fat32_sectorspercluster
    sta fat32_pendingsectors

    ; Now go back to looking up the next cluster in the chain
    ; Find the offset to this cluster's entry in the FAT sector we loaded earlier

    ; Offset = (cluster*4) & 511 = (cluster & 127) * 4
    lda fat32_nextcluster
    and #$7f
    asl
    asl
    tay ; Y = low byte of offset

    ; Add the potentially carried bit to the high byte of the address
    lda sd_address+1
    adc #0
    sta sd_address+1

    ; Copy out the next cluster in the chain for later use
    lda (sd_address),y
    sta fat32_nextcluster
    iny
    lda (sd_address),y
    sta fat32_nextcluster+1
    iny
    lda (sd_address),y
    sta fat32_nextcluster+2
    iny
    lda (sd_address),y
    and #$0f
    sta fat32_nextcluster+3

    ; See if it's the end of the chain
    ora #$f0
    and fat32_nextcluster+2
    and fat32_nextcluster+1
    cmp #$ff
    bne notendofchain
    lda fat32_nextcluster
    cmp #$f8
    bcc notendofchain

    ; It's the end of the chain, set the top bits so that we can tell this later on
    sta fat32_nextcluster+3
notendofchain:

    rts
    .endscope


fat32_readnextsector:
    ; Reads the next sector from a cluster chain into the buffer at fat32_address.
    ;
    ; Advances the current sector ready for the next read and looks up the next cluster
    ; in the chain when necessary.
    ;
    ; On return, carry is clear if data was read, or set if the cluster chain has ended.

    ; Maybe there are pending sectors in the current cluster
    .scope
    lda fat32_pendingsectors
    bne readsector

    ; No pending sectors, check for end of cluster chain
    lda fat32_nextcluster+3
    bmi endofchain

    ; Prepare to read the next cluster
    jsr fat32_seekcluster

readsector:
    dec fat32_pendingsectors

    ; Set up target address  
    lda fat32_address
    sta sd_address
    lda fat32_address+1
    sta sd_address+1

    ; Read the sector
    jsr sd_readsector

    ; Advance to next sector
    inc sd_currentsector
    bne sectorincrementdone
    inc sd_currentsector+1
    bne sectorincrementdone
    inc sd_currentsector+2
    bne sectorincrementdone
    inc sd_currentsector+3

sectorincrementdone:
    ; Success - clear carry and return
    clc
    rts

endofchain:
    ; End of chain - set carry and return
    sec
    rts
    .endscope

fat32_openroot:
    ; Prepare to read the root directory
    .scope

    lda fat32_rootcluster
    sta fat32_nextcluster
    lda fat32_rootcluster+1
    sta fat32_nextcluster+1
    lda fat32_rootcluster+2
    sta fat32_nextcluster+2
    lda fat32_rootcluster+3
    sta fat32_nextcluster+3

    jsr fat32_seekcluster

    ; Set the pointer to a large value so we always read a sector the first time through
    lda #$ff
    sta sd_address+1

    rts
    .endscope


fat32_opendirent:
    .scope
    ; Prepare to read from a file or directory based on a dirent
    ;
    ; Point sd_address at the dirent

    ; Remember file size in bytes remaining
    ldy #28
    lda (sd_address),y
    sta fat32_bytesremaining
    iny
    lda (sd_address),y
    sta fat32_bytesremaining+1
    iny
    lda (sd_address),y
    sta fat32_bytesremaining+2
    iny
    lda (sd_address),y
    sta fat32_bytesremaining+3

    ; Seek to first cluster
    ldy #26
    lda (sd_address),y
    sta fat32_nextcluster
    iny
    lda (sd_address),y
    sta fat32_nextcluster+1
    ldy #20
    lda (sd_address),y
    sta fat32_nextcluster+2
    iny
    lda (sd_address),y
    sta fat32_nextcluster+3

    jsr fat32_seekcluster

    ; Set the pointer to a large value so we always read a sector the first time through
    lda #$ff
    sta sd_address+1

    rts
    .endscope


fat32_readdirent:
    .scope
    ; Read a directory entry from the open directory
    ;
    ; On exit the carry is set if there were no more directory entries.
    ;
    ; Otherwise, A is set to the file's attribute byte and
    ; sd_address points at the returned directory entry.
    ; LFNs and empty entries are ignored automatically.

    ; Increment pointer by 32 to point to next entry
    clc
    lda sd_address
    adc #32
    sta sd_address
    lda sd_address+1
    adc #0
    sta sd_address+1

    ; If it's not at the end of the buffer, we have data already
    cmp #>(fat32_readbuffer+$200)
    bcc gotdata

    ; Read another sector
    lda #<fat32_readbuffer
    sta fat32_address
    lda #>fat32_readbuffer
    sta fat32_address+1

    jsr fat32_readnextsector
    bcc gotdata

endofdirectory:
    sec
    rts

gotdata:
    ; Check first character
    ldy #0
    lda (sd_address),y

    ; End of directory => abort
    beq endofdirectory

    ; Empty entry => start again
    cmp #$e5
    beq fat32_readdirent

    ; Check attributes
    ldy #11
    lda (sd_address),y
    and #$3f
    cmp #$0f ; LFN => start again
    beq fat32_readdirent

    ; Yield this result
    clc
    rts
    .endscope


fat32_finddirent:
    .scope
    ; Finds a particular directory entry.  X,Y point to the 11-character filename to seek.
    ; The directory should already be open for iteration.

    ; Form ZP pointer to user's filename
    stx fat32_filenamepointer
    sty fat32_filenamepointer+1

    ; Iterate until name is found or end of directory
direntloop:
    jsr fat32_readdirent
    ldy #10
    bcc comparenameloop
    rts ; with carry set

comparenameloop:
    lda (sd_address),y
    cmp (fat32_filenamepointer),y
    bne direntloop ; no match
    dey
    bpl comparenameloop

    ; Found it
    clc
    rts
    .endscope


fat32_file_readbyte:
    .scope
    ; Read a byte from an open file
    ;
    ; The byte is returned in A with C clear; or if end-of-file was reached, C is set instead

    sec

    ; Is there any data to read at all?
    lda fat32_bytesremaining
    ora fat32_bytesremaining+1
    ora fat32_bytesremaining+2
    ora fat32_bytesremaining+3
    beq done

    ; Decrement the remaining byte count
    lda fat32_bytesremaining
    sbc #1
    sta fat32_bytesremaining
    lda fat32_bytesremaining+1
    sbc #0
    sta fat32_bytesremaining+1
    lda fat32_bytesremaining+2
    sbc #0
    sta fat32_bytesremaining+2
    lda fat32_bytesremaining+3
    sbc #0
    sta fat32_bytesremaining+3

    ; Need to read a new sector?
    lda sd_address+1
    cmp #>(fat32_readbuffer+$200)
    bcc gotdata

    ; Read another sector
    lda #<fat32_readbuffer
    sta fat32_address
    lda #>fat32_readbuffer
    sta fat32_address+1

    jsr fat32_readnextsector
    bcs done                   ; this shouldn't happen

gotdata:
    ldy #0
    lda (sd_address),y

    inc sd_address
    bne done
    inc sd_address+1
    bne done
    inc sd_address+2
    bne done
    inc sd_address+3

done:
  rts
    .endscope


fat32_file_read:
    .scope
    ; Read a whole file into memory.  It's assumed the file has just been opened 
    ; and no data has been read yet.
    ;
    ; Also we read whole sectors, so data in the target region beyond the end of the 
    ; file may get overwritten, up to the next 512-byte boundary.
    ;
    ; And we don't properly support 64k+ files, as it's unnecessary complication given
    ; the 6502's small address space

    ; Round the size up to the next whole sector
    lda fat32_bytesremaining
    cmp #1                      ; set carry if bottom 8 bits not zero
    lda fat32_bytesremaining+1
    adc #0                      ; add carry, if any
    lsr                         ; divide by 2
    adc #0                      ; round up

    ; No data?
    beq done

    ; Store sector count - not a byte count any more
    sta fat32_bytesremaining

    ; Read entire sectors to the user-supplied buffer
wholesectorreadloop:
    ; Read a sector to fat32_address
    jsr fat32_readnextsector

    ; Advance fat32_address by 512 bytes
    lda fat32_address+1
    adc #2                      ; carry already clear
    sta fat32_address+1

    ldx fat32_bytesremaining    ; note - actually loads sectors remaining
    dex
    stx fat32_bytesremaining    ; note - actually stores sectors remaining

    bne wholesectorreadloop

done:
    rts
    .endscope

