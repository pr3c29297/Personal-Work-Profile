var s:string;
    m:char;
    t,a,i,i1,i2:real;
    c,p:longint;
    t1,t2,d:extended;

    begin
    readln(s);
    readln(t);
    readln(m);
    readln(c);
    readln(p);
    if p>4 then
    begin
    p:=4;
    end;
    p:=p*15000;
    if c>5 then
    begin
    c:=5;
    end;
    c:=c*10000;
    if m='M' then
    begin
    a:=30000+30000+c+p;
    writeln('Allowance = ',a:0:2);
    end
    else
    begin
     a:=30000+c+p;
    writeln('Allowance = ',a:0:2);
    end;
    i:=t-a;
    if i<0 then
    begin
    i:=0;
    end;
    writeln('Net Chargeble Income = ',i:0:2);
    i1:=i;
    i2:=i;

    if i<=40000 then
    begin
    t1:=i*0.02;
    end
    else
    begin
     if i<=80000 then
     begin
     t1:=800+(i-40000)*0.07;
     end
     else
     begin
      if i>120000 then
      begin
       t1:= 8400+(i-120000)*0.17;
      end
      else
      begin
       t1:=3600+(i-80000)*0.12;
      end;
      end;

      end;
      if t*0.15<t1 then
      begin
      t1:=t*0.15;
      end;

      writeln('Tax of ',s,' in 2008/09 : ',t1:0:2);

        if i<=35000 then
    begin
    t2:=i*0.02;
    end
    else
    begin
     if i<=70000 then
     begin
     t2:=700+(i-35000)*0.07;
     end
     else
     begin
      if i>105000 then
      begin
       t2:= 7350+(i-105000)*0.17;
      end
      else
      begin
       t2:=3150+(i-70000)*0.12;
      end;
      end;
      end;
      if t*0.16<t2 then
      begin
      t2:=t*0.16;
      end;

      writeln('Tax of ',s,' in 2007/08 : ',t2:0:2);
      d:=t1-t2;
      writeln('Difference = ',d:0:2);
    end.
