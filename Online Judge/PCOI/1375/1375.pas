var a:array[1..11,1..11] of longint;
    i,j,n,f,c:longint;
begin
     readln(n);
     a[1,1]:=1;
     for i:= 2 to n do
     a[i,1]:=a[i-1,1]+1;
     for i:= 2 to n do
     a[1,i]:=a[1,i-1]+1;
     for i:= 2 to n do
     begin
      for j:= 2 to n do
      begin
      if a[i,j-1]+1<= n then
       a[i,j]:=a[i,j-1]+1
      else
      begin
       a[i,j]:=1;
      end;
      end;
     end;
     for i:= 1 to n do
     begin
      for j:= 1 to n-1 do
      write(a[i,j],' ');
      writeln(a[i,n]);
     end;
end.