var l,n,i,j:longint;
    s:ansistring;
begin
  readln(l);
  readln(n);
  for i:= 1 to n do
   begin
    str(i,s);
    for j:= length(s) to l-1 do
    write('0');
    writeln(i);
   end;
  end.
