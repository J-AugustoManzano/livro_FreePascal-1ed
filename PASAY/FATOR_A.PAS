program FATORIAL_A;
var
  CONTADOR, N : integer;
  FATORIAL : longint;
begin
  FATORIAL := 1;
  CONTADOR := 1;
  writeln('Programa Fatorial');
  writeln;
  write('Fatorial de que numero: '); readln(N);
  writeln;
  while (CONTADOR <= N) do
    begin 
      FATORIAL := FATORIAL * CONTADOR;
      CONTADOR := CONTADOR + 1;
    end;
  writeln('Fatorial de ', N, ' equivale a ', FATORIAL);
  writeln;
  write('Tecle <ENTER> para encerrar: '); readln;
end.

