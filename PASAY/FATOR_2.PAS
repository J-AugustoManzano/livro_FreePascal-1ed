program FATORIAL2;
uses
  Crt;

  procedure FATORIAL(N : integer; var FAT : integer);
  var
    I : integer;
  begin
    FAT := 1;
    for I := 1 to N do
      FAT := FAT * I;
  end;

var
  LIMITE, RETORNO : integer;
begin
  clrscr;
  writeln('Programa Fatorial');
  writeln;
  write('Informe um valor inteiro: '); readln(LIMITE);
  Fatorial(LIMITE, RETORNO);
  writeln('A fatorial de ', LIMITE,' equivale a: ', RETORNO);
  writeln('Tecle <ENTER> para encerrar o programa'); readln;   
end.

