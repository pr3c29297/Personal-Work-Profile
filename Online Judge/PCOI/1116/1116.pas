var i,j,k,temp:longint;
    ip,sm,ans2:array [1..4] of longint;
    bin1,bin2,ans:array[1..8] of longint;
    s:ansistring;
begin
     for i:= 1 to 2 do
     begin
          readln(s);
          k:=1;
          for j:= 1 to length(s) do
          begin
               if s[j]<>'.' then
               begin
               temp:=temp*10+(ord(s[j])-ord('0'));
               end
               else
               begin
                     if i=1 then
                     begin
                          ip[k]:=temp;
                     end
                     else
                     begin
                          sm[k]:=temp;
                     end;
                     inc(k);
                     temp:=0;
               end;
          end;
          if i=1 then
          ip[k]:=temp
          else
          sm[k]:=temp;
          temp:=0;
     end;
     for i:= 1 to 4 do
     begin
          k:=8;
          while ip[i]>=2 do
          begin
               bin1[k]:=ip[i] mod 2;
               ip[i]:=ip[i] div 2;
               dec(k);
          end;
          bin1[k]:=ip[i];
          k:=8;
          while sm[i]>=2 do
          begin
               bin2[k]:=sm[i] mod 2;
               sm[i]:=sm[i] div 2;
               dec(k);
          end;
          bin2[k]:=sm[i];
          for j:= 1 to 8 do
          begin
               ans[j]:=bin1[j] and bin2[j];
          end;
          temp:=0;
          for j:= 1 to 8 do
          begin
               temp:=temp+trunc(ans[j]*exp((8-j)*ln(2)));
          end;
          for j:= 1 to 8 do
          begin
               bin2[j]:=abs(1-bin2[j]);
               ans[j]:=bin1[j] or bin2[j];
          end;

          for j:= 1 to 8 do
          begin
               ans2[i]:= ans2[i]+trunc(ans[j]*exp((8-j)*ln(2)));
          end;
          if i<=3 then
          write(temp,'.')
          else
          writeln(temp);
          for j:= 1 to 8 do
          begin
               bin1[j]:=0;
               bin2[j]:=0;
          end;
     end;
     for i:= 1 to 3 do
     write(ans2[i],'.');
     writeln(ans2[4]);
end.

