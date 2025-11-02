.global _start

.data
string: .asciz "Hello World\n"
len = . - string

.text
_start:
    mov r7, #4
    mov r0, #1
    ldr r1, =string
    ldr r2, =len
    swi 0

    mov r7, #1
    mov r0, #0
    swi 0
