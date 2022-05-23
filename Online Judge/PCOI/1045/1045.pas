var n,i,d,j:longint;
    q:int64;
    x,rad,r,rf:double;
begin
  readln(d);
  readln(n);
  if n> 10 then
  n:=10;
  rad:=3.141592654*(2*d/360);
  for i:= 0 to n-1 do
  begin
   r:=1;
   q:=1;
   for j:= 1 to 1+2*i do
     r:=r*rad;
   for j:= 1 to 1+2*i do
     q:=q*j;
   if i mod 2 = 1 then
     rf:=rf-(r/q)
   else
     rf:=rf+(r/q);
  end;
  writeln(rf:0:10);
  writeln(sin(rad):0:10);
end.
