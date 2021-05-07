program MEU_MENU;
uses
  Crt;
const
  MAXIMO = 6;
  COLUNA = 35;
  LINHA = 9;
var
  TECLA : char;
  OPCAO, ATUAL : integer;
  MENU : array[1..MAXIMO] of string[30];
begin
  repeat
    MENU[1] := 'Cadastrar ';
    MENU[2] := 'Alterar   ';
    MENU[3] := 'Consultar ';
    MENU[4] := 'Remover   ';
    MENU[5] := 'Relatorios';
    MENU[6] := 'Fim       ';
    clrscr;
    TextBackground(LightGray);
    TextColor(Black);
    for OPCAO := 1 to MAXIMO do
      begin
        gotoxy(COLUNA, LINHA + OPCAO - 1);
        if (OPCAO > 1) then
          begin
            TextBackground(Black);
            TextColor(LightGray);
          end;
        write(MENU[OPCAO]);
      end;
    gotoxy(COLUNA, LINHA);
    ATUAL := 1;

    repeat
      TECLA := readkey;
      TextBackground(Black);
      TextColor(LightGray);
      write(MENU[ATUAL]);
      case TECLA of
        #72 : if (ATUAL > 1) then
                ATUAL := ATUAL - 1
              else
                ATUAL := MAXIMO;
        #80 : if (ATUAL < MAXIMO) then
                ATUAL := ATUAL + 1
              else
                ATUAL := 1;
        #75 : ATUAL := 1;
        #77 : ATUAL := MAXIMO;
      end;
      TextBackground(White);
      TextColor(Black);
      gotoxy(COLUNA, LINHA + ATUAL - 1);
      write(MENU[ATUAL]);
      gotoxy(COLUNA, LINHA + ATUAL - 1);
    until (TECLA = #13);

    TextBackground(Black);
    TextColor(LightGray);
    gotoxy(1,1);
    case ATUAL of
      1 : begin
            clrscr;
            writeln('Ativou opcao [Cadastrar]');
            writeln;
            write('Tecle <Enter>...'); readln;
          end;
      2 : begin
            clrscr;
            writeln('Ativou opcao [Alterar]');
            writeln;
            write('Tecle <Enter>...'); readln;
          end;
      3 : begin
            clrscr;
            writeln('Ativou opcao [Consultar]');
            writeln;
            write('Tecle <Enter>...'); readln;
          end;
      4 : begin
            clrscr;
            writeln('Ativou opcao [Remover]');
            writeln;
            write('Tecle <Enter>...'); readln;
          end;
      5 : begin
            clrscr;
            writeln('Ativou opcao [Relatorios]');
            writeln;
            write('Tecle <Enter>...'); readln;
          end;
    end;
  until (ATUAL = 6);
end.
