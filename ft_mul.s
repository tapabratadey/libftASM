[bits 64]

global _ft_mul

section .text

; int ft_mul (int a, int b)
; a = rdi
; b = rsi
_ft_mul:
    xor rax, rax

    .mul:
    mov r12, rdi
    imul r12, rsi
    mov rax, r12
    ret