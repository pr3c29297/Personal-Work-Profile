var c,n,temp:longint;
begin
  readln(n);
  temp:=n;
  c:=1;
    if temp>=2 then
    begin
      if temp mod 2 = 0 then
        c:=1+c+round((temp-2)/2)
      else
      begin
        temp:=temp-1;
        c:=1+c+round((temp-2)/2);
      end;
    end;
    writeln(c);
end.







