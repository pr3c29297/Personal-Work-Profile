var s:ansistring;
    c:array[1..51] of char;
    i,d,f,a,h:longint;
begin
     readln(s);
     for i:= 1 to length(s) do
     c[i]:=s[i];
     if c[2] in ['0'..'9'] then
     begin
     a:=(ord(c[1])-ord('0'))*10+(ord(c[2])-ord('0'));
     i:=3;
     while i<= length(s) do
     begin
      if c[i]='+' then
      begin
       if c[i+2] in ['0'..'9'] then
       begin
       a:=a+(ord(c[i+1])-ord('0'))*10+(ord(c[i+2])-ord('0'));
       i:=i+3;
       end
       else
       begin
       a:=a+(ord(c[i+1])-ord('0'));
       i:=i+2;
       end;
      end
      else
      begin
      if c[i+2] in ['0'..'9'] then
       begin
       a:=a-(ord(c[i+1])-ord('0'))*10-(ord(c[i+2])-ord('0'));
       i:=i+3;
       end
       else
       begin
       a:=a-(ord(c[i+1])-ord('0'));
       i:=i+2;
       end;
       end;
       end;
       end
      else
      begin
      a:=ord(c[1])-ord('0');
      i:=2;
       while i<= length(s) do
     begin
      if c[i]='+' then
      begin
       if c[i+2] in ['0'..'9'] then
       begin
       a:=a+(ord(c[i+1])-ord('0'))*10+(ord(c[i+2])-ord('0'));
       i:=i+3;
       end
       else
       begin
       a:=a+(ord(c[i+1])-ord('0'));
       i:=i+2;
       end;
      end
      else
      begin
      if c[i+2] in ['0'..'9'] then
       begin
       a:=a-(ord(c[i+1])-ord('0'))*10-(ord(c[i+2])-ord('0'));
       i:=i+3;
       end
       else
       begin
       a:=a-(ord(c[i+1])-ord('0'));
       i:=i+2;
       end;
       end;
       end;
       end;
     writeln(a);
end.