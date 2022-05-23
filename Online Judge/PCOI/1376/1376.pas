var n,i,j,sum:longint;
begin
     readln(n);
     while not((i=n) and (j=n)) do
     begin
           sum:=sum+i+j;
           inc(j);
           if j>n then
           begin
                inc(i);
                j:=i;
           end;
     end;
     writeln(sum+n+n);
end.