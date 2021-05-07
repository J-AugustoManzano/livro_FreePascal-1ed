program LE_ARQUIVO_INTEIRO;
uses
  Crt;
var
  ARQUIVO_INT : file of integer;
  NUMERO : integer;
begin
  clrscr;
  assign(ARQUIVO_INT, 'ARQINT.XXX');
  reset(ARQUIVO_INT);
  while not eof(ARQUIVO_INT) do
    begin
      read(ARQUIVO_INT, NUMERO);
      writeln(NUMERO);
    end;
  close(ARQUIVO_INT);
end.

