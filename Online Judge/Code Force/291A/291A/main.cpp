#include <iostream>
using namespace std;

int main() {
    long long i,n,a[1000]={},j,s,p=0;
    cin>>n;
    for (i=0;i<n;i++){
        cin>>a[i];
    }
    for (i=n-1;i>=0;i--){
        s=0;
        if (a[i]!=0){
        for (j=i;j>=0;j--){
            if (a[i]==a[j]){
                s++;
            }
        }
            if (s==2){
                p++;
            }
            else if (s>2){
                cout<<-1<<endl;
                return 0;
            }
    }
    }
    cout<<p<<endl;
    return 0;
}
