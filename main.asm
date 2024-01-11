; Simple calculator made in assembly by nx86
; TODO: addition, multiplication, etc. other calculation and algebra shit 
%include "funcs.asm"
extern print_Achar
extern os_return
extern printf

SECTION .data
    msg: db  "Calculator\0", 0
    fmt: db  "%s", 10, 0

SECTION .bss

input1: resb 4 ; reserve 4 bytes for first number
input2: resb 4 ; reserve 4 bytes for the action
input3: resb 4 ; reserve 4 bytes for the second number
    

SECTION .text

global main
    
    main:
        mov rax, msg
        call printmsg

        mov rdx, 4
        mov rcx, input1
        mov rbx, 0
        mov rax, 3
        
        mov rdx, 4
        mov rcx, input2
        mov rbx, 0
        mov rax, 3

;        call add

        call exit

        


;  Todo:  addition:
;    add:
         

 ;   TODO: subtraction:




