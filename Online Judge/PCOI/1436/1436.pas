var s:ansistring;
    i,j,k,r,x,y,xx,yy:longint;
    c:char;
begin
     readln(s);
     x:=2;
     y:=2;
     for k:= 1 to length(s) do
     begin
          if s[k]='1' then
          begin
               xx:=1;
               yy:=3;
          end;
          if s[k]='2' then
          begin
               xx:=2;
               yy:=3;
          end;
          if s[k]='3' then
          begin
               xx:=3;
               yy:=3;
          end;
          if s[k]='4' then
          begin
               xx:=1;
               yy:=2;
          end;
          if s[k]='5' then
          begin
               xx:=2;
               yy:=2;
          end;
          if s[k]='6' then
          begin
               xx:=3;
               yy:=2;
          end;
          if s[k]='7' then
          begin
               xx:=1;
               yy:=1;
          end;
          if s[k]='8' then
          begin
               xx:=2;
               yy:=1;
          end;
          if s[k]='9' then
          begin
               xx:=3;
               yy:=1;
          end;
          if s[k]='.' then
          begin
               xx:=3;
               yy:=4;
          end;
          if s[k]<>'0' then
          begin
               r:=r+ abs(x-xx)+abs(y-yy);
               x:=xx;
               y:=yy;
          end
          else
          begin
               if abs(x-1)<abs(x-2) then
               begin
                    r:=r+abs(x-1)+abs(y-4);
                    x:=1;
                    y:=4;
               end
               else
               begin
                    r:=r+abs(x-2)+abs(y-4);
                    x:=2;
                    y:=4;
               end;
          end;
     end;
     writeln(r);
end.


