program LOOPING_3A;
var
  A, B, R, I : integer;
begin
  for I := 1 to 5 do
    begin
      write('Entre um valor para A: '); readln(A);
      write('Entre um valor para B: '); readln(B);
      writeln;
      R := A + B;
      writeln('O resultado corresponde a: ', R);
      writeln;
    end; 
end.

