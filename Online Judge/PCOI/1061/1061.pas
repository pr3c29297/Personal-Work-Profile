var a:array[0..255,0..255] of longint;
    t,x,y:array[0..500000] of longint;
    n,m,i,j,temp,k,l:longint;
    su:char;
    d:array[0..500000] of char;
begin
     readln(n,m);
     for i:= 0 to n-1 do
     begin
          a[0,i]:=i;
          for j:=1 to n-1 do
          begin
               a[j,i]:=a[j-1,i]+n;
          end;
     end;
     for i:= 1 to m do
     readln(x[i],y[i],d[i],d[i],su,t[i]);
     for i:= m downto 1 do
     begin
          t[i]:=t[i] mod 4;
          for j:= 1 to t[i] do
          begin
               if d[i]='A' then
               begin
                    temp:=a[x[i],y[i]];
                    a[x[i],y[i]]:=a[x[i]+1,y[i]];
                    a[x[i]+1,y[i]]:=a[x[i]+1,y[i]+1];
                    a[x[i]+1,y[i]+1]:=a[x[i],y[i]+1];
                    a[x[i],y[i]+1]:=temp;
               end;
               if d[i]='C' then
               begin
                    temp:=a[x[i],y[i]];
                    a[x[i],y[i]]:=a[x[i],y[i]+1];
                    a[x[i],y[i]+1]:=a[x[i]+1,y[i]+1];
                    a[x[i]+1,y[i]+1]:=a[x[i]+1,y[i]];
                    a[x[i]+1,y[i]]:=temp;
               end;
          end;
     end;
     for k:= 0 to n-1 do
     begin
          for l:= 0 to n-2 do
          write(a[k,l],' ');
          writeln(a[k,n-1]);
     end;

end.
