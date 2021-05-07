program GERENCIAMENTO_ESCOLAR;

uses
  Crt, Udp;

const
  REG_MAXIMO = 1000;

type
  BIMESTRE  = array[1..4] of real;
  REG_ALUNO = record
                FLAG      : char;
                MATRICULA : integer;
                NOME      : string[30];
                NOTAS     : bimestre;
              end;

var
  ALUNO       : reg_aluno;
  ARQALU      : file of reg_aluno;
  NR_MATRIC   : integer;
  SISTEMA     : string;
  RESP, TECLA : char;
  I           : byte;

procedure ACESSA_ARQUIVO;
begin
  assign(ARQALU, 'CADALU.DAT');
  {$I-}
  reset(ARQALU);
  {$I+}
  if (IORESULT = 2) then
    begin
      rewrite(ARQALU);
      write(ARQALU, ALUNO);
    end;
end;

procedure TELA;
begin
  gotoxy(18,10); clreol;
  gotoxy(18,11); clreol;
  gotoxy(18,12); clreol;
  gotoxy(18,13); clreol;
  gotoxy(18,14); clreol;
  gotoxy(18,15); clreol;
  writexy( 1,10,'Matricula ...: ');
  writexy( 1,11,'Nome ........: ');
  writexy( 1,12,'1a. Nota  ...: ');
  writexy( 1,13,'2a. Nota  ...: ');
  writexy( 1,14,'3a. Nota  ...: ');
  writexy( 1,15,'4a. Nota  ...: ');
end;

function PESQUISA(NUMERO : integer) : boolean;
var
  ACHOU : boolean;
begin
  ACHOU := false;
  seek(ARQALU, 0);
  while (not eof(ARQALU)) and (not ACHOU) do
  begin
    read(ARQALU, ALUNO);
    ACHOU := (NUMERO = ALUNO.MATRICULA) and (ALUNO.FLAG <> '*');
  end;
  seek(ARQALU,filepos(ARQALU)-1);
  PESQUISA := ACHOU;
end;

function REGISTROS : integer;
var
  CONTA_REG   : integer;
begin
  seek(ARQALU ,1); { posiciona no registro 1 do arquivo }
  CONTA_REG := 0;
  while (not eof(ARQALU)) do
  begin
    read(ARQALU, ALUNO);
    if (ALUNO.FLAG = ' ') then
      CONTA_REG := CONTA_REG + 1;
  end;
  REGISTROS := CONTA_REG;
end;

procedure ROT_CADASTRAR;
begin
  clrscr;
  Line;
  Center(SISTEMA);
  Center('MODULO DE CADASTRAMENTO');
  Line;
  writexy( 1, 6,'Digite os dados abaixo:');
  repeat
    if (Registros < REG_MAXIMO) then
      begin
        gotoxy( 1, 7);
        write(Registros, ' registro(s), maximo ',REG_MAXIMO);
        gotoxy( 1, 8); write('Digite o ',Registros + 1,'o. registro');
        writexy( 1,24,'Digite [0] para encerrar o modulo cadastro');
        Tela;
        gotoxy(18,10); readln(NR_MATRIC);
        gotoxy( 1,24); clreol;
        if (NR_MATRIC <> 0) then
        begin
          if (pesquisa(NR_MATRIC) = true) then
            begin
              { Apresenta os dados caso exista no arquivo } 
              gotoxy(18,10); writeln(NR_MATRIC);
              gotoxy(18,11); writeln(ALUNO.NOME);
              for I := 1 to 4 do
                begin
                  gotoxy(18,11 + I);
                  writeln(ALUNO.NOTAS[I]:8:2);
                end;
              writexy( 1,23,'Este registro ja esta cadastrado');
              gotoxy( 1,24); write('Pressione algo para continuar...');
              TECLA := readkey;
              gotoxy( 1,23); clreol;
            end
          else
            begin
              { Localiza posicao para gravar registro }
              seek(ARQALU, 0);
              repeat
                read(ARQALU,ALUNO);
              until (ALUNO.FLAG = '*') or (eof(ARQALU));
              if (ALUNO.FLAG = '*') then
                seek(ARQALU,filepos(ARQALU)-1)
              else
                seek(ARQALU,filesize(ARQALU));
              { Grava registro }
              ALUNO.FLAG := ' ';
              gotoxy(18,11); readln(ALUNO.NOME);
              for I := 1 to 4 do
              begin
                gotoxy(18,11 + I);
                readln(ALUNO.NOTAS[I]);
              end;
              ALUNO.MATRICULA := NR_MATRIC;
              write(ARQALU,ALUNO);
              gotoxy( 1,24); write('Pressione algo para continuar...');
              TECLA := readkey;
            end;
        end;
      end
    else
      begin
        writexy( 1,23,'Arquivo lotado');
        gotoxy( 1,24); write('Pressione algo para continuar...');
        TECLA := readkey;
        NR_MATRIC := 0;
      end;
  until (NR_MATRIC = 0);
