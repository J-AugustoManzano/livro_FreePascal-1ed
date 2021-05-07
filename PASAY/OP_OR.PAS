program TESTA_LOGICA_OR;
var
  SEXO : string;
begin
  write('Entre com o seu sexo: '); readln(SEXO);
  writeln;
  if (SEXO = 'masculino') or (SEXO = 'feminino') then
    writeln('O seu sexo e valido')
  else
    writeln('O seu sexo e invalido');
end.
