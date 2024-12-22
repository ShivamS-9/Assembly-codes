#include <stdio.h>
#define ll long long int

void product(ll *arr, ll n);
// {
//     ll i = 0;
//     ll count = 0;
//     ll result = 1;

//     while (i < n)
//     {
//         if (arr[i] == 0)
//             count++;
//         else
//             result *= arr[i];
//         i++;
//     }

//     i = 0;
//     if (count > 1) // all 0
//     {
//         while (i < n)
//         {
//             arr[i] = 0;
//             i++;
//         }
//     }
//     else
//     {
//         while (i < n)
//         {
//             if (arr[i] == 0)
//                 arr[i] = result;
//             else if (count == 1)
//                 arr[i] = 0;
//             else
//                 arr[i] = result / arr[i];
//             i++;
//         }
//     }

//     return *arr;
// }

int main()
{
    ll n;
    scanf("%lld", &n);
    // printf("%lld\n", n);

    ll arr[n];
    for (ll i = 0; i < n; i++)
    {
        scanf("%lld", &arr[i]);
    }
    // printf("%lld\n", n);

    product(arr, n);
    // printf("%lld\n", n);
    for (ll i = 0; i < n; i++)
    {
        printf("%lld ", arr[i]);
    }
    return 0;
}
