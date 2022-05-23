var a:array[1..100] of string;
    n,i,j,k,r:longint;
    s:string;
begin
     readln(s);
     readln(n);
     for i:= 1 to n do
     readln(a[i]);
     for i:= 1 to n do
     begin
          if a[i]<> s then
          begin
               for j:= i+1 to n do
               begin
                    if a[i]=a[j] then
                    begin
                         inc(r);
                         a[j]:='';
                    end;
               end;
               if r>0 then
               begin
                    a[i]:='';
                    r:=0;
               end;
          end;
     end;
     for i:= 1 to n do
     begin
          if a[i]='' then
          inc(r);
     end;
     writeln(r);
end.
