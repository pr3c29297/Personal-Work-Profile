var  n,i:int64;
function f(n:int64):int64;
begin
     if n=1 then
     f:=1
     else if n=2 then
     f:=1
     else
     f:=f(n-1)+f(n-2);
end;
begin
     readln(n);
     writeln(f(n));
end.
