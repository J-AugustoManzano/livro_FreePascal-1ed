program POINTER6;
uses
  Crt;
var
  ENDERECO, N : ^integer;
  S, I : Integer;
begin

  {*** Entrada dos 5 Valores ***}

  S := 0;
  clrscr;
  writeln('Somatorio de Valores');
  writeln;
  Mark(ENDERECO);
  for I := 1 to 5 do
    begin
      GetMem(N, 20);
      write('Memoria: ',MemAvail, ' bytes - ');
      write('Entre o ',I, 'o. valor: '); readln(N^);
      S := S + N^;
      Release(ENDERECO);
    end;

  {*** Apresentacao do Somatorio ***}

  writeln('Total: ',S);
  writeln;
  write('Tecla algo para continuar... ');
  readkey;
end.