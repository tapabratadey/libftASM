# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_cat.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/17 15:47:38 by tadey             #+#    #+#              #
#    Updated: 2018/07/17 15:47:40 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; void ft_cat(const char *filename);
; takes in a fd -> reads from it -> write on the stdout

; Tells the assembler that we're writing 64-bit code
[bits 64]

; Tells the assembler what symbols (in our case functions) that we're trying to export
global _ft_cat
extern _open 

; The .bss section is where all variables can be initalized
section .bss
    buff resb 1024

; The .text section is where all code (instructions to execute) should be
section .text

; int ft_cat(int fd);
; rdi
_ft_cat:
    xor rax, rax
    mov r12, rdi        ; store the fd in r12
    ; cmp r12, 0 ; fd < 0
	; jl .exit

    .read:
    mov rax, 0x2000003  ; call the sys_read
    mov rdi, r12        ; fd = r12
    mov rsi, buff       ; buffer
    mov rdx, 1024       ; size 
    syscall             ; call sys_read    
    mov r13, rax        ; store the bytes read in r13
    cmp r13, 0          ; check if there's nothing more to read
    jz  .finish_loop    ; ret

    .write:
    xor rax, rax        ; clear out rax
    mov rax, 0x2000004  ; call sys_write
    mov rdi, 1          ; fd
    mov rsi, buff       ; write the buff
    mov rdx, r13        ; bytes to write
    syscall             ; call sys_write
    jmp .read           ; go back to read

    .finish_loop:
    ret

    .exit:
    leave
    ret