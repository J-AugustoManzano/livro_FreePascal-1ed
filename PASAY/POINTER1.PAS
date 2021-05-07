program POINTER1;
uses
  Crt;
var
  X : ^integer;
  A, B : integer;
begin
  clrscr;
  writeln('Programa: Ordena Dois Valores');
  writeln;
  write('Informe um valor para a variavel estatica A: '); readln(A);
  write('Informe um valor para a variavel estatica B: '); readln(B);
  writeln;
  if (A > B) then
    begin
      writeln('Memoria antes de criar a variavel X ...: ', MaxAvail, ' bytes');
      writeln;
      new(X);
      writeln('Memoria apos criacao da variavel X ....: ', MemAvail, ' bytes');
      writeln;
      X^ := A;
      A := B;
      B := X^;
      dispose(X);
      writeln('Memoria apos destruir variavel X ......: ', MemAvail, ' bytes');
    end;
  writeln;
  writeln('Os valores ordenados sao:');
  write(A, ' ', B);
  writeln;
  write('Tecle algo para encerrar... ');
  readkey;
end.
