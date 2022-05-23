uses math;
var a:array[1..1000000] of longint;
    s:ansistring;
    i,j:longint;
    cg:int64;
begin
      readln(s);
      for i:= 1 to length(s) do
      begin
           if s[i] in ['0'..'9'] then
                a[i]:=ord(s[i])-48;
           if s[i] in ['A'..'F'] then
                a[i]:=10+ord(s[i])-ord('A');
           cg:=cg+a[i]*trunc(power(16,length(s)-i));
           a[i]:=0;
      end;
      writeln(cg);
end.




