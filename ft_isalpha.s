# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalpha.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/14 17:15:50 by tadey             #+#    #+#              #
#    Updated: 2018/07/14 17:16:18 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


; int ft_isalpha(int c);
; check if the character is an alphabet
; function takes an int 
; then we compare that int to the ascii values of a to z and A to Z
; if the int is between the range then we return 1
; else we return 0

; Tells the assembler that we're writing 64-bit code
[bits 64]

; Tells the assembler that what symbols (in our case functions)
; that we're trying to export
global _ft_isalpha

; The .text section is where all code (instructions to execute) should live
section .text

; int ft_isalpha(int c)
_ft_isalpha:
    ; Functions return values in the register rax. So, we will use that to
    ; store the number of character in the string
    xor rax, rax

    ; Create a local label. A local label is not exported and begins with "."
    .check:
    cmp rdi, 65     ; cmp with 'A'
    jl .not_alpha   ; if it is less than 65 then error
    cmp rdi, 90     ; cmp with 'Z'
    jle .is_alpha   ; if it is less than/equal to 90 then it is_alpha
    cmp rdi, 97     ; cmp with 'a'
    jl .not_alpha   ; if it is less than 97 then it is not alpha
    cmp rdi, 122    ; cmp with 'z'
    jg  .not_alpha  ; if it is greater than 122 then it is not an alpha

    .is_alpha:
    mov rax, 1

    .not_alpha:
    ret

    ; jge: jump if greater or equal
    ; jle: jump if less or equal
    ; if rdi - 65 = neg then jle not_alpha / pos then jge is_alpha
    ; if rdi - 90 = neg then jge not_alpha / pos then jle is_alpha
    ; if rdi - 97 = neg then jge not_alpha / pos then jle is_alpha
    ; if rdi - 122 = neg then