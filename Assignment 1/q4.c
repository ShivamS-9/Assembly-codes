#include <stdio.h>
#define ll long long int

ll findSum(ll arr[], ll n);
// {
//     ll min = arr[0];
//     ll max = arr[0];
//     ll i = 1;
//     while (i < n)
//     {
//         ll temp = arr[i];
//         if (temp > max)
//             max = temp;
//         if (temp < min)
//             min = temp;
//         i++;
//     }
//     return min + max;
// }

int main()
{
    ll n;
    scanf("%lld", &n);
    ll arr[n];
    for (ll i = 0; i < n; i++)
    {
        scanf("%lld", &arr[i]);
    }
    ll ans = findSum(arr, n);
    printf("%lld\n", ans);

    return 0;
}