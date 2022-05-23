#include <iostream>
#include <string>
using namespace std;

int main() {
    int n,i,j,k,p;
    string s[50],temp;
    char a[30],b[30];
    cin>>n;
    for (i=0;i<n;i++){
        cin>>s[i];
    }
    for (i=0;i<=(n*(n-1)/2);i++){
        cin>>temp;
        for (j=0;j<temp.length();j++){
            if (temp[j]=='-'){
                k=temp.copy (a,j,0);
                cout<<a;
            }
        }
    }
    return 0;
}
