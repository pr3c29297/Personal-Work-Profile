var s1,s2,sub:string;
    v1,v2,p,i,j,k,l,temp:longint;
    a:array[1..4] of longint;
begin
     readln(s1);
     readln(s2);
     for i:= 1 to length(s1) do
     begin
          if s1[i]='.' then
          begin
               sub:=copy(s1,1,i-1);
               val(sub,v1,temp);
               break;
          end;
     end;
     if (1<=v1) and (v1<=127) then
     writeln('A')
     else if (128<=v1) and (v1<=191) then
     writeln('B')
     else if (192<=v1) and (v1<=223) then
     writeln('C');
     for i:= 1 to length(s2)+1 do
     begin
          if (s2[i]='.') or (i=length(s2)+1) then
          begin
               sub:=copy(s2,j+1,i-j-1);
               j:=i;
               inc(l);
               val(sub,a[l],temp);
          end;
     end;
     temp:=256-a[4];
     for i:= 3 downto 1 do
     temp:=temp*(255-a[i]+1);
     writeln(temp-2);

end.