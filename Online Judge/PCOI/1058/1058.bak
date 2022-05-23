var n,t:integer;
procedure Hanoi(n: integer; from, tot, by: char);
Begin
        inc(t);
    if (n=1) then
        writeln('--> Move disk ',n,' from ', from, ' to ', tot)
    else begin
        Hanoi(n-1, from, by, tot);
        Writeln('--> Move disk ',n,' from ', from, ' to ', tot);
        Hanoi(n-1, by, tot, from);
    end;
End;
begin
     readln(n);
     writeln('Move ',n,' disk(s) from X to Y using Z as temp storage');
     Hanoi(n,'X','Y','Z');
     writeln('There are total ',t,' moves.');
end.
