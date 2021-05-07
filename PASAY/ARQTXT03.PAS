program LE_ARQUIVO_TEXTO;
var
  ARQUIVO_TXT : text;
  MENSAGEM : string[50];
begin
   assign(ARQUIVO_TXT, 'ARQTXT.XXX');
   reset(ARQUIVO_TXT);
   read(ARQUIVO_TXT, MENSAGEM);
   write(MENSAGEM);
   close(ARQUIVO_TXT);
end.

