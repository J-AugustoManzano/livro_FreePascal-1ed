program testcnpj;

uses
  Crt;

function CNPJ(NUMERO : string) : boolean;
var
  POSICAO, CODIGO, I, SOMA1, SOMA2, DV, DV_INFORMADO, RESULT : integer;
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

  {*** Gera o valor composto com a 1a, 3a, 5a e 7a posicao ***}
  VALOR_COMPOSTO := '';
  VALOR_UNITARIO := '';
  SOMA1 := 0;
  for I := 1 to 8 do
    if (I mod 2 = 1) then
      begin
        str(DIGITO[I], VALOR_UNITARIO);
        VALOR_COMPOSTO := VALOR_COMPOSTO + VALOR_UNITARIO;
      end
    else
      SOMA1 := SOMA1 + DIGITO[I];

  {*** Multiplica o valor composto por 2 ***}
  val(VALOR_COMPOSTO, POSICAO, CODIGO);
  POSICAO := POSICAO * 2;
  str(POSICAO, VALOR_COMPOSTO);

  {*** Soma cada parte do valor composto aos demais valores ***}
  for I := 1 to length(VALOR_COMPOSTO) do
    begin
      val(copy(VALOR_COMPOSTO, I, 1), POSICAO, CODIGO);
      SOMA1 := SOMA1 + POSICAO;
    end;

  {*** Extrai de SOMA1 o valor da unidade, ***}
  {*** implicando em RESULT                ***}
  str(SOMA1, VALOR_UNITARIO);
  VALOR_UNITARIO := copy(VALOR_UNITARIO, 2, 1);
  val(VALOR_UNITARIO, RESULT, CODIGO);

  {*** Se RESULT for zero, o CNPJ e valido ***}
  if (RESULT = 0) then
    begin

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

      {*** Verifica se DV e igual a DV informado ***}
      DV := DIGITO[13] * 10 + DIGITO[14];
      if (DV = DV_INFORMADO) then
        CNPJ := true
      else
        CNPJ := false;
    end
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