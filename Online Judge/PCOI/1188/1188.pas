var a:array[0..1000,0..1000] of longint;
    f:int64;
    i,j,k,n,r,c,m,r1,c1,r2,c2:longint;
    x,y,z:array[0..1000,0..1000] of longint;
begin
     readln(r,c,m);
     for i:= 1 to r do
     begin
          for j:= 1 to c do
          begin
               read(a[i,j]);
          end;
     end;
     for i:= 1 to r do
     begin
          for j:= 1 to c do
          begin
               x[i,j]:=x[i,j-1]+a[i,j];
               y[i,j]:=y[i-1,j]+x[i,j];
          end;
     end;
     for i:= 1 to m do
     begin
          f:=0;
          readln(r1,c1,r2,c2);
          f:=(y[r2,c2]-y[r1-1,c2])-(y[r2,c1-1]-y[r1-1,c1-1]);
          writeln(f);
     end;
end.

end.
