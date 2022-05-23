var a:array[0..30000] of longint;
    n,i,j,k,m,c,r:longint;
begin
      readln(n);
      a[0]:=10001;
      for i:= 1 to n do
      begin
           readln(a[i]);
      end;
      m:=a[1];
      c:=-1;
      for i:= 1 to n do
      begin
           if (a[i]<m) then
           begin
                inc(c);
           end
           else
           begin
                for j:= i-1 downto i-c-1 do
                begin
                r:=r+m-a[j];
                end;
                m:=a[i];
                c:=-1;
           end;
      end;
      writeln(r);
end.
