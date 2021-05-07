program COLOR2;
uses 
  Crt;
var
  MENSAGEM : string;
begin
  clrscr;
  writeln('Teste de padrao de Cores com Codigo Numerico');
  writeln;

  NormVideo;
  MENSAGEM := 'Fundo: Preto // Texto: Branco (padrao normal)';
  writeln(MENSAGEM);
  writeln;

  TextColor(14 + 128);
  TextBackground(1);
  MENSAGEM := 'Fundo: Azul // Texto: Amarelo Piscante';
  writeln(MENSAGEM);
  writeln;

  TextColor(8);
  TextBackground(1);
  MENSAGEM := 'Fundo: Azul // Texto: Cinza claro';
  writeln(MENSAGEM);
  writeln;

  TextColor(14);
  TextBackground(4);
  MENSAGEM := 'Fundo: Vermelho // Texto: Amarelo';
  writeln(MENSAGEM);
  writeln;

  TextColor(2);
  TextBackground(0);
  MENSAGEM := 'Fundo: Preto // Texto: Verde';
  writeln(MENSAGEM);
  writeln;

  TextColor(12 + 128);
  TextBackground(7);
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
