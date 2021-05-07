program MOLDURA1;
uses
  Crt;

procedure POE_MOLDURA(C1, L1, C2, L2, TIPO : byte);
var
  TRACO : byte;
  BSES, BLAT, BIES, BLIN, BSDI, BIDI : char;
begin


  {*** Determina dimensao de colunas ***}

  if (C1 > 80) then {verifica limite direito}
    C1 := 80;
  if (C2 > 80) then
    C2 := 80;
  if (C1 = C2) and (C2 <> 0) then
    C1 := C2 - 1;
  if (C1 < 1) then {verifica limite esquerdo}
    C1 := 1;
  if (C2 < 1) then
    C2 := 1;
  if (C1 = C2) then
    C2 := C1 + 1;


  {*** Determina dimensao de linhas ***}

  if (L1 > 24) then {verifica linha inferior}
    L1 := 24;
  if (L2 > 24) then
    L2 := 24;
  if (L1 = L2) and (L2 <> 0) then
    L1 := L2 - 1;
  if (L1 < 1) then {verifica linha superior}
    L1 := 1;
  if (L2 < 1) then
    L2 := 1;
  if (L1 = L2) then
    L2 := L1 + 1;


  {*** Seleciona o tipo de borda a ser desenhada ***}

  if (TIPO > 2) then {determina borda dupla}
    TIPO := 2;
  if (TIPO < 1) then {determina borda simples}
    TIPO := 1;
  if (TIPO = 1) then
    begin {borda simples}
      BSES := #218;
      BLAT := #179;
      BIES := #192;
      BLIN := #196;
      BSDI := #191;
      BIDI := #217;
    end
  else
    begin {borda dupla}
      BSES := #201;
      BLAT := #186;
      BIES := #200;
      BLIN := #205;
      BSDI := #187;
      BIDI := #188;
    end;


  {*** Desenha as quinas da moldura ***}

  gotoxy(C1, L1); write(BSES);
  gotoxy(C2, L1); write(BSDI);
  gotoxy(C1, L2); write(BIES);
  gotoxy(C2, L2); write(BIDI);


  {*** Desenha linha horizontal do topo ***}

  gotoxy(C1 + 1, L1);
  for TRACO := L1 + C1 to C2 + L1 - 2 do
    write(BLIN);


  {*** Desenha linha lateral esquerda ***}

  for TRACO := 2  to L2 - L1 do 
    begin
      gotoxy(C1, L1 + TRACO - 1);
      write(BLAT);
    end;


  {*** Desenha linha lateral direita ***}

  for TRACO := 2 to L2 - L1 do
    begin
      gotoxy(C2, L1 + TRACO - 1);
      write(BLAT);
    end;


  {*** Desenha linha horizontal da base ***}

  gotoxy(C1 + 1, L2);
  for TRACO := L1 + C1 to C2 + L1 - 2 do
    write(BLIN);
end;


begin
  clrscr;
  poe_moldura(1,1,80,24,2);
  while (readkey <> #13) do;
end.
