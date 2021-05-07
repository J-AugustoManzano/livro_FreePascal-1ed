program CALC_MEDIA;
var
  X : string;
  I, J, ATUAL, PROXIMO : integer;
  Y, SOMA_NT, SOMA_MD, MEDIA_GP : real;
  NOTA : array[1..8,1..4] of real;
  MEDIA : array[1..8] of real;
  NOMES : array[1..8] of string;

  {*** Rotina de entrada de dados ***}

begin
  SOMA_MD := 0;
  for I := 1 to 8 do
    begin
      SOMA_NT := 0;
      write(’Informe o nome do ’, I:2,’o. aluno: ’);
      readln(NOMES[I]);
      for J := 1 to 4 do
        begin
          write(J:2,’a. nota: ’); readln(NOTA[I,J]);
          SOMA_NT := SOMA_NT + NOTA[I,J];
        end; 
      MEDIA[I] := SOMA_NT / 4;
      SOMA_MD := SOMA_MD + MEDIA[I];
      writeln;
  end; 

  {*** Rotina de ordenacao e troca de elementos ***}

  for ATUAL :=1 to 7 do
    for PROXIMO := ATUAL + 1 to 8 do
      if (NOMES[ATUAL] > NOMES[PROXIMO]) then
         begin
           X := NOMES[ATUAL];
           NOMES[ATUAL] := NOMES[PROXIMO];
           NOMES[PROXIMO] := X;
           Y := MEDIA[ATUAL];
           MEDIA[ATUAL] := MEDIA[PROXIMO];
           MEDIA[PROXIMO] := Y;
       end;

  {*** Rotina de apresentacao ***}

  MEDIA_GP := SOMA_MD / 8;
  for I := 1 to 8 do
    begin
      writeln(’Aluno .: ’, NOMES[I]);
      writeln(’Media .: ’, MEDIA[I]:5:2);
      writeln;
    end;
  writeln(’Media Geral : ’, MEDIA_GP:5:2);
  writeln;
  writeln(’Tecle <ENTER> para encerrar: ’); readln; 
end.
