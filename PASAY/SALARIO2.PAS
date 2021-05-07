program SALARIO;
var
  HT, VH, PD, TD, SB, SL : real;
begin
  write('Quantas horas de trabalho? '); readln(HT);
  write('Qual o valor da hora? '); readln(VH);
  write('Qual o percentual de desconto? '); readln(PD);
  SB := HT * VH;
  TD := (PD/100) * SB;
  SL := SB - TD; 
  writeln('Salario bruto ....: ', SB:7:2);
  writeln('Desconto .........: ', TD:7:2);
  writeln('Salario liquido ..: ', SL:7:2);
end.

