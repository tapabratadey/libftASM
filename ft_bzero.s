# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_bzero.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/14 16:26:04 by tadey             #+#    #+#              #
#    Updated: 2018/07/14 16:26:08 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; void bzero(void *s, size_t n)
; rdi register will be a pointer to s and the rax register will be the number
; of bytes to set to 0 

; Tells the assembler that we're writing 64-bit code
[bits 64]

; Tells the assembler that what symbols (in our case functions) that we're trying to export
global _ft_bzero

; The .text section is where all code (instructions to execute) should live
section .text

; void	ft_bzero(void *s, size_t n)
_ft_bzero:
    ; Functions return values in the register rax. So, we will use that to store
    ; the number of characters in the string (rax is the counter)
    xor rax, rax

    ; Create a local label. A local label is not exported, and begins with "."
    .loop_start:
    cmp rsi, rax            ; check if rsi (register source index) is equal to rax (return register)
    jz  .finish_loop        ; if rax is not greater than 0 then finish the loop

    dec rsi                 ; rsi--
    mov byte [rdi + rsi], 0 ; rdi[rsi] = 0
    jmp .loop_start         ; jump to the start of the loop again (in order to check the next character)

    .finish_loop:
    ret                     ;ret
