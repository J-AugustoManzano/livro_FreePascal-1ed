program TROCA2;
var
  A : integer;
  B : integer;

procedure TROCA;
var
  X : integer;
begin
  X := A;
  A := B;
  B := X;
end;

begin
  readln(A);
  readln(B);
  Troca;
  writeln(A);
  writeln(B);
end.

