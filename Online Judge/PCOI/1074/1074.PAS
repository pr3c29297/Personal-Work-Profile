PROGRAM task1074;
VAR n : integer; (* variable for the input *)

(* Given : Called by procedure NumToString to parse digit(s) into string *)
PROCEDURE ParseNumber(n:integer);
   BEGIN
      CASE n OF
      1  : write('one');
      2  : write('two');
      3  : write('three');
      4  : write('four');
      5  : write('five');
      6  : write('six');
      7  : write('seven');
      8  : write('eight');
      9  : write('nine');
      10 : write('ten');
      11 : write('eleven');
      12 : write('twelve');
      13 : write('thirteen');
      14 : write('fourteen');
      15 : write('fifteen');
      16 : write('sixteen');
      17 : write('seventeen');
      18 : write('eighteen');
      19 : write('nineteen');
      20 : write('twenty');
      30 : write('thirty');
      40 : write('forty');
      50 : write('fifty');
      60 : write('sixty');
      70 : write('seventy');
      80 : write('eighty');
      90 : write('ninety');
      END
   END;

(* This procedure extract digits one by one from the input PARAMETER num *)
(* CALL procedure ParseNumber where appropriate, complete the missing part *)
PROCEDURE NumToString(n:integer);
VAR over1000,over100:boolean;
temp:longint;
BEGIN
     over1000:=false;
     over100:=false;
     if n>=1000 then
     begin
          if n mod 1000 <>0 then
          over1000:=true;
          temp:=trunc(n/1000);
          if temp<=20 then
          ParseNumber(temp)
          else
          begin
               ParseNumber(trunc(temp/10)*10);
               if temp mod 10<>0 then
               begin
                    write('-');
                    ParseNumber(temp mod 10);
               end;
          end;
          write(' thousand');
          n:=n-temp*1000;
     end;
     if n>=100 then
     begin
          if n mod 100<>0 then
          over100:=true;
          if over1000= true then
          write(' ');
          temp:=trunc(n/100);
          ParseNumber(temp);
          n:=n-temp*100;
          write(' hundred');
     end;
     if n<=20 then
     begin
          if ((over100=true) or (over1000=true)) and (n<>0) then
          write(' ');
          ParseNumber(n);
     end
     else
     begin
          if ((over100=true) or (over1000=true))and (n<>0) then
          write(' ');
          ParseNumber(trunc(n/10)*10);
          if n mod 10<>0 then
          begin
               write('-');
               ParseNumber(n mod 10);
          end;
     end;


END;

(* Main Program, given, cannot be modified *)
BEGIN
   repeat
      readln(n);  {
      inc(n);  }
      if n<>0 then
      begin
         write( n, ': ');
         NumToString(n);  (* Call this procedure by passing num *)
         writeln;
      end;               {
      if n=32767 then
      n:=0;  }
   until n=0;
END.
