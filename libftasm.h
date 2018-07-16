/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libftasm.h                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tadey <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/07/15 17:29:39 by tadey             #+#    #+#             */
/*   Updated: 2018/07/15 17:29:39 by tadey            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */


#ifndef LIBFT_ASM_
#define LIBFT_ASM_

#include <stdio.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>

extern unsigned int ft_strlen(const char* str);
extern void         ft_bzero(void *s, size_t n);
extern int          ft_isalpha(int c);
extern int          ft_isdigit(int c);
extern int          ft_isalnum(int c);
extern int          ft_isascii(int c);
extern int          ft_isprint(int c);


#endif //LIBFT_ASM_