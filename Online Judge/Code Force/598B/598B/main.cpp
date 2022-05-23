#include <iostream>
using namespace std;

int main() {
    string s,sub,fow;
    long long i,l,r,k,n;
    getline(cin,s);
    cin>>n;
    for (i=0;i<n;i++){
        cin>>l>>r>>k;
        if (k>r-l+1){
            k=k%(r-l+1);
        }
        sub=s.substr(r-k,k);
        /*for (int j=0;j<k/2;j++){
            char temp;
            temp = sub[j];
            sub[k-j]=sub[j];
            sub[j]=temp;
        }*/
        fow=s.substr(l-1,r-l+1-k);
        //cout<<sub<<' '<<fow<<endl;
        s.replace(l-1,k,sub);
        s.replace(l+k-1,fow.length(),fow);
    }
    cout<<s<<endl;
    return 0;
}
