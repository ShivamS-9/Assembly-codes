#include <stdio.h>
#define ll long long int

ll rotate(ll *arr, ll n);
// {
//     ll i = 1;
//    while (i < n-1)
//    {
//     ll temp = arr[i];
//     arr[i] = arr[i+1];
//     arr[i+1] = temp;
//     i++;
//    }
//    return *arr;
// }

int main()
{
    ll n;
    scanf("%lld", &n);
    ll arr[n];
    for (int i = 0; i < n; i++)
    {
        scanf("%lld", &arr[i]);
    }
    // printf("%p", *arr);
    *arr = rotate(arr, n);
    for (int i = 0; i < n; i++)
    {
        printf("%lld ", arr[i]);
    }

    return 0;
}