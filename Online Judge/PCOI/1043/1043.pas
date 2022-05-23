var s1,s2:string;
a1,a2,a3,b1,b2,b3,i,j,k,ans:longint;
ecode:integer;
c:char;
function leap(x:longint):boolean;
begin
    if  (x mod 400 = 0)  or (x mod 4 = 0) and (x mod 100<>0)
    then
       leap:=true
    else
       leap:=false;
end;
function day(x:longint):longint;
begin
    case x of
    1,3,5,7,8,10,12:day:=31;
    4,6,9,11:day:=30;
    2:if leap(a3)  then day:=29 else day:=28;
    end;

end;
begin
    readln(S1);
    val(copy(s1,1,2),a1,ecode);
    val(copy(s1,4,2),a2,ecode);
    val(copy(s1,7,4),a3,ecode);
    readln(S2);
    val(copy(s2,1,2),b1,ecode);
    val(copy(s2,4,2),b2,ecode);
    val(copy(s2,7,4),b3,ecode);
    if (a3>b3) or (a3=b3) and (a2>b2)  or (a3=b3) and (b2=a2) and(b1<a1) then
    begin
        writeln('input error');
        halt;
    end;
    while ((a1<>b1) or (a2<>b2) or (a3<>b3) ) do
    begin

        a1:=a1+1;
        ans:=ans+1;
        if a1=day(a2) then
        begin
        a1:=0;
        a2:=a2+1;
        end;
        if a2=13 then
        begin
        a2:=1;
        a3:=a3+1;
        end;
    end;
    writeln(ans+1);
end.
