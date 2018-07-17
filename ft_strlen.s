# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/14 15:39:15 by tadey             #+#    #+#              #
#    Updated: 2018/07/17 10:17:56 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; Tells the assembler that we're writing 64-bit code
[bits 64]

; Tells the assembler that what symbols (in our case functions) that we're trying to export
global _ft_strlen

; The .text section is where all code (instructions to execute) should live
section .text

; unsigned ft_strlen(const char *str)
_ft_strlen:
    ; Functions return values in the register rax. So, we will use that to store
    ; the number of characters in the string
    xor rax, rax

    ; Create a local label. A local label is not exported, and begins with "."
    .loop_start:
    mov bl, byte [rdi]   ; loads a single byte rdi(register destination index)(destination for data copies) into bl (rdx low 8bit)(bl branches itself to the address of rdi)
    cmp bl, 0           ; check if bl is 0
    jz  .finish_loop    ; if we hit a null byte (end of string), finish the loop

    inc rax             ; rax++
    inc rdi             ; rdi is a char* - increment it to point to the next character in the string
    jmp .loop_start     ; jump to the start of the loop again (in order to check the next character)

    .finish_loop:
   	ret                 ; return
