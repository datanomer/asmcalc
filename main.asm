; Simple calculator made in assembly by nx86
; TODO: convert input to printable integer, basic algebra operations and checking input for invalid stuff 
%include "funcs.asm"
extern printf
extern print_Achar
extern os_return


SECTION .data
       msg db "Assembly calculator",20 , 0
       msg2 db "ADDITION: ", 11, 0
       fmts db "%s", 10, 0
       fmtx db "%x", 10, 0
       ;ints db "0123456789", 10, 0
SECTION .bss

input1len: equ 12 ; reserve 20 bytes for first number
input1: resb input1len
input2len: equ 12 ; reserve 20 bytes for second number
input2: resb input2len
result: rest 100

SECTION .text

global main
    
_start:
     
    main:
    ; message printing        
    push rbp
    mov rsi, msg
    mov rdi, fmts
    mov rax, 1
    call printf
    int 80h

    ; take 2 inputs
    ;sys_read 1 input
    mov rax, 0
    mov rdi, 0
    mov rsi, input1
    mov rdx, input1len
    syscall
    ; sys_read for second input
    mov rax, 0
    mov rdi, 0
    mov rsi, input2
    mov rdx, input2len
    syscall
    
    ; call add routine
    call add
    ;convert input value to ascii-coded decimal and print it to screen
    call atoi

    mov rsi, rbx
    mov rdi, fmts
    mov rax, 1
    call printf
    int 80h
    ;exit 
    call exit

    ; add inputs together
    add:
        mov rax, [input1]
        mov rbx, [input2] 
        add rax, rbx
        mov rcx, rax
        push rcx

