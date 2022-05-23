var a,b,i,j,k,r:longint;
begin
     readln(a,b);
     if (b=0)and (a=0) then
     begin
          writeln('-1');
          halt;
     end
     else
     begin
          while a>=b do
          begin
               i:=a-b;
               a:=b;
               b:=i;
               inc(r);
          end;
          writeln(r+2)
     end;
end.
