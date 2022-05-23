var a:array[1..500] of longint;
    b:array[-2000..2000] of longint;
    n,i,j,r:longint;
begin
     n:=-1;
     while n<>0 do
     begin
          read(n);
          if n=0 then
          halt
          else
          begin
               for i:= 1 to n-1 do
               read(a[i]);
               readln(a[i+1]);
               for i:= 2 to n do
               inc(b[a[i]-a[i-1]]);
               for i:= -2000 to 2000 do
               begin
                    if b[i]>0 then
                    begin
                         inc(r);
                         b[i]:=0;
                    end;
               end;
               writeln(r);
               r:=0;
          end;
     end;
end.

