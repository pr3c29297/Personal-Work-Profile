var n,m,mn,i,j,r:longint;
    b:array[1..30000] of boolean;
    a:array[1..30000] of longint;
begin
     readln(n,m);
     r:=n;
     for i:= 1 to n do
     begin
     a[i]:=i;
     b[i]:=true;
     end;
     for j:= 1 to m do
     begin
     read(mn);
      for i:= 1 to n do
      begin
      b[i]:= (a[i] mod mn = 0);
      if b[i]= true then
      begin
      a[i]:= -1;
      r:=r-1;
      end;
      end;
     end;
     writeln(r);
end.
