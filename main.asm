; Simple calculator made in assembly by nx86
; TODO: addition, multiplication, etc. other calculation and algebra shit 
%include "funcs.asm"
extern print_Achar
extern os_return

SECTION .bss

input1: resb 10 ; reserve 10 bytes for first number
input2: resb 5 ; reserve 5 bytes for the action
input3: resb 10 ; reserve 10 bytes for the second number
    

SECTION .text

global main
    
    main:
        mov rax, message
        call printmsg

        mov rbx, 0
        mov rax, 1
        int 80h
  
;  Todo:  addition:


 ;   TODO: subtraction:




