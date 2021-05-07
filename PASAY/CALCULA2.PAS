program CALCULADORA;
uses
  Crt;
var
  OPCAO : char;

  {*** Sub-rotinas de calculos ***}

  procedure ROT_ADICAO;
  var
    X, A, B : real;
    TECLA   : char;
  begin
    clrscr;
    gotoxy(32, 1); write('Rotina de Adicao');
    gotoxy( 5, 6); write('Entre um valor para A: '); readln(A);
    gotoxy( 5, 7); write('Entre um valor para B: '); readln(B);
    X := A + B;
    gotoxy( 5,10); write('O resultado equivale a: ', X:4:2);
    gotoxy(25,24); writeln('Tecle algo para voltar ao menu'); 
    TECLA := readkey;
  end;

  procedure ROT_SUBTRACAO;
  var
    X, A, B : real;
    TECLA   : char;
  begin
    clrscr;
    gotoxy(30, 1); write('Rotina de Subtracao');
    gotoxy( 5, 6); write('Entre um valor para A: '); readln(A);
    gotoxy( 5, 7); write('Entre um valor para B: '); readln(B);
    X := A - B;
    gotoxy( 5,10); write('O resultado equivale a: ', X:4:2);
    gotoxy(25,24); writeln('Tecle algo para voltar ao menu'); 
    TECLA := readkey;
  end;

  procedure ROT_MULTIPLICACAO;
  var
    X, A, B : real;
    TECLA   : char;
  begin
    clrscr;
    gotoxy(28, 1); write('Rotina de Multiplicacao');  
    gotoxy( 5, 6); write('Entre um valor para A: '); readln(A);
    gotoxy( 5, 7); write('Entre um valor para B: '); readln(B);
    X := A * B;
    gotoxy( 5,10); write('O resultado equivale a: ', X:4:2);
    gotoxy(25,24); writeln('Tecle algo para voltar ao menu'); 
    TECLA := readkey;
  end;

  procedure ROT_DIVISAO;
  var
    X, A, B : real;
    TECLA   : char;
  begin
    clrscr;
    gotoxy(32, 1); write('Rotina de Divisao');
    gotoxy( 5, 6); write('Entre um valor para A: '); readln(A);
    gotoxy( 5, 7); write('Entre um valor para B: '); readln(B);
    X := A / B;
    gotoxy( 5,10); write('O resultado equivale a: ', X:4:2);
    gotoxy(25,24); writeln('Tecle algo para voltar ao menu');
    TECLA := readkey;
  end;

{*** Programa Principal ***}

begin
  OPCAO := '0';
  while (OPCAO <> '5') do
    begin
      clrscr;
      gotoxy(33, 1); write('Menu Principal');
      gotoxy(28, 6); write('1 ................. Soma');
      gotoxy(28, 8); write('2 ............ Subtracao');
      gotoxy(28,10); write('3 ........ Multiplicacao');
      gotoxy(28,12); write('4 .............. Divisao');
      gotoxy(28,14); write('5 ...... Fim de Programa');
      gotoxy(28,18); write('Escolha uma opcao ....: '); 
      readln(OPCAO);
      if (OPCAO <> '5') then
        case OPCAO of
           '1' : Rot_Adicao;
           '2' : Rot_Subtracao;
           '3' : Rot_Multiplicacao;
           '4' : Rot_Divisao;
        else
           gotoxy(27,24); writeln('Opcao invalida - Tecle algo');
           OPCAO := readkey;
        end;
    end;
end.

