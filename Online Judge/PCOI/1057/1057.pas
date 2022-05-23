program task1057;  {use of user-defined procedure}
var row, col, field, i, j : integer;
    Oil : array [0..101,0..101] of char; (* 0 and 101 for last move *)
    line :string;

procedure Dig(x,y:integer);
begin
    Oil[x,y] := 'O';
    If Oil[x+1,y  ]='@' then Dig(x+1,y);
    If Oil[x+1,y+1]='@' then Dig(x+1,y+1);
    If Oil[x-1,y  ]='@' then Dig(x-1,y);
    If Oil[x,y-1]='@' then Dig(x,y-1);
    If Oil[x-1,y-1  ]='@' then Dig(x-1,y-1);
    If Oil[x,y+1]='@' then Dig(x,y+1);
    If Oil[x-1,y+1  ]='@' then Dig(x-1,y+1);
    If Oil[x+1,y-1]='@' then Dig(x+1,y-1);
end;

begin
   readln(row,col);
   field := 0;
   For i := 1 to row do
   begin
     readln(line);
     For j := 1 to col do
       Oil[i,j] := line[j];
   end;
   For i := 1 to row do
     For j := 1 to col do
       If Oil[i,j]='@' then begin
         field := field + 1;
         Dig(i,j);
       end;
   writeln(field);
end.
