var c:array['a'..'z'] of longint;
    s:ansistring;
    i,temp:longint;
    t:char;
begin
     i:=1;
     while not(eof) do
     begin
     readln(s);
      for i:= 1 to length(s) do
      begin
       if ((s[i]<>' ') or (s[i]<>'.')) then
       begin
       if s[i] in ['A'..'Z'] then
       begin
        temp:=ord(s[i])+32;
        s[i]:=chr(ord(temp));
       end;
       c[s[i]]:=c[s[i]]+1;
       end;
      end;
       end;
      i:=0;
       for t:= 'a' to 'z' do
       begin
       inc(i);
       if i=1 then
        write(t,':',c[t]:5)
        else
        write('    ',t,':',c[t]:5);
        if i mod 6=0 then
        begin
         writeln;
         i:=0;
        end;
       end;
       writeln;


end.