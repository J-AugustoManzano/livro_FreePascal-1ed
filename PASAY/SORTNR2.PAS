program ORDENA_NUMEROS;
uses
  Crt;
var
  VETOR : array[1..10] of integer;
  I, J  : integer;
  TECLA : char;
  OPCAO : char;

  {*** Rotina de ordenacao ***}

  procedure TROCA(var A, B : integer);
  var
    X : integer;
  begin
    X := A;
    A := B;
    B := X;
  end;

  procedure ORDENA(var A, B : integer; TIPO : char);
  var
    X : integer;
  begin
    if (TIPO = ’>’) then
      begin
        if (A > B) then
          begin
            Troca(A, B);
          end;
      end
    else
      begin
        if (A < B) then
          begin
            Troca(A, B);
          end;
      end;
  end;

begin

  {*** Entrada dos dados ***}

  clrscr;
  gotoxy(23, 1); write(’Programa para ordenacao de valores’);
  gotoxy( 5, 3); write(’Selecione um operador:’);
  gotoxy( 5, 5); write(’[>] ........ Crescente’);
  gotoxy( 5, 6); write(’[<] ...... Decrescente’);
  gotoxy( 5, 8); write(’==> ’); readln(OPCAO); 
  for I := 1 to 10 do
    begin
      gotoxy( 5,I+12); 
      write(’Entre um valor para VETOR[’,I:2,’]: ’);
      readln(VETOR[I]); 
    end;
  gotoxy(25,24); writeln(’Tecle algo para continuar ...’); 
  TECLA := readkey;

  {*** Ordenacao dos dados ***}

  for I := 1 to 9 do
    for J := I + 1 to 10 do
      Ordena(VETOR[I], VETOR[J], OPCAO);

  {*** Saida dos dados ***}

  for I := 1 to 10 do
    begin
      gotoxy(46,I+12); 
      write(’Agora VETOR[’,I:2,’] vale: ’, VETOR[I]:2); 
    end;
  gotoxy(22,24); writeln(’Tecle algo para encerrar o programa’); 
  TECLA := readkey;
end.
