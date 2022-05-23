var  df,mf,fw:array[1..12] of integer;
     a,b,c,i,j,k,totpt,dfpt,fwpt,mfpt,d,m,f:integer;
begin
     for i:= 1 to 11 do
     readln(df[i],mf[i],fw[i]);
     for i:= 12 downto 2 do
     begin
          for a:= 12 downto i do
          fwpt:=fwpt+fw[a];
          for j:= i downto 2 do
          begin
               for b:= i-1 downto j do
                mfpt:=mfpt+mf[b];
               for c:= j-1 downto 2 do
               dfpt:=dfpt+df[c];
               if dfpt+mfpt+fwpt>= totpt then
               begin
                    totpt:=dfpt+mfpt+fwpt;
                    d:=j-1-2+1;
                    m:=i-1-j+1;
                    f:=12-i;
               end;
               dfpt:=0;
               mfpt:=0;

          end;
          fwpt:=0;
     end;
     writeln(d,'-',m,'-',f);
end.
