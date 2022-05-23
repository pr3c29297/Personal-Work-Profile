#include <iostream>
#include <cmath>
using namespace std;

int main() {
    long long i,j,t,k,ans[100]={},p[31];
    cin>>t;
    for (i=0;i<=30;i++){
        p[i]=pow(2,i);
    }
    for (i=0;i<t;i++){
        cin>>j;
        ans[i]=(1+j)*j/2;
        for (k=0;k<=30;k++){
            if (p[k]<=j){
                ans[i]=ans[i]-2*p[k];
            }
        }
    }
    for (i=0;i<t;i++){
        cout<<ans[i]<<endl;
    }
    return 0;
}
