procedure quickSort(var a: array of integer; l, r: Integer);
    var p: integer;
    function partition(var a: array of integer; l, r: integer): integer;
        var x, i, j: integer;
        procedure exchange(i,j: integer);
            var temp: integer;
        begin
            temp:= a[i];
            a[i]:= a[j];
            a[j]:= temp;
        end;
    begin
        x:= a[r];
        i:= l-1;
        for j:= l to r-1 do
            if a[j] <= x then begin
                inc(i);
                exchange(i,j);
            end;
        exchange(i+1,r);
        partition:= i+1;
    end;
begin
    if l < r then begin
        p:= partition(a, l, r);
        quickSort(a, l, p-1);
        quickSort(a, p+1, r);
    end;
end;

var a:array[1..10000] of integer;
    n,i,p,l,r:longint;
begin
     for i:= 1 to 10 do
     read(a[i]);
     for i:= 1 to 5 do
     quickSort(a[i],l,p-1);
     for i:= 6 to 10 do
     quickSort(a[i],p+1,r);
     for i:= 1 to 10 do
     write(a[i],' ');
end.