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
#include <string.h>

extern unsigned int ft_strlen(const char* str);
extern void         ft_bzero(void *s, size_t n);
extern int          ft_isalpha(int c);
extern int          ft_isdigit(int c);

int main()
{
    #if 0
    printf("FT_ISDIGIT\n");
    printf("EXPECTED DIGIT:\n");\
    char *test = "0123456789";
    for(int i = 0; i < 10; i++){
        printf(" '%c' (%d): %s", test[i], (char)test[i], ft_isdigit(test[i]) ? "digit\n" : "not digit\n");
    }
    printf("EXPECTED NON-DIGIT:\n");
    char *test1 = "ABCabc/:~abc)&";
    for(int i = 0; i < strlen(test1); i++){
        printf(" '%c' (%d): %s", test1[i], (char)test1[i], ft_isdigit(test1[i]) ? "digit\n" : "not digit\n");
    } 
    #endif

    #if 0
    printf("FT_ISALPHA\n");
    printf("EXPECTED ALPHA:\n"); 
    printf(" 'A' (65)  : %s", ft_isalpha('A') ? "alpha\n" : "not alpha\n");
    printf(" 'B' (66)  : %s", ft_isalpha('B') ? "alpha\n" : "not alpha\n");
    printf(" 'C' (67)  : %s", ft_isalpha('C') ? "alpha\n" : "not alpha\n");
    printf(" 'Y' (89)  : %s", ft_isalpha('Y') ? "alpha\n" : "not alpha\n");
    printf(" 'Z' (90)  : %s", ft_isalpha('Z') ? "alpha\n" : "not alpha\n");
    printf(" 'a' (97)  : %s", ft_isalpha('a') ? "alpha\n" : "not alpha\n");
    printf(" 'b' (98)  : %s", ft_isalpha('b') ? "alpha\n" : "not alpha\n");
    printf(" 'c' (99)  : %s", ft_isalpha('c') ? "alpha\n" : "not alpha\n");
    printf(" 'Y' (93)  : %s", ft_isalpha('y') ? "alpha\n" : "not alpha\n");
    printf(" 'z' (122) : %s", ft_isalpha('z') ? "alpha\n" : "not alpha\n");
    printf("EXPECTED NON-ALPHA:\n");
    printf(" '@' (64)  : %s", ft_isalpha('@') ? "alpha\n" : "not alpha\n");
    printf(" '[' (91)  : %s", ft_isalpha('[') ? "alpha\n" : "not alpha\n");
    printf(" ']' (93)  : %s", ft_isalpha(']') ? "alpha\n" : "not alpha\n");
    printf(" '^' (94)  : %s", ft_isalpha('^') ? "alpha\n" : "not alpha\n"); 
    printf(" '1' (49)  : %s", ft_isalpha('1') ? "alpha\n" : "not alpha\n");
    printf(" '9' (57)  : %s", ft_isalpha('9') ? "alpha\n" : "not alpha\n");
    printf(" '$' (36)  : %s", ft_isalpha('$') ? "alpha\n" : "not alpha\n");
    printf(" '~' (126) : %s", ft_isalpha('~') ? "alpha\n" : "not alpha\n");
    printf(" '=' (61)  : %s", ft_isalpha('=') ? "alpha\n" : "not alpha\n");
    printf(" '{' (123) : %s", ft_isalpha('{') ? "alpha\n" : "not alpha\n");
    printf(" '`' (96)  : %s", ft_isalpha('`') ? "alpha\n" : "not alpha\n");
    printf(" ')' (41)  : %s", ft_isalpha(')') ? "alpha\n" : "not alpha\n");
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