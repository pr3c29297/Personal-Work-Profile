var a:array[1..30,1..30] of longint;
    i,j,n,k:longint;
begin
    readln(n);
    for i:= 1 to n do
    begin
    for j:= 1 to n do
    begin
    a[i,1]:=1;
    a[i,j]:=1;
    end;
    end;
      for i:= 3 to n do
    begin
     for j:= 2 to i-1 do
     begin
      a[i,j]:= a[i-1,j-1]+a[i-1,j];
     end;
    end;
    for i:= 1 to n do
    begin
     for j:= 1 to i-1 do
     begin
     write(a[i,j],',');
     end;
    writeln(a[i,i]);
    end;
    end.