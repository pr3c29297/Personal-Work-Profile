var a:array[1..8] of char;
    n,i:longint;
begin
     for i:=8 downto 2 do
     begin
          read(a[i]);
          if a[i]in['A'..'Z'] then
          n:=n+(ord(a[i])-ord('A')+1)*i
          else
          n:=n+(ord(a[i])-ord('0'))*i;
     end;
     n :=n mod 11;
     if n=1 then
     writeln('A')
     else if n=0 then
     writeln('0')
     else
     writeln(11-n);
end.


