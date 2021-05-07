program listlig1;
uses
  Crt;
type
  lista = ^proximo;
  proximo = record
              elemento : real;
              indice : lista;
            end;
var
  A, PRI_ELEMENTO, ELEMENTO_SEG, LISTA_SAIDA : lista;
  I : longint;
  SOMA, MEDIA : real;
  N : string;
  CODIGO : integer;
begin
  SOMA := 0;
  I := 1;
  clrscr;
  writeln('Matriz Dinamica');
  writeln;
  Mark(A);
  PRI_ELEMENTO := nil;
  repeat
    if (PRI_ELEMENTO = nil) then
      begin
        New(A);
        write('Informe o ',I:4,'o. valor: ');
        readln(N);
        if (N <> '*') then
          begin
            Val(N,A^.elemento,CODIGO);
            PRI_ELEMENTO := A;
            A^.indice := nil;
            I := I + 1;
          end;
      end
    else
      begin
        ELEMENTO_SEG := A;
        New(A);
        write('Informe o ',I:4,'o. valor: ');
        readln(N);
        if (N <> '*') then
          begin
            Val(N,A^.elemento,CODIGO);
            ELEMENTO_SEG^.indice := A;
            A^.indice := nil;
            I := I + 1;
          end;
      end;
  until (N = '*');
  LISTA_SAIDA := PRI_ELEMENTO;
  while (LISTA_SAIDA <> NIL) do
    begin
      SOMA := SOMA + LISTA_SAIDA^.elemento;
      LISTA_SAIDA := LISTA_SAIDA^.indice;
    end;
  MEDIA := SOMA / (I-1);
  writeln;
  writeln('Media = ',MEDIA:6:2);
  writeln;
  write('Tecle algo para encerrar...');
  readkey;
end.

