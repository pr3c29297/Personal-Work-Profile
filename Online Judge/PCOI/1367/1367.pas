var a,b,c,d:array[1..200001] of int64;
    i,j,k,n,m,po,r:longint;
procedure mergeb (l,r:longint);
var p,q:longint;
begin
     if l<r then
     begin
          mergeb(l,(l+r)div 2);
          mergeb((l+r) div 2 +1,r);
          p:=l;
          q:=(l+r) div 2 +1;
          for i:= l to r do
          begin
               if (q>r) or ((p<=(l+r) div 2) and (b[p]<=b[q])) then
               begin
                    {c[i]:=a[p]; }
                    d[i]:=b[p];
                    inc(p);
               end
               else
               begin
                    {c[i]:=a[q];}
                    d[i]:=b[q];
                    inc(q);
               end;
          end;
          for i:= l to r do
          begin
               {a[i]:=c[i];}
               b[i]:=d[i];
          end;
     end;
end;
procedure merge (l,r:longint);
var p,q:longint;
begin
     if l<r then
     begin
          merge(l,(l+r)div 2);
          merge((l+r) div 2 +1,r);
          p:=l;
          q:=(l+r) div 2 +1;
          for i:= l to r do
          begin
               if (q>r) or ((p<=(l+r) div 2) and (a[p]<=a[q])) then
               begin
                    c[i]:=a[p];   {
                    d[i]:=b[p]; }
                    inc(p);
               end
               else
               begin
                    c[i]:=a[q];{
                    d[i]:=b[q]; }
                    inc(q);
               end;
          end;
          for i:= l to r do
          begin
               a[i]:=c[i];{
               b[i]:=d[i];   }
          end;
     end;
end;
begin
     readln(n);
     for i:= 1 to n do
     readln(a[i],b[i]);
     readln(m);
     for i:= n+1 to n+m do
     readln(a[i],b[i]);
     merge(1,n+m);
     mergeb(1,n+m);
     po:=b[1];
     for i:= 1 to n+m do
     begin
          if (po+1<a[i]) then
          begin
               inc(r);
               po:=b[i];
               c[i]:=-1;
               d[i]:=-1;
          end
          else
          begin
               if po<b[i] then
               po:=b[i];
          end;
     end;
     writeln(r+1);
     write(a[1],' ');
     for i:= 1 to n+m do
     begin
          if c[i]=-1 then
          writeln(b[i-1]);
          if d[i]=-1 then
          write(a[i],' ');
     end;
     writeln(po);

end.