section .data
    msg db "abcdefgh", 10, 0 
    newline db 10
    len equ $ - msg - 1

section .text
    global _start

; TODO: Accept user input and reverse user input. and/or only reverse a section of the string

_start:
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    mov rax, 1
    syscall ; Print 

    mov rsi, msg            ; start ptr
    mov rdi, msg + len - 1  ; end ptr

loop_start:
    mov al, [rsi]
    mov bl, [rdi]
    mov [rdi], al
    mov [rsi], bl
    add rsi, 1
    sub rdi, 1
    cmp rsi, rdi
    jl loop_start

print_result:
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    mov rax, 1
    syscall ; Print 

print_newline:
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    mov rax, 1
    syscall ; Print 

exit:
    mov rax, 60
    mov rdi, 0
    syscall ; exit