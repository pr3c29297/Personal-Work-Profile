#include <iostream>
#include <algorithm>
using namespace std;
 
int main()
{
	long t,n,x,i,j=0,k;
	long double c;
	long long a[100000]={},p[100000]={};
	cin>>t;
	for (k=0;k<t;k++){
		cin>>n>>x;
		for (i=0;i<n;i++){
			cin>>a[i];
		}
		sort(a,a+n);
		p[0]=a[n-1];
		if (p[0]<x){
			cout<<'0'<<endl;
			continue;
		}
		for (i=1;i<n;i++){
			p[i]=p[i-1]+a[n-1-i];
			c=(long double)p[i]/(long double)(i+1);
			//cout<<p[i]<<' '<<c<<endl;
			if (c<x){
				cout<<i<<endl;
				break;
			}
		}
		if (i==n){
			cout<<n<<endl;
		}
	}
}