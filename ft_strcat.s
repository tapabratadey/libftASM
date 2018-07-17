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
    mov r12, rdi            ; storing string1 rdi in r12
    mov r13, rsi            ; storing string2 rsi in r13
    call _ft_strlen         ; calling ft_strlen on string1
    mov r14, rax            ; storing strlen of string1 in r14

    .loop_start:
    mov bl, byte [r13]      ; storing the first byte of r13 and storing in bl
    cmp bl, 0               ; cmp with 0
    jz  .finish_loop        ; finish loop if it is null

    mov byte [r12 + r14], bl    ; move the second string 
    inc r14                     ; increment the index
    inc r13                     ; r13 is the second string pointer, increment that too
    jmp .loop_start             

    .finish_loop:
    mov bl, 0                   ; null terminate the second string
    mov [r12 + r14], bl         ; then place it at the end of the concat string
    mov rax, r12                ; return the string
    ret

; concat two strings
; first find the length of the first string
; then loop through the second string
; and start adding the second string at the end of the first string
; and null terminate it
; then return the string