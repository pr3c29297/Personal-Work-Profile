var s,att:ansistring;
    n,i,j,t,f,g:longint;
    c:char;
    a,ty:array['a'..'z'] of longint;
begin
    readln(s);
    for i:= 1 to length(s) do
      a[s[i]]:=1;
    for c:='a' to 'z' do
      if a[c]=1 then
        inc(g);
    readln(att);
    for i:= 1 to length(att) do
    begin
      if f<7 then
      begin
        if a[att[i]]=1 then
          begin
            inc(t);
            inc(a[att[i]]);
          end;
        if a[att[i]]=0 then
          begin
            inc(f);
            a[att[i]]:=2;
          end;
      end;
    end;
    if t=g then
    writeln('You win.');
    if (t<g) and (f>=7) then
    writeln('You lose.');
    if (t<g) and (f<=6) then
    writeln('You chickened out.')
end.
