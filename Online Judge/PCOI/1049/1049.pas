(* stack and its applications : reverse the order *)
program task1049;
const max = 10000;
var
   stack : array [1..10000] of char;
   top : integer;
   ch : char;

procedure push(ch:char);
begin
   if top<max then (* check full *)
      begin
           inc(top);
           stack[top]:=ch;
         (* complete the push subprogram *)
      end;
end;

function pop:char;
begin
   if top>0 then (* check empty *)
      begin
           pop:=stack[top];
         (* complete the pop subprogram *)
      end;
end;

begin (* main program *)
   top := 0;
   while not(eof) do
      begin
         read(ch);
         if ch in ['0'..'9'] then
         write(ch)
         else
         push(ch);
         (* how to process the input data *)
      end;
   (* how to output data *)
   while top>0 do
   begin
   write(pop);
   dec(top);
   end;
   writeln;
end.
