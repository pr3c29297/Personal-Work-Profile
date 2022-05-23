var a,b:array[0..5] of char;
    s:array[0..1000] of string;
    i,j,r,p:longint;
    c,d:char;
begin
     for i:=1 to 5 do
     read(a[i]);
     readln;
     c:='A';
     d:='a';
     i:=1;
     while (c<='E') and (d<='e') do
     begin
          if (b[r]=chr(ord(c))) or (b[r]=chr(ord(d))) then
          begin
               inc(p);
               s[p]:='Pop';
               dec(r);
               c:=chr(ord(c)+1);
               d:=chr(ord(d)+1);
          end
          else
          begin
          if(a[i]=chr(ord(c))) or (a[i]=chr(ord(d)))then
          begin
               inc(p);
               s[p]:='Push';
               inc(p);
               s[p]:='Pop';
               c:=chr(ord(c)+1);
               d:=chr(ord(d)+1);
          inc(i);
          end
          else
          begin
               inc(r);
               b[r]:=a[i];
               inc(p);
               s[p]:='Push';
               inc(i);
          end;
          end;
     end;
     if r>0 then
     writeln('No solution')
     else
     begin
          for i:= 1 to p do
          writeln(s[i]);
     end;


end.
