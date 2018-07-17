# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_toupper.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/14 20:03:52 by tadey             #+#    #+#              #
#    Updated: 2018/07/17 10:18:13 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


; int ft_toupper(int c)
; convert from lowercase to uppercase (return 1)
; else just return the lowercase alphabet (return char)

; Tells the assembler that we're writing 64-bit code
[bits 64]

; Tells the assembler that what symbols (in our case functions)
; that we're trying to export
global _ft_toupper

; The .text section is where all code (instructions to execute) should be
section .text

; int ft_toupper(int c)
_ft_toupper:
    ; Functions return values in the register rax.
    xor rax, rax

    ; Create a local label. A local label is not exported and begins with "."
    .check:
    cmp rdi, 97         ; cmp with 'a'
    jl  .return_as_is   ; if it is less then 97 then return_as_is
    cmp rdi, 127        ; cmp with 'z'
    jg  .return_as_is   ; if it is less than 127 then return_as_is
    
    .to_upper:          ; else
    sub rdi, 32         ; if it is in the range then sub 32 to convert to upper
    mov rax, rdi        ; mov the rdi value to rax

    .return_as_is:      ; in return_as_is
    mov rax, rdi        ; since we want to return as is mov rdi to rax
    ret
