var a:array [1..100] of longint;
    n,i,s,j,y,k:longint;
    begin
    k:=0;
    s:=0;
    readln(n);
    if n= 3 then
    begin
     for i:= 1 to n-1 do
     readln(a[i]);
      for i:= 1 to n do
    for j:= 1 to n-1 do
     if a[j]>a[j+1] then
     begin
      k:=a[j];
      a[j]:=a[j+1];
      a[j+1]:=k;
     end;
      for i:= 2 to n do
    s:=s+a[i];
    y:=(50*(n-2))-s;
    if y<0 then
    y:=0;
    if y>100 then
    writeln('FAIL')
    else
    writeln(y);
    end
    else
    begin
    for i:= 1 to n-1 do
    readln(a[i]);
    for i:= 1 to n do
    for j:= 1 to n-1 do
     if a[j]>a[j+1] then
     begin
      k:=a[j];
      a[j]:=a[j+1];
      a[j+1]:=k;
     end;
    for i:= 4 to n do
    s:=s+a[i];
    y:=(50*(n-2))-s;
    if y<0 then
    y:=0;
    if y>100 then
    writeln('FAIL')
    else
    writeln(y);
   end;
   end.
