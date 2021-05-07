program ANSI1;

procedure CLRSCR;
begin
  write(#27'[2J');
end;

procedure GOTOXY(X : byte; Y : byte);
begin
  if (X >= 1) and (X <= 80) and (Y >= 1) and (Y <=24) then
    write(#27'[',y,';',x,'H');
end;

var
  NOME : string;
begin
  clrscr;
  gotoxy( 3, 5); write('Entre um nome: ');
  readln(NOME);
  gotoxy( 1, 6); write(NOME);
  gotoxy( 1,24); write('Tecle <Enter> para encerrar.');
  readln;
end.