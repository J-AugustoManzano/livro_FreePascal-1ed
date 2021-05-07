program ANSI2;

const

{*** Constantes para as cores de Frente (Texto) e Fundo ***}

  Black     = 0;
  Blue      = 1;
  Green     = 2;
  Cyan      = 3;
  Red       = 4;
  Magenta   = 5;
  Brown     = 6;
  LightGray = 7;

{*** Constantes para as cores do Texto (Frente) ***}

  DarkGray     = 8;
  LightBlue    = 9;
  LightGreen   = 10;
  LightCyan    = 11;
  LightRed     = 12;
  LightMagenta = 13;
  Yellow       = 14;
  White        = 15;

{*** Constante para o efeito Piscante ***}

  Blink = 128;

procedure TEXTBACKGROUND(COR : byte);
begin
  case COR of
    0 : write(#27'[40m'); {Preto}
    1 : write(#27'[44m'); {Azul}
    2 : write(#27'[42m'); {Verde}
    3 : write(#27'[46m'); {Ciano}
    4 : write(#27'[41m'); {Vermelho}
    5 : write(#27'[45m'); {Magenta}
    6 : write(#27'[43m'); {Marrom}
    7 : write(#27'[47m'); {Cinza claro}
  end;
end;

procedure TEXTCOLOR(COR : byte);
begin
  case COR of
      0 : write(#27'[30m'); {Preto}
      1 : write(#27'[34m'); {Azul}
      2 : write(#27'[32m'); {Verde}
      3 : write(#27'[36m'); {Ciano}
      4 : write(#27'[31m'); {Vermelho}
      5 : write(#27'[35m'); {Magenta}
      6 : write(#27'[33m'); {Marrom}
      7 : write(#27'[37m'); {Cinza Claro}
      8 : write(#27'[1;30m'); {Cinza escuro}
      9 : write(#27'[1;34m'); {Azul claro}
     10 : write(#27'[1;32m'); {Verde claro}
     11 : write(#27'[1;36m'); {Ciano claro}
     12 : write(#27'[1;31m'); {Vermelho claro}
     13 : write(#27'[1;35m'); {Magenta claro}
     14 : write(#27'[1;33m'); {Amarelo}
     15 : write(#27'[1;37m'); {Branco}
    128 : write(#27'[5m'); {Piscante}
    129 : write(#27'[5;34m'); {Azul piscante}
    130 : write(#27'[5;32m'); {Verde piscante}
    131 : write(#27'[5;36m'); {Ciano piscante}
    132 : write(#27'[5;31m'); {Vermelho piscante}
    133 : write(#27'[5;35m'); {Magenta piscante}
    134 : write(#27'[5;33m'); {Marrom piscante}
    135 : write(#27'[5;37m'); {Cinza claro piscante}
    136 : write(#27'[5;1;30m'); {Cinza escuro piscante}
    137 : write(#27'[5;1;34m'); {Azul claro piscante}
    138 : write(#27'[5;1;32m'); {Verde claro piscante}
    139 : write(#27'[5;1;36m'); {Ciano claro piscante}
    140 : write(#27'[5;1;31m'); {Vermelho claro piscante}
    141 : write(#27'[5;1;35m'); {Magenta claro piscante}
    142 : write(#27'[5;1;33m'); {Amarelo piscante}
    143 : write(#27'[5;1;37m'); {Branco piscante}
  end;
end;

procedure NORMVIDEO;
begin
  write(#27'[0m');
end;

procedure LOWVIDEO;
begin
  write(#27'[2m');
end;

procedure HIGHVIDEO;
begin
  write(#27'[1m');
end;


var
  MENSAGEM : string;
begin
  writeln('Teste de padrao de Cores com Codigo Numerico');
  writeln;

  NormVideo;
  TextColor(14 + 128);
  TextBackground(1);
  MENSAGEM := 'Fundo: Azul // Texto: Amarelo Piscante';
  writeln(MENSAGEM);
  writeln;

  NormVideo;
  TextColor(7);
  TextBackground(1);
  MENSAGEM := 'Fundo: Azul // Texto: Cinza claro';
  writeln(MENSAGEM);
  writeln;

  NormVideo;
  TextColor(14);
  TextBackground(4);
  MENSAGEM := 'Fundo: Vermelho // Texto: Amarelo';
  writeln(MENSAGEM);
  writeln;

  NormVideo;
  TextColor(2);
  TextBackground(0);
  MENSAGEM := 'Fundo: Preto // Texto: Verde';
  writeln(MENSAGEM);
  writeln;

  NormVideo;
  TextColor(12 + 128);
  TextBackground(7);
  MENSAGEM := 'Fundo: Cinza claro // Texto: Vermelho claro Piscante';
  writeln(MENSAGEM);
  writeln;

  NormVideo;
  write('Tecle <Enter> para encerrar ...');
  readln;
end.
