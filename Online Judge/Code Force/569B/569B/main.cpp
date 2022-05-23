#include <iostream>
using namespace std;

int main() {
    int a[100001]={},i,j,n,em[100001]={},in[100001]={};
    cin>>n;
    for (i=0;i<n;i++){
        cin>>in[i];
        a[in[i]]++;
    }
    j=0;
    for (i=1;i<=n;i++){
        if (a[i]==0){
            em[j]=i;
            j++;
        }
    }
    j=0;
    for (i=0;i<n;i++){
        if ((a[in[i]]>1) or (in[i]>n)){
            a[in[i]]--;
            in[i]=em[j];
            j++;
        }
    }
    for (i=0;i<n-1;i++){
        cout<<in[i]<<' ';
    }
    cout<<in[n-1]<<endl;
    return 0;
}
