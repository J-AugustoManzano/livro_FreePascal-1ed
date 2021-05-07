program AGENDA;
var
  DADO : array[1..10,1..5] of string;
  I, J, ATUAL, PROXIMO : integer;
  X    : string;
begin

  {*** Rotina de entrada ***}

  writeln(’Programa agenda’);
  writeln;
  for I := 1 to 10 do
    begin
      write(’Nome .....: ’); readln(DADO[I,1]);
      write(’Endereco .: ’); readln(DADO[I,2]);
      write(’CEP ......: ’); readln(DADO[I,3]);
      write(’Bairro ...: ’); readln(DADO[I,4]);
      write(’Telefone .: ’); readln(DADO[I,5]);
      writeln;
    end;

  {*** Rotina de ordenacao e troca de elementos ***}
 
  for ATUAL := 1 to 9 do
    for PROXIMO := ATUAL + 1 to 10 do
      if (DADO[ATUAL,1] > DADO[PROXIMO,1]) then
         begin

           {Troca Nome}

           X := DADO[ATUAL,1];
           DADO[ATUAL,1] := DADO[PROXIMO,1];
           DADO[PROXIMO,1] := X;

           {Troca Endereço}

           X := DADO[ATUAL,2];
           DADO[ATUAL,2] := DADO[PROXIMO,2];
           DADO[PROXIMO,2] := X;

           {Troca CEP}

           X := DADO[ATUAL,3];
           DADO[ATUAL,3] := DADO[PROXIMO,3];
           DADO[PROXIMO,3] := X;

           {Troca Bairro}

           X := DADO[ATUAL,4];
           DADO[ATUAL,4] := DADO[PROXIMO,4];
           DADO[PROXIMO,4] := X;

           {Troca Telefone}

           X := DADO[ATUAL,5];
           DADO[ATUAL,5] := DADO[PROXIMO,5];
           DADO[PROXIMO,5] := X;
         end;

  {*** Rotina de saida ***}
 
  for I := 1 to 10 do
    for J := 1 to 5 do
      writeln(DADO[I,J]); 
  writeln;
  writeln(’Tecle <ENTER> para encerrar: ’); readln; 
end.
