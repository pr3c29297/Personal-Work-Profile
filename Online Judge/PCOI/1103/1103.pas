var a:array[1..1000000] of longint;
    n,m,i,j,t:longint;
begin
     readln(n,m);
     for i:= 1 to m do
     begin
      readln(a[i]);
      if a[i]>j then
      j:=a[i];
     end;
     writeln(trunc(j/n));
end.