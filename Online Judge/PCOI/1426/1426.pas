var a:array[-1..1002,-1..1002] of char;
    i,j,k,n,m,r:longint;
begin
     readln(n,m);
     for i:= 0 to n+1 do
     begin
          for j:= 0 to m+1 do
          a[i,j]:='0';
     end;
     for i:= 1 to n do
     begin
          for j:= 1 to m do
          read(a[i,j]);
          readln;
     end;
     for i:= 0 to n+1 do
     begin
          for j:= 0 to m+1 do
          begin
               if (a[i,j]='0') then
               begin
                    if a[i+1,j]='1' then
                    begin
                         inc(r);
                    end;
                    if a[i-1,j]='1' then
                    begin
                         inc(r);
                    end;
                    if a[i,j+1]='1' then
                    begin
                         inc(r);
                    end;
                    if a[i,j-1]='1' then
                    begin
                         inc(r);
                    end;
               end;
          end;
     end;
     writeln(r);
end.
