program PESQUISA_BINARIA;
var
  NOME : array[1..10] of string;
  I, J : integer;
  COMECO, FINAL, MEIO : integer;
  PESQ, RESP, X : string;
  ACHA : boolean;
begin
  writeln('Pesquisa binaria de nomes');
  writeln;
  for I := 1 to 10 do
    begin
      write('Digite o ', I:2 ,'o. nome: '); readln(NOME[I]);
    end;

  {*** Ordenacao ***}

  for I := 1 to 9 do
    for J := I + 1 to 10 do
      if (NOME[I] > NOME[J]) then
         begin
           X := NOME[I];
           NOME[I] := NOME[J];
           NOME[J] := X;
         end;

  {*** Trecho de pesquisa ***}

  RESP := 'SIM';
  while (RESP = 'SIM') or (RESP = 'sim') do
    begin
      writeln;
      write('Entre o nome a ser pesquisado: '); readln(PESQ);
      COMECO := 1;
      FINAL := 10;
      ACHA := false;
      while (COMECO <= FINAL) and (ACHA = false) do
        begin
          MEIO := (COMECO + FINAL) DIV 2;
          if (PESQ = NOME[MEIO]) then
            ACHA := true
          else
            if (PESQ < NOME[MEIO]) then
                 FINAL := MEIO - 1
              else
                 COMECO := MEIO + 1;
        end;
      if (ACHA = true) then
        writeln(PESQ, ' foi localizado na posicao ', MEIO:2)
      else
        writeln(PESQ, ' nao foi localizado');
      writeln;
      write('Deseja continuar? SIM/NAO: ');
      readln(RESP);
    end;
end.

