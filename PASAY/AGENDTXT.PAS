program AGENDATXT;
uses
  Crt;
var
  ARQTXT   : text;
  NOME     : string[40];
  TELEFONE : string[8];
  TECLA    : char;
  OPCAO    : char;

{*** Rotinas de Visualizacao ***}

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
    write(#205);
end;

{*** Rotinas de Manipulacao de Arquivos ***}

procedure ARQUIVO;
begin
  clrscr;
  line;
  center('Criacao de Arquivo');
  line;
  rewrite(ARQTXT);
  gotoxy( 1,12); center('Arquivo foi criado');
  writexy(25,24,'Tecle algo para voltar ao menu'); 
  TECLA := readkey;
  close(ARQTXT);
end;

procedure CADASTRA;
begin
  clrscr;
  line;
  center('Cadastramento de Registro');
  line;
  append(ARQTXT);
  writexy(10, 5, 'Entre com o Nome ..........: '); readln(NOME);
  writexy(10, 6, 'Entre com o Telefone ......: '); readln(TELEFONE);
  writeln(ARQTXT, NOME);
  writeln(ARQTXT, TELEFONE);
  writexy(25,24,'Tecle algo para voltar ao menu'); 
  TECLA := readkey;
  close(ARQTXT);
end;

procedure EXIBIR;
var
  LINHA : byte;
begin
  clrscr;
  line;
  center('Apresentacao de Registros');
  line;
  LINHA := 5;
  reset(ARQTXT);
  while not eof(ARQTXT) do
    begin
      readln(ARQTXT, NOME);
      readln(ARQTXT, TELEFONE);
      gotoxy( 5,LINHA); write(NOME);
      gotoxy(50,LINHA); write(TELEFONE);
      LINHA := LINHA + 1;
    end;
  writexy(25,24,'Tecle algo para voltar ao menu'); 
  TECLA := readkey;
  close(ARQTXT);
end;

{*** Programa Principal ***}

begin
  OPCAO := '0';
  assign(ARQTXT,'AGENDTXT.DAT');
  while (OPCAO <> '4') do
    begin
      clrscr;
      line;
      center('Menu Principal');
      line;
      gotoxy(28, 6); write('1 ........ Criar arquivo');
      gotoxy(28, 8); write('2 ............ Cadastrar');
      gotoxy(28,10); write('3 ..... Exibir registros');
      gotoxy(28,12); write('4 ...... Fim de Programa');
      gotoxy(28,16); write('Escolha uma opcao ....: ');
      readln(OPCAO);
      if (OPCAO <> '4') then
        case OPCAO of
           '1' : Arquivo;
           '2' : Cadastra;
           '3' : Exibir;
        else
           gotoxy(27,24); writeln('Opcao invalida - Tecle algo');
           OPCAO := readkey;
        end;
    end;
end.

