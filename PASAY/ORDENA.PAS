program ORDENA;
var
  X, A, B : integer;
begin
  write('Informe um valor para a variavel A: '); readln(A);
  write('Informe um valor para a variavel B: '); readln(B);
  writeln;
  if (A > B) then
    begin
      X := A;
      A := B;
      B := X;
    end;
  writeln('Os valores ordenados são:');
  write(A, ' ', B);
end.
