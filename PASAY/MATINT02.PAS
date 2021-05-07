program ARQUIVO_E_MATRIZ;
uses 
  Crt;
var
  A   : array[1..10] of integer;
  I   : integer;
  ARQ : file of integer;
begin
  assign(ARQ, 'MATINT.DBP');
  reset(ARQ);
  clrscr;
  I := 1;
  while (I <= 10) do 
    begin
      read(ARQ, A[I]);
      write('O registro ', I:2, ' contem o elemento: '); writeln(A[I]:2);
      I := I + 1;
    end;
  close(ARQ);
end.
