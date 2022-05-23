var s,temp:ansistring;
    u,p:char;
    ch:array [1..1000000] of longint;
    a,b,c,ans:double;
    ecode,i,n:longint;
begin
     readln(s);
     for i:= 1 to length(s) do
     begin
      if( s[i]='+') or (s[i]='=') or (s[i] in ['a'..'z']) then
      begin
       inc(n);
       ch[n]:=i;
      end;
      if s[i] in ['a'..'z'] then
      u:=s[i];
     end;

     temp:=copy(s,1,ch[1]-1);
     val(temp,a,ecode);
     if s[ch[1]] = u then
     begin
     temp:=copy(s,ch[2]+1,ch[3]-ch[2]-1);
     val(temp,b,ecode);
     temp:=copy(s,ch[3]+1,length(s)-ch[3]);
     val(temp,c,ecode);
     ans:=(c-b)/a;
     end
     else
     begin
     temp:=copy(s,ch[1]+1,ch[2]-ch[1]-1);
     val(temp,b,ecode);
     temp:=copy(s,ch[3]+1,length(s)-ch[3]);
     val(temp,c,ecode);
     ans:=(c-a)/b;
     end;
     writeln(u,'=',ans:0:2);
end.

