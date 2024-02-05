; Simple calculator made in assembly by nx86
; TODO: addition, multiplication, etc. other calculation and algebra shit 
%include "funcs.asm"
extern printf
extern print_Achar
extern os_return


SECTION .data
       msg db "Assembly calculator",20 , 0
       fmt db "%s", 10, 0 

SECTION .bss

input1: resb 20 ; reserve 20 bytes for first number
input2: resb 20 ; reserve 20 bytes for second number
result: resb 20 ; result

SECTION .text

global main
    
_start:
     
    main:
    ; message printing        
    push rbp
    mov rsi, msg
    mov rdi, fmt
    mov rax, 1
    call printf
    int 80h
    
    ; take 2 inputs
    mov rdx, 20
    mov rcx, input1
    mov rbx, 0
    mov rax, 3
    push rcx
    int 80h

    mov rdx, 20
    mov rcx, input2
    mov rbx, 0
    mov rax, 3

    int 80h
        
    ; call add routine located in: funcs.asm
    call add
    ;convert rbx register value to ascii
    call intoas  

    add:
        mov rax, [input1]
        sub rax, 30h
        mov rbx, [input2]
        sub rbx, 30h
        add rax, rbx
        add rax, 30h
        mov [result], rax
    
    sub: 
        push r8
        push r9
        sub r8, r9
        pop r9
        push r8
        mov r10, r8
        push r10
    
    intoas:
        push r10
        mov rax, 4
        mov rbx, 1
        mov rcx, [result]
        mov rdx, 1
        int 80h


    call exit


