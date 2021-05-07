program testpis;

uses
  Crt;

function PIS(NUMERO : string) : boolean;
var
  POSICAO, CODIGO, I, SOMA, DV, DV_INFORMADO : integer;
  DIGITO : array[1..11] of byte;
begin

  {*** Retira do numero o ultimo valor ***}
  val(copy(NUMERO, 11, 1), DV_INFORMADO, CODIGO);

  {*** Desmembra o numero do PIS na matriz DIGITO ***}
  for I := 1 to 10 do
    begin
      val(copy(NUMERO,I,1),DIGITO[I],CODIGO);
    end;

  {*** Calcula o valor do digito de verificacao ***}
  SOMA := 0;
  SOMA := DIGITO[1] * 3 + DIGITO[2] * 2;
  POSICAO := 9;
  for I := 3 to 10 do
    begin
      SOMA := SOMA + DIGITO[I] * POSICAO;
      POSICAO := POSICAO - 1;
    end;
  DIGITO[11] := SOMA mod 11;
  if (DIGITO[11] <= 1) then
    DIGITO[11] := 0
  else
    DIGITO[11] := 11 - DIGITO[11];

  {*** Verifica se DV calculado e igual a DV informado ***}
  DV := DIGITO[11];
  if (DV = DV_INFORMADO) then
    PIS := true
  else
    PIS := false;
end;

var
  NUMEROCPF : string;
begin
  clrscr;
  write('Entre o PIS: '); readln(NUMEROCPF);
  writeln;
  if (PIS(NUMEROCPF)) then
    writeln('Numero valido')
  else
    writeln('Numero invalido');
  readln;
end.