var email:ansistring;
    c:array[1..1000000] of longint;
    ch:array[1..1000000] of char;
    s:ansistring;
    sn:array[1..1000000] of ansistring;
    n,i,ti,temp,j:longint;
begin
     readln(email);
     readln(n);
     for i:= 1 to length(email) do
     begin
      if email[i] in ['A'..'Z'] then
      begin
       temp:=ord(email[i])+32;
       email[i]:=chr(ord(temp));
      end;
     end;
     while not eof do
     begin
      inc(ti);
      readln(sn[ti]);
     end;
     for i:= 1 to ti do
     begin
      for j:= 1 to length(sn[i]) do
      begin
      if sn[i][j] in ['A'..'Z'] then
      begin
       temp:=ord(sn[i][j])+32;
       sn[i][j]:=chr(ord(temp));
      end;
      ch[j]:=sn[i][j];
      end;
      write(ch[1]);
     temp:=0;
      for j:= 2 to length(sn[i])-1 do
      begin
      if ch[j]=' ' then
      begin
       temp:=temp+1;
       c[temp]:=j+1;
      end;
      end;
      for j:= 1 to temp-1 do
      write(ch[c[j]]);
      write(copy(sn[i],c[temp],length(sn[i])-c[temp]+1));
      str(i,s);
      for j:= 1 to n-length(s) do
      write('0');
      writeln(s,'@',email);

     end;

end.
