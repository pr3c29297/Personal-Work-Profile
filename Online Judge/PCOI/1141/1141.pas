var a,s,t,r:array[1..1001] of longint;
    n,k,i,f,ct:longint;
begin
     readln(n,k);
     for i:= 1 to k do
     begin
     readln(s[i],t[i],r[i]);
      f:=n;
      ct:=0;
      while f>0 do
      begin
       ct:=ct+1;
       if ct<=t[i] then
       begin
       f:=f-s[i];
       a[i]:=a[i]+1;
       end
       else
       begin
       a[i]:=a[i]+r[i];
       ct:=0;
       end;
      end;
     end;
     for i:= 1 to k do
     writeln(a[i]);
end.