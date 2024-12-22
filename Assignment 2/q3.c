
#include <stdio.h>
#define ll long long int
#define MAX 100001


ll calculate(long long int n, char *s);

int main()
{
    ll n;
    scanf("%lld\n", &n);
    char s[MAX];
    scanf("%[^\n]s", s);
    ll ans = calculate(n, s);
    printf("%lld\n", ans);
}
