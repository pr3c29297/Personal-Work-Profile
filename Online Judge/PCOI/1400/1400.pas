var a:array[1..50,1..50] of char;
    n,m,r,c,i,j,k,s:longint;
begin
     readln(n,m,r,c);
     for i:= 1 to n do
     begin
          for j:= 1 to m do
          read(a[i,j]);
          readln;
     end;
     for i:= 1 to n do
     begin
          for j:= 1 to m do
          begin
               if a[i,j]='0' then
               begin
                    inc(s);
               end;
          end;
     end;
     writeln(s);
end.