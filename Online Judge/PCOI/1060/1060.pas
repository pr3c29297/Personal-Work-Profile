var a:array[0..125] of longint;
    i,j,k,n,r:longint;
begin
     readln(n);
     for i:= 1 to 125 do
     a[i]:=i;
     for i:= 2 to trunc(sqrt(125)) do
     begin
          if a[i]<>0 then
          begin
               for j:= 2 to 125 div i do
               begin
                    a[i*j]:=0;
               end;
          end;
     end;
     for i:= 2 to n-1 do
     begin
          k:=n;
          j:=2;
          while (k>0) do
          begin
               if k-a[j]=0 then
               begin
                    inc(r);
               end;
               k:=k-a[j];
               inc(j);
          end;
     end;
     if a[n]<>0 then
     inc(r);
     writeln(r);
end.