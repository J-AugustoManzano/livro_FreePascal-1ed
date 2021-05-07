program DATATEST;

uses
  Crt, Datas;

var
  DATA1, DATA2 : string;
  DJ, DIAS : real;
  N : integer;
  TECLA : char;
begin
  clrscr;
  writeln('Teste de controle de datas');
  writeln('--------------------------');
  writeln;
  write('Entre a primeira data no formato DD/MM/AAAA ..: '); 
  Entra_Dt(DATA1);
  write('Entre a segunda data no formato DD/MM/AAAA ...: '); 
  Entra_Dt(DATA2);
  writeln;
  if (Dt_Ansi(DATA1) > Dt_Ansi(DATA2)) then
    begin
      writeln('A primeira data e maior que a segunda data');
      DIAS := Juliano(DATA1) - Juliano(DATA2);
    end
  else
    begin
      writeln('A primeira data nao e maior que a segunda data');
      DIAS := Juliano(DATA2) - Juliano(DATA1);
    end;
  writeln('A diferenca entre as datas equivale a ', DIAS:1:0, ' dias');
  writeln;
  write('Tecle algo para continuar...');
  TECLA := readkey;
  clrscr;
  writeln('Teste de controle de datas');
  writeln('--------------------------');
  writeln;
  write('Entre uma data no formato DD/MM/AAAA ....: '); 
  Entra_Dt(DATA1);
  writeln;
  writeln('Dia da semana abreviado .............: ', Ds_Abr(DATA1));
  writeln('Dia da semana por extenso ...........: ', Ds_Ext(DATA1));
  writeln('Dia da semana numerico ..............: ', Ds_Num(DATA1));
  writeln;
  writeln('O Dia da data equivale (caractere) ..: ', Cdia(DATA1));
  writeln('O Mes da data equivale (caractere) ..: ', Cmes(DATA1));
  writeln('O Ano da data equivale (caractere) ..: ', Cano(DATA1));
  writeln;
  writeln('O Dia da data equivale (numerico) ...: ', Ndia(DATA1):4);
  writeln('O Mes da data equivale (numerico) ...: ', Nmes(DATA1):4);
  writeln('O Ano da data equivale (numerico) ...: ', Nano(DATA1):4);
  writeln;
  if (Bissexto(DATA1)) then
    writeln('O ano da data informada e bissexto')
  else
    writeln('O ano da data informada nao e bissexto');
  writeln;
  write('Tecle algo para continuar...');
  TECLA := readkey;
  clrscr;
  writeln('Teste de controle de datas');
  writeln('--------------------------');
  writeln;
  write('Entre uma data no formato DD/MM/AAAA .......: '); 
  Entra_Dt(DATA1);
  writeln;
  write('Valor da data em DJ (dia juliano) ..........: ', Juliano(DATA1):1:0);
  writeln;
  write('Informe o numero de dias que deseja adicionar a data: '); readln(N);
  writeln;
  DIAS := Juliano(DATA1) + N;
  writeln('A proxima data equivale a: ', Dt_Cal(DIAS));
  writeln;
  writeln;
  write('Informe um Dia Juliano no formato 9999999 ..: '); 
  Entra_Dj(DIAS);
  writeln;
  writeln('O DJ informado equivale a data ', Dt_Cal(DIAS));
  writeln;
  write('Tecle algo para encerrar.');
  TECLA := readkey;
end.
