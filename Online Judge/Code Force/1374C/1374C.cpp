#include <iostream>
#include <vector>
using namespace std;
 
int main()
{
	vector<char> brac;
	int t,n;
	char c;
	cin>>t;
	for (int i=0;i<t;i++){
		cin>>n;
		brac.clear();
		for (int j=0;j<n;j++){
			cin>>c;
			if (brac.empty() == false){
				if ((brac.back()=='(')&&(c==')')){
					brac.pop_back();
				}
				else 
					brac.push_back(c);
			}
			else 
				brac.push_back(c);
			/*for (int k=0;k<brac.size();k++){
				cout<<brac.at(k);
			}
			cout<<endl;*/
		}		

		cout<<brac.size()/2<<endl;;
	}
}