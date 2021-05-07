program MOLDURA2;
uses
  Crt;

procedure POE_MOLDURA(C1, L1, C2, L2, TIPO : byte);
var
  TRACO : byte;
  BSES, BLVT, BIES, BLHZ, BSDI, BIDI : char;
begin
  if (C1 > 80) then
    C1 := 80;
  if (C2 > 80) then
    C2 := 80;
  if (C1 = C2) and (C2 <> 0) then
    C1 := C2 - 1;
  if (C1 < 1) then
    C1 := 1;
  if (C2 < 1) then
    C2 := 1;
  if (C1 = C2) then
    C2 := C1 + 1;
  if (L1 > 24) then
    L1 := 24;
  if (L2 > 24) then
    L2 := 24;
  if (L1 = L2) and (L2 <> 0) then
    L1 := L2 - 1;
  if (L1 < 1) then
    L1 := 1;
  if (L2 < 1) then
    L2 := 1;
  if (L1 = L2) then
    L2 := L1 + 1;
  if (TIPO > 2) then
    TIPO := 2;
  if (TIPO < 1) then
    TIPO := 1;
  if (TIPO = 1) then
    begin
      BSES := #218;
      BLVT := #179;
      BIES := #192;
      BLHZ := #196;
      BSDI := #191;
      BIDI := #217;
    end
  else
    begin
      BSES := #201;
      BLVT := #186;
      BIES := #200;
      BLHZ := #205;
      BSDI := #187;
      BIDI := #188;
    end;
  gotoxy(C1, L1); write(BSES);
  gotoxy(C2, L1); write(BSDI);
  gotoxy(C1, L2); write(BIES);
  gotoxy(C2, L2); write(BIDI);
  gotoxy(C1 + 1, L1);
  for TRACO := L1 + C1 to C2 + L1 - 2 do
    write(BLHZ);
  for TRACO := 2  to L2 - L1 do
    begin
      gotoxy(C1, L1 + TRACO - 1);
      write(BLVT);
    end;
  for TRACO := 2 to L2 - L1 do
    begin
      gotoxy(C2, L1 + TRACO - 1);
      write(BLVT);
    end;
  gotoxy(C1 + 1, L2);
  for TRACO := L1 + C1 to C2 + L1 - 2 do
    write(BLHZ);
end;


procedure POE_LINHA(C, L, TAMANHO, TIPO : byte);
var
  TRACO : byte;
  BLES, BLHZ, BLDI : char;
begin

  {*** Determina a dimensao da linha ***}

  if (L > 24) then
    L := 24;
  if (L < 1) then
    L := 1;
  if (C > 80) then
    C := 80;
  if (C < 1) then
    C := 1;
  if (TAMANHO > 80) then
    TAMANHO := 80;
  if (TAMANHO < 1) then
    TAMANHO := 1;


  {*** Seleciona o tipo de arremate e linha a ser desenhado ***}

  if (TIPO = 11) then
    begin
      BLES := #195;
      BLDI := #180;
      BLHZ := #196;
    end;
  if (TIPO = 12) then
    begin
      BLES := #199;
      BLDI := #182;
      BLHZ := #196;
    end;
  if (TIPO = 21) then
    begin
      BLES := #198;
      BLDI := #181;
      BLHZ := #205;
    end;
  if (TIPO = 22) then
    begin
      BLES := #204;
      BLDI := #185;
      BLHZ := #205;
    end;


  {*** Desenha a linha horizontal ***}

  gotoxy(C, L); write(BLES);
  gotoxy(TAMANHO, L); write(BLDI);
  gotoxy(C + 1, L );
  for TRACO := C + 1 to TAMANHO - 1 do
    write(BLHZ);
end;

begin
  clrscr;
  poe_moldura(1,1,50,24,1);
  poe_linha(1,10,50,11);
  while (readkey <> #13) do;
end.
