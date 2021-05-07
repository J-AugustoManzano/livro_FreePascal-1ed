program LISTA_NOME;
var
  NOME : array[1..10] of string;
  I : integer;
begin
  writeln('Listagem de nomes');
  writeln;

  { *** Entrada dos dados *** }

  for I := 1 to 10 do
    begin
      write('Digite o ', I:2 ,'o. nome: '); readln(NOME[I]);
    end; 
  writeln;

  { *** Apresentacao dos nomes *** }

  for I := 1 to 10 do
    writeln('Nome: ' ,I:2, ' --> ', NOME[I]); 
  writeln;
  writeln('Tecle <ENTER> para encerrar: '); readln; 
end.
