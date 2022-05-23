#include <iostream>
using namespace std;

int main() {
    long long k,m,na,nb,a[100000],b[100000],i;
    cin>>na>>nb;
    cin>>k>>m;
    for (i=0;i<na;i++){
        cin>>a[i];
    }
    for (i=0;i<nb;i++){
        cin>>b[i];
    }
    if (a[k-1]<b[nb-m]){
        cout<<"YES"<<endl;
    }
    else{
        cout<<"NO"<<endl;
    }
    return 0;
}
