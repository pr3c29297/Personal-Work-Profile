var s:array[1..100000] of ansistring;
    n,i,j,k,num,l:longint;
    nous:array[1..100000] of char;
    ous,nu:ansistring;
begin
     readln(n);
     for i:= 1 to n do
     readln(s[i]);
     readln(ous);
     i:=0;
     while i=0 do
     begin
          k:=0;
          for j:= 1 to n do
          begin
          if s[j]<>ous then
          inc(k);
          end;
          if k=n then
          i:=1
          else
          begin
               inc(num);
               k:=1;
               str(num,nu);
               for j:= 1 to length(ous) do
               nous[j]:=ous[j];
               for j:= length(ous)+1 to length(ous)+1+length(nu) do;
               begin
                    nous[j]:=nu[k];
                    inc(k);
               end;
               for j:= 1 to length(ous)+1+length(nu) do
               begin
               write(nous[j]);
               ous[j]:=nous[j];
               end;
               writeln;
               writeln(ous);
          end;


     end;
     writeln(ous);

end.