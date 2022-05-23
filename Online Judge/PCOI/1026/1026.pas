var n,i,l,m,r,s,t:longint;
    x,y:char;
begin
    l:=0;
    m:=1;
    r:=0;
    readln(n);
    for i:= 1 to n do
    begin
    readln(x,y,y);
    if ((x='L') and (y='M')) then
    begin
    if r=1 then
    begin
    m:=0;
    l:=0;
    end
    else
    begin
    if m=1 then
    begin
    m:=0;
    l:=1;
    end
    else
    begin
    m:=1;
    l:=0;
    end;
    end;
    end;
    if ((x='M') and (y='L')) then
    begin
    if r=1 then
    begin
    m:=0;
    l:=0;
    end
    else
    begin
     if m=1 then
    begin
    m:=0;
    l:=1;
    end
    else
    begin
    m:=1;
    l:=0;
    end;
    end;
    end;
    if (( x='R') and (y='L')) then
    begin
    if m= 1 then
    begin
    r:=0;
    l:=0;
    end
    else
    begin
      if r= 1 then
    begin
    l:=1;
    r:=0;
    end
    else
    begin
    r:=1;
    l:=0;
    end;
    end;
    end;
     if ((x='L') and (y='R')) then
    begin
     if m= 1 then
    begin
    r:=0;
    l:=0;
    end
    else
    begin
    if r= 1 then
    begin
    l:=1;
    r:=0;
    end
    else
    begin
    r:=1;
    l:=0;
    end;
    end;
    end;
    if ((x='R') and (y='M')) then
    begin
    if l=1 then
    begin
    m:=0;
    r:=0;
    end
    else
    begin
    if m= 1 then
    begin
    m:=0;
    r:=1;
    end
    else
    begin
    m:=1;
    r:=0;
    end;
    end;
    end;
     if ((x='M') and (y='R')) then
    begin
    if l=1 then
    begin
    m:=0;
    r:=0;
    end
    else
    begin
    if m= 1 then
    begin
    m:=0;
    r:=1;
    end
    else
    begin
    m:=1;
    r:=0;
    end;
    end;
    end;
    end;

    if l=1 then
    writeln('Left');
    if m= 1 then
    writeln('Middle');
    if r= 1 then
    writeln('Right');

end.
