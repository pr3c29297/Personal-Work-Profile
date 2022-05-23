var a,b,i,j,k,n:longint;
    p,r:array[0..1000000] of int64;
begin
    readln(n);
    for i:= 2 to 1000 do
    begin
         if p[i]=0 then
         begin
              for j:= 2 to 1000000 div i do
              begin
                   p[i*j]:=i*j;
              end;
         end;
    end;
    for i:= 1 to 1000000 do
    begin
         r[i]:=r[i-1]+p[i];
    end;
    for i:= 1 to n do
    begin
          readln(a,b);
          writeln(r[b]-r[a-1]);
    end;
end.
