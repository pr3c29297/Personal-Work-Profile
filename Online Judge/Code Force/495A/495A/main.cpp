#include <iostream>
using namespace std;

int main() {
    char c;
    int i,r=1,temp;
    for (i=0;i<2;i++){
        cin>>c;
        if (c=='0'){
            temp=2;
        }
        if (c=='1'){
            temp=7;
        }
        if (c=='2'){
            temp=2;
        }
        if (c=='3'){
            temp=3;
        }
        if (c=='4'){
            temp=3;
        }
        if (c=='5'){
            temp=4;
        }
        if (c=='6'){
            temp=2;
        }
        if (c=='7'){
            temp=5;
        }
        if (c=='8'){
            temp=1;
        }
        if (c=='9'){
            temp=2;
        }
        r=r*temp;
    }
    cout<<r<<endl;
    return 0;
}
