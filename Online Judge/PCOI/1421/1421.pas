var a:array[1..10,1..10] of longint;
    i,j,k,n:longint;
begin
     readln(n);
     for i:= 1 to n do
     begin
          a[1,i]:=1;
          a[i,n]:=1;
     end;
     for i:= 2 to n do
     begin
          for j:=1 to n-1 do
          begin
               a[i,j]:=a[i-1,j+1]+1;
          end;
     end;
     for i:= 1 to n do
     begin
          for j:= 1 to n-1 do
          write(a[i,j],' ');
          writeln(a[i,n]);
     end;
end.
