%include "io64.inc"

section .rodata
    a: dd 1.0
    e: dd 2.71828
    two: dd 2.0
    x: dd 3.0
    y: dd -11.0
   
section .text
global main
main:
    ; y > sinh(x) - a
    ; sinh(x) = (e^x - e^(-x))/ 2
    ; e x ^ e x - ^ - 2 /
 
    ; e^x
    fld dword[x]
    fld dword[e]
    fyl2x
    fld1
    fld st1
    fprem
    f2xm1
    fadd
    fscale
    fstp st1
    
    ; e^(-x)
    fld1
    fdiv st0, st1
    
    ; (e^x - e^(-x)) / 2
    fsub
    fld dword[two]
    fdiv
    
    ; sinh(x) - a
    fld dword[a]
    fsub
    
    fld dword[y]
    fcomip st1
    ja .true
    PRINT_DEC 4, 0
    jmp .end
    
.true:
    PRINT_DEC 4, 1
    jmp .end
    
.end:
    fstp st0
    xor rax, rax
    ret