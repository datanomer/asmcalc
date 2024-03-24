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
       msg1 db "3. mul", 6, 0
       msg4 db "Action choice: ", 15, 0
       msg5 db "Output: ", 8,0
       fmts db "%s", 10, 0
       fmtd db "%d", 10, 0
SECTION .bss

choice: resb 10
input1: resb 10 ; reserve 10 quadword for first number
input2: resb 10 ; reserve 10 quadword for second number
result: rest 10

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
    mov rax, 3
    mov rbx, 0
    mov rcx, input1
    mov rdx, 2
    int 80h

    ; sys_read for second input
    mov rax, 3
    mov rbx, 0
    mov rcx, input2
    mov rdx, 2
    int 80h 
    
    mov rsi, msg4
    mov rdi, fmts
    mov rax, 1
    call printf
    int 80h
 
    mov rsi, msg2
    mov rdi, fmts
    mov rax, 1
    call printf
    int 80h
 
    mov rsi, msg3
    mov rdi, fmts
    mov rax, 1
    call printf
    int 80h

    mov rsi, msg1
    mov rdi, fmts
    mov rax, 1
    call printf
    int 80h

    mov rax, 3
    mov rbx, 0
    mov rcx, choice
    mov rdx, 2
    int 80h 
    
    mov ah, [choice]
    sub ah, "0"
    
    cmp ah, 1
    je add
    
    cmp ah, 2
    je sub

    cmp ah, 3
    je mul
    ;cmp ah, 4
    ;jz div

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

        jmp printmsg
        
    sub:
        mov rax, [input1]
        mov rbx, [input2]
        sub rax, "0"
        sub rbx, "0"
        sub rax, rbx

        add rax, "0"

        mov  [result], rax
        
        jmp printmsg


    mul:
        mov rax, [input1]
        mov rbx, [input2]
        sub rax, "0"
        sub rbx, "0"
        mul rax

        add rax, "0"

        mov  [result], ax
    
        jmp printmsg

    ; not working
    div:
        mov rax, [input1]
        mov rbx, [input2]
        div rbx
        sub rax, "0"
        sub rbx, "0"

        add rax, "0"

        mov  [result], ax
    
        jmp printmsg

    printmsg:
        mov rax, 4
        mov rbx, 1
        mov rcx, result
        mov rdx, 10
        int 80h


