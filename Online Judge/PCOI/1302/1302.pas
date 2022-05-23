var a,b,c:array[65..90] of longint;
    i,j,n,r,k:longint;
    s,ts:ansistring;
procedure ms(l,r:longint);
var p,q:longint;
begin
     if (l<r) then
     begin
          ms(l,(l+r) div 2);
          ms((l+r) div 2 +1,r);
          p:=l;
          q:=(l+r) div 2+1;
          for i:= l to r do
          begin
               if (q>r) or ((p<=(l+r) div 2) and (a[p]>=a[q])) then
               begin
                    b[i]:=a[p];
                    inc(p);
               end
               else
               begin
                    b[i]:=a[q];
                    q:=q+1;
               end;
          end;
          for i:= l to r do
          a[i]:=b[i];
     end;
end;
begin
     readln(s);
     for i:= 1 to length(s) do
     inc(a[ord(s[i])]);
     ms(65,90);
     for i:= 65 to 90 do
     begin
          c[i]:=a[i];
          a[i]:=0;
     end;
     readln(n);
     for k:= 1 to n do
     begin
          for i:= 65 to 90 do
          a[i]:=0;
          r:=0;
          readln(ts);
               for j:= 1 to length(ts) do
               inc(a[ord(ts[j])]);
               ms(65,90);
               for j:= 65 to 90 do
               begin
                    if a[j]=c[j] then
                    inc(r);
               end;
               if r= 26 then
               writeln('YES')
               else
               writeln('NO');
     end;
end.