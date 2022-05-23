#include <iostream>
using namespace std;
int main(int argc, const char * argv[]) {
    string s="";
    int i,j=0,k=1,a[100];
    cin>>s;
    for (i=0;i<100;i++){
        a[i]=0;
    }
    a[j]=-1;
    j++;
    for (i=0;i<s.length();i++){
        if ((s[i]=='A')or(s[i]=='E')or(s[i]=='I')or(s[i]=='O')or(s[i]=='U')or(s[i]=='Y')){
            a[j]=i;
            j++;
        }
    }
    a[j]=s.length();
    for (i=1;i<=j;i++){
        if ((a[i]-a[i-1])>k){
            k=a[i]-a[i-1];
        }
    }
    cout<<k<<endl;
    return 0;
}
