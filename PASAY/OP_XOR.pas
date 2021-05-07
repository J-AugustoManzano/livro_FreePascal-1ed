program TESTA_LOGICA_XOR;
var
  NOME1, SEXO1 : string;
  NOME2, SEXO2 : string;
begin
  write('Entre com o nome da pessoa 1: ');
  readln(NOME1);
  write('Entre com o sexo da pessoa 1: ');
  readln(SEXO1);
  write('Entre com o nome da pessoa 1: ');
  readln(NOME2);
  write('Entre com o sexo da pessoa 1: ');
  readln(SEXO2);
  if (SEXO1 = 'm') xor (SEXO2 = 'm') then
    writeln(NOME1, ' pode se casar com ',NOME2)
  else
    writeln(NOME1, ' nao pode se casar com ',NOME2);
end.
