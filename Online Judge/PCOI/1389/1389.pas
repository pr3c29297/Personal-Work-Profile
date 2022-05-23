var n,i,j,k,r:longint;
begin
     readln(n);
     for i:= 1 to n do
     begin
          j:=i;
          k:=1;
          while j<n do
          begin
               j:=j+j+k;
          end;
          if j=n then
          inc(r)
     end;
     writeln(r);
end.