var p:char;
    s:ansistring;
    n,i,c:longint;
begin
     readln(p);
     readln(s);
     n:=ord(p)-ord('A')+1;
     for i:= 1 to n-1 do
     n:=n*i;
     c:=ord(p)-ord('A')+1-length(s)+1;
     for i:= 1 to c-1 do
     c:=c*i;
     n:=n-c;
     writeln(n);
end.