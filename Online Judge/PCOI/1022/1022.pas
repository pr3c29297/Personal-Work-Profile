uses math;
var s:ansistring;
    x:real;
    c:array[1..1000] of char;
    n,i,y:longint;
    a:array[1..1000] of longint;
begin
     readln(s);
     x:=0;
     y:=length(s);
     for i:= 1 to length(s) do
     c[i]:=s[i];
     for i:= 1 to length(s) do
     a[i]:=ord(c[i])-ord('0');
     for i:= 1 to length(s) do
     begin
      x:=x+a[i]*((power(2,y))-1);
      y:=y-1;
     end;
     writeln(x:0:0);
end.
