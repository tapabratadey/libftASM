# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/17 15:47:27 by tadey             #+#    #+#              #
#    Updated: 2018/07/17 15:47:30 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; char *ft_strdup(const char *src)
; allocates space for a copy of the char string

; Tells the assembler that we're writing 64-bit code
[bits 64]

; Tells the assembler that what symbols that what symbols (in our case functions)
; that we're trying to export
global _ft_strdup
extern _ft_strlen
extern _malloc
extern _free
extern _printf

; The .text section is where all code (instructions to execute) should be
section .text

; char *ft_strdup(const char *src)
;                   rdi
_ft_strdup:
    xor rax, rax

    mov r13, rdi                ; store the string in r13
    call _ft_strlen             ; find the strlen of the string
    mov r12, rax                ; store the strlen in r12
    mov rdi, r12                ; storing the length in rdi for malloc to use

    call _malloc                ; call malloc to allocate that many bytes
    ; on return, rax points to our newly-allocated memory
    mov r14, rax                ; storing the returned pointer to r14

    cmp r14, 0                  ; error check if the pointer is null
    jz .end                     ; if null then jump to .end and return null

    ; else start the loop
    .loop_start:
    cmp r12, 0
    jz  .finish_loop

    mov bl, byte [r13]          ; treating the string as a byte and storing in bl
    mov byte [r14], bl          ; treating the pointer as a byte and storing bl to it (i.e the string)
    dec r12                     ; decrementing the size
    inc r13                     ; incrementing the source string
    inc r14                     ; incrementing the allocated string
    jmp .loop_start

    .finish_loop:
    mov byte [r14], 0           ; null terminating the string
    ; mov rdi, rax                ; moving malloc's allocated string to rdi
    ; call _free                  ; then calling free
    mov rax, r14                ; moving r14 into rax and then returning
    ret

    .end:
    mov rax, 0
    ret