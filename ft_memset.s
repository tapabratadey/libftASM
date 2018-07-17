# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memset.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/16 15:16:06 by tadey             #+#    #+#              #
#    Updated: 2018/07/17 10:17:10 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; void  *ft_memset(void *b, int c, size_t len);
; memset is used to fill a block of memory with particular value.
; sets len bytes of the string b to the value of c
; rdi = void *b     (register destination index)
; rsi = int c       (register source index)
; rdx = size_t len  (register d extended)

; Tells the assembler that we're writing 64-bit code
[bits 64]

; Tells the assembler that what symbols (in our case funcitons)
; that we're trying to export
global _ft_memset

; The .text section is where all code (instructions to execute) should be
section .text

; void	 *ft_memset(void *b, int c, size_t len);
;                   rdi    , rsi  ,  rdx
_ft_memset:
    ; Functions return values in the register rax
    xor rax, rax
    mov rbx, rsi                ; Store c (rsi) into rbx

    ; Create a local label. A local label is not exported, and begins with "."
    .loop_start:
    cmp rdx, 0                  ; cmp size_t len (rdx) to 0
    jz  .finish_loop            ; if it is 0 then finish_loop

    dec rdx                     ; decrement size_t len (rdx)
    mov byte [rdi + rdx], bl    ; set each char of the string to c (bl (treating it as a byte of rbx))
    jmp .loop_start 

    .finish_loop:
    mov rax, rdi                ; returning the string  
    ret
