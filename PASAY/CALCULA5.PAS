program CALCULADORA;
uses
  Crt;
var
  OPCAO : char;
  X, A, B : real;

  {*** Rotinas definidas pelo usuario ***}

  procedure CENTER(MENSAGEM : string);
  var
    TAMANHO : integer;
  begin
    TAMANHO := 40 + length(MENSAGEM) div 2;
    writeln(MENSAGEM:TAMANHO);
  end;

  procedure WRITEXY(X, Y : byte; MENSAGEM : string);
  begin
    gotoxy(X, Y); write(MENSAGEM);
  end;

  procedure LINE;
  var
    I : byte;
  begin
    for I := 1 to 80 do
      write('-');
  end;

  {*** Rotinas de entrada ***}

  procedure ENTRADA;
  begin
    WriteXy( 5, 6,'Entre um valor para A: '); readln(A);
    WriteXy( 5, 7,'Entre um valor para B: '); readln(B);
  end;

  {*** Funcao para o calculo das operacoes ***}

  function CALCULO(R, T : real; OPERADOR : char) : real;
  begin
    case OPERADOR of
      '+' : CALCULO := R + T;
      '-' : CALCULO := R - T;
      '*' : CALCULO := R * T;
      '/' : CALCULO := R / T;
    end;
  end;

  {*** Rotinas de saida ***}

  procedure SAIDA;
  var
    TECLA   : char;
  begin
    gotoxy( 5,10); write('O resultado equivale a: ', X:4:2);
    WriteXy(25,24,'Tecle algo para voltar ao menu'); 
    TECLA := readkey;
  end;

  {*** Rotinas de calculo ***}

  procedure ROT_ADICAO;
  begin
    clrscr;
    Line;
    Center('Rotina de Adicao');  
    Line;
    Entrada;
    X := Calculo(A, B, '+');
    Saida;
  end;

  procedure ROT_SUBTRACAO;
  begin
    clrscr;
    Line;
    Center('Rotina de Subtracao');  
    Line;
    Entrada;
    X := Calculo(A, B, '-');
    Saida;
  end;

  procedure ROT_MULTIPLICACAO;
  begin
    clrscr;
    Line;
    Center('Rotina de Multiplicacao');
    Line;
    Entrada;
    X := Calculo(A, B, '*');
    Saida;
  end;

  procedure ROT_DIVISAO;
  begin
    clrscr;
    Line;
    Center('Rotina de Divisao');
    Line;
    Entrada;
    X := Calculo(A, B, '/');
    Saida;
  end;

{*** Programa Principal ***}

begin
  OPCAO := '0';
  while (OPCAO <> '5') do
    begin
      clrscr;
      Line;
      Center('Menu Principal');
      Line;
      WriteXy(28, 6,'1 ................. Soma');
      WriteXy(28, 8,'2 ............ Subtracao');
      WriteXy(28,10,'3 ........ Multiplicacao');
      WriteXy(28,12,'4 .............. Divisao');
      WriteXy(28,14,'5 ...... Fim de Programa');
      WriteXy(28,18,'Escolha uma opcao ....: '); 
      readln(OPCAO);
      if (OPCAO <> '5') then
        case OPCAO of
           '1' : Rot_Adicao;         
           '2' : Rot_Subtracao;         
           '3' : Rot_Multiplicacao;         
           '4' : Rot_Divisao;
        else         
           WriteXy(27,24,'Opcao invalida - Tecle algo'); 
           OPCAO := readkey;
        end;
    end;
end.

