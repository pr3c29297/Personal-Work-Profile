var a:array[0..101] of double;
    n,l,r,i,k,j:longint;
    x:double;
begin
     readln(n);
     for i:= 1 to n do
     read(a[i]);
     readln;
     readln(l,r);
     for i:= l+1 to r do
     begin
          x:=a[i];
          a[0]:=x;
          j:=i-1;
          while x>a[j] do
          begin
               a[j+1]:=a[j];
               j:=j-1;
          end;
          a[j+1]:=x;
     end;
     for i:= 1 to n-1 do
     write(a[i]:0:7,' ');
     writeln(a[n]:0:7);
end.