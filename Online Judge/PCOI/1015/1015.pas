var r,c,h,w,i,j,k,l,m,p:longint;
 begin
   readln(r,c,h,w);
   write('|');
   for i:= 1 to c do
   begin
   for j:= 1 to w do
   begin
   write('-');
   end;
   write('|');
   end;
   writeln;
   for i:= 1 to r do
   begin
   write('|');
   for p:= 1 to h do
   begin
   for j:= 1 to c do
   begin
   for k:= 1 to w do
   begin
   write(' ');
   end;
   write('|');
   end;
   writeln;
   write('|');
   end;
   for l:= 1 to c do
   begin
   for m:= 1 to w do
   begin
   write('-');
   end;
   write('|');
   end;
   writeln;
   end;
   end.