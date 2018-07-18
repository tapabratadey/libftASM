# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/17 15:47:18 by tadey             #+#    #+#              #
#    Updated: 2018/07/17 15:47:20 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


; void  *ft_memcpy(void *dst, const void *src, size_t n)
; copies n bytes from byte string src to dst. the two byte strings are assumed
; to be the same length.

; Tells the assembler that we're writing 64-bit code
[bits 64]

; Tells the assembler that what symbols that what symbols (in our case functions)
; that we're trying to export
global _ft_memcpy

; The .text section is where all code (instructions to execute) should be
section .text

; void *ft_memcpy(void *dst, const void *src, size_t n)
;                   rdi    ,    rsi         ,   rdx
_ft_memcpy:
    ; Functions return values in the register rax
    xor rax, rax
    mov r12, rdi
    .loop_start:
    cmp rdx, 0
    ; mov bl, byste [rdi]
    jz  .finish_loop

    mov bl, byte [rsi]
    mov byte [rdi], bl
    dec rdx
    inc rdi
    inc rsi
    jmp .loop_start

    .finish_loop:
    mov rax, r12
    ret