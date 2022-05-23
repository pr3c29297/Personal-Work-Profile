var s:ansistring;
    n,i:longint;
begin
     readln(s);
     for i:= 1 to length(s)-1 do
     begin
       if (s[i]='C') and (s[i+1]='M') then
       begin
        n:=n+900;
        s[i]:=' ';
        s[i+1]:=s[i];
       end;
       if (s[i]='C') and (s[i+1]='D') then
       begin
        n:=n+400;
        s[i]:=' ';
        s[i+1]:=s[i];
       end;
       if (s[i]='X') and (s[i+1]='C') then
       begin
        n:=n+90;
        s[i]:=' ';
        s[i+1]:=s[i];
       end;
       if (s[i]='X') and (s[i+1]='L') then
       begin
        n:=n+40;
        s[i]:=' ';
        s[i+1]:=s[i];
       end;
       if (s[i]='I') and (s[i+1]='X') then
       begin
        n:=n+9;
        s[i]:=' ';
        s[i+1]:=s[i];
       end;
       if (s[i]='I') and (s[i+1]='V') then
       begin
        n:=n+4;
        s[i]:=' ';
        s[i+1]:=s[i];
       end;
     end;
     for i:= 1 to length(s) do
     begin
      if s[i]='M' then
      n:=n+1000;
      if s[i]='D' then
      n:=n+500;
      if s[i]='C' then
      n:=n+100;
      if s[i]='L' then
      n:=n+50;
      if s[i]='X' then
      n:=n+10;
      if s[i]='V' then
      n:=n+5;
      if s[i]='I' then
      n:=n+1;
     end;
     writeln(n);
end.