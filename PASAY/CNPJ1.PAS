program testcnpj;

uses
  Crt;

function CNPJ(NUMERO : string) : boolean;
var
  POSICAO, CODIGO, I, SOMA1, SOMA2, DV, DV_INFORMADO : integer;
  DIGITO : array[1..14] of byte;
  VALOR_UNITARIO, VALOR_COMPOSTO : string;
begin

  {*** DV_INFORMADO - dois ultimos digitos de verificacao ***}
  val(copy(NUMERO, 13, 2), DV_INFORMADO, CODIGO);

  {*** Desmembra o numero do CNPJ na matriz DIGITO ***}
  for I := 1 to 12 do
    begin
      val(copy(NUMERO, I, 1), DIGITO[I], CODIGO);
    end;

  {*** Calcula o 13o. digito de verificacao ***}
  POSICAO := 5;
  SOMA2 := 0;
  for I := 1 to 4 do
    begin
      SOMA2 := SOMA2 + DIGITO[I] * POSICAO;
      POSICAO := POSICAO - 1;
    end;
  POSICAO := 9;
  for I := 5 to 12 do
    begin
      SOMA2 := SOMA2 + DIGITO[I] * POSICAO;
      POSICAO := POSICAO - 1;
    end;
  DIGITO[13] := SOMA2 mod 11;
  if (DIGITO[13] < 2) then
    DIGITO[13] := 0
  else
    DIGITO[13] := 11 - DIGITO[13];

  {*** Calcula o 14o. digito de verificacao ***}
  POSICAO := 6;
  SOMA2 := 0;
  for I := 1 to 5 do
    begin
      SOMA2 := SOMA2 + DIGITO[I] * POSICAO;
      POSICAO := POSICAO - 1;
    end;
  POSICAO := 9;
  for I := 6 to 13 do
    begin
      SOMA2 := SOMA2 + DIGITO[I] * POSICAO;
      POSICAO := POSICAO - 1;
    end;
  DIGITO[14] := SOMA2 mod 11;
  if (DIGITO[14] < 2) then
    DIGITO[14] := 0
  else
    DIGITO[14] := 11 - DIGITO[14];

  {*** Verifica se DV calculado e igual a DV informado ***}
  DV := DIGITO[13] * 10 + DIGITO[14];
  if (DV = DV_INFORMADO) then
    CNPJ := true
  else
    CNPJ := false;
end;

var
  NUMEROCGC : string;
begin
  clrscr;
  write('Entre o CGC: '); readln(NUMEROCGC);
  writeln;
  if (CNPJ(NUMEROCGC)) then
    writeln('Numero valido')
  else
    writeln('Numero invalido');
  readln;
end.