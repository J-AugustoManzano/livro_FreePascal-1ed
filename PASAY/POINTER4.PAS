program POINTER4;
uses
  Crt;
var
  N : ^integer;
  S, I : Integer;
begin

  {*** Entrada dos 5 Valores ***}

  S := 0;
  clrscr;
  writeln('Somatorio de Valores');
  writeln;
  for I := 1 to 5 do
    begin
      GetMem(N, 20);
      write('Memoria: ',MemAvail, ' bytes - ');
      write('Entre o ',I, 'o. valor: '); readln(N^);
      S := S + N^;
      FreeMem(N, 20);
    end;

  {*** Apresentacao do Somatorio ***}

  writeln('Total: ',S);
  writeln;
  write('Tecla algo para continuar... ');
  readkey;
end.