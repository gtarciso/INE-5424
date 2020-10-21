// EPOS RISC-V Program Starter

        .file "rv32_crt0.S"

        // Entry point called by SETUP for processors
        .section .text
        .align  4
        .global _start
        .type   _start, function
_start:
        // Temporary stack(s) for INIT are created and configure by SETUP
        la      sp, __boot_stack__

        // Set all bytes in the BSS section to zero.
        la      a0, __bss_start
        la      a1, __BSS_END__
        #bgeu    a0, a1, 2f
L1:     sd      zero, (a0)
        addi    a0, a0, 8
        bltu    a0, a1, L1

        // Call _init

        call      _init

        // Call main
        .align  4
        .globl  __epos_app_entry
        .type   __epos_app_entry, function
__epos_app_entry:
        call      main
        lw        a0, 0(sp)         // save main's return value to be used by exit()
        call      _fini
        call      _exit
