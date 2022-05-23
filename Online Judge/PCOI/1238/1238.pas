var n,c,i,j,k,sum,temp:longint;
    a:array[1..16] of longint;
begin
     readln(c,n);
     for i:= 1 to n do
     readln(a[i]);
     for i:= 1 to n do
     begin
          j:=i;
          while j<=n do
          begin
               temp:=temp+a[j];
               inc(j);
               if temp > c then
               begin
                    temp:=temp-a[j];
                    inc(j);
               end;
          end;
          if temp>sum then
          sum:=temp;
          temp:=0;
     end;
     writeln(sum);
end.