var c:array[1..1000] of char;
    s:ansistring;
    i,b,f,t:longint;
begin
     readln(s);
     for i:= 1 to length(s) do
     c[i]:=s[i];
     b:=1;
     f:=length(s);
     t:=0;
     for i:= 1 to round( length(s) /2) do
     begin
     if c[b]=c[f] then
     begin
      t:=t+1;
      b:=b+1;
      f:=f-1;
     end;
     end;
     if t=round (length(s) / 2) then
     writeln('yes')
     else
     writeln('no');
end.