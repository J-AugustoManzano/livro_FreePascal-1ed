program FATORIAL1;
uses
  Crt;

  procedure FATORIAL(N : integer);
  var
    I, FAT : integer;
  begin
    FAT := 1;
    for I := 1 to N do
      FAT := FAT * I;
    writeln('A fatorial de ', N,' equivale a: ', FAT);
  end;

var
  LIMITE : integer;
begin
  clrscr;
  writeln('Programa Fatorial');
  writeln;
  write('Informe um valor inteiro: '); readln(LIMITE);
  Fatorial(LIMITE);
  writeln('Tecle <ENTER> para encerrar o programa'); readln;   
end.

