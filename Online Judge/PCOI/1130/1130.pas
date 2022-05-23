var n,i,r,a,b:int64;
begin
     readln(n);
     while a<=n do
     begin
          inc(a);
          while b<=n do
          begin
               inc(b);
               if (a+b)*(a-b)=n then
               begin
               inc(r);
               end;
          end;
          b:=0;
     end;
     writeln(r);
end.
