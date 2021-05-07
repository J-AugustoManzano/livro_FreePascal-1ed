program SALARIO;
var
  HT, VH, PD, TD, SB, SL : real;
begin
  readln(HT);
  readln(VH);
  readln(PD);
  SB := HT * VH;
  TD := (PD/100) * SB;
  SL := SB - TD; 
  writeln(SB);
  writeln(TD);
  writeln(SL);
end.

