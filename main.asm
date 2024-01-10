; Simple calculator made in assembly by nx86
; TODO: addition, multiplication, etc. other calculation and algebra shit 
%include "funcs.asm"
extern print_Achar
extern os_return

SECTION .data
    msg: db  "calculator", 0Ah, 0h
    frstnum: db "1st number: ", 0Ah, 0h
    action: db "action(*, /, +, -): ", 0Ah, 0h
    sndnum: db "2nd number: ", 0Ah, 0h
    resultm: db "result: ", 0Ah, 0h

SECTION .bss

input1: resb 255 ; reserve 255 bytes for first number
input2: resb 255 ; reserve 255 bytes for the action
input3: resb 255 ; reserve 255 bytes for the second number
    

SECTION .text

global main
    
    main:
        mov rax, msg
        call printmsg

        mov rdx, 255
        mov rcx, input1
        mov rbx, 0
        mov rax, 3
        int 80h

        mov rdx, 255
        mov rcx, input2
        mov rbx, 0
        mov rax, 3
    
        call exit 
;  Todo:  addition:


 ;   TODO: subtraction:




