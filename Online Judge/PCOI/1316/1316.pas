var n,i,j,s,k,d:longint;
begin
     readln(n);
     k:=1;
     for i:= 1 to n do
     begin
         s:=s+k;
         write(s);
         d:=s;
         for j:= 1 to i-1 do
         begin
         write(' ',d-1);
         d:=d-1;
         end;
         writeln;
         k:=k+1;
     end;
      for i:= n-1 downto 1 do
     begin
         s:=s+i;
         write(s);
         d:=s;
         for j:= 1 to i-1 do
         begin
         write(' ',d-1);
         d:=d-1;
         end;
         writeln;
     end;

end.