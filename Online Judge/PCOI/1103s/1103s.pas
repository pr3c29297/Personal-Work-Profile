var a:array[1..101] of double;
    n,l,r,i,j,k:longint;
    x,temp:double;
begin
     readln(n);
     for i:=1 to n do
     read(a[i]);
     readln;
     readln(l,r);
     for i:= r downto l+1 do
     begin
          x:=a[l];
          k:=l;
          for j:= l to i do
          begin
               if a[j]<x then
               begin
                    x:=a[j];
                    k:=j;
               end;
          end;
          temp:=a[k];
          a[k]:=a[i];
          a[i]:=temp;
     end;
     for i:= 1 to n -1 do
     write(a[i]:0:7,' ');
     writeln(a[n]:0:7);
end.