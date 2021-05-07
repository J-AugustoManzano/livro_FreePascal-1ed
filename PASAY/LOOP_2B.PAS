program LOOPING_2B;
var
  A, B, R : integer;
  RESP : string;
begin
  RESP := 'SIM';
  repeat
    write('Entre um valor para A: '); readln(A);
    write('Entre um valor para B: '); readln(B);
    writeln;
    R := A + B;
    writeln('O resultado corresponde a: ', R);
    write('Deseja continuar? SIM/NAO: '); readln(RESP);
    writeln;
  until (RESP <> 'SIM') and (RESP <> 'sim');
end.

