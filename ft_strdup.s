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

; Tells the assembler that what symbols (in our case functions)
; that we're trying to export
global _ft_strdup
extern _ft_strlen
extern _malloc
extern _free

; The .text section is where all code (instructions to execute) should be
section .text

; char *ft_strdup(const char *src)
;                   rdi
_ft_strdup:
    xor rax, rax                ; clearing out rax

    mov r13, rdi                ; storing the source string rdi in r13 
    call _ft_strlen             ; find the strlen of the string which gets stored in rax
    mov r12, rax                ; storing the strlen rax in r12
    mov rdi, r12                ; storing the length in rdi for malloc to use
    push rdi                    ; push rdi to stack for malloc to use
    call _malloc                ; calling malloc to allocate that many bytes
    pop rdi                     ; pop rdi out of the stack after malloc is done
    ; rax points now points to allocated mem
    mov r14, rax                ; storing the returned pointer rax to r14

    cmp r14, 0                  ; error check if the pointer is null
    jz .end                     ; if null then jump to .end and return null

    mov r15, r14
    ; else start the loop
    .loop_start:
    cmp r12, 0                  ; cmp if r12 is 0
    jz  .finish_loop

    mov bl, byte [r13]          ; treating the source string as a byte and storing in bl
    mov byte [r14], bl          ; treating the pointer as a byte and storing bl to it (i.e the string)
    dec r12                     ; decrementing the size
    inc r13                     ; incrementing the source string
    inc r14                     ; incrementing the allocated string
    jmp .loop_start

    .finish_loop:
    mov byte [r14], 0           ; null terminating the string
    mov rax, r15                ; moving r14 into rax and then returning
    ret

    .end:
    mov rax, 0                  ; if allocated pointer is null then ret null
    ret
    
    ; exit
    ; mov rax, 0x02000001         ; system call for exit
    ; xor rdi, rdi                ; exit code 0
    ; syscall  