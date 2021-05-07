program TESTE_DE_IMPRESSAO_3;
uses
  Printer;
begin
  writeln(LST, 'Programa para teste de impressao');
  writeln(LST);
  write(LST, #27#45#1#27#52#27#69#27#87#1);
  writeln(LST, 'Texto de impressao total');
  write(LST, #27#45#0#27#53#27#70#27#87#0);
  write(LST, #12);
end.
