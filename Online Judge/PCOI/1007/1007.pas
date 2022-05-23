var n,i,r,j,k,l:longint;
    begin
     readln(n);
     if n=1 then
     begin
      writeln('*');
     end
     else
     begin
     j:=n;
     k:=n;
     l:=0;
     for i:= 1 to n-1 do
     begin
      write(' ');
     end;
     for i:= 1 to n do
     begin
      write('*');
     end;
     writeln;
     r:=0;
     while r<n-2 do
     begin
      for i:= k-2 downto 1 do
      begin
       write(' ');
      end;
      write('*');
      for i:= 1 to j do
      begin
       write(' ');
      end;
      j:=j+2;
      writeln('*');
      r:=r+1;
      k:=k-1;
      l:=l+1;
      end;
      write('*');
      for i:= 1 to n+(l*2) do
      begin
       write(' ');
      end;
      writeln('*');
      r:=0;
      k:=1;
      while r<n-2 do
      begin
      for i:=1 to k do
      begin
       write(' ');
      end;
      write('*');
      for i:= n+(l*2)-2 downto 1 do
      begin
       write(' ');
      end;
      j:=j+2;
      writeln('*');
      r:=r+1;
      k:=k+1;
      l:=l-1;
      end;
      for i:= 1 to n-1 do
      begin
       write(' ');
      end;
      for i:= 1 to n do
      begin
       write('*');
     end;
     writeln;
     end;
    end.