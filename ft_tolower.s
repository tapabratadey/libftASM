# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_tolower.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/14 20:03:59 by tadey             #+#    #+#              #
#    Updated: 2018/07/17 10:18:08 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


; int ft_tolower(int c)
; convert from uppercase to lowercase (return 1)
; else just return the uppercase alphabet (return char)

; Tells the assembler that we're writing 64-bit code
[bits 64]

; Tells the assembler that what symbols (in our case funcitons)
; that we're trying to export
global _ft_tolower

; The .text section is where all code (instructions to execute) should be
section .text

; int ft_tolower(int c)
_ft_tolower:
    ; Functions return values in the register rax.
    xor rax, rax

    ; Create a local label. A local label is not exported and begins with "."
    .check:
    cmp rdi, 65         ; cmp with 'A'
    jb  .return_as_is   ; if it is less than 65 then jump to return_as_is
    cmp rdi, 90         ; cmp with 'Z'
    jg  .return_as_is   ; if it is greater than 90 then jump to return_as_is

    .to_upper:          ; else 
    add rdi, 32         ; if it is in the range then add 32 to convert to lower
    mov rax, rdi        ; mov the rdi value to rax

    .return_as_is:      ; in return_as_is
    mov rax, rdi        ; since we want to return as is mov rdi to rax
    ret
