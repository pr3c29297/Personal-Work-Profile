#include <iostream>
#include <math.h>
#include <cmath>
using namespace std;
int main(){
	int n, i, j=0, k=0;
	double co;
	bool RC[100]={}, BS[100]={};
	cin>>n;
	for (i=0;i<n;i++){
		cin>>RC[i];
	}
	for (i=0;i<n;i++){
		cin>>BS[i];
		if ((RC[i]==1)&&(BS[i]==0)) {
			j++;
		}
		else if ((RC[i]==0)&&(BS[i]==1)){
			k++;
		}
	}
	if ((j==0)&&(k>=0)){
		cout<<"-1"<<endl;
		return 0;
	}
	k++;
	co=ceil((double)k/j);
	cout<<co<<endl;
	return 0;
}