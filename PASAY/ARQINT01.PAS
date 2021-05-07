program CRIA_ARQUIVO_INTEIRO;
var
  ARQUIVO_INT : file of integer;
begin
  assign(ARQUIVO_INT, 'ARQINT.XXX');
  rewrite(ARQUIVO_INT);
  close(ARQUIVO_INT);
end.

