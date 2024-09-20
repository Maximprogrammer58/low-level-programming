%include "io64.inc"
    
section .data
space db ' ', 0  

section .bss
arr: resd 100

section .text
global main
main: 
    GET_UDEC 4, r8d
    xor ecx, ecx
.input_start:
    cmp ecx, r8d
    je .input_end
    GET_DEC 4, [arr + 4*ecx]
    add ecx, 1
    jmp .input_start 
.input_end:
    xor ecx, ecx
.sort_out_loop_start:
    cmp ecx, r8d
    je .sort_out_loop_end
    mov r9d, [arr + 4*ecx]
    mov r10d, ecx
    sub r10d, 1
    mov r11d, r10d
.sort_inner_loop_start:
    cmp r11d, 0
    jl .sort_inner_loop_end
    cmp [arr + 4*r11d], r9d
    jle .sort_inner_loop_end
    mov r12d, [arr + 4*r11d]
    mov [arr + 4*r11d + 4], r12d    
    sub r11d, 1
    jmp .sort_inner_loop_start
.sort_inner_loop_end:
    mov [arr + 4*r11d + 4], r9d
    add ecx, 1
    jmp .sort_out_loop_start
.sort_out_loop_end:  
    xor ecx, ecx
.output_start:
    cmp ecx, r8d
    je .output_end
    PRINT_DEC 4, [arr + 4*ecx]
    PRINT_STRING [space]
    add ecx, 1
    jmp .output_start 
.output_end:
    xor ecx, ecx  
    ret