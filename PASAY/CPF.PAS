program testcpf;

uses
  Crt;

function CPF(NUMERO : string) : boolean;
var
  POSICAO, CODIGO, I, SOMA, DV, DV_INFORMADO : integer;
  DIGITO : array[1..11] of byte;
begin

  {*** Retira do numero o DV_INFORMADO ***}
  val(copy(NUMERO, 10, 2), DV_INFORMADO, CODIGO);

  {*** Desmembra o numero do CPF na matriz DIGITO ***}
  for I := 1 to 9 do
    begin
      val(copy(NUMERO,I,1),DIGITO[I],CODIGO);
    end;

  {*** Calcula o valor do 10o. digito de verificacao ***}
  POSICAO := 10;
  SOMA := 0;
  for I := 1 to 9 do
    begin
      SOMA := SOMA + DIGITO[I] * POSICAO;
      POSICAO := POSICAO - 1;
    end;
  DIGITO[10] := SOMA mod 11;
  if (DIGITO[10] < 2) then
    DIGITO[10] := 0
  else
    DIGITO[10] := 11 - DIGITO[10];

  {*** Calcula o 11o. digito de verificacao ***}
  POSICAO := 11;
  SOMA := 0;
  for I := 1 to 10 do
    begin
      SOMA := SOMA + DIGITO[I] * POSICAO;
      POSICAO := POSICAO - 1;
    end;
  DIGITO[11] := SOMA mod 11;
  if (DIGITO[11] < 2) then
    DIGITO[11] := 0
  else
    DIGITO[11] := 11 - DIGITO[11];

  {*** Verifica se DV calculado e igual a DV informado ***}
  DV := DIGITO[10] * 10 + DIGITO[11];
  if (DV = DV_INFORMADO) then
    CPF := true
  else
    CPF := false;
end;

var
  NUMEROCPF : string;
begin
  clrscr;
  write('Entre o CPF: '); readln(NUMEROCPF);
  writeln;
  if (CPF(NUMEROCPF)) then
    writeln('Numero valido')
  else
    writeln('Numero invalido');
  readln;
end.