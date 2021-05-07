program COMPARACAO;

uses
  Crt;

  function COMPARA(A, B : real) : boolean;
  begin
    COMPARA := A = B;
  end;

var
  NUM1, NUM2 : real;
begin
  clrscr;
  write('Informe o 1o. valor: '); readln(NUM1);
  write('Informe o 2o. valor: '); readln(NUM2);
  writeln;
  if (Compara(NUM1, NUM2)) then 
    writeln('Os valores fornecidos sao iguais')
  else
    writeln('Os valores fornecidos sao diferentes');
  writeln('Tecle <ENTER> para encerrar o programa'); readln; 
end.
