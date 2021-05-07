program LOOPING_1A;
var
  A, B, R, I : integer;
begin
  I := 1;
  while (I <= 5) do
    begin
      write('Entre um valor para A: '); readln(A);
      write('Entre um valor para B: '); readln(B);
      writeln;
      R := A + B;
      writeln('O resultado corresponde a: ', R);
      writeln;
      I := I + 1;
    end;
end.



