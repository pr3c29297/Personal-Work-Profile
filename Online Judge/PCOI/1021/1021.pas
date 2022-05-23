var l,w,h,l1,w1,h1,i,n,s,s1,d1,d2:longint;
begin
 readln(l,w,h);
 s:=l*w*h;
 readln(n);
 d2:=2147483647;
 for i:= 1 to n do
 begin
 readln(l1,w1,h1);
 if (l1>=l) and (w1>=w) and (h1>=h) then
 s1:=l1*w1*h1;
 if s1-s>=0 then
 begin
  d1:=s1-s;
 if d1<d2 then
 d2:=d1;
 end;
 end;
 writeln(d2);
end.