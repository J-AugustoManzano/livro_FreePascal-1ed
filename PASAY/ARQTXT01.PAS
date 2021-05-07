program CRIA_ARQUIVO_TEXTO;
var
  ARQUIVO_TXT : text;
begin
   assign(ARQUIVO_TXT, 'ARQTXT.XXX');
   rewrite(ARQUIVO_TXT);
   close(ARQUIVO_TXT);
end.

