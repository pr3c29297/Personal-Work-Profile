var a:ansistring;
    i,j,k:longint;
    s1,s2:array[1..500] of char;
begin
     readln(a);
     s1[1]:='1';
     s2[1]:='0';
     if s1[1]<>a[1] then
     inc(j)
     else
     inc(k);
     for i:= 2 to length(a) do
     begin
          if s1[i-1]='0' then
          s1[i]:='1'
          else
          s1[i]:='0';
          if s1[i]<>a[i] then
          inc(j);
     end;
     for i:= 2 to length(a) do
     begin
          if s2[i-1]='0' then
          s2[i]:='1'
          else
          s2[i]:='0';
          if s2[i]<>a[i] then
          inc(k);
     end;
     if j<k then
     writeln(j)
     else
     writeln(k);

end.
