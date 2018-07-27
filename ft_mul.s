# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_mul.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/27 14:20:20 by tadey             #+#    #+#              #
#    Updated: 2018/07/27 14:32:11 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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
