#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    long long n,p,q,a[500][500],col[500],row[500],fdi=0,sdi=0,ans[500],temp=0,tail=0;
    bool ch;
    cin>>n;
    
    for (int i=0;i<n;i++){
        col[i]=0;
        row[i]=0;
    }
    for (int i=0;i<n;i++){
        for (int j=0;j<n;j++){
            cin>>a[i][j];
            if (a[i][j]==0){
                p=i;;
                q=j;
            }
        }
    }
    for (int i=0;i<n;i++){
        for (int j=0;j<n;j++){
            col[i]+=a[i][j];
            row[i]+=a[j][i];
        }
        fdi+=a[i][i];
        sdi+=a[i][n-i-1];
    }
    ans[0]=fdi;
    if (fdi!=sdi){
        tail++;
        ans[1]=sdi;
    }
    for (int i=0;i<n;i++){
        temp=0;
        for (int j=0;j<=tail;j++){
            if (col[i]!=)
        }
    }
    return 0;
}
