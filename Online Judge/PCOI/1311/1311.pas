var x1,x2,x3,x4,y1,y2,y3,y4:longint;
    m,a,p:real;
begin
     readln(x1,y1);
     readln(x2,y2);
     readln(x3,y3);
     readln(x4,y4);
     m:=10000;
     if m > (sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1))) then
      m:=sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));

     if m> (sqrt((x3-x1)*(x3-x1)+(y3-y1)*(y3-y1))) then
     m:=sqrt((x3-x1)*(x3-x1)+(y3-y1)*(y3-y1));

     if m> (sqrt((x4-x1)*(x4-x1)+(y4-y1)*(y4-y1))) then
     m:=sqrt((x4-x1)*(x4-x1)+(y4-y1)*(y4-y1));

     if m> (sqrt((x3-x2)*(x3-x2)+(y3-y2)*(y3-y2))) then
     m:=sqrt((x3-x2)*(x3-x2)+(y3-y2)*(y3-y2));

     if m> (sqrt((x4-x2)*(x4-x2)+(y4-y2)*(y4-y2))) then
     m:=sqrt((x4-x2)*(x4-x2)+(y4-y2)*(y4-y2));

     if m> (sqrt((x4-x3)*(x4-x3)+(y4-y3)*(y4-y3))) then
     m:=sqrt((x4-x3)*(x4-x3)+(y4-y3)*(y4-y3));
     p:=m*4;
     a:=m*m;
     writeln(p:0:2,' ',a:0:2);
end.