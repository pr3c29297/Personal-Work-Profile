var a,u,g,temp:array[1..10000] of longint;
    n,i,j,k,b,s,r:longint;
begin
     readln(n);
     for i:= 1 to n do
     begin
          readln(k);
          inc(a[k]);
     end;
     for i:= 1 to 10000 do
     if a[i]>b then
     b:=a[i];
     for i:= 1 to 10000 do
     if (a[i]>s) and (a[i]<b) then
     s:=a[i];
     j:=0;
     k:=0;
     for i:= 1 to 10000 do
     begin
          if a[i]=b then
          begin
               inc(j);
               u[j]:=i;
          end;
          if a[i]=s then
          begin
               inc(k);
               g[k]:=i;
          end;
     end;
     if s=0 then
     begin
          writeln(u[j]-u[1]);
          halt;
     end;
     r:=abs(u[j]-g[1]);
     if r>=abs(u[1]-g[k]) then
     writeln(r)
     else
     writeln(abs(u[1]-g[k]));
end.
