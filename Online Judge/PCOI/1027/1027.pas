var a:array['A'..'Z'] of longint;
i,j,k:longint;
n:char;
s:ansistring;
begin
    readln(s);
    for i:=1 to length(s) do
    begin
    a[s[i]]:=a[s[i]]+1;
    end;
    for n:= 'A' to 'Z' do
    begin
    for i:= 1 to a[n] do
    begin
    write(n);
    end;
    end;
    writeln;

end.
