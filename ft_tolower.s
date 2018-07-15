# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_tolower.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/14 20:03:59 by tadey             #+#    #+#              #
#    Updated: 2018/07/14 20:04:01 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


; Tells the assembler that we're writing 64-bit code
[bits 64]

; Tells the assembler that what symbols (in our case functions) that we're trying to export
global _ft_tolower

; The .text section is where all code (instructions to execute) should live
section .text

; int ft_tolower(int c)
_ft_tolower:
    