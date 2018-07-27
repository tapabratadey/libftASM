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

; The .bss section is where all variables can be initalized
; section .bss
;     buff resb 1024

; The .text section is where all code (instructions to execute) should be
section .text

; int ft_cat(int fd);
; rdi
_ft_cat:
    cmp rdi, 0x000000A
    jge .finish_loop
    xor rax, rax
    mov r12, rdi
    sub rsp, 1024       ; making space in stack for buffer
    
    .read:
    mov rax, 0x2000003  ; call the sys_read
    mov rdi, r12        ; fd = r12
    mov rsi, rsp        ; buffer
    mov rdx, 1024       ; size 
    syscall             ; call sys_read    
    mov r13, rax        ; store the bytes read in r13
    cmp r13, 0          ; check if there's nothing more to read
    jle  .finish_loop   ; ret

    .write:
    mov rax, 0x2000004  ; call sys_write
    mov rdi, 1          ; fd
    mov rsi, rsp        ; write the buff
    mov rdx, r13        ; bytes to write
    syscall             ; call sys_write
    jmp .read           ; go back to read


    .finish_loop:
    add rsp, 1024
    leave
    ret