var a:array[1..20,1..20] of char;
    n,i,j,k,pt:longint;
    c:char;
    s:ansistring;
begin
     readln(c);
     readln(n);
     readln(s);
     for i:= n to n+20-( n mod 20) do
     s:=s+' ';
     if (c = 'e') and (n mod 20<>0) then
     n:=n+20-( n mod 20);
     for i:= 1 to n do
     begin
          if s[i] in ['A'..'M'] then
          s[i]:=chr(ord('Z')-ord(s[i])+ord('A'))
          else if s[i] in ['N'..'Z'] then
          s[i]:=chr(ord('A')+ord('Z')-ord(s[i]))
          else if s[i]=' ' then
          s[i]:='^'
          else if s[i]='^' then
          s[i]:=' ';
     end;
     if (c='e') then
     begin
           for k:= 1 to n div 20 do
           begin
                for i:= 1 to 4 do
                begin
                     for j:= 1 to 5 do
                     begin
                          inc(pt);
                          a[i,j]:=s[pt];
                     end;
                end;
                for i:= 1 to 5 do
                begin
                     for j:= 1 to 4 do
                     write(a[j,i]);
                end;
           end;
     end
     else if (c='d') then
     begin
           for k:= 1 to n div 20 do
           begin
                for i:= 1 to 5 do
                begin
                     for j:= 1 to 4 do
                     begin
                          inc(pt);
                          a[j,i]:=s[pt];
                     end;
                end;
                for i:= 1 to 4 do
                begin
                     for j:= 1 to 5 do
                     write(a[i,j]);
                end;
           end;
     end;
     writeln;
end.

