var s:array[0..100000] of ansistring;
    a:array[0..100000] of longint;
    m,n,i,j,k:longint;
begin
     readln(n,m);
     for i:=1 to m do
     begin
          readln(s[i]);
          for j:= 1 to n do
          begin
               for k:= j to n do
               begin
                    if ord(s[i][j])>ord(s[i][k]) then
                    inc(a[i]);
               end;
          end;
     end;
     for i:= 0 to 100000 do
     begin
          for j:= 1 to m do
          begin
               if (i=a[j]) and (s[j]<>'') then
               writeln(s[j]);
          end;
     end;
end.