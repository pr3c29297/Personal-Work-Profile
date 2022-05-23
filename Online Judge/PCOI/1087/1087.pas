uses math;
var i,j,n,temp,k,t:longint;
    s:array[1..1000000] of ansistring;
    s1:ansistring;
begin
     while not eof do
     begin
     i:=i+1;
     readln(s[i]);
     end;
     for j:= 1 to i do
      begin
      for k:= 1 to length(s[j]) do
      begin
        temp:=round((ord(s[j][k])-ord('0'))*power(10,length(s[j])-k));
        if temp>=1000 then
        begin
         for t:= 1 to temp div 1000 do
         write('M');
        end;
        if temp=900 then
        write('CM');
        if (temp<=800) and (temp>=500) then
        begin
         write('D');
         for t:= temp div 100 -1 downto 5 do
         write('C');
        end;
        if temp=400 then
        write('CD');
        if (temp<=300) and (temp>=100) then
        begin
         for t:= temp div 100  downto 1 do
         write('C');
        end;
        if temp=90 then
        write('XC');
        if (temp<=80) and (temp>=50) then
        begin
         write('L');
         for t:= temp div 10 -1 downto 5 do
         write('X');
        end;
        if temp=40 then
        write('XL');
        if (temp<=30) and (temp>=10) then
        begin
         for t:= temp div 10 downto 1 do
         write('X');
        end;
       if temp=9 then
       write('IX');
       if (temp<=8) and (temp>=5) then
       begin
        write('V');
        for t:= temp-1 downto 5 do
        write('I');
       end;
       if temp=4 then
       write('IV');
       if (temp<=3) and (temp>0) then
       begin
       for t:= temp downto 1 do
       write('I');
       end;
      end;
      writeln;
      end;
end.
