var a:array[1..50] of longint;
    b:array[1..50] of longint;
    n,i,j,m,k,l,t,c:longint;
begin
    readln(n);
    for l:= 1 to n do
    begin
     readln(m);
     k:=0;
     t:=0;
     for i:= 1 to m do
     begin
      read(a[i]);
     end;
     for i:= 1 to m do
     for j:= 1 to m-1 do
      if a[j]>a[j+1] then
      begin
       k:=a[j];
       a[j]:=a[j+1];
       a[j+1]:=k;
       t:=t+1;
      end;
    b[l]:=t;
    end;
    for i:= 1 to n do
    writeln('Optimal train swapping takes ',b[i],' swaps.');
end.
