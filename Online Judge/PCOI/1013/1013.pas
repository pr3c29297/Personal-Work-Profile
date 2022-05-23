var n,i,j,temp,l:longint;
    a,c:array[1..100000] of longint;
    d:double;
begin
     readln(n);
     for i:= 1 to n do
     begin
      readln(d);
      temp:=round(d*100);
      a[temp]:=a[temp]+1;
      if i= 1 then
      l:=a[temp]
      else
      begin
       if a[temp]>l then
       l:=a[temp];
      end;
     end;
     for i:= 1 to 10000 do
     begin
     if a[i]=l then
     writeln(i/100:0:2);
     end;

end.
