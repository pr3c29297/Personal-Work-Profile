#include <iostream>
#include <math.h>
using namespace std;

int main() {
    int i,j=0,k,n,s=0,a[1001]={},p[1001]={},l;
    cin>>n>>k;
    for (i=2;i<=sqrt(n);i++){
        if (a[i]==0){
            for (j=2;j<=n/i;j++){
                a[i*j]=1;
            }
        }
    }
    j=0;
    for (i=2;i<=n;i++){
        if (a[i]==0){
            p[j]=i;
            j++;
        }
    }
    l=j;
    for (i=1;p[i]<=n;i++){
        for (j=0;j<l-1;j++){
            if (p[j]+p[j+1]+1 == p[i]){
                s++;
            }
        }
    }
    if (s>=k){
        cout<<"YES"<<endl;
    }
    else {
        cout<<"NO"<<endl;
    }
    return 0;
}
