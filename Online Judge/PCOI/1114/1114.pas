var x,n,i,j,k,l:longint;
    begin
     readln(n);
     x:=1;
     if n= 1 then
     begin
     writeln('2');
     end
     else
     begin
     for i:= 2 to 6997 do
      begin

       l:= 2;
       while (l<=(i/2)) and (i mod l <> 0) do
         l:=l+1;
         if l>(i/2) then
          begin
          if i=2 then
          begin
          write(i,' ');
          x:=x+1;
          end
          else
          begin
          if x<=n*n then
          begin
          if x mod n <>0 then
          begin
          write(i,' ');
          x:=x+1;
          end
          else
          begin
          writeln(i);
          x:=x+1;
          end;
          end;
          end;
          end;
          end;
          end;
      end.
