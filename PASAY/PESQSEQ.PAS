program PESQUISA_SEQUENCIAL;
var
  NOME : array[1..10] of string;
  I    : integer;
  PESQ : string;
  RESP : string;
  ACHA : boolean;
begin
  writeln('Pesquisa sequencial de nomes');
  writeln;
  for I := 1 to 10 do
    begin
      write('Digite o ', I:2 ,'o. nome: '); readln(NOME[I]);
    end; 
  RESP := 'SIM';
  while (RESP = 'SIM') or (RESP = 'sim') do
    begin
      {*** Rotina de pesquisa ***}
      writeln;
      write('Entre o nome a ser pesquisado: '); readln(PESQ);
      I := 1;
      ACHA := false;
      while (I <= 10) and (ACHA = false) do
        if (PESQ = NOME[I]) then
          ACHA := true
        else
          I := I + 1;
      if (ACHA = true) then
        writeln(PESQ, ' foi localizado na posicao ', I:2)
      else
        writeln(PESQ, ' nao foi localizado');
      {*** Fim da rotina de pesquisa ***}
      writeln;
      write('Deseja continuar? SIM/NAO: ');
      readln(RESP);
    end;
end.
