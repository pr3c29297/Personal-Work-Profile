var s1,s2,sub,c1,c2:ansistring;
    i,j,k,l,sl:longint;
begin
     readln(s1);
     readln(s2);
          for i:= 1 to length(s2) do
          begin
               for j:= 1 to length(s2)-i+1 do
               begin
                    c1:=copy(s2,j,i);
                         for l:= 1 to length(s1)-i+1 do
                         begin
                              c2:=copy(s1,l,i);
                              if (c1=c2) and (length(c2)>sl) then
                              begin
                                   sub:=c2;
                                   sl:=length(c2);
                              end;
                         end;
               end;
          end;
     writeln(sub);
end.