program TESTA_LOGICA_NOT;
var
  A, B, C, X : integer;
begin
  write('Entre um valor para a variavel A: '); readln(A);
  write('Entre um valor para a variavel B: '); readln(B);
  write('Entre um valor para a variavel X: '); readln(X);
  if not (X > 5) then
    C := (A + B) * X
  else
    C := (A - B) * X;
  writeln('O resultado da variavel C corresponde a: ', C);
end.
