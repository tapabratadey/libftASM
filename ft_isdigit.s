# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isdigit.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/15 16:33:09 by tadey             #+#    #+#              #
#    Updated: 2018/07/17 10:16:52 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


; int ft_isdigit(int c);
; check if the number is a digit
; function takes an int
; then we compare that int to the ascii values of 1 to 9
; if the int is between the range then we return 1
; else we return 0

; Tells the assembler that we're writing 64-bit code
[bits 64]

; Tells the assembler that what symbols (in our case functions)
; that we're trying to export
global _ft_isdigit

; The .text section is where all code (instructions to execute) should be
section .text

; int ft_isdigit(int c)
_ft_isdigit:
    ; Functions return values in the register rax.
    xor rax, rax

    ; Create a local label. A local label is not exported and begins with "."
    .check:
    cmp rdi, 48     ; cmp with 0
    jl  .not_digit  ; if it is less than 49 then not_digit
    cmp rdi, 57     ; cmp with 9
    jg  .not_digit  ; if it is greater than 57 then not_digit
    
    .is_digit:
    mov rax, 1

    .not_digit:
    ret
