[bits 64]

global _ft_sub

section .text

; int ft_sub (int a, int b)
; a = rdi
; b = rsi
_ft_sub:
    xor rax, rax

    .sub:
    mov r12, rdi
    sub r12, rsi
    mov rax, r12
    ret