var n,m,p,i,j,k,r:longint;
begin
     readln(n,m,p);
     i:=n;
     j:=m;
     while 2*(i+j)>=p do
     begin
          r:=r+(trunc(n/i)+n mod i)*(trunc(m/j)+m mod j) ;
          dec(i);
          if i= 0 then
          begin
               i:=n;
               dec(j);
          end;
     end;
     writeln(r);
end.
