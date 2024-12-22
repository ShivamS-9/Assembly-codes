#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define ll long long int
#define MAX_LEN 10000
ll pali_check(char str[], ll n);
// {
//     ll i = 0, j = n - 1;
//     while (i <= n / 2 && j >= n / 2)
//     {
//         if (str[i] != str[j])
//             return 0;
//         i++;
//         j--;
//     }
//     return 1;
// }

int main()
{
    char *str  =  malloc(sizeof(char) *MAX_LEN);
    scanf("%s", str);
    ll n = strlen(str);
    int ans = pali_check(str, n);
    printf("%d\n", ans);
    return 0;
}