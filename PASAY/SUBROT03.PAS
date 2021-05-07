program TRACA_LINHA; 

procedure LINE;
var
  I : byte;
begin
  for I := 1 to 80 do
    write('-');
end;

begin
  line;
  writeln('Apresentacao de linha tracejada');
  line;
  readln;
end.

