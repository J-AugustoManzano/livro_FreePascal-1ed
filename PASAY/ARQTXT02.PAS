program GRAVA_ARQUIVO_TEXTO;
var
  ARQUIVO_TXT : text;
  MENSAGEM : string[50];
begin
   assign(ARQUIVO_TXT, 'ARQTXT.XXX');
   append(ARQUIVO_TXT);
   read(MENSAGEM);
   write(ARQUIVO_TXT, MENSAGEM);
   close(ARQUIVO_TXT);
end.

