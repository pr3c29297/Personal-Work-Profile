var n,i,t,j,e:longint;
    c1,c2,ans:array[1..1000000] of char;
begin
     readln(n);
     for i:= 1 to n do
     begin
      readln(c1[i],c2[i]);
      if t<0 then
      e:=1
      else
      begin
      if c1[i]='+' then
      begin
       inc(t);
       ans[t]:=c2[i];
      end
      else
      begin
       for j:= 1 to t-1 do
       ans[j]:=ans[j+1];
       dec(t);
      end;
      end;
     end;
     if e=1 then
     writeln('ERROR');
     if t=0 then
     writeln('EMPTY')
     else if t>0 then
     begin
     for i:= 1 to t do
     write(ans[i]);
     writeln;
     end;
end.