program TESTE_DE_IMPRESSAO_2;
uses
  Printer;
begin
  writeln(LST, 'Programa para teste de impressao');
  writeln(LST);
  write(LST, #27#45#1); writeln(LST, 'Texto sublinhado'); write(LST, #27#45#0);
  write(LST, #27#52); writeln(LST, 'Texto italico'); write(LST, #27#53);
  write(LST, #27#83#0); writeln(LST, 'Texto sobrescito'); write(LST, #27#84);
  write(LST, #27#83#1); writeln(LST, 'Texto subescrito'); write(LST, #27#84);
  write(LST, #27#69); writeln(LST, 'Texto negrito'); write(LST, #27#70);
  write(LST, #27#87#1); writeln(LST, 'Texto expandido'); write(LST, #27#87#0);
  write(LST, #12);
end.
