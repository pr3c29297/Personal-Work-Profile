var numbers:array[1..10] of longint;
    size,i,j,indexs:longint;
begin
     readln(size);
     for i:= 1 to size do
     read(numbers[i]);
     for i:= 2 to size-1 do
     begin
      indexs := numbers[i];
      j:=i;
      while ((j>1) and (numbers[j-1]>indexs)) do
      begin
       numbers[j]:=numbers[j-1];
       j:=j-1;
      end;
      numbers[j]:=indexs;
     end;
     for i:= 1 to 10 do
     write(numbers[i],' ');
end.