; int ft_isprint(int c)
; check if the number is a printable
; function takes an int
; then we compare the int to the ascii values of 32 to 126
; if the int is between the range then we return 1
; else we return 0

; Tells the assembler that we're writing 64-bit code
[bits 64]

; Tells the assembler that what symbols (in our case functions)
; that we're trying to export
global _ft_isprint

; The .text section is where all code (instructions to execute) should be
section .text

; int _ft_isdigit(int c)
_ft_isprint:
    ; Function return values in the register rax.
    xor rax, rax

    ; Create a local label. A local label is not exported and begins with "."
    .check:
    cmp rdi, 32     ; cmp with 32
    jl .not_print   ; if it is less than 32 then can't print
    cmp rdi, 127    ; cmp with 127
    jg  .not_print  ; if it is greater than 127 then can't print

    .is_print:      ; else return value (rax) becomes 1
    mov rax, 1      

    .not_print:     ; not local label returns 0
    ret