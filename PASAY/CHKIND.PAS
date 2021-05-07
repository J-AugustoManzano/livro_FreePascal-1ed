program CHECK_INDICE;
var
  A, B : array[1..10] of integer;
  I, R : integer;
begin
  writeln('Calculo com checagem do indice da matriz');
  writeln;

  { *** Entrada dos dados *** }

  for I := 1 to 10 do
    begin
      write('Informe o ', I:2, 'o. valor: '); 
      readln(A[I]);
   end;

  { *** Processamento par ou impar *** }

  for I := 1 to 10 do
    begin
      R := I mod 2;
      if (R = 0) then
        B[I] := A[I] * 5
      else
        B[I] := A[I] + 5;
    end;
  writeln;

  { *** Apresentacao das matrizes *** }

  for I := 1 to 10 do
    writeln('A[',I:2,'] = ',A[I]:2,'  ','B[',I:2,'] = ',B[I]:2);
  writeln;
  writeln('Tecle <ENTER> para encerrar: '); readln; 
end.
