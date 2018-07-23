# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_sub.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/23 14:18:37 by tadey             #+#    #+#              #
#    Updated: 2018/07/23 14:18:38 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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
