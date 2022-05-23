var a,b:array[1..31] of ansistring;
    go,si,br:array[1..31] of longint;
    n,i,j,k,po,l,r,t,ch:longint;
    s:ansistring;
begin
     readln(n);
     for i:= 1 to n do
     begin
          readln(s);
          po:=0;
          for j:= 1 to length(s) do
          begin
               if s[j]=',' then
               begin
                    inc(po);
                    if po=1 then
                    begin
                         for k:= 1 to t do
                         begin
                              if a[k]=copy(s,1,j-1) then
                              begin
                                   ch:=-1;
                                   inc(go[k]);
                                   break;
                              end;
                         end;
                         if (ch<>-1) then
                         begin
                              inc(t);
                              a[t]:=copy(s,1,j-1);
                              inc(go[t]);
                         end;
                         l:=j;
                         ch:=1;
                    end
                    else if po=2 then
                    begin
                         for k:= 1 to t do
                         begin
                              if a[k]=copy(s,l+1,j-1-l) then
                              begin
                                   ch:=-1;
                                   inc(si[k]);
                                   break;
                              end;
                         end;
                         if ch<>-1 then
                         begin
                              inc(t);
                              a[t]:=copy(s,l+1,j-1-l);
                              inc(si[t]);
                         end;
                         ch:=1;
                         for k:= 1 to t do
                         begin
                              if a[k]=copy(s,j+1,length(s)-j) then
                              begin
                                   ch:=-1;
                                   inc(br[k]);
                                   break;
                              end;
                         end;
                         if ch<>-1 then
                         begin
                              inc(t);
                              a[t]:=copy(s,j+1,length(s)-j);
                              inc(br[t]);
                         end;
                         ch:=1;
                    end;
               end;
          end;
     end;
     for i:= 1 to t do
     begin
          for j:= 1 to t-1 do
          begin
               if go[j]>go[j+1] then
               begin
                    k:=go[j];
                    go[j]:=go[j+1];
                    go[j+1]:=k;
                    s:=a[j];
                    a[j]:=a[j+1];
                    a[j+1]:=s;
                    k:=si[j];
                    si[j]:=si[j+1];
                    si[j+1]:=k;
                    k:=br[j];
                    br[j]:=br[j+1];
                    br[j+1]:=k;
               end
               else if go[j]=go[j+1] then
               begin
                    if si[j]>si[j+1] then
                    begin
                         s:=a[j];
                         a[j]:=a[j+1];
                         a[j+1]:=s;
                         k:=si[j];
                         si[j]:=si[j+1];
                         si[j+1]:=k;
                         k:=br[j];
                         br[j]:=br[j+1];
                         br[j+1]:=k;
                    end
                    else if si[j]=si[j+1] then
                    begin
                         if br[j]>br[j+1] then
                         begin
                              s:=a[j];
                              a[j]:=a[j+1];
                              a[j+1]:=s;
                              k:=br[j];
                              br[j]:=br[j+1];
                              br[j+1]:=k;
                         end
                         else if br[j]=br[j+1] then
                         begin
                              if a[j]<a[j+1] then
                              begin
                                   s:=a[j];
                                   a[j]:=a[j+1];
                                   a[j+1]:=s;
                              end;
                         end;
                    end;
               end;
          end;
     end;
     writeln('COUNTRY      GOLD  SILVER  BRONZE  TOTAL');
     writeln('----------------------------------------');
     for i:= t downto 1 do
     writeln(a[i],go[i]:(17-length(a[i])),si[i]:(8),br[i]:(8),(go[i]+si[i]+br[i]):(7));
end.

