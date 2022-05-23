var a,w,c:array[0..1000000] of double;
    i,j,n,k,cg:longint;
    wl,va:double;
procedure pick (j,n,k:longint; wl:double);
var temp,co:double;
begin
     co:=co+w[j];
     if (co<=wl) and (j<=n) then
     begin
          temp:=temp+a[j];
          c[k]:=temp;
          pick(j+1,n,k+1,wl);
          pick(j,n,k+1,wl);
     end;
end;
begin
     readln(n);
     for i:= 1 to n do
     begin
          readln(a[i],w[i]);
     end;
     readln(wl);
     writeln('Weight limit : ',wl:0:2);
     k:=1;
     pick(1,n,k,wl);
end.
