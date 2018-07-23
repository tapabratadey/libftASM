# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_add.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/23 14:18:29 by tadey             #+#    #+#              #
#    Updated: 2018/07/23 14:18:31 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

[bits 64]

global _ft_add

section .text

; int ft_add (int a, int b)
; a = rdi
; b = rsi
_ft_add:
    xor rax, rax

    .add:
    mov r12, rdi
    add r12, rsi
    mov rax, r12
    ret
