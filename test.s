[bits 64]

global _ft_hello
section .data
    text db "Hello, World!", 10

section .text

_ft_hello:
    mov rax, 0x2000004  ; call sys_write
    mov rdi, 1          ; fd
    mov rsi, text       ; write the buff
    mov rdx, 14         ; bytes to write
    syscall             ; call sys_write
    ret