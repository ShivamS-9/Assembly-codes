#include <stdio.h>
#define ll long long int

ll calculate(char* arr,long long int n);

int main()
{
    ll n;  
    scanf("%lld\n", &n);
    char arr[n+1];
    for (ll i = 0; i < n; i++)
    {
        scanf("%c", &arr[i]);

    }
    arr[n] = '\0';    
    ll ans=0;
    ans=calculate(arr,n);
    printf("%lld\n",ans);
    

    
  
    return 0;
}