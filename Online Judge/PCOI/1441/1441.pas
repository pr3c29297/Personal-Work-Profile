var a,b:array[1..300000] of int64;
    t:array[-273..200000] of int64;
    i,j,k,n,r2,r1,f1,f2:longint;
procedure merge(l,r:longint);
var p,q:longint;
begin
     if l<r then
     begin
          merge(l,(l+r) div 2);
          merge((l+r) div 2 +1,r);
          p:=l;
          q:=(l+r) div 2 +1;
          for i:= l to r do
          begin
               if (q>r) or ((p<=(l+r) div 2) and (a[p]<=a[q])) then
               begin
                    b[i]:=a[p];
                    inc(p)
               end
               else
               begin
                    b[i]:=a[q];
                    inc(q);
               end;
          end;
          for i:= l to r do
          a[i]:=b[i];
     end;
end;
begin
     readln(n);
     for i:= 1 to n do
     begin
          read(a[i]);
          inc(t[a[i]]);
     end;
     merge(1,n);
     f1:=a[n div 2];
     f2:=a[n div 2+1];
     for i:= -273 to 200000 do
     begin
          r1:=r1+abs(f1-i)*t[i];
          r2:=r2+abs(f2-i)*t[i];
     end;
     if r1<r2 then
     writeln(r1)
     else
     writeln(r2);
end.