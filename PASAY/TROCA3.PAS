program TROCA3;

{*** Rotina com erro de declaracao de variaveis ***}

procedure TROCA;
var
  X : integer;
begin
  X := A;
  A := B;
  B := X;
end;

var
  A : integer;
  B : integer;
begin
  readln(A);
  readln(B);
  Troca;
  writeln(A);
  writeln(B);
end.

