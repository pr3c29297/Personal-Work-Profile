var n,i,s,t,f:longint;
    c:array[1..100] of char;
    a:array[1..100] of longint;
begin
     readln(n);
     for i:= 1 to n do
     begin
      read(c[i]);
      if c[i]='0' then
      inc(f);
     end;
     if f=n then
     writeln('0=0')
     else
     begin
      for i:= 1 to n do
      begin
      if s=0 then
      begin
       if c[i]='1' then
       s:=i;
      end;
      end;
     for i:= s to n do
     write(' ');
     for i:= s to n do
     begin
      if c[i]='1' then
      begin
      if (((n-i)>=10))then
       write((n-i):4)
       else
       write((n-i):3);
       inc(t);
       a[t]:=n-i;
      end;
     end;
     writeln;
     for i:= s to n do
     write(c[i]);
     write('=');
     for i:= 1 to t do
     begin
      if ((i=1) and (a[i]>=10)) then
      write('2  ')
      else if ((i=1) and (a[i]<10)) then
      write('2 ')
      else if ((i>1) and(a[i]>=10)) then
      write('+2  ')
      else if ((i>1) and (a[i]<10)) then
      write('+2 ');
     end;
     writeln;
     end;
end.