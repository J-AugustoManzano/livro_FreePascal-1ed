program LEITURA_ESCRITA;
type
  BIMESTRE  = array[1..4] of real;
  CAD_ALUNO = record
                NOME : string;
                NOTA : bimestre;
              end;
var
  ALUNO : array[1..8] of cad_aluno;
  I, J  : byte;
begin
  writeln('Cadastro de aluno');
  writeln; 
  for J := 1 to 8 do
    begin
      write('Informe nome do ', J:2,'o. aluno ...: ');
      readln(ALUNO[J].NOME);
      writeln;
      for I := 1 to 4 do
        begin
          write('Informe a ', I:2, 'a. nota ..........: ');
          readln(ALUNO[J].NOTA[I]); 
        end;
      writeln;
    end;
  writeln;
  writeln;
  for J := 1 to 8 do
    begin
      writeln('Nome aluno: ', J:2,' ...: ', ALUNO[J].NOME);
      writeln;
      for I := 1 to 4 do
        writeln('Nota ', I, ' ...........: ', ALUNO[J].NOTA[I]:2:2);
      writeln;
    end;
  writeln;
  writeln('Tecle <ENTER> para encerrar: '); readln; 
end.

