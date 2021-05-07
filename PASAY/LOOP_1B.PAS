program LOOPING_1B;
var
  A, B, R : integer;
  RESP : string;
begin
  RESP := 'SIM';
  while (RESP = 'SIM') or (RESP = 'S') do
    begin
      write('Entre um valor para A: '); readln(A);
      write('Entre um valor para B: '); readln(B);
      writeln;
      R := A + B;
      writeln('O resultado corresponde a: ', R);
      writeln;
      write('Deseja continuar? '); readln(RESP);
    end;
end.

