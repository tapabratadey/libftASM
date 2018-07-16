# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_puts.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/16 15:14:28 by tadey             #+#    #+#              #
#    Updated: 2018/07/16 15:18:26 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; int puts(const char *str)
; Writes the C string pointed by str
; to the standard output (stdout) and
; appends a newline character ('\n').
; upon success it return non-negative number
; the function returns EOF and sets the error indicator (ferror).
; System calls are APIs for the interface between the user space and the kernel space
; Steps

; Tells the assembler that we're writing 64-bit code
[bits 64]

; Tells the assembler that what symbols (in our case functions)
; that we're trying to export
global _ft_puts

section .data
new_line    db  10      ; new line

; The .text section is where all code (instructions to execute) should be
section .text

; int ft_puts(const char *str)
_ft_puts:
    ; Functions return values in the register rax
    xor rax, rax
    mov r12, rdi            ;storing rdi string in r12 temp register
    ;Create a local label. A local label is not exported and begins with "."
    .loop_start:
    cmp byte [r12], 0
    jz  .print_newline      ; once the pointer is null print a new line

    mov	rax, 0x2000004		; system call number (sys_write) gets passed in rax
    mov	rdi, 1		        ; file descriptor (stdout) sys_call arg fd gets passed in rdi
    mov	rsi, r12		    ; message to write gets passed in rsi
    mov	rdx, 1		        ; message length
    inc r12                 ; increment the string pointer
    syscall                 ; syscall
    jmp .loop_start         

    .print_newline:         ; print a new line
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, new_line
    mov rdx, 1
    syscall

    .finish_loop:
    ret

; so i guess it starts in a loop
; the string gets stored in rdi
; then we can load byte[rdi] to bl 
; check if bl is null cmp bl, 0
; rax | sys_call | rdi            |          rsi         |        rdx
;   1 | sys_write|unsigned int fd | const char* buff     |  size_t count
