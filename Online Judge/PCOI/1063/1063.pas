var n,k,i,j:longint;
    a:array[1..6001] of longint;
    c1,c2,t:int64;
begin
     readln(n,k);
     c1:=2147483650;
     c2:=c1;
     for i:= 1 to n do
     read(a[i]);
     for i:= 1 to n do
     begin
      for j:= i to n do
      begin
       if a[i]*a[j] = k then
       begin
       if a[j]<a[i] then
       begin
        t:=a[i];
        a[i]:=a[j];
        a[j]:=t;
       end;
        if (a[i]<c1) then
        begin
         c1:=a[i];
         c2:=a[j];
        end;
       end;
      end;
     end;
     if ((c1=2147483650) and (c2=c1)) then
     writeln('0 0')
     else
     writeln(c1,' ',c2);
end.
