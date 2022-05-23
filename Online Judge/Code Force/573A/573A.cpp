#include <iostream>
using namespace std;
#define inf 0x3f3f3f3f
#define ll long long
const int N=200005;
#define lowbit(x) (x&(-x))
ll a[N];
int main()
{
    std::ios::sync_with_stdio(false);
    int n;
    cin>>n;
    int flag=0;
    for(int i=1;i<=n;i++)
    {
        cin>>a[i];
        while(a[i]%2==0) a[i]/=2;
        while(a[i]%3==0) a[i]/=3;
        if(i>1&&a[i]!=a[i-1])
            flag=1;
    }
    if(flag)
        cout<<"No"<<endl;
    else
        cout<<"Yes"<<endl;
    return 0;
}