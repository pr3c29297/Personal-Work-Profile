#include <iostream>

int main(int argc, const char * argv[]) {
    long long i,n,temp=0,c=0,a[100001]={};
    std::cin>>n;
    for (i=1;i<=n;i++){
        std::cin>>a[i];
        if (a[i]>=a[i-1]){
            temp++;
        }
        else{
            temp=1;
        }
        if (temp>c){
            c=temp;
        }
    }
    std::cout<<c<<std::endl;
    return 0;
}
