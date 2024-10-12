section .rodata
    x: dd 4.0
    num: dd 20
    sum: dd 1.0
    term: dd 1.0

section .bss
    result: resd 1

section .text
global main
main:
    mov rbp, rsp; 
    movss xmm0, dword[x]
    movss xmm1, dword[sum]
    movss xmm2, dword[term]
    mov ecx, 1 
    
.start_loop:
    cmp ecx, dword[num]
    jge .end_loop
        
    cvtsi2ss xmm3, ecx
    movss xmm4, xmm0  
    divss xmm4, xmm3 
    mulss xmm2, xmm4 
        
    addss xmm1, xmm2
        
    inc ecx
    jmp .start_loop
    
.end_loop:
    movss dword[result], xmm1 
    ret

