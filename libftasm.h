/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libftasm.h                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tadey <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/07/15 17:29:39 by tadey             #+#    #+#             */
/*   Updated: 2018/07/17 10:18:18 by tadey            ###   ########.fr       */
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
extern int          ft_toupper(int c);
extern int          ft_tolower(int c);
extern int          ft_puts(const char *str);
extern void	        *ft_memset(void *b, int c, size_t len);
extern char         *ft_strcat(char *s1, const char *s2);
extern void         *ft_memcpy(void *dst, const void *src, size_t n);
extern char	        *ft_strdup(const char *src);
extern void         ft_cat(int fd);
extern int          ft_add(int a, int b);
extern int          ft_sub(int a, int b);
extern int          ft_mul(int a, int b);

#endif //LIBFT_ASM_
