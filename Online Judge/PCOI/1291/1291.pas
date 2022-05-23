var a,p:array[0..1000000] of int64;
    i,j,k,n,r,x,y,com:longint;
    sw:char;
    temp:ansistring;
begin
     p[1]:=1;
     for i:= 2 to 1000 do
     begin
          if p[i]=0 then
          begin
          for j:=2 to 1000000 div i do
          begin
               p[i*j]:=i*j;
          end;
          end;
     end;
     com:=1;
     for i:= 1 to 1000000 do
     begin
          if p[i]=0 then
          begin
               str(i,temp);
               for j:= 1 to trunc(length(temp)/2) do
               begin
                    sw:=temp[j];
                    temp[j]:=temp[length(temp)-j+1];
                    temp[length(temp)-j+1]:=sw;
               end;
               val(temp,com,k);
               if p[com]=0 then
           a[i]:=1;

          end;

           a[i]:=a[i]+a[i-1];
     end;
     readln(n);
     for i:= 1 to n do
     begin
          readln(x,y);
          writeln(a[y]-a[x-1]);
     end;
end.
