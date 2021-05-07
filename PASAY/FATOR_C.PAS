program FATORIAL_C;
var
  CONTADOR, N : integer;
  FATORIAL : longint;
begin
  FATORIAL := 1;
  writeln('Programa Fatorial');
  writeln;
  write('Fatorial de que numero: '); readln(N);
  writeln;
  for CONTADOR := 1 to N do
    FATORIAL := FATORIAL * CONTADOR;
  writeln('Fatorial de ', N, ' equivale a ', FATORIAL);
  writeln;
  write('Tecle <ENTER> para encerrar: '); readln;
end.

