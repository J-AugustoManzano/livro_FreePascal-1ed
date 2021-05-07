program MATRIZ_E_ARQUIVO;
uses 
  Crt;
var
  A   : array[1..10] of integer;
  I   : integer;
  ARQ : file of integer;
begin
  assign(ARQ, 'MATINT.DBP');
  rewrite(ARQ);
  clrscr;
  I := 1;
  while (I <= 10) do 
    begin
      write('Digite o elemento - ', I:2, ': '); readln(A[I]);
      write(ARQ, A[I]);
      I := I + 1;
    end;
  close(ARQ);
end.
