var a,b,c,i,j,k,ca,cb,cc:longint;
    x,y,z:double;
begin
     readln(a,b,c);
     for i:= 1 to abs(a) do
     begin
          for j:=1 to abs(c) do
          begin
          if (i<>0) and (j<>0) then
          begin
               if (i*j)+((a div i)*(c div j))=b then
               writeln(i,' ',c div j,' ',a div i,' ',j);
          end;
          end;
     end;
end.
