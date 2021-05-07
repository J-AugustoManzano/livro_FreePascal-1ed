program TESTE_DE_IMPRESSAO_1;
uses
  Crt,
  Printer;
var
  NOME : string;
begin
  clrscr;
  writeln('Programa para teste de impressao');
  writeln;
  write('Informe seu nome '); readln(NOME);
  write(LST, NOME);
  write(LST, #12);
end.
