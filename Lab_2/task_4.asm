%include "io64.inc"

section .rodata
    a: dd 3.0
    e: dd 2.71828
    two: dd 2.0
    x: dd 2.0
    y: dd -8.0
   
section .text
global main
main:
    ; y > sinh(x) - a
    ; sinh(x) = (e^x - e^(-x))/ 2
 
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
    fld dword[x]
    fchs
    fld dword[e]
    fyl2x
    fld1
    fld st1
    fprem
    f2xm1
    fadd
    fscale
    fstp st1
    
    ; (e^x - e^(-x)) / 2
    fsub
    fld dword[two]
    fxch st0, st1
    fdivr
    
    ; sinh(x) - a
    fld dword[a]
    fsub
    
    fld dword[y]
    fcompp
    jle false
    PRINT_DEC 4, 1
    jmp end
    
false:
    PRINT_DEC 4, 0
    
end:
    fstp st0
    xor rax, rax
    ret