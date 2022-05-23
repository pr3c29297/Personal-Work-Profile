#include <iostream>
using namespace std;

int main() {
    int n,i,a[100],s=0,e,l=0,b=0;
    cin>>n;
    for (i=0;i<n;i++){
        cin>>a[i];
    }
    for (i=0;i<n;i++){
        if (a[i]==0){
            s++;
        }
        else {
            break;
        }
    }
    e=n-1;
    for (i=n-1;i>=0;i--){
        if (a[i]==0){
            e--;
        }
        else {
            break;
        }
    }
    for (i=s;i<=e;i++){
        if (a[i]==1){
            l++;
            if (b<2){
                l+=b;
            }
            b=0;
        }
        else {
            b++;
        }
    }
    cout<<l<<endl;
    return 0;
}
