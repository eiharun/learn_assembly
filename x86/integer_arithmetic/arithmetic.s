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


_start:

addition:
    mov rsi, msg_add
    mov rdx, 5
    call stdout
    xor rax, rax
    mov rax, [a]
    add rax, [b]
    mov rdi, rax
    call dec_to_ascii
    mov rsi, newline
    mov rdx, 2
    call stdout

subtraction:
    mov rsi, msg_sub
    mov rdx, 6
    call stdout
    xor rax, rax
    mov rax, [a]
    sub rax, [b]
    mov rdi, rax
    call dec_to_ascii
    mov rsi, newline
    mov rdx, 2
    call stdout

multiplication:
    mov rsi, msg_mul
    mov rdx, 6
    call stdout
    xor rax, rax
    mov rax, [a]
    imul rax, [b]
    mov rdi, rax
    call dec_to_ascii
    mov rsi, newline
    mov rdx, 2
    call stdout

division:
    mov rsi, msg_div
    mov rdx, 6
    call stdout
    xor rax, rax
    xor rbx, rbx
    mov rax, [a]
    mov rbx, [b]
    cqo
    idiv rbx
    push rdx
    mov rdi, rax
    call dec_to_ascii
    mov rsi, msg_remainder
    mov rdx, 4
    call stdout
    pop rdi
    call dec_to_ascii
    mov rsi, newline
    mov rdx, 2
    call stdout

exit:
    mov rsi, newline
    mov rdx, 2
    call stdout
    mov rax, 60
    mov rdi, 0
    syscall ; exit

section .data
    a dq 25
    b dq 4
    msg_add db "Sum: ", 0
    msg_sub db "Diff: ", 0
    msg_mul db "Prod: ", 0
    msg_div db "Quot: ", 0
    msg_remainder db " r ", 0
    newline db 10, 0
    ascii_offset dq 48

section .bss
    buf resb 1 ; reserves [1] byte
