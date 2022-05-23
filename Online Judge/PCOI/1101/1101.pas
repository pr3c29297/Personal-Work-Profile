var a:array[1..101,1..101] of char;
    n,i,j,k,pt,x,y:longint;
    c:char;
    s:ansistring;
begin
     readln(x,y);
     readln(c);
     readln(n);
     readln(s);
     for i:= n to n+(x*y)-( n mod (x*y)) do
     s:=s+' ';
     if (c = 'e') and (n mod (x*y)<>0) then
     n:=n+(x*y)-( n mod (x*y));
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
           for k:= 1 to n div (x*y) do
           begin
                for i:= 1 to x do
                begin
                     for j:= 1 to y do
                     begin
                          inc(pt);
                          a[i,j]:=s[pt];
                     end;
                end;
                for i:= 1 to y do
                begin
                     for j:= 1 to x do
                     write(a[j,i]);
                end;
           end;
     end
     else if (c='d') then
     begin
           for k:= 1 to n div (x*y) do
           begin
                for i:= 1 to y do
                begin
                     for j:= 1 to x do
                     begin
                          inc(pt);
                          a[j,i]:=s[pt];
                     end;
                end;
                for i:= 1 to x do
                begin
                     for j:= 1 to y do
                     write(a[i,j]);
                end;
           end;
     end;
     writeln;
end.

