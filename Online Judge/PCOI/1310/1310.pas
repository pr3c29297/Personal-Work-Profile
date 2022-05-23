var a:array[0..50000] of longint;
    n,i,t,z,p,j,c,k:longint;
begin
     readln(n);
     for i:= 1 to n do
     read(a[i]);
     for i:= 1 to n do
     if (a[i]>=a[i-1]) and (a[i]>=a[i+1]) then
     writeln(i);
end.
