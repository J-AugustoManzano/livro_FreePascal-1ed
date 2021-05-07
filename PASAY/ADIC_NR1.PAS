program ADICIONA_NUMEROS;
var
  X, A, B : integer;
begin
  write('Informe um valor para a variavel A: '); readln(A);
  write('Informe um valor para a variavel B: '); readln(B);
  writeln;
  X := A + B;
  if (X > 10) then
    writeln('O valor da variavel X equivale a: ', X);
end.

