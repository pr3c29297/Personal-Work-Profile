var n,i,j: longint;
    a :array[1..19,1..19] of longint;
begin
    readln(n);
    for i:= 1 to n do
    begin
    a[i,1]:=4*n-i-2;
    a[n,i]:=3*n-i-1;
    a[i,n]:=i+n-1;
    a[1,i]:=i;
    end;
    for i:= 1 to n do
    begin
    for j:= 1 to n-1 do
    if a[i,j]<>0 then
    begin
    write(a[i,j]:4);
    end
    else
    begin
    write('    ');
    end;
    writeln(a[i,n]:4);
    end;
end.