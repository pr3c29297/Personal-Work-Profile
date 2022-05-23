uses math;
var a,b:array[1..100] of char;
    s:string;
    i,j,k,os,inp,le:longint;
    c:array[1..100] of double;
begin
     readln(s);
     for i:= 1 to length(s)-1 do
     begin
          if s[i] in ['0'..'9'] then
          begin
               inc(le);
               b[le]:=s[i];
          end
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
                    if os>=inp then
                    begin
                         inc(le);
                         b[le]:=a[j];
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
     begin
          inc(le);
          b[le]:=a[i];
     end;
     j:=0;
     for i:= 1 to le do
     begin
          if b[i]in['0'..'9'] then
          begin
               inc(j);
               c[j]:=ord(b[i])-ord('0');
          end
          else if b[i]='+' then
          begin
               c[j-1]:=c[j]+c[j-1];
               j:=j-1;
          end
          else if b[i]='-' then
          begin
               c[j-1]:=c[j-1]-c[j];
               j:=j-1;
          end
          else if b[i]='*' then
          begin
               c[j-1]:=c[j]*c[j-1];
               j:=j-1;
          end
          else if b[i]='/' then
          begin
               c[j-1]:=c[j-1]/c[j];
               j:=j-1;
          end
          else if b[i]='@' then
          begin
               c[j-1]:=power(c[j-1],c[j]);
               j:=j-1;
          end;
     end;
     writeln(c[1]:0:3);
end.

end.

