var n,m,i,j,o,c:longint;
    an,am,max:array[1..300000] of longint;
begin
     readln(n);
     for i:= 1 to n do
     read(an[i]);
     readln(m);
     for i:= 1 to m do
     begin
      readln(am[i]);
      o:=0;
      for j:= 1 to n do
      if ((an[j]<=am[i]) and (an[j]>o)) then
      begin
       o:=an[j];
       max[i]:=an[j];
       c:=j;
      end;
       end;
     for i:= 1 to m do
     writeln(max[i]);
end.