var s:array[1..10000] of ansistring;
    i,j,k:longint;
begin
     s[0]:=' ';
     while (s[i][1]<>'#') do
     begin
          inc(i);
          readln(s[i]);
     end;
     for j:= 1 to i-1 do
     begin
           for k:= 1 to length(s[j]) do
           begin
                if (s[j][k]<>' ') and (s[j][k]<>'!') and (s[j][k]<>'$') and (s[j][k]<>'%') and (s[j][k]<>'(') and (s[j][k]<>')') and (s[j][k]<>'*') then
                write(s[j][k]);
                if s[j][k]=' ' then
                write('%20');
                if s[j][k]='!' then
                write('%21');
                if s[j][k]='$' then
                write('%24');
                if s[j][k]='%' then
                write('%25');
                if s[j][k]='(' then
                write('%28');
                if s[j][k]=')' then
                write('%29');
                if s[j][k]='*' then
                write('%2a');
           end;
           writeln;
     end;
end.