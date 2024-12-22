#include <stdio.h>
#define ll long long int

ll nCr(ll n, ll r);
int main()
{
    ll n, r;
    scanf("%lld %lld", &n, &r);
    ll result = nCr(n, r);
    printf("%lld\n", result);
    return 0;
}
