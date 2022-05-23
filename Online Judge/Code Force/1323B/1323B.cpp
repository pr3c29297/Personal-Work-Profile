#include <iostream>
using namespace std;
 
int main()
{
    long long i,j=0,k1=0,k2=0,n,m,co=0,area,att,pos=0,temp1=0,temp2=0,temp3=0,temp4=0;
    long long a[40001]={}, b[40001]={}, c[40001]={}, d[40001]={},p[160000]={};
    
    cin>>n>>m>>area;
    for (i=0;i<n;i++){
        cin>>a[i];
        if (a[i]==1){
            j++;
        }
        if (((a[i]==0)or(i==n-1))&&(j>0)){
            c[k1]=j;
            k1++;
            j=0;
        }
    }
    j=0;
    for (i=0;i<m;i++){
        cin>>b[i];
        if (b[i]==1){
            j++;
        }
        if (((b[i]==0)or(i==m-1))&&(j>0)){
            d[k2]=j;
            k2++;
            j=0;
        }
    }
 	for (att=1;att*att<=area;att++){
 		if (area % att == 0){
 			p[pos]=att;
 			pos++;
 		}
 	}
 	for (i=0;i<k1;i++){
 		for (att=0;att<pos;att++){
 			if(p[att]<=c[i]){
 				temp1+=c[i]-p[att]+1;
 				if ((p[att]*p[att]!=area)&&(area/p[att]<=c[i])){
 					temp3+=c[i]-area/p[att]+1;
 				}
 			}
 		}
 	}
 	for (i=0;i<k2;i++){
 		for (att=0;att<pos;att++){
 			if(area/p[att]<=d[i]){
 				temp2+=d[i]-area/p[att]+1;
 				if ((p[att]*p[att]!=area)&&(area/p[att]<=d[i])){
 					temp4+=d[i]-p[att]+1;
 				}
 			}
 		}
 	}
 	co=temp1*temp2+temp3*temp4;
 	cout<<co<<endl;
 	co=0;
    for (i=0;i<k1;i++){
        for (j=0;j<k2;j++){
        	if (c[i]*d[j]>=area){
        		for (att=0;att<pos;att++){
                if ((p[att]<=c[i])&&(area/p[att]<=d[j])){
                    co=co+(c[i]-p[att]+1)*(d[j]-area/p[att]+1);
                    }
                if (p[att]*p[att]!=area){
                    if ((p[att]<=d[j])&&(area/p[att]<=c[i])){
                    	co=co+(d[j]-p[att]+1)*(c[i]-area/p[att]+1);
                    }
                 }
            }
        	}
        }
    }

    cout<<co<<endl;
    return 0;
}