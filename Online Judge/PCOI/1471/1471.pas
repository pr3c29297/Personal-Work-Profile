var a:array['0'..'9'] of longint;
    i,j,k,n:longint;
    s:string;
    c:char;
begin
     readln(n);
     while k<>10 do
     begin
          inc(n);
          for c:= '0' to '9' do
          begin
               a[c]:=0;
          end;
          str(n,s);
          for i:= 1 to length(s) do
          begin
               a[s[i]]:=a[s[i]]+1;
          end;
          for c:= '0' to '9' do
          begin
               if a[c]<=1 then
               inc(k);
          end;
          if k=10 then
          begin
               writeln(n);
               halt;
          end
          else
          k:=0;
     end;
end.