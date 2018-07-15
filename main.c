/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tadey <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/07/14 15:39:30 by tadey             #+#    #+#             */
/*   Updated: 2018/07/14 15:39:31 by tadey            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

extern unsigned int ft_strlen(const char* str);
extern void         ft_bzero(void *s, size_t n);
extern int          ft_isalpha(int c);

int main()
{
    #if 1
    printf("FT_ISALPHA\n");
    printf("%d", ft_isalpha('a'));
    // if (ft_isalpha('A') == 0)
    //     printf("Alpha");
    // printf("not alpha");
    #endif

    #if 0
    printf("FT_BZERO\n");
    char test[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int i = 0;

    ft_bzero(test, 10);
    while (i < 10)
    {
        printf("%d\n", test[i]);
        i++;
    }
    #endif

    #if 0
    printf("FT_STRLEN\n");
    printf("length of string: %d\n", ft_strlen("hello"));
    #endif
    return (0);
}