var i,n:longint;
 begin
  readln(n);
  i:=2;
  while n>i do
  begin
   if n mod i= 0 then
   begin
    write(i,'*');
    n:=n div i;
    end
    else
    i:=i+1;
    end;
    writeln(i);
    end.