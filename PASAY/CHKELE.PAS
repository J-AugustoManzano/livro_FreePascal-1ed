program ELEMENTO_IMPAR;
var
  A     : array[1..5] of integer;
  I, SOMA, R : integer;
begin
  SOMA := 0;
  writeln('Somatorio de elementos impares');
  writeln;

  { *** Entrada dos dados *** }

  for I := 1 to 5 do
    begin
      write('Informe o ', I:2, 'o. valor: '); 
      readln(A[I]);
     end;

  { *** Processamento par ou impar *** }

  for I := 1 to 5 do
    begin
      R := A[I] mod 2; 
      if (R <> 0) then
        SOMA := SOMA + A[I];
    end;
  writeln;
 
  { *** Apresentacao do somatorio *** }

  writeln('A soma dos elementos impares equivale a: ', SOMA:2); 
  writeln;
  writeln('Tecle <ENTER> para encerrar: '); readln; 
end.
