var a:array[1..50000] of int64;
    t:int64;
    i,j,k,n,c,st,temp,ans:longint;
begin
     readln(t,n);
     st:=9999999;
     for i:= 1 to n do
     begin
          readln(a[i]);
          if abs(a[i])<abs(st) then
          begin
          k:=i;
          st:=a[i];
          end;
     end;
     c:=abs(st);
     inc(ans);
     a[k]:=0;
     while c<t do
     begin
          temp:=999999;
          for i:=1 to n do
          begin
               if (a[i]<>0) and (abs(st-a[i])<temp) then
               begin
                    temp:= abs(st-a[i]);
                    k:=i;
               end;
          end;
          c:=c+temp;
          st:=a[k];
          a[k]:=0;
          if c<t then
          inc(ans);
     end;
     writeln(ans);
end.

