var n,m,i,m1,m2,c:longint;
    a:array[1..10] of longint;
begin
     readln(n,m);
     a[1]:=1;
     for i:= 2 to n do
     a[i]:=0;
     for i:= 1 to m do
     begin
     readln(m1,m2);
     c:=a[m1];
     a[m1]:=a[m2];
     a[m2]:=c;
     end;
     for i:= 1 to n do
     begin
     if a[i]=1 then
     writeln(i);
     end;
end.
