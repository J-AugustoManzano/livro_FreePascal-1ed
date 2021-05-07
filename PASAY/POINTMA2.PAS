program POINTMA2;
uses
  Crt;
type
  p_mat = ^matriz;
  matriz = array[1..181,1..181] of integer;
var
  A : p_mat;
  L, C, I, J, TOT_P, TOT_I : integer;
begin
  TOT_P := 0;
  TOT_I := 0;
  clrscr;
  writeln('Matriz Bidimensional');
  writeln;
  write('Informe o numero de linhas ...: '); readln(L);
  write('Informe o numero de colunas ..: '); readln(C);
  writeln;
  GetMem(A, L * C * SizeOf(integer));
  for I := 1 to L do
    for J := 1 to C do
      begin
        write('Entre o elemento [', I:3, ',', J:3, ']: ');
        readln(A^[I,J]);
      end;
  for I := 1 to L do
    for J := 1 to C do
      if (A^[I,J] mod 2 = 0) then
        TOT_P := TOT_P + 1
      else
        TOT_I := TOT_I + 1;
  writeln;
  writeln('Total de elementos do tipo par ....: ', TOT_P);
  writeln('Total de elementos do tipo impar ..: ', TOT_I);
  writeln;
  FreeMem(A, L * C * SizeOf(integer));
  writeln('Tecle algo para encerrar... ');
  readkey;
end.
