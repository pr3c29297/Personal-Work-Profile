var a,b:array[1..800000] of longint;
    i,n,k,id,c:longint;
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
                     inc(p);
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
     readln(n,k);
     for i:= 1 to n do
     begin
          readln(a[i]);
     end;
     merge(1,n);
     writeln(a[k]);
end.
