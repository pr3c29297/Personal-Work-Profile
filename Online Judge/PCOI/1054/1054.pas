uses math;
var dig,n,i,j,f,pl,nl:longint;
    bin,tc:array[1..1000000] of longint;
begin
     readln(dig);
     readln(n);
     pl:=round(power(2,dig-1)-1);
     nl:=0-pl-1;
     if (n>pl) or (n<nl ) then
     writeln('overflow')
     else
     begin
     f:=trunc(sqrt(n*n));
     while f>=2 do
     begin
          inc(i);
          bin[i]:=f mod 2;
          f:=trunc(f / 2);
     end;
     bin[i+1]:=f;
     if n>=0 then
     begin
          for j:= dig downto 1 do
          write(bin[j]);
          writeln;
     end
     else
     begin
           for j:= 1 to dig do
           begin
                if bin[j]=1 then
                tc[j]:=0
                else
                tc[j]:=1;
           end;
           j:=1;
           if tc[1]= 0 then
           tc[1]:=1
           else
           begin
           while tc[j]=1 do
           begin
                tc[j]:=0;
                inc(j);
           end;
           tc[j]:=1;
           end;
           for j:= dig downto 1 do
           write(tc[j]);
           writeln;
     end;
     end;
end.