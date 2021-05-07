program LEITURA_ESCRITA;
type
  BIMESTRE  = array[1..4] of real;
  CAD_ALUNO = record
                NOME : string;
                NOTA : bimestre;
              end;
var
  ALUNO : cad_aluno;
  I : byte;
begin
  writeln('Cadastro de aluno');
  writeln; 
  write('Informe o nome .......: '); readln(ALUNO.NOME);
  writeln;  
  for I := 1 to 4 do
    begin
      write('Informe a ', I:2, 'a. nota ..: '); 
      readln(ALUNO.NOTA[I]); 
    end;
  writeln;
  writeln;
  writeln('Nome ....: ', ALUNO.NOME);
  writeln;
  for I := 1 to 4 do
    writeln('Nota ', I, ' ..: ', ALUNO.NOTA[I]:2:2);
  writeln;
  writeln('Tecle <ENTER> para encerrar: '); readln; 
end.

