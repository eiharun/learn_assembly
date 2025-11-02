global _start
section .text
; calling convention ( %rdi, %rsi, %rdx, %rcx, %r8, and %r9) + stack
stdout: ; msg -> rsi , len -> rdx
    mov rdi, 1
    mov rax, 1
    syscall ; Print 
    ret

dec_to_ascii: ; dec -> rdi
    mov rax, rdi
    xor rcx, rcx
.loop:
    xor rdx, rdx
    mov rbx, 10
    div rbx ; rax -> quotent, rdx -> remainder
    add dl, '0'
    movzx rdx, dl
    push rdx
    inc rcx
    test rax, rax
    jnz .loop

.print_loop:
    pop rsi
    mov [buf], sil
    mov rsi, buf
    mov rdi, 1
    push rcx
    call stdout
    pop rcx
    loop .print_loop
    ret


factorial:
    push rbp
    mov rbp, rsp
    sub rsp, 8 ; new stack frame
    cmp rdi, 1
    jle .basecase   

    push rdi
    dec rdi
    call factorial
    pop rsi
    imul rax, rsi

    add rsp, 8
    pop rbp
    ret

.basecase:
    mov rax, 1
    add rsp, 8
    pop rbp
    ret

_start:
    push rbp
    mov rbp, rsp
    sub rsp, 8 ; new stack frame
    mov rdi, [factorial_value]
    call factorial
    mov rdi, rax
    call dec_to_ascii


exit:
    mov rsi, newline
    mov rdx, 2
    call stdout
    mov rax, 60
    mov rdi, 0
    syscall ; exit


section .data
    factorial_value dq 10
    newline db 10, 0

section .bss
    buf resb 1 ; reserves [1] byte
