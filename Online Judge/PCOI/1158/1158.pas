var a:array[1..100000000] of int64;
    s:ansistring;
    i,j,k,c:longint;
    t:int64;
begin
     readln(s);
     val(s,t,i);
     for i:= 1 to length(s) do
     begin
          a[k]:=ord(s[i])-ord('0');
          inc(k);
     end;
end.
