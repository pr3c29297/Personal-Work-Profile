var a:array[1..30000] of double;
    r,i,j,f,t:longint;
    indexs:double;
begin
     readln(r);
     for i:= 1 to r do
     read(a[i]);
     readln(f,t);
     for i:= f+1 to t do
     begin
      indexs := a[i];
      j:=i;
      while ((j>1) and (a[j-1]<indexs)) do
      begin
       a[j]:=a[j-1];
       j:=j-1;
      end;
      a[j]:=indexs;
     end;
     for i:= 1 to r-1 do
     write(a[i]:0:7,' ');
     writeln(a[r]:0:7);
end.