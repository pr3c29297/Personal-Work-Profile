var a:array[1..10,1..10] of longint;
    n,i,j,k:longint;
begin
     readln(n);
     for i:= 1 to n do
     a[i,n]:=i;
     for i:= 1 to n  do
     begin
          for j:= n-1 downto 1 do
          begin
               a[i,j]:=a[i,j+1]+2;
          end;
     end;
     for i:= 1 to n do
     begin
          for j:= 1 to n-1 do
          begin
               write(a[i,j],' ');
          end;
          writeln(a[i,n]);
     end;
end.
