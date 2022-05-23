var a,b,k,i,s:longint;
begin
     readln(a,b,k);
     s:=0;
     for i:= a to b do
     if i mod k = 0 then
     s:=s+i;
     writeln(s);
end.