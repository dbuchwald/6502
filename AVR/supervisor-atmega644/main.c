#include <stdio.h>
#include <avr/io.h>
#include "main_shell.h"
#include "core.h"

int main(void)
{
  initSystem();

  runMainShell();

  return 0;
}
