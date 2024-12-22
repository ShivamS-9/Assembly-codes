#include <stdio.h>
#define ll long long int
void binSearch(ll *arr, ll N, ll key, ll *result);

int main()
{
    ll key = 0;
    ll arr[32];
    ll result[2];
    result[0] = 0, result[1] = 0;
    for (ll i = 0; i < 32; i++)
    {
        scanf("%lld", &arr[i]);
    }
    scanf("%lld", &key);
    binSearch(arr, 32, key, result);
    printf("%lld %lld\n", result[0], result[1]);
    return 0;
}