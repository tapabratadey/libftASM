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
    cmp rsi, 41h    ; 41h = 'A'
                    ; jump to ret 1
   ; cmp rax, 5ah    ; 5ah = 'Z'
    ;j               ; jump to ret 1
    ;cmp rax, 61h    ; 61h = 'a'
                    ; jump to ret 1
   ; cmp rax, 7ah    ; 7ah = 'z'
    ;jg              ; jump to ret 1
    ret
; function takes an int 
; then we compare that int to the ascii values of a to z and A to Z
; if the int is between the range then we return 1
; else we return 0