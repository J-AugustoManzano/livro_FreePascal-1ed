program LOOPING_2A;
var
  A, B, R, I : integer;
begin
  I := 1;
  repeat
    write('Entre um valor para A: '); readln(A);
    write('Entre um valor para B: '); readln(B);
    writeln;
    R := A + B;
    writeln('O resultado corresponde a: ', R);
    writeln;
    I := I + 1;
  until (I > 5) 
end.

