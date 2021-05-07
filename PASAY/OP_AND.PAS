program TESTA_LOGICA_AND;
var
  NUMERO : integer;
begin
  write('Informe um numero: '); readln(NUMERO);
  writeln;
  if (NUMERO >= 20) and (NUMERO <= 90) then
    writeln('O número está na faixa de 20 a 90')
  else
    writeln('O número está fora da faixa de 20 a 90');
end.
