program LISTLIG2;
uses
  Crt;
type
  LISTA = ^DADOS;
  DADOS = record
            NOME : string;
            SALARIO : real;
            TEMPO : integer;
            PROX : lista;
         end;
var
  CADFUN, ATUAL, LIST_CF : lista;
  REGISTRO : dados;
  ENT_NOME : string;
  ENT_SALARIO : real;
  ENT_TEMPO : integer;
  I, LINHA : longint;
  RESP : char;
begin
  I := 1;
  CADFUN := nil;
  repeat
    clrscr;
    writeln('CADFUN');
    writeln;
    new(CADFUN);
    writeln('Entre o ',I:4,'o. registro');
    writeln;
    write('Nome ..............: '); readln(ENT_NOME);
    write('Salario ...........: '); readln(ENT_SALARIO);
    write('Tempo de Servico ..: '); readln(ENT_TEMPO);
    CADFUN^.NOME    := ENT_NOME;
    CADFUN^.SALARIO := ENT_SALARIO;
    CADFUN^.TEMPO   := ENT_TEMPO;
    if (LIST_CF=nil) or (ENT_NOME < LIST_CF^.NOME) then
      begin
        CADFUN^.PROX := LIST_CF;
        LIST_CF := CADFUN;
      end
    else
      begin
        ATUAL := LIST_CF;
        while (ATUAL^.PROX <> nil) and (ENT_NOME > ATUAL^.PROX^.NOME) do
          ATUAL := ATUAL^.PROX;
        CADFUN^.PROX := ATUAL^.PROX;
        ATUAL^.PROX := CADFUN;
      end;
    I := I + 1;
    writeln;
    writeln('Deseja continuar? [S]im ou [N]ao: '); readln(RESP);
  until (UpCase(RESP) = 'N');
  clrscr;
  I := 1;
  LINHA := 3;
  gotoxy( 1, 1); write('Reg#');
  gotoxy( 6, 1); write('Nome');
  gotoxy(46, 1); write('Salario');
  gotoxy(61, 1); write('Tempo de Servico');
  while (LIST_CF <> nil) do
    begin
      gotoxy( 1,LINHA); write(I:4);
      gotoxy( 6,LINHA); write(LIST_CF^.NOME);
      gotoxy(46,LINHA); write(LIST_CF^.SALARIO:6:2);
      gotoxy(61,LINHA); write(LIST_CF^.TEMPO);
      LIST_CF := LIST_CF^.PROX;
      LINHA := LINHA + 1;
      I := I + 1;
    end;
end.

