section .data
    msg db "Input:   " ; msg is the memory address where "Hello World" lives
    newline db 10
    len equ $ - msg ; $ (current address) -(minus) msg(address) 

section .text
    global _start

_start:
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    mov rax, 1
    syscall ; Print Hello world
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    mov rax, 0
    syscall ; get input
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    mov rax, 1
    syscall ; print input
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    mov rax, 1
    syscall ; Print Hello world
    mov rax, 60
    mov rdi, 0
    syscall ; exit