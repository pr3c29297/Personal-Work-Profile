program task1055;
const
   maxnodes = 255;
type
   tree = array [1..maxnodes] of char;
var
   X : tree;
   str : string[maxnodes];
   i : integer;

procedure preorder(T:tree; k:integer);
begin
     if t[k]<>' ' then
     begin
          write(t[k],' ');
          preorder(t,2*k);
          preorder(t,2*k+1);
     end;
end;

procedure inorder(T:tree; k:integer);
begin
     if t[k]<>' ' then
     begin
          inorder(t,2*k);
          write(t[k],' ');
          inorder(t,2*k+1);
     end;
end;

procedure postorder(T:tree; k:integer);
begin
     if t[k]<>' ' then
     begin
         postorder(t,2*k);
         postorder(t,2*k+1);
         write(t[k],' ');
     end;
end;

begin {Main program should NOT be modified}
   {Read the whole tree into the array rapidly}
   readln( str );
   for i := 1 to maxnodes do
      X[i] := ' ';
   for i := 1 to length(str) do
      X[i] := str[i];

   {tree traversals}
   write('Pre  : '); preorder(X,1); writeln;
   write('In   : '); inorder(X,1); writeln;
   write('Post : '); postorder(X,1); writeln;
end.
