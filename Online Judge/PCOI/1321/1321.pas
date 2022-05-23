var a,b,gcd,temp,tempb,i:longint;
    s,sa,sb:ansistring;
begin
    while s<>'0/0' do
    begin
    readln(s);
    if s<>'0/0' then
    begin
    temp:=0;
    for i:= 1 to length(s) do
    begin
         if s[i]='/' then
         temp:=i;
    end;
    sb:=copy(s,temp+1,length(s));
    sa:=copy(s,1,temp-1);
    val(sa,a,temp);
    val(sb,b,temp);
    temp:=a;
    tempb:=b;
    while tempb<>0 do
    begin
         gcd:=temp mod tempb;
         temp:=tempb;
         tempb:=gcd;
    end;
    gcd:=abs(temp);
    a:=a div gcd;
    b:=b div gcd;
    if ((a<0) and (b<0)) or (b<0) then
    begin
         a:=-a;
         b:=-b;
    end;
    if (b>1) then
    writeln(a,'/',b)
    else if (b=1) then
    writeln(a);
    end;
    end;
end.
