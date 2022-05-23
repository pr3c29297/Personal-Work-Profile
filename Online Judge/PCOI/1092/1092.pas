var c:array [1..3] of char;
    a,m:array [1..2] of longint;
    i,j,d1,d2:longint;
begin
     for j:= 1 to 2 do
     begin
     for i:= 1 to 2 do
     read(c[i]);
     if c[2]=':' then
     begin
     a[j]:=ord(c[1])-ord('0');
     readln(m[j]);
     end
     else
     begin
     a[j]:=((ord(c[1])-ord('0'))*10)+(ord(c[2])-ord('0'));
     readln(c[3],m[j]);
     end;
     end;
     d1:=(a[2]-a[1])*360;
     d2:=(m[2]-m[1])*6;
     if (d1+d2)<0 then
     writeln(360*12+(d1+d2))
     else
     writeln(d1+d2);

end.