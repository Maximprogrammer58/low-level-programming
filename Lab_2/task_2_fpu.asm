%include "io64.inc"

section .rodata
    x: dd -5.0
    e: dd 2.71828

section .bss 
    result: resd 1
       
section .text
global main
main:
    ; e^x = 2^(x*log2(e))
    fld dword[x]
    fld dword[e]
    fyl2x   ; st1=st1*log2(st0), top++
    fld1
    fld st1
    fprem
    f2xm1   ; st0 = 2^st0 - 1
    fadd    ; st1 += st0, top++
    fscale  ; st0 = st0 * 2^[st1]
    fstp st1
    fstp dword[result]
    
    xor rax, rax
    ret