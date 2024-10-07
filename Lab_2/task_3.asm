section .rodata
    a: dd 3.0

section .bss
    x: resd 1
    
section .text
global main
main:
    ; x = arctg(1/(log2(a)))
    fld1
    fld dword[a]
    fyl2x
    fld1
    fxch st0, st1
    fpatan
    fstp dword[x]

    xor rax, rax
    ret