program TESTE_DE_IMPRESSAO_5;
uses
  Crt, Printer;

procedure PRINTCENTER(MENSAGEM : string);
var
  POSICAO : byte;
begin
  POSICAO := 40 + length(MENSAGEM) div 2;
  writeln(LST, MENSAGEM:POSICAO);
end;

procedure PRINTLINE;
var
  I : byte;
begin
  for I := 1 to 80 do
    write(LST, '-');
  writeln(LST);
end;

type
  BIMESTRE = array[1..4] of real;
  DADOS = record
           CODIGO : string[6];
           NOME : string[40];
           NOTA : bimestre;
         end;
var
  ALUNO : array[1..10] of dados;
  X : dados;
  I, J : byte;
  SOMAG, MEDIAG, SOMA : real;
  MEDIA : array[1..10] of real;
  ESPACOS : byte;
begin

  {*** Cadastro dos alunos ***}

  for I := 1 to 10 do
    begin
      clrscr;
      gotoxy( 1, 1); write('CADASTRO DE ALUNOS');
      gotoxy( 1, 2); write('------------------');
      gotoxy( 1, 4); write('Entre com o ',I,'o. registro');
      gotoxy( 1, 6); write('Entre o codigo de matricula ....:');
      gotoxy( 1, 7); write('Entre o nome ...................:');
      gotoxy( 1, 8); write('Entre a Nota 1 .................:');
      gotoxy( 1, 9); write('Entre a Nota 2 .................:');
      gotoxy( 1,10); write('Entre a Nota 3 .................:');
      gotoxy( 1,11); write('Entre a Nota 4 .................:');
      gotoxy(35, 6); readln(ALUNO[I].CODIGO);
      gotoxy(35, 7); readln(ALUNO[I].NOME);
      for J := 1 to 4 do
        begin
          gotoxy(35,J+7);
          readln(ALUNO[I].NOTA[J]);
        end;
    end;

  {*** Ordenacao dos alunos ***}

  for I := 1 to 9 do
    for J := I+1 to 10 do
      if (ALUNO[I].NOME > ALUNO[J].NOME) then
        begin
          X := ALUNO[I];
          ALUNO[I] := ALUNO[J];
          ALUNO[J] := X;
        end;

  {*** Processamento das Medias ***}

  SOMAG := 0;
  for I := 1 to 10 do
    begin
      SOMA := 0;
      begin
        for J := 1 to 4 do
          SOMA := SOMA + ALUNO[I].NOTA[J];
        MEDIA[I] := SOMA / 4;
        SOMAG := SOMAG + MEDIA[I];
      end;
      MEDIAG := SOMAG / 10;
    end;

  {*** impressao em papel ***}

  clrscr;
  gotoxy( 1, 1); write('EMISSAO DE LISTAGEM');
  gotoxy( 1, 2); write('-------------------');
  gotoxy( 1, 5); write('Ligue a impressora e tecle <Enter>');
  gotoxy( 1, 6); write('e aguarde o termino da impressao.');
  readln;

  {*** Cabecalho da Listagem ***}

  PrintCenter('RELACAO GERAL DE ALUNOS');
  PrintLine;
  write(LST, 'NOME':4);
  write(LST, 'CODIGO':43);
  write(LST, 'NOTA1':6);
  write(LST, 'NOTA2':6);
  write(LST, 'NOTA3':6);
  write(LST, 'NOTA4':6);
  write(LST, 'MEDIA':9);
  write(LST);
  PrintLine;
  writeln(LST);

  {*** Corpo da Listagem ***}

  for I := 1 to 10 do
    begin
      ESPACOS := 40 - length(ALUNO[I].NOME);
      write(LST, ALUNO[I].NOME,'':ESPACOS);
      write(LST, ALUNO[I].CODIGO:7);
      for J := 1 to 4 do
        write(LST, ALUNO[I].NOTA[J]:6:2);
      write(LST, MEDIA[I]:9:2);
      writeln(LST);
    end;
  writeln(LST);

  write(LST, 'MEDIA GERAL >>':74);
  write(LST, MEDIAG:6:2);
  writeln(LST);
  write(LST, #12);
end.
