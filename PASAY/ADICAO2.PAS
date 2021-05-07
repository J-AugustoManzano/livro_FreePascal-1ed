program CALC_ADICAO;

uses
  Crt;

  function ADICAO(A, B : real) : real;
  begin
    ADICAO := A + B;
  end;

var
  NUM1, NUM2 : real;
begin
  clrscr;
  write('Informe o 1o. valor: '); readln(NUM1);
  write('Informe o 2o. valor: '); readln(NUM2);
  writeln;
  writeln('O resultado da adicao = ', Adicao(NUM1, NUM2):5:2);
  writeln('Tecle <ENTER> para encerrar o programa'); readln; 
end.
