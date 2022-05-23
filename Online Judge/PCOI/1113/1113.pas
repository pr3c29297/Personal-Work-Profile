var a:array [1..20,1..20] of longint;
    n,i,j,l,k:longint;
begin
     readln(n);
     for k:= n downto 1 do
     begin
          for i:= 1 to k do
          begin
               for j:= n-k+1 to n do
               a[i,j]:=k;
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