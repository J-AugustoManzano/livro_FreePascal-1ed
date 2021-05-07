program LISTA_NOME_ORDENADA;
var
  NOME : array[1..10] of string;
  I, J : integer;
  X    : string;

  {*** Rotina de entrada de dados ***}

begin
  writeln('Listagem de nomes');
  writeln;
  for I := 1 to 10 do
    begin
      write('Digite o ', I:2 ,'o. nome: '); readln(NOME[I]);
    end;

  {*** Rotina de processamento de ordenacao ***}

  for I := 1 to 9 do
    for J := I+1 to 10 do
      if (NOME[I] > NOME[J]) then
         begin
           X := NOME[I];
           NOME[I] := NOME[J];
           NOME[J] := X;
         end;

  {*** Rotina de saida com dados ordenados ***}

  writeln;
  for I := 1 to 10 do
    writeln('Nome: ' ,I:2, ' --> ', NOME[I]);
  writeln;
  writeln('Tecle <ENTER> para encerrar: '); readln;
end.

