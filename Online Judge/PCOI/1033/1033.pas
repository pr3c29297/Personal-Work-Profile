var n,r:longint;
begin
     readln(n);
     if n mod 2 = 0 then
          r:=2*(n div 2)*((n div 2)-1) div 2
     else
          r:=(n div 2)*((n div 2)-1) div 2+((n div 2)+1)*(n div 2) div 2;
     writeln(r);
end.