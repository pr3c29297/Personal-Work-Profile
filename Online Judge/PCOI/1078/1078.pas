var a,b,n,m,i:longint;
    begin
     readln(n,m);
     a:=1;
     b:=1;
     for i:= 1 to n-1 do
     begin
     a:=a*i;
     end;
     for i:= 1 to m do
     begin
     b:= b*i;
     end;
     writeln(a*b);
     end.