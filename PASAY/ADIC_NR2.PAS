program ADICIONA_NUMEROS_V2;
var
  X, A, B : integer;
begin
  write('Informe um valor para a variavel A: '); readln(A);
  write('Informe um valor para a variavel B: '); readln(B);
  writeln;
  X := A + B;
  write('O resultado equivale a: ');
  if (X >= 10) then
    writeln(X + 5)
  else
    writeln(X - 7);
end.