end;

procedure ROT_REMOVER;
begin
  clrscr;
  Line;
  Center(SISTEMA);
  Center('MODULO DE REMOCAO');
  Line;
  writexy( 1, 6,'Digite o numero de matricula:');
  repeat
    gotoxy( 1, 7);
    write('Arquivo possui ', Registros, ' registro(s).');
    writexy( 1,24,'Digite [0] para encerrar o modulo remocao');
    Tela;
    gotoxy(18,10); readln(NR_MATRIC);
    gotoxy( 1,24); clreol;
    if (NR_MATRIC <> 0) then
      begin
        if (pesquisa(NR_MATRIC) = true) then
          begin
            Tela;
            gotoxy(18,10); writeln(NR_MATRIC);
            gotoxy(18,11); writeln(ALUNO.NOME);
            for I := 1 to 4 do
              begin
                gotoxy(18,11 + I);
                writeln(ALUNO.NOTAS[I]:8:2);
              end;
            gotoxy( 1,17); write('Remove este registro? [S/N]: ');
            read(RESP);
            gotoxy( 1,17); clreol;
            if (RESP = 'S') or (RESP = 's') then
              begin
                ALUNO.FLAG := '*';
                write(ARQALU, ALUNO);
                writexy( 1,23,'Registro removido do arquivo');
                gotoxy( 1,24);
                write('Pressione algo para continuar...');
                TECLA := readkey;
              end;
            gotoxy( 1,15); clreol;
            gotoxy( 1,23); clreol;
          end
        else
          begin
            writexy( 1,23,'Este registro nao esta cadastrado');
            gotoxy( 1,24); 
            write('Pressione algo para continuar...');
            TECLA := readkey;
            gotoxy( 1,23); clreol;
         end;
      end;
  until (NR_MATRIC = 0);
end;

procedure ROT_ALTERAR;
var
  NOVO_NOME : string[30];
  NOVA_NOTAS : bimestre;
begin
  clrscr;
  Line;
  Center(SISTEMA);
  Center('MODULO DE ALTERACAO');
  Line;
  writexy( 1, 6,'Digite o numero de matricula:');
  repeat
    gotoxy( 1, 7);
    write('Arquivo possui ', Registros, ' registro(s).');
    writexy( 1,24,'Digite [0] para encerrar o modulo alteracao');
    Tela;
    gotoxy(18,10); readln(NR_MATRIC);
    gotoxy( 1,24); clreol;
    if (NR_MATRIC <> 0) then
      begin
        if (pesquisa(NR_MATRIC) = true) then
          begin
            gotoxy(18,10); writeln(NR_MATRIC);
            gotoxy(18,11); writeln(ALUNO.NOME);
            for I := 1 to 4 do
              begin
                gotoxy(18,11 + I);
                writeln(ALUNO.NOTAS[I]:8:2);
              end;
            writexy( 1,23,'Deseja efetuar alteracao? [S/N]: ');
            readln(RESP);
            gotoxy( 1,23); clreol;
            if (RESP = 'S') or (RESP = 's') then
              begin
                writexy( 1,23,'Digite as novas informacoes');
                writexy( 1,17,'Novo Nome ...: ');
                writexy( 1,18,'1a. Nota ....: ');
                writexy( 1,19,'2a. Nota ....: ');
                writexy( 1,20,'3a. Nota ....: ');
                writexy( 1,21,'4a. Nota ....: ');
                gotoxy(18,17); readln(NOVO_NOME);
                for I := 1 to 4 do
                begin
                  gotoxy(18,17 + I);
                  readln(NOVA_NOTAS[I]);
                end;
                gotoxy( 1,23); clreol;
                writexy( 1,23,'Altera? [S/N]: '); readln(RESP);
                if (RESP = 'S') or (RESP = 's') then
                  begin
                    ALUNO.NOME := NOVO_NOME;
                    for I := 1 to 4 do
                      ALUNO.NOTAS[I] := NOVA_NOTAS[I];
                    write(ARQALU, ALUNO);
                    writexy( 1,23,'Alteracoes executadas com sucesso');
                  end;
                gotoxy( 1,24);
                write('Pressione algo para continuar...');
                TECLA := readkey;
                gotoxy( 1,17); clreol;
                gotoxy( 1,18); clreol;
                gotoxy( 1,19); clreol;
                gotoxy( 1,20); clreol;
                gotoxy( 1,21); clreol;
                gotoxy( 1,23); clreol;
              end;
          end
        else
          begin
            writexy( 1,23,'Este registro nao esta cadastrado');
            gotoxy( 1,24); 
            write('Pressione algo para continuar...');
            TECLA := readkey;
            gotoxy( 1,23); clreol;
          end;
      end;
  until (NR_MATRIC = 0);
