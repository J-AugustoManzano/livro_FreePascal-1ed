program LISTA_NUMERICA_ORDENADA;
var
  A : array[1..5] of integer;
  I, J, X : integer;

  {*** Rotina de entrada de dados ***}

begin
  writeln('Listagem de nomes');
  writeln;
  for I := 1 to 5 do
    begin
      write('Informe o ', I:2 ,'o. valor numerico inteiro: ');
      readln(A[I]);
    end;

  {*** Rotina de processamento de ordenacao ***}

  for I := 1 to 4 do
    for J := I + 1 to 5 do
      if (A[I] > A[J]) then
        begin
          X := A[I];
          A[I] := A[J];
          A[J] := X;
        end;

  {*** Rotina de saida com dados ordenados ***}

  writeln;
  for I := 1 to 5 do
    writeln(I:2, 'o. valor --> ', A[I]);
  writeln;
  writeln('Tecle <ENTER> para encerrar: ');
  readln;
end.
