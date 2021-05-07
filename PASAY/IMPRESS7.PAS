program TITULOS_VENCIDOS;
{$N+}
uses
  Udp2, Udp, Crt, Printer, Datas;
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


procedure RELATORIO(DB : string);
var
  PAG : integer;
  LIN, I : byte;
  TEMP : string;
begin
  PAG := 0;
  LIN := 99;
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
          printcenter('RELACAO DE TITULOS VENCIDOS - EMISSAO EM ' + DATA);
          printcenter('DATA BASE: ' + DB);
          writeln(LST);
          printline;
          write(LST, 'DT. VENC.':9);
          write(LST, 'TITULO':10);
          write(LST, 'VALOR':19);
          write(LST, 'ATRASO':8);
          write(LST, '     NOME DO CLIENTE');
          writeln(LST);
          printline;
          writeln(LST);
          LIN := 11;
        end;
      read(CADTIT, TITULO);
      if (Dt_Ansi(TITULO.VENCTO) < Dt_Ansi(DB)) then
        begin
          write(LST, TITULO.VENCTO:10);
          write(LST, TITULO.NUMERO:9);
          write(LST, formata_real(TITULO.VALOR):19);
          write(LST, Juliano(DB) - Juliano(TITULO.VENCTO):8:0);
          if (pesquisa_cli(TITULO.CODCLI)) then
            writeln(LST, '     ',CLIENTE.NOME);
          LIN := LIN + 1;
          if (LIN > 60) then
            write(LST, #12);
        end;
    end;
    if (LIN <= 60) then
      write(LST, #12);
end;

var
  DATABASE : string;
begin
  SISTEMA := 'SISTEMA DE CONTROLE CLIENTE/TITULO - v1.0';
  acessa_arquivo;
  clrscr;
  line;
  center(SISTEMA);
  center('RELATORIO DE TITULOS VENCIDOS');
  line;
  writeln;
  writeln;
  gotoxy( 1, 7); write('Entre a data base no formato DD/MM/AAAA: ');
  Entra_Dt(DATABASE);
  gotoxy( 1, 9); write('Ligue a impressora, tecle <Enter>');
  gotoxy( 1,10); write('e aguarde o termino da impressao.');
  readln;
  relatorio(DATABASE);
  close(CADCLI);
  close(CADTIT);
end.
