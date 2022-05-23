var p:array[1..51,1..51] of char;
    a,t,n,i,j,k,c:longint;
begin
     readln(t);
     begin
      for k:= 1 to t do
      begin
       readln(n);
       a:=0;
       for i:= 1 to 2 do
       begin
        for j:= 1 to n do
        read(p[i,j]);
       end;
        for i:= 1 to 2 do
        begin
         for j:= 1 to n do
         begin
          if p[i,j] = '1' then
          a:=a+1;
         end;
        end;
        writeln(a);
       end;
       end;
       end.