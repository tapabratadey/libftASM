# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcat.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/17 10:17:47 by tadey             #+#    #+#              #
#    Updated: 2018/07/17 10:17:51 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


; funtion takes two strings and contacts them as one

; Tells the assembler that we're writing 64-bit code
[bits 64]
extern _ft_strlen

; Tells the assembler that what symbols (in our case funcitons)
; that we're trying to export
global _ft_strcat

; The .text section is where all code (instructions to execute) should be
section .text

; char *ft_strcat(char *s1, const char *s2)
;                   rdi   ,      rsi
_ft_strcat:
    ; Functions return values in the register rax
    xor rax, rax
    mov r12, rdi            ; string1
    mov r13, rsi            ; string2
    call _ft_strlen
    .loop_start:
    mov bl, byte [r13]
    cmp bl, 0
    jz  .finish_loop

    

    .finish_loop:
    mov rax, r12
    ret

; concat two strings
; first find the length of the first string
; then loop through the second string
; and start adding the second string at the end of the first string
; and null terminate it
; then return the string  