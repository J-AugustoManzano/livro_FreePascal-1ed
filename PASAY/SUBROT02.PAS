program ESCREVE_POSICIONADO;
uses
  Crt;

procedure WRITEXY(X, Y : byte; MENSAGEM : string);
begin
  gotoxy(X, Y); write(MENSAGEM);
end;

begin
  clrscr;
  WriteXy(4,6,'Texto posicionado na coluna 4 linha 6');
  readln;
end.

