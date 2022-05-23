var a:array[1..100] of longint;
    n,i,j,s:longint;
begin
     readln(n);
     j:=1;
     s:=0;
     for i:= 1 to n do
     begin
     readln(a[j],a[i]);
     j:=j+1;
     end;
     j:=1;
     for i:= 1 to n-1 do
     begin
     if (a[j+1]-a[j]>=0) and (a[i+1]-a[i]>=0) then
      s:=s+((a[j+1]-a[j])+(a[i+1]-a[i]))

     else if (a[j+1]-a[j]<=0) and (a[i+1]-a[i]<=0) then
       s:=s+((a[j]-a[j+1])+(a[i]-a[i+1]));
      j:=j+1;
     end;
     writeln(s);
end.