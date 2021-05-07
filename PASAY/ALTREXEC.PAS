program ALTERA_AUTOEXEC;
var
  ARQ : text;
begin
  assign(ARQ, '\AUTOEXEC.BAT');
  append(ARQ);
  write(ARQ, 'ECHO TESTE DE ALTERACAO DE AUTOEXEC');
  close(ARQ);
end.

