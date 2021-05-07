unit UDP2;
  {$N+}

  interface

    procedure PRINTCENTER(MENSAGEM : string);
    procedure PRINTLINE;
    function FORMATA_REAL(NUMERO : double) : string;
    function HORA : string;
    function DATA : string;

  implementation

  uses
    Dos, Printer;

  procedure PRINTCENTER(MENSAGEM : string);
  var
    POSICAO : byte;
  begin
    POSICAO := 40 + length(MENSAGEM) div 2;
    writeln(LST, MENSAGEM:POSICAO);
  end;

  procedure PRINTLINE;
  var
    I : byte;
  begin
    for I := 1 to 80 do
      write(LST, '-');
    writeln(LST);
  end;


  function FORMATA_REAL(NUMERO : double) : string;

    function REAL_PARA_CARACTERE(NUMERO_REAL : double): string;
    var
      NUMERO_CARACTERE : string;
    begin
      str(NUMERO_REAL:0:2, NUMERO_CARACTERE);
      REAL_PARA_CARACTERE := NUMERO_CARACTERE;
    end;

    var
      TAMANHO : byte;
      TEMP : string;
    begin
      if (NUMERO < 9999999999.98) then
        begin
          TEMP := REAL_PARA_CARACTERE(NUMERO);
          TAMANHO := length(TEMP);
          delete(TEMP,TAMANHO-2,1);
          insert(',',TEMP,TAMANHO-2);
          if (TAMANHO >= 7) and (TAMANHO <= 9) then
            insert('.',TEMP,TAMANHO-5);
          if (TAMANHO >= 10) and (TAMANHO <= 12) then
            begin
              insert('.',TEMP,TAMANHO-5);
              insert('.',TEMP,TAMANHO-8);
            end;
          if (TAMANHO = 13) then
            begin
              insert('.',TEMP,TAMANHO-5);
              insert('.',TEMP,TAMANHO-8);
              insert('.',TEMP,TAMANHO-11);
            end;
        end
      else
        TEMP := '*.***.***.***,**';
      FORMATA_REAL := TEMP;
  end;

  function POEZERO(POSICAO : word) : string;
  var
    SUBTEMPO : string;
  begin
    str(POSICAO:0,SUBTEMPO);
    if length(SUBTEMPO) = 1 then
      insert('0', SUBTEMPO, 1);
    POEZERO := SUBTEMPO;
  end;

  function HORA : string;
  var
    HOR, MIN, SEG, CEN : word;
    TEMPOHR : string[5];
  begin
    gettime(HOR,MIN,SEG,CEN);
    TEMPOHR := POEZERO(HOR) + ':' + POEZERO(MIN);
    HORA := TEMPOHR;
  end;

  function DATA : string;
  var
    DIA, MES, ANO, SEM : word;
    TEMPODT : string[10];
  begin
    getdate(ANO,MES,DIA,SEM);
    TEMPODT := POEZERO(DIA) + '/' + POEZERO(MES) + '/' + POEZERO(ANO);
    DATA := TEMPODT;
  end;

end.