program LEITURA_ESCRITA;
type 
  CAD_ALUNO = record
                NOME  : string;
                NOTA1 : real;
                NOTA2 : real;
                NOTA3 : real;
                NOTA4 : real;
             end;
var
  ALUNO : cad_aluno;
begin
  writeln('Cadastro de aluno');
  writeln; 
  write('Informe o nome ...........: '); readln(ALUNO.NOME);  
  write('Informe a primeira nota ..: '); readln(ALUNO.NOTA1); 
  write('Informe a segunda nota ...: '); readln(ALUNO.NOTA2); 
  write('Informe a terceira nota ..: '); readln(ALUNO.NOTA3); 
  write('Informe a quarta nota ....: '); readln(ALUNO.NOTA4);
  writeln; 
  writeln('Nome ....: ', ALUNO.NOME);  
  writeln('Nota 1 ..: ', ALUNO.NOTA1:2:2); 
  writeln('Nota 2 ..: ', ALUNO.NOTA2:2:2); 
  writeln('Nota 3 ..: ', ALUNO.NOTA3:2:2); 
  writeln('Nota 4 ..: ', ALUNO.NOTA4:2:2);
  writeln;
  writeln('Tecle <ENTER> para encerrar: '); readln; 
end.

