program CADASTRA_ARQUIVO_INTEIRO;
uses
  Crt;
var
  ARQUIVO_INT : file of integer;
  NUMERO : integer;
  RESP   : char;
begin
  assign(ARQUIVO_INT, 'ARQINT.XXX');
  reset(ARQUIVO_INT);
  RESP := 'S';
  while (RESP = 'S') or (RESP = 's') do
    begin
      clrscr;
      writeln('Gravacao de Registros Inteiros');
      writeln;
      seek(ARQUIVO_INT, filesize(ARQUIVO_INT));
      write('Informe um numero inteiro: '); readln(NUMERO);
      write(ARQUIVO_INT, NUMERO);
      writeln;
      write('Deseja continuar? (S/N) '); readln(RESP);
    end;
  close(ARQUIVO_INT);
end.

