var p,temp,r,n,m,k,i,j:longint;
    a,b:array[1..100000] of longint;
procedure ms(l,r:longint);
var p,q:longint;
begin
     if (l<r) then
     begin
          ms(l,(l+r) div 2);
          ms((l+r) div 2+1, r);
          p:=l;
          q:=(l+r) div 2+1;
          for i:= l to r do
          begin
               if (q>r) or ((p<=(l+r) div 2) and (a[p]>=a[q])) then
               begin
                    b[i]:=a[p];
                    p:=p+1;
               end
               else
               begin
                    b[i]:=a[q];
                    q:=q+1;
               end;
          end;
          for i:= l to r do
          a[i]:=b[i];
     end;
end;

begin
     readln(n,m,k);
     for i:= 1 to m do
     readln(a[i]);
     ms(1,m);
     for i:= 1 to n+1 do
     p:=p+a[i];
     r:=p*trunc(k/(n+1));
     for i:= 1 to k mod (n+1) do
     r:=r+a[i];
     writeln(r);
end.