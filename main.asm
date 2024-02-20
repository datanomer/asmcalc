; Simple calculator made in assembly by nx86
; TODO: convert input to printable integer, basic algebra operations and checking input for invalid stuff 
%include "funcs.asm"
extern printf
extern print_Achar
extern os_return


SECTION .data
       msg db "Assembly calculator",20 , 0
       msg2 db "1. add", 6, 0
       msg3 db "2. sub", 6, 0
       fmts db "%s", 10, 0
       fmtd db "%d", 10, 0
       ;ints db "0123456789", 10, 0
SECTION .bss

input1: resb 2 ; reserve 2 bytes for first number
input2: resb 2 ; reserve 2 bytes for second number
result: resb 2

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
    
    

    mov rsi, msg2
    mov rdi, fmts
    mov rax, 1
    call printf
    int 80h
    ; take 2 inputs
    ;sys_read 1 input
    mov rax, 3
    mov rbx, 0
    mov rcx, input1
    mov rdx, 20
    int 80h

    ; sys_read for second input
    mov rax, 3
    mov rbx, 0
    mov rcx, input2
    mov rdx, 20
    int 80h 
    ; call add routine
    call add
    ;convert input value to ascii-coded decimal and print it to screen
    ;exit 
    call exit

    ; add inputs together
    add:
    ; ascii to decimal thing ??
        mov rax, [input1]
        mov rbx, [input2]
        sub rax, "0"
        sub rbx, "0"
        add rax, rbx
    ;decimal to ascii 
        add rax, "0"

        mov [result], rax

       ; print result 
        mov rax, 4
        mov rbx, 1
        mov rcx, result
        mov rdx, 2
        int 80h
