program TROCA1;
var
  X : integer;
  A : integer;
  B : integer;
begin
  readln(A);
  readln(B);
  X := A;
  A := B;
  B := X;
  writeln(A);
  writeln(B);
end.

