program COLOR1;
uses 
  Crt;
var
  MENSAGEM : string;
begin
  clrscr;
  writeln('Teste de padrao de Cores');
  writeln;

  NormVideo;
  MENSAGEM := 'Fundo: Preto // Texto: Branco (padrao normal)';
  writeln(MENSAGEM);
  writeln;

  TextColor(Yellow + Blink);
  TextBackground(Blue);
  MENSAGEM := 'Fundo: Azul // Texto: Amarelo Piscante';
  writeln(MENSAGEM);
  writeln;

  TextColor(LightGray);
  TextBackground(Blue);
  MENSAGEM := 'Fundo: Azul // Texto: Cinza claro';
  writeln(MENSAGEM);
  writeln;

  TextColor(Yellow);
  TextBackground(Red);
  MENSAGEM := 'Fundo: Vermelho // Texto: Amarelo';
  writeln(MENSAGEM);
  writeln;

  TextColor(Green);
  TextBackground(Black);
  MENSAGEM := 'Fundo: Preto // Texto: Verde';
  writeln(MENSAGEM);
  writeln;

  TextColor(LightRed + Blink);
  TextBackground(LightGray);
  MENSAGEM := 'Fundo: Cinza claro // Texto: Vermelho claro Piscante';
  writeln(MENSAGEM);
  writeln;

  NormVideo;
  MENSAGEM := 'Video em Modo Normal';
  writeln(MENSAGEM);
  writeln;

  LowVideo;
  MENSAGEM := 'Video com baixa intensidade';
  writeln(MENSAGEM);
  writeln;
  NormVideo;

  writeln;
  write('Tecle <Enter> para encerrar ...');
  readln;
end.
