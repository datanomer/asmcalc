extern printf
SECTION .text
    ; ascii to integer
    atoi:
        push rbx
        push rcx
        push rdx
        push rsi
        mov rsi, rcx
        mov rax, 0
        mov rcx, 0
    ;convert input ascii decimal codes to intgers
    ;I have to research this conversion crap more
    mov cl, 0Ah
    mov rdi, 1000000000
    .cock:
        xor rdx, rdx
        div rdi
        add rax, 30h
        mov rsi, rdx
        mov rbx, rax
        inc rbx
        mov rax, rdi
        mov rdi, 0Ah
        xor rdx, rdx
        div rdi
        mov rdi, rax
        mov rax, rsi
        dec cl
        jnz .cock
        

    exit:
        mov rbx, 0
        mov rax, 1
        int 80h

