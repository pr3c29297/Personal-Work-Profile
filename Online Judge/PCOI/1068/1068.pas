var n,i,t,r,j,k,l:longint;
    s,s1,temp:ansistring;
    c,co:array[1..100000] of char;
begin
     readln(n);
     readln(s);
     t:=1;
     r:=0;
     for i:= 1 to length(s) do
           co[i]:=s[i];
     l:=length(s);
     for k:= 1 to n do
     begin
     for i:= 1 to l do
     begin
          if i<> l then
          begin
          if co[i]=co[i+1] then
          inc(t);
          if (co[i]<>co[i+1])  then
          begin
                str(t,temp);
                for j:=1 to length(temp) do
                c[r+j]:=temp[j];
                c[r+j+1]:=co[i];
                r:=r+j+1;
                t:=1;
          end;
          end
          else
          begin
                if co[i]=co[i-1] then
                begin
                str(t,temp);
                for j:=1 to length(temp) do
                c[r+j]:=temp[j];
                c[r+j+1]:=co[i];
                r:=r+j+1;
                t:=1;
                end
                else
                begin
                c[r+1]:='1';
                c[r+2]:=co[i];
                r:=r+2;
                end;
          end;
     end;
     for i:= 1 to r do
     begin
          co[i]:=c[i];
          if k=n then
          write(co[i]);
     end;
     l:=i;
     t:=1;
     r:=0;
     end;
     writeln;
end.