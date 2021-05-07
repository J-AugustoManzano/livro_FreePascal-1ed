program MEDIA_TURMA;
var
  MD : array[1..8] of real;
  SOMA, MEDIA : real;
  I : integer;
begin
  SOMA := 0;
  writeln('Calculo de media escolar');
  writeln;
  for I := 1 to 8 do
    begin
      write('Informe a ', I, 'a. nota: '); readln(MD[I]); 
      SOMA := SOMA + MD[I];
    end;
  MEDIA := SOMA / 8;
  writeln;
  writeln('A media do grupo equivale a: ', MEDIA:2:2);
  writeln;
  writeln('Tecle <ENTER> para encerrar: '); readln; 
end.

