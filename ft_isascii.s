# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isascii.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/16 12:22:11 by tadey             #+#    #+#              #
#    Updated: 2018/07/16 12:22:16 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; int ft_isascii(int c)
; check if the character is ascii
; function takes an int
; then we compare that int to ascii values
; return 1 if it is ascii
; return 0 if not

; Tells the assembler that we're writing 64-bit
[bits 64]

; Tells the assembler that what symbols (in our case functions)
; that we're trying to export
global _ft_isascii

; Tells .text section is where all code (instructions to execute) should be
section .text

; int ft_isascii(int c)
_ft_isascii:
    ; Functions return values in the register rax
    xor rax, rax

    ; Create a local label. A local label is not exported and begins with "."
    .check:
    cmp rdi, 0
    jl  .notascii
    cmp rdi, 127
    jg  .notascii

    .is_ascii:
    mov rax, 1
    
    .notascii:
    ret
