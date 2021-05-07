program CENTRALIZA_TEXTO;

procedure CENTER(MENSAGEM : string);
var
  TAMANHO : integer;
begin
  TAMANHO := 40 + length(MENSAGEM) div 2;
  writeln(MENSAGEM:TAMANHO);
end;

begin
  Center('Centralizacao de uma mensagem');
  readln;
end.

