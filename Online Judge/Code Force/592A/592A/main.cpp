#include <iostream>
using namespace std;

int main() {
    char c[8][8];
    int i,j,rb=8,ra=8,temp,k;
    for (i=0;i<8;i++){
        for (j=0;j<8;j++){
            cin>>c[i][j];
        }
    }
    for (i=0;i<8;i++){
        for (j=0;j<8;j++){
            if (c[i][j]=='B'){
                temp=7-i;
                if (rb>temp){
                    for (k=i;k<8;k++){
                        if (c[k][j]!='W'){
                            temp--;
                        }
                    }
                    if (temp==-1){
                        rb=7-i;
                    }
                }
            }

            if (c[i][j]=='W'){
                temp=i-1;
                if (ra>temp){
                    for (k=temp;k>=0;k--){
                        if (c[k][j]!='B'){
                            temp--;
                        }
                    }
                    if (temp==-1){
                        ra=i;                    }
                }
            }
        }
        
    }
    
    if (ra>rb){
        cout<<'B'<<endl;
    }
    else{
        cout<<'A'<<endl;
    }
    return 0;
}
