program TESTE_DE_IMPRESSAO_4;
uses
  Printer;
var
  I, J : integer;
begin
  for J := 1 to 8 do
    for I := 1 to 10 do
      if (I < 10) then
        write(LST, I)
      else
        write(LST, 0);
      writeln(LST);
  for I := 2 to 66 do
     writeln(LST, I);
  write(LST, #12);
end.
