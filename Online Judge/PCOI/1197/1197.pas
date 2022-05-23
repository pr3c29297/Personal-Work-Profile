var
 f:array[0..2000,0..2000]of char;
 d:array[0..2000,0..2000]of longint;
 a:array[0..2000]of char;
 n,i,j,k,m,l,r,ll,rr:longint;
procedure print(i:longint);
 begin
  write(a[i]);
  inc(k);
  if k=80 then begin writeln; k:=0; end;
 end;
procedure left;
 begin
  for m:=i to l-1 do print(m);
  i:=l;
 end;
procedure right;
 begin
  for m:=r+1 to j do print(m);
  j:=r;  
 end;
begin
 readln(n);
 for i:=1 to n do readln(a[i]);
 i:=1; j:=n;
 while i<j do
  if a[i]<a[j] then begin print(i); inc(i); end
  else if a[i]>a[j] then begin print(j); dec(j); end
  else begin
   l:=i; r:=j;
   while (a[l]=a[i])and(a[r]=a[i])and(l<r) do
    begin inc(l); dec(r); end;
   if (l>r)or((a[l]>=a[i])and(a[r]>=a[i])) then
    begin left; right; end
   else if a[l]<a[r] then left
   else if a[l]>a[r] then right
   else begin
    ll:=l; rr:=r;
    while (a[ll]=a[rr])and(ll<rr) do 
     begin inc(ll); dec(rr); end;
    if (ll>rr)or(a[ll]<a[rr]) then left else right;
   end;
  end;
 if i=j then print(i);
 if k<>0 then writeln;
end.