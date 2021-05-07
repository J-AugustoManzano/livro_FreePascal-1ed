program LISTA_NOME_ORDENADA;
uses
  Crt;
var
  NOME  : array[1..10] of string;
  I, J  : integer;
  X     : string;
  TECLA : char;

  {*** Rotina de entrada de dados ***}

begin
  clrscr;
  gotoxy(31, 2); writeln('Listagem de nomes');
  writeln;
  for I := 1 to 10 do
    begin
      write('Digite o ', I:2 ,'o. nome: '); readln(NOME[I]);
    end; 
  gotoxy(23,24); writeln('Tecle algo para ver lista ordenada'); 
  TECLA := readkey;

  {*** Rotina de processamento de ordenacao ***}

  for I := 1 to 9 do
    for J := I + 1 to 10 do
      if (NOME[I] > NOME[J]) then
         begin
           X := NOME[I];
           NOME[I] := NOME[J];
           NOME[J] := X;
         end;

  {*** Rotina de saída com dados ordenados ***}

  clrscr;
  gotoxy(31, 2); writeln('Listagem ordenada');
  writeln;
  for I := 1 to 10 do
    writeln('Nome: ' ,I:2, ' --> ', NOME[I]); 
  gotoxy(22,24); writeln('Tecle algo para encerrar o programa');
  TECLA := readkey;
end.

