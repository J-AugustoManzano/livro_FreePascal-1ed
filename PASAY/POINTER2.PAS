program POINTER2;
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
      new(N);
      write('Memoria: ',MemAvail, ' bytes - ');
      write('Entre o ',I, 'o. valor: '); readln(N^);
      S := S + N^;
    end;

  {*** Apresentacao do Somatorio ***}

  writeln('Total: ',S);
  writeln;
  write('Tecla algo para continuar... ');
  readkey;
end.