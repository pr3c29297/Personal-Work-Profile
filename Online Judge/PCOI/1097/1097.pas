var n,s,a,ma,mi,t:real;
begin
  readln(n);
  s:=0;
  t:=0;
  ma:=0;
  mi:=n;
  while n <> 0 do
  begin
   s:=s+n;
   t:=t+1;
   if n>ma then
    ma:=n;
   if n<mi then
    mi:=n;
   readln(n);
  end;
  writeln(ma:0:2);
  writeln(mi:0:2);
  writeln(s/t:0:2);
end.