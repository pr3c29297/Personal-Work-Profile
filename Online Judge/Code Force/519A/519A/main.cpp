#include <iostream>

int main(int argc, const char * argv[]) {
    long long i,j,w=0,b=0;
    char a[8][8];
    for (i=0;i<8;i++){
        for (j=0;j<8;j++){
            std::cin>>a[i][j];
            if (a[i][j]=='Q'){
                w=w+9;
            }
            if (a[i][j]=='R'){
                w=w+5;
            }
            if (a[i][j]=='B'){
                w=w+3;
            }
            if (a[i][j]=='N'){
                w=w+3;
            }
            if (a[i][j]=='P'){
                w=w+1;
            }
            if (a[i][j]=='q'){
                b=b+9;
            }
            if (a[i][j]=='r'){
                b=b+5;
            }
            if (a[i][j]=='b'){
                b=b+3;
            }
            if (a[i][j]=='n'){
                b=b+3;
            }
            if (a[i][j]=='p'){
                b=b+1;
        }
    }
}
    if (w==b){
        std::cout<<"Draw"<<std::endl;
    }
    else if (w>b){
        std::cout<<"White"<<std::endl;
    }
    else if (w<b){
        std::cout<<"Black"<<std::endl;
    }
    return 0;
}
