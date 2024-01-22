; Simple calculator made in assembly by nx86
; TODO: addition, multiplication, etc. other calculation and algebra shit 
%include "funcs.asm"
extern print_Achar
extern os_return

SECTION .data
    
    msg  db "calculator", 0xa

SECTION .bss

input1: resb 20 ; reserve 20 bytes for first number
input2: resb 20 ; reserve 20 bytes for second number
    

SECTION .text

global main
    
    main:
        mov rax, msg
        call printmsg

        mov rdx, 20
        mov rcx, input1
        mov rbx, 0
        mov rax, 3
        push rcx
        mov r8, rcx
        pop rcx
        push r8
        int 80h

        mov rdx, 20
        mov rcx, input2
        mov rbx, 0
        mov rax, 3
        push rcx
        mov r9, rcx
        pop rcx
        push r9
        int 80h
        
        call add  

        call exit

