#include <iostream>
#include <math.h>
using namespace std;

int main() {
    long long a,b,n,c=0,i,tot;
    cin>>n>>a>>b;
    i=(a/n)*n;
    tot=(b-a)/n;
    c=tot;
    if (i<a){
        for (long long j=a;j<=b;j++){
            if (j%n==0){
                i=j;
                break;
            }
            if (j==b){
                cout<<0<<endl;
                return 0;
            }
        }
    }
    
    i=i+n*tot;
    while ((i<=b)){
        c++;
        i+=n;
    }
    cout<<c<<endl;
    return 0;
}
