program TRIANGULO;
var
   A, B, C : real;
begin
  write('Informe o 1o. lado de triangulo: '); readln(A);
  write('Informe o 2o. lado de triangulo: '); readln(B);
  write('Informe o 3o. lado de triangulo: '); readln(C);
  writeln;
  if (A < B + C) and (B < A + C) and (C < A + B) then
    if (A = B) and (B = C) then
      writeln('Triangulo Equilatero')
    else
      if (A = B) or (A = C) or (C = B) then
        writeln('Triangulo Isosceles')
      else
        writeln('Triangulo Escaleno')
  else
    writeln('Os valores fornecidos nao formam um triangulo');
end.

