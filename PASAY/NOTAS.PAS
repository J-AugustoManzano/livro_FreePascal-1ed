program NOTA_ALUNO;
var
  NOTAS : array[1..8,1..4] of real;
  I, J  : integer;
begin
  writeln('Leitura e apresentacao de notas');
  writeln;
  for I := 1 to 8 do
    begin
      writeln;
      writeln('Entre as notas do ', I:2,'o. aluno');
      for J := 1 to 4 do
        begin
          write('Nota ', J:2,': ');
          readln(NOTAS[I,J]);
        end;
    end; 
  writeln;
  for I := 1 to 8 do
    begin
      write('As notas do aluno ', I:2,' sao: ');
      for J := 1 to 4 do
        write(NOTAS[I,J]:2:2, ' ');
      writeln;
    end; 
  writeln;
  writeln('Tecle <ENTER> para encerrar: '); readln; 
end.