end;

procedure ROT_PESQUISAR;
begin
  clrscr;
  Line;
  Center(SISTEMA);
  Center('MODULO DE PESQUISA');
  Line;
  writexy( 1, 6,'Digite o numero de matricula:');
  repeat
    gotoxy( 1, 7);
    write('Arquivo possui ', Registros, ' registro(s).');
    writexy( 1,24,'Digite [0] para encerrar o modulo pesquisa');
    Tela;
    gotoxy(18,10); readln(NR_MATRIC);
    gotoxy( 1,24); clreol;
    if (NR_MATRIC <> 0) then
      begin
        if (pesquisa(NR_MATRIC) = true) then
          begin
          gotoxy(18,10); writeln(NR_MATRIC);
          gotoxy(18,11); writeln(ALUNO.NOME);
            for I := 1 to 4 do
              begin
                gotoxy(18,11 + I);
                writeln(ALUNO.NOTAS[I]:8:2);
              end;
             gotoxy( 1,24); write('Pressione algo para continuar...');
             TECLA := readkey;
          end
        else
          begin
            writexy( 1,23,'Este registro nao esta cadastrado');
            gotoxy( 1,24); write('Pressione algo para continuar...');
            TECLA := readkey;
            gotoxy( 1,23); clreol;
          end;
      end;
  until (NR_MATRIC = 0);
end;

procedure ROT_ENCERRAR;
begin
  clrscr;
  close(ARQALU);
  writeln('Fim de execucao do cadastro de alunos');
  writeln;
  exit;
end;

var
  OPCAO    : char;
begin
  SISTEMA := 'SISTEMA DE GERENCIAMENTO ESCOLAR - v1.0';
  Acessa_Arquivo;
  repeat
    clrscr;
    line;
    center(SISTEMA);
    center('MODULO PRINCIPAL');
    line;
    writexy(26, 9,'Cadastramento .........: [C]');
    writexy(26,10,'Remocao ...............: [R]');
    writexy(26,11,'Alteracao .............: [A]');
    writexy(26,12,'Pesquisa ..............: [P]');
    writexy(26,13,'Finalizacao ...........: [F]');
    writexy(26,17,'Entre com a opcao: --> '); 
    readln(OPCAO);
    writeln;
    OPCAO := upcase(OPCAO);
    if (OPCAO in ['C','R','A','P','F']) then
      begin
        case OPCAO of
          'C' : Rot_Cadastrar;
          'R' : Rot_Remover;
          'A' : Rot_Alterar;
          'P' : Rot_Pesquisar;
          'F' : ROT_Encerrar;
        end;
      end
    else
      begin;
        writexy( 1,23,'Erro - Opcao invalida');
        gotoxy( 1,24); 
        write('Pressione algo para continuar...');
        TECLA := readkey;
      end;
  until (OPCAO = 'F');
end.


