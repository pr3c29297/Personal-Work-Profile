var a,b,c,d,e:array[1..200] of char;
    n,i,j,k,t,r:longint;
    cg:char;
begin
     readln(n);
     for i:= 1 to n do
     read(a[i]);
     readln;
     for i:= 1 to n do
     read(b[i]);
     readln;
     for i:= 1 to 2*n do
     read(c[i]);
     readln;
     for i:= 1 to 2*n do
     begin
          if i mod 2 = 1 then
          begin
          inc(k);
          d[i]:=b[k];
          e[i]:=b[k];
          end
          else
          begin
          d[i]:=a[k];
          e[i]:=a[k];
          end;
     end;
     t:=1;
     while (j<>n*2) and (r<>n*2) do
     begin
          k:=0;
          for i:=1 to n do
          begin
               a[i]:=d[i];
               b[i]:=d[n+i];
          end;
     for i:= 1 to 2*n do
     begin
          if i mod 2 = 1 then
          begin
          inc(k);
          d[i]:=b[k];
          end
          else
          d[i]:=a[k];
     end;
          for i:= 1 to n*2 do
          begin
               if e[i]=d[i] then
               inc(r);
          end;
          if r=n*2 then
          t:=-2
          else
          begin
          for i:= 1 to n*2 do
          begin
               if c[i]=d[i] then
               inc(j)
          end;
          if j<>n*2 then
          begin
               inc(t);
               j:=0;
          end;
          r:=0;
          end;
     end;
     writeln(t+1);
end.