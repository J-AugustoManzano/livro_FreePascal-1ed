unit UDP;

  interface

    procedure CENTER(MENSAGEM : string);
    procedure WRITEXY(X, Y : byte; MENSAGEM : string);
    procedure LINE;
    function CALCULO(R, T : real; OPERADOR : char) : real;

  implementation

    uses Crt;

    procedure CENTER(MENSAGEM : string);
    var
      TAMANHO : integer;
    begin
      TAMANHO := 40 + length(MENSAGEM) div 2;
      writeln(MENSAGEM:TAMANHO);
    end;

    procedure WRITEXY(X, Y : byte; MENSAGEM : string);
      begin
      gotoxy(X, Y); write(MENSAGEM);
    end;
  
    procedure LINE;
    var
      I : byte;
    begin
      for I := 1 to 80 do
        write('-');
    end;

    function CALCULO(R, T : real; OPERADOR : char) : real;
    begin
      case OPERADOR of
        '+' : CALCULO := R + T;
        '-' : CALCULO := R - T;
        '*' : CALCULO := R * T;
        '/' : CALCULO := R / T;
      end;
    end;

end.

