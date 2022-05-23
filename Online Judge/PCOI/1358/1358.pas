var inp,t,ft:ansistring;
a,b,c,d:array[0..100000] of longint;
i,j,k,al,bl,tem:longint;
begin
    readln(inp);
    for i:= length(inp) downto 1 do
    begin
        a[j]:=ord(inp[i])-ord('0');
        inc(j);
    end;
    al:=length(inp)-1;
    readln(inp);
    bl:=length(inp)-1;
    j:=0;
    for i:= length(inp) downto 1 do
    begin
        b[j]:=ord(inp[i])-ord('0');
        inc(j);
    end;
    for i:= 0 to al do
    begin
        for j:= 0 to bl do
        begin
            c[i+j]:=c[i+j]+a[i]*b[j];
        end;
    end;
    for i:= 0 to al+bl do
    begin
        c[i]:=c[i]+tem;
        if c[i]<10 then
        d[i]:=c[i]
        else
        begin
            str(c[i],t);
            d[i]:=ord(t[length(t)])-ord('0');
            ft:=copy(t,1,length(t)-1);
            val(ft,tem,k);
        end;
    end;
    d[al+bl]:=c[al+bl];
    for i:= al+bl downto 0 do
    write(d[i]);
    writeln;

end.