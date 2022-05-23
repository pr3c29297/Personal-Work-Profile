#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    long long i,j,n;
    bool g=false;
    char c[1000][6];
    cin>>n;
    for (i=0;i<n;i++){
        for (j=0;j<5;j++){
            cin>>c[i][j];
            if ((c[i][j]=='O') and (c[i][j]==c[i][j-1]) and (g==false) and ((j==1) or (j==4))){
                cout<<"YES"<<endl;
                c[i][j]='+';
                c[i][j-1]='+';
                g=true;
            }
        }
    }
    if (g==false){
        cout<<"NO"<<endl;
    }
    else {
    for (i=0;i<n;i++){
        for (j=0;j<5;j++){
            cout<<c[i][j];
        }
        cout<<endl;
    }
    }
    return 0;
}
