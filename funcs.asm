extern printf
SECTION .text

;something 
; ex-printmsg:
;        push    rdx
;        push    rcx
;        push    rbx
;        push    rax 
;        call    slen
 
;        mov     rdx, rax
;        pop     rax
 
;        mov     rcx, rax
;        mov     rbx, 1
;        mov     rax, 4
;        int     80h
 
;        pop     rbx
;        pop     rcx
;        pop     rdx
;        ret


;    slen:
        
;        mov rbx, rax

;    nextchar:
    
;        cmp     byte[rbx], 0 
;        jz      finished
;        inc     rbx
;        jmp     nextchar
    
;    finished:
;        sub     rbx, rax
;        pop     rax
;        ret

; todo:
    add:
        push r8
        push r9
        add r8 ,r9
        pop r9
        push r8
        mov rbx, r8
        push rbx

    exit:
        mov rbx, 0
        mov rax, 1
        int 80h

