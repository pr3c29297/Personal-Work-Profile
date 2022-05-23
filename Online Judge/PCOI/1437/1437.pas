var a:array['a'..'z'] of longint;
    n,i,j,k,m:longint;
    c:char;
    s:ansistring;
begin
     readln(n);
     readln(s);
     m:=1001;
     for i:= 1 to length(s) do
     inc(a[s[i]]);
     for c:= 'a' to 'z' do
     begin
     if a[c] mod n <>0 then
     begin
          writeln(-1);
          halt;
     end;
     end;
          for i:= 1 to n do
          begin
               for c:='a' to 'z' do
               begin
                    for j:= 1 to a[c] div n do
                    write(c);
               end;
          end;
          writeln;
end.
