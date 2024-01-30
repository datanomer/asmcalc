; Simple calculator made in assembly by nx86
; TODO: addition, multiplication, etc. other calculation and algebra shit 
%include "funcs.asm"
extern printf
extern print_Achar
extern os_return


SECTION .data
       msg db "Assembly calculator",20 , 0
       fmt db "%s", 10, 0 
       fmtnum db "%d", 20, 0

SECTION .bss

input1: resb 20 ; reserve 20 bytes for first number
input2: resb 20 ; reserve 20 bytes for second number
buffer: resb 20

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
        
    ; call add routine located in: funcs.asm
    call add
    
    push rbx
    mov rax, rbx
    lea rdi, [buffer + 19]
    mov byte [rdi], 0Ah

    call convert

    convert:
        dec rdi
        xor rdx, rdx
        mov rcx, 10
        div rcx
        add dl, "0"
        mov [rdi], dl
        test rax, rax
        jnz convert

    mov rax, 4
    mov rbx, 1
    lea rcx, [rdi]
    lea rdx, [buffer + 19]
    sub rdx ,rcx
    int 80h
    ;convert rbx register value to ascii

    call exit


