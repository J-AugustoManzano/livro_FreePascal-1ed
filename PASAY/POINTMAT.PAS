program POINTMAT;
uses
  Crt;
type
  p_mat = ^matriz;
  matriz = array[1..MaxInt] of integer;
var
  A : p_mat;
  N, I, J, X : integer;
begin
  clrscr;
  writeln('Classificacao de "N" elementos');
  writeln;
  write('Informe o numero de elementos: '); readln(N);
  writeln;
  GetMem(A, N * SizeOf(integer));
  for I := 1 to N do
    begin
      write('Entre o ', I:5, 'o. elemento: ');
      readln(A^[I]);
    end;
  for I := 1 to N-1 do
    for J := I+1 to N do
      if (A^[I] > A^[J]) then
        begin
          X := A^[I];
          A^[I] := A^[J];
          A^[J] := X;
        end;
  clrscr;
  writeln('Classificacao de ',N ,' elementos');
  writeln;
  for I := 1 to N do
    writeln(A^[I]);
  writeln;
  FreeMem(A, N * SizeOf(integer));
  writeln('Tecle algo para encerrar... ');
  readkey;
end.
