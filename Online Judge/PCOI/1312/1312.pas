var n,d,i,j,t,c,f:longint;
    a:array[1..101] of longint;
begin
     readln(n,d);
     for i:= 1 to n do
     read(a[i]);
     for i:= 1 to n do
     for j:= 1 to n-d do
     begin
      if a[j]>a[j+d] then
      begin
       t:=a[j];
       a[j]:=a[j+d];
       a[j+d]:=t;
       c:=c+1;
      end;
     end;
     for i:= 1 to n do
     for j:= 1 to n-1 do
     begin
      if a[j]>a[j+1] then
      f:=f+1;
     end;
     if ((c=0) and (f>1)) then
     writeln('WRONG!')
     else
     if ((c=0) and (f=0)) then
     writeln('0')
     else
     if c>0 then
     writeln(c);
end.