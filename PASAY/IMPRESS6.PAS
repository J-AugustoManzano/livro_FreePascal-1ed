program RELATORIO_SIMPLES;
{$N+}
uses
  Udp2, Udp, Crt, Printer;
type
  REG_CLIENTE = record
                  CODIGO : string[3];
                  NOME : string[30];
                  ENDERECO : string[30];
                  CIDADE : string[20];
                  ESTADO : string[2];
                  CEP : string[8];
                end;
  REG_TITULO = record
                 NUMERO : string[6];
                 VALOR : real;
                 VENCTO : string[10];
                 CODCLI : string[3];
               end;
var
  CLIENTE : reg_cliente;
  CADCLI : file of reg_cliente;
  TITULO : reg_titulo;
  CADTIT : file of reg_titulo;
  NRCOD : string[3];
  NRTIT : string[6];
  RESP, TECLA : char;
  I : byte;
  SISTEMA : string;

procedure ACESSA_ARQUIVO;
begin
  assign(CADCLI, 'CLIENTES.DBP');
  assign(CADTIT, 'TITULOS.DBP');
  {$I-}
  reset(CADCLI);
  {$I+}
  if (IORESULT = 2) then
    begin
      rewrite(CADCLI);
      write(CADCLI, CLIENTE);
    end;
  {$I-}
  reset(CADTIT);
  {$I+}
  if (IORESULT = 2) then
    begin
      rewrite(CADTIT);
      write(CADTIT, TITULO);
    end;
end;

procedure TELA_CLIENTE;
begin
  gotoxy(33, 7); clreol;
  gotoxy(33, 9); clreol;
  gotoxy(33,11); clreol;
  gotoxy(33,13); clreol;
  gotoxy(33,15); clreol;
  gotoxy(33,17); clreol;
  writexy(10, 7, 'Codigo do Cliente ..:');
  writexy(10, 9, 'Nome ...............:');
  writexy(10,11, 'Endereco ...........:');
  writexy(10,13, 'Cidade .............:');
  writexy(10,15, 'Estado .............:');
  writexy(10,17, 'CEP ................:');
end;

procedure TELA_TITULO;
begin
  gotoxy(33, 7); clreol;
  gotoxy(33, 9); clreol;
  gotoxy(33,11); clreol;
  gotoxy(33,13); clreol;
  writexy(10, 7, 'Numero do Titulo ...:');
  writexy(10, 9, 'Valor ..............:');
  writexy(10,11, 'Data de Vencimento .:');
  writexy(10,13, 'Codigo do Cliente ..:');
end;

function PESQUISA_CLI(CLINUMERO : string) : boolean;
var
  ACHOU : boolean;
begin
  ACHOU := false;
  seek(CADCLI, 1);
  while (not eof(CADCLI)) and (ACHOU = false) do
  begin
    read(CADCLI, CLIENTE);
    if (CLINUMERO = CLIENTE.CODIGO) then
      ACHOU := true;
  end;
  seek(CADCLI, filepos(CADCLI)-1);
  PESQUISA_CLI := ACHOU;
end;

function PESQUISA_TIT(TITNUMERO : string) : boolean;
var
  ACHOU : boolean;
begin
  ACHOU := false;
  seek(CADTIT, 1);
  while (not eof(CADTIT)) and (ACHOU = false) do
  begin
    read(CADTIT, TITULO);
    if (TITNUMERO = TITULO.NUMERO) then
      ACHOU := true;
  end;
  seek(CADTIT, filepos(CADTIT)-1);
  PESQUISA_TIT := ACHOU;
end;

procedure CADASTRA_CLIENTE;
begin
  clrscr;
  line;
  center(SISTEMA);
  center('Cadastro de Clientes');
  line;
  repeat
    writexy( 1,24, 'Digite [0] para encerrar o cadastro...');
    tela_cliente;
    gotoxy(33, 7); readln(NRCOD);
    gotoxy( 1,24); clreol;
    if (NRCOD <> '0') then
      begin
        if (pesquisa_cli(NRCOD) = true) then
          begin
            gotoxy(33, 7); write(NRCOD);
            gotoxy(33, 9); write(CLIENTE.NOME);
            gotoxy(33,11); write(CLIENTE.ENDERECO);
            gotoxy(33,13); write(CLIENTE.CIDADE);
            gotoxy(33,15); write(CLIENTE.ESTADO);
            gotoxy(33,17); write(CLIENTE.CEP);
            writexy( 1,23, 'Este registro ja esta cadastrado');
            writexy( 1,24, 'Pressione algo para continuar...');
            TECLA := readkey;
            gotoxy( 1,23); clreol;
          end
        else
          begin
            seek(CADCLI, filesize(CADCLI));
            gotoxy(33, 7); write(NRCOD);
            gotoxy(33, 9); readln(CLIENTE.NOME);
            gotoxy(33,11); readln(CLIENTE.ENDERECO);
            gotoxy(33,13); readln(CLIENTE.CIDADE);
            gotoxy(33,15); readln(CLIENTE.ESTADO);
            gotoxy(33,17); readln(CLIENTE.CEP);
            CLIENTE.CODIGO := NRCOD;
            write(CADCLI, CLIENTE);
            writexy( 1,24, 'Pressione algo para continuar...');
            TECLA :=  readkey;
          end;
      end;
  until (NRCOD = '0');
end;

procedure CADASTRA_TITULO;
begin
  clrscr;
  line;
  center(SISTEMA);
  center('Cadastro de Titulos');
  line;
  repeat
    writexy( 1,24, 'Digite [0] para encerrar o cadastro...');
    tela_titulo;
    gotoxy(33, 7); readln(NRTIT);
    gotoxy( 1,24); clreol;
    if (NRTIT <> '0') then
      begin
        if (pesquisa_tit(NRTIT) = true) then
          begin
            gotoxy(33, 7); write(NRTIT);
            gotoxy(33, 9); write(TITULO.VALOR:10:2);
            gotoxy(33,11); write(TITULO.VENCTO);
            gotoxy(33,13); write(TITULO.CODCLI);
            writexy( 1,23, 'Este registro ja esta cadastrado');
            writexy( 1,24, 'Pressione algo para continuar...');
            TECLA := readkey;
            gotoxy( 1,23); clreol;
          end
        else
          begin
            seek(CADTIT, filesize(CADTIT));
            gotoxy(33, 7); write(NRTIT);
            gotoxy(33, 9); readln(TITULO.VALOR);
            gotoxy(33,11); readln(TITULO.VENCTO);
            gotoxy(33,13); readln(TITULO.CODCLI);
            TITULO.NUMERO := NRTIT;
            write(CADTIT, TITULO);
            writexy( 1,24 ,'Pressione algo para continuar...');
            TECLA :=  readkey;
          end;
      end;
  until (NRTIT = '0');
end;


procedure RELATORIO;
var
  PAG : integer;
  LIN,I : byte;
  TOTPAG, TOTGERAL : double;
  TEMP : string;
begin
  TOTGERAL := 0;
  PAG := 0;
  LIN := 99;
  clrscr;
  line;
  center(SISTEMA);
  center('Emissao de Relatorio Simples');
  line;
  gotoxy( 1, 7); write('Ligue a impressora, tecle <Enter>');
  gotoxy( 1, 8); write('e aguarde o termino da impressao.');
  readln;
  seek(CADTIT, 1);
  while (not eof(CADTIT)) do
    begin
      if (LIN > 60) then
        begin
          write(LST, 'HORA: ' + HORA);
          PAG := PAG + 1;
          str(PAG, TEMP);
          if (length(TEMP) = 1) then
            TEMP := '00' + TEMP
          else
            if (length(TEMP) = 2) then
              TEMP := '0' + TEMP;
          write(LST, 'PAG: ' + TEMP:69);
          writeln(LST);
          writeln(LST);
          printcenter('SISTEMA DE CONTROLE CLIENTE/TITULO');
          printcenter('RELACAO DE TITULOS - EMISSAO EM ' + DATA);
          writeln(LST);
          printline;
          write(LST, 'DT. VENC.':9);
          write(LST, 'TITULO':13);
          write(LST, 'VALOR':21);
          write(LST, '     NOME DO CLIENTE');
          writeln(LST);
          printline;
          writeln(LST);
          LIN := 10;
          TOTPAG := 0;
        end;
      read(CADTIT, TITULO);
      write(LST, TITULO.VENCTO:10);
      write(LST, TITULO.NUMERO:12);
      write(LST, FORMATA_REAL(TITULO.VALOR):21);
      TOTPAG := TOTPAG + TITULO.VALOR;
      TOTGERAL := TOTGERAL + TITULO.VALOR;
      if (pesquisa_cli(TITULO.CODCLI)) then
        writeln(LST, '     ',CLIENTE.NOME);
      LIN := LIN + 1;
      if (LIN > 60) then
        begin
          writeln(LST);
          writeln(LST);
          printline;
          write(LST, 'TOTAL PAGINA: R$ ':17);
          writeln(LST, FORMATA_REAL(TOTPAG):26);
          write(LST, 'TOTAL ACUMULADO: R$ ':19);
          writeln(LST, FORMATA_REAL(TOTGERAL):23);
          printline;
          write(LST, #12);
        end;
    end;
    if (LIN <= 60) then
      begin
        for I := 1 to 63 - LIN do
          writeln(LST);
        printline;
        write(LST, 'TOTAL PAGINA: R$ ':17);
        writeln(LST, FORMATA_REAL(TOTPAG):26);
        write(LST, 'TOTAL ACUMULADO: R$ ':19);
        writeln(LST, FORMATA_REAL(TOTGERAL):23);
        printline;
        write(LST, #12);
      end;
end;

var
  OPCAO : char;
begin
  SISTEMA := 'SISTEMA DE CONTROLE CLIENTE/TITULO - v1.0';
  acessa_arquivo;
  repeat
    clrscr;
    line;
    center(SISTEMA);
    center('PROGRAMA PRINCIPAL - MENU');
    line;
    writexy(26, 9, '[1] ..... Cadastro de Clientes');
    writexy(26,11, '[2] ...... Cadastro de Titulos');
    writexy(26,13, '[3] ........ Relatorio Simples');
    writexy(26,15, '[F] ........... Fim de Servico');
    writexy(26,21, 'Entre com a opcao: ');
    readln(OPCAO);
    OPCAO := upcase(OPCAO);
    if (OPCAO in ['1','2','3','F']) then
      begin
        case OPCAO of
          '1' : cadastra_cliente;
          '2' : cadastra_titulo;
          '3' : relatorio;
        end;
      end
    else
      begin
        writexy( 1,23, 'Erro - Opcao invalida');
        writexy( 1,24, 'Pressione algo para continuar...');
        TECLA := readkey;
      end;
  until (OPCAO = 'F');
  close(CADCLI);
  close(CADTIT);
end.
