var n,i,f: longint;
 begin
  readln(n);
  f:=n;
  write('  ');
  for i:= 1 to n+2 do
   begin
    write('-');
   end;
   writeln;
   write(' /');
   for i:= 1 to n do
   begin
    write(' ');
   end;
   writeln('/');
   for i:= 1 to n do
   begin
    write('-');
   end;
   writeln(' /');
   while f>4 do
   begin
   for i:= 1 to f-2 do
   begin
    write(' ');
    end;
    write('/ /');
    writeln;
    f:=f-1;
    end;
    write('  / ');
    for i:= 1 to n do
    begin
    write('-');
    end;
    writeln;
    write(' /');
    for i := 1 to n do
    begin
    write(' ');
    end;
    writeln('/');
    for i:= 1 to n+2 do
    begin
    write('-');
    end;
    writeln;
   end.