var n,i,j,k,a,b:longint;
    p,r:array[0..1000000] of int64;
begin
     readln(n);
     for i:= 2 to 100000 do
     p[i]:=i;
     for i:= 2 to 1000 do
     begin
          if p[i]<>0 then
          p[i]:=1;
          for j:= 2 to 100000 div i do
          begin
               p[i*j]:=0;
          end;
     end;
     for i:= 1 to 100000 do
          r[i]:=r[i-1]+p[i];
     for i:= 1 to n do
     begin
          readln(a,b);
          writeln(r[b]-r[a-1]);
     end;
end.