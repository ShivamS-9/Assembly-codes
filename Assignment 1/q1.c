#include <stdio.h>
#define ll long long int

ll calculate(ll arr[], ll n);
// {
//     ll i = 0;
//     int val = 0;
//     while (i < n )
//     {
//         val ^= arr[i];
//         i++;
//     }
//     return val;
// }

int main()
{

    ll n;
    scanf("%lld", &n);
    ll arr_size = 2 * n + 1;
    ll arr[arr_size];
    for (ll i = 0; i < arr_size; i++)
    {
        scanf("%lld", &arr[i]);
    }

    ll ans = calculate(arr, arr_size);
    printf("%lld", ans);
    return 0;
}