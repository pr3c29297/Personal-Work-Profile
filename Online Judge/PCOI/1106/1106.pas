var a:array[1..21,1..21] of longint;
    n,m,i,j,k,x,y,z,p,t:longint;
begin
     readln(n,m);
     for i:= 1 to n do
     begin
          for j:= 1 to m do
          read(a[i,j]);
          readln;
     end;
     readln(p);
     for k:= 1 to p do
     begin
          readln(t,x,y,z);
          if t=1 then
          begin
               a[x,y]:=z;
          end
          else if t=2 then
          begin
                if x=-1 then
                begin
                     for i:= 1 to n do
                     a[i,y]:=a[i,y]+z;
                end
                else if y=-1 then
                begin
                     for j:= 1 to m do
                     a[x,j]:=a[x,j]+z;
                end;
          end
          else if t=3 then
          begin
                if x=-1 then
                begin
                     for i:= 1 to n do
                     a[i,y]:=a[i,y]*z;
                end
                else if y=-1 then
                begin
                     for j:= 1 to m do
                     a[x,j]:=a[x,j]*z;
                end;
          end;
     end;
     for i:= 1 to n do
     begin
          for j:= 1 to m-1 do
          write(a[i,j],' ');
          writeln(a[i,m]);
     end;
end.
