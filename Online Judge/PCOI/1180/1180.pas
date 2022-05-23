var a,a2:array[0..101,0..101] of char;
    n,m,x,i,j,k,l,d:longint;
begin
     readln(n,m,x);
     for i:= 1 to n do
     begin
          for j:= 1 to m-1 do
          begin
          read(a[i,j]);
          a2[i,j]:=a[i,j];
          end;
          readln(a[i,m]);
          a2[i,m]:=a[i,m];
     end;
     for k:= 1 to x do
     begin

          for i:= 1 to n do
          begin
               for j:= 1 to m do
               begin

                              if a[i-1,j-1]='0' then
                              inc(d);
                              if a[i-1,j-1]='1' then
                              inc(l);
                              if a[i-1,j]='0' then
                              inc(d);
                              if a[i-1,j]='1' then
                              inc(l);
                              if a[i-1,j+1]='0' then
                              inc(d);
                              if a[i-1,j+1]='1' then
                              inc(l);
                              if a[i,j-1]='0' then
                              inc(d);
                              if a[i,j-1]='1' then
                              inc(l);
                              if a[i,j+1]='0' then
                              inc(d);
                              if a[i,j+1]='1' then
                              inc(l);
                              if a[i+1,j-1]='0' then
                              inc(d);
                              if a[i+1,j-1]='1' then
                              inc(l);
                              if a[i+1,j]='0' then
                              inc(d);
                              if a[i+1,j]='1' then
                              inc(l);
                              if a[i+1,j+1]='0' then
                              inc(d);
                              if a[i+1,j+1]='1' then
                              inc(l);
                    if a[i,j]='1' then
                    begin
                         if (l=2) or (l=3) then
                         a2[i,j]:='1'
                         else
                         a2[i,j]:='0';

                    end;

                    if a[i,j]='0' then
                    begin
                         if (l=3) then
                         a2[i,j]:='1';
                    end;
                    l:=0;
                    d:=0;
               end;
          end;
          for i:= 1 to n do
          begin
               for j:= 1 to m do
               begin
                    a[i,j]:=a2[i,j];
               end;
          end;
     end;
     for i:= 1 to n do
     begin
          for j:= 1 to m-1 do
          write(a2[i,j]);
          writeln(a2[i,m]);
     end;
end.