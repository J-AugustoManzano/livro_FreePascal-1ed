program CALCADIC;

procedure CALCADICAO(A, B : integer);
var
  Z : integer;
begin
  Z := A + B;
  writeln(Z);
end;

var
  X, Y, W, T : integer;
begin
  readln(X);
  readln(Y);
  CalcAdicao(X, Y);
  readln(W);
  readln(T);
  CalcAdicao(W, T);
  CalcAdicao(6, 4);
end.

