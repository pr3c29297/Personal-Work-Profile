var a:array[1..100] of longint;
    l,r,n,i,c,mid:longint;
    begin
    for i:= 1 to 10 do
    read(a[i]);
    readln;
    readln(c);
l:=1;r:=10;
repeat
mid:=(l+r) div 2;
if c>a[mid] then
l:=mid+1;
if c<a[mid] then
r:=mid-1;
until (a[mid]=c) or (l>r);
    writeln(mid);
end.
