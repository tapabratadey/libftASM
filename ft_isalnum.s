# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalnum.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/15 17:12:24 by tadey             #+#    #+#              #
#    Updated: 2018/07/15 17:12:25 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


; int ft_isalnum(int c)
; check if the character is either an alphabet/number
; function takes an int
; then we compare that int to the ascii values of 1 to 9
; and ascii values of a to z and A to Z
; if the int is between the range then we return 1
; else we return 0
; we can call ft_isalpha and ft_isdigit

; Tells the assembler that we're writing 64-bit code
[bits 64]

extern _ft_isalpha
extern _ft_isdigit
; Tells the assembler that what symbols (in our case functions)
; that we're trying to export
global _ft_isalnum

; Tells .text section is where all code (instructions to execute) should be
section .text

; int ft_isalnum(int c)
_ft_isalnum:
    ; Functions return values in the register rax.
    xor rax, rax

    ; Create a local label. A local label is not exported and begins with "."
    .check:
    call    _ft_isdigit
    cmp     rax, 1
    je      .is_alnum
    call    _ft_isalpha
    cmp     rax, 1
    je      .is_alnum  
    jne     .not_alnum

    .is_alnum:
    mov rax, 1
    
    .not_alnum:
    ret