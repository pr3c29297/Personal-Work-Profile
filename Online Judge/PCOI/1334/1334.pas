var n,l,i,j,w,s,m,e,d,a,p:longint;
begin
     readln(n,l);
     for i:= 1 to n do
     begin
      read(w,s,m,e,d);
      p:=w;
      for j:= s+1 to e-1 do
      begin
       if j<=m then
       p:=p+d;
       if j>m then
       p:=p-d;
       if p>l then
       a:=a+(p-(l-1));
      end;
     end;
     writeln(a);
end.