var a:array[1..21] of char;
    s:string;
    i,j,k,os,inp:longint;
begin
     readln(s);
     for i:= 1 to length(s)-1 do
     begin
          if s[i] in ['0'..'9'] then
          write(s[i])
          else
          begin
               while j>0 do
               begin
                    if s[i]='@' then
                    inp:=4
                    else if (s[i]='*') or (s[i]='/') then
                    inp:=2
                    else if (s[i]='+') or (s[i]='-') then
                    inp:=1;
                    if a[j]='@' then
                    os:=3
                    else if (a[j]='*') or (a[j]='/') then
                    os:=2
                    else if (a[j]='+') or (a[j]='-') then
                    os:=1;
                    if inp<=os then
                    begin
                         write(a[j]);
                         dec(j);
                    end
                    else
                    break;
               end;
               inc(j);
               a[j]:=s[i];
          end;
     end;
     for i:= j downto 1 do
     write(a[i]);
     writeln;
end.
