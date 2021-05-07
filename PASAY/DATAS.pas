unit DATAS;

  interface

    function CDIA(DT : string) : string;
    function CMES(DT : string) : string;
    function CANO(DT : string) : string;
    function NDIA(DT : string) : word;
    function NMES(DT : string) : word;
    function NANO(DT : string) : word;
    function BISSEXTO(DT : string) : boolean;
    function DT_ANSI(DT : string) : string;
    function JULIANO(DT : string) : real;
    function DT_CAL(DJ : real) : string;
    function DS_ABR(DT : string) : string;
    function DS_EXT(DT : string) : string;
    function DS_NUM(DT : string) : byte;
    procedure ENTRA_DJ(var DJ : real);
    procedure ENTRA_DT(var DT : string);

  implementation

    uses Crt;

    function CDIA(DT : string) : string;
    var
      CD : string;
    begin
      CD := DT;
      delete(CD, 3,10);
      CDIA := CD;
    end;

   function CMES(DT : string) : string;
   var
     CM : string;
   begin
     CM := DT;
     delete(CM, 1, 3);
     delete(CM, 3, 7);
     CMES := CM;
   end;

   function CANO(DT : string) : string;
   var
     CA : string;
   begin
     CA := DT;
     delete(CA, 1, 6);
     CANO := CA;
   end;

   function NDIA(DT : string) : word;
   var
     CODIGO : integer;
     DIA : word;
   begin
     val(CDIA(DT), DIA, CODIGO);
     NDIA := DIA;
   end;

   function NMES(DT : string) : word;
   var
     CODIGO : integer;
     MES : word;
   begin
     val(CMES(DT), MES, CODIGO);
     NMES := MES;
   end;

   function NANO(DT : string) : word;
   var
     CODIGO : integer;
     ANO : word;
   begin
     val(CANO(DT), ANO, CODIGO);
     NANO := ANO;
   end;

   function BISSEXTO(DT : string) : boolean;
   begin
     if (NANO(DT) mod 4 <> 0) then
       BISSEXTO := false
     else
       if (NANO(DT) mod 100 = 0) then
         if (NANO(DT) mod 400 = 0) then
           BISSEXTO := true
         else
           BISSEXTO := false
       else
         BISSEXTO := true
   end;

   function DT_ANSI(DT : string) : string;
   begin
     DT_ANSI := CANO(DT) + CMES(DT) + CDIA(DT);
   end;

   function DT_VALIDA(DT : string) : boolean;
   begin
     DT_VALIDA := true;
     if (CDIA(DT) < '01') or (CDIA(DT) > '31') then
       DT_VALIDA := false;
     if (CMES(DT) < '01') or (CMES(DT) > '12') then
       DT_VALIDA := false;
     if (CANO(DT) < '0001') or (NANO(DT) > 9999) then
       DT_VALIDA := false;
     if (bissexto(DT) = false) and (CMES(DT) = '02') and
       (CDIA(DT) > '28') then
       DT_VALIDA := false;
     if (bissexto(DT) = true) and (CMES(DT) = '02') and
       (CDIA(DT) > '29') then
       DT_VALIDA := false;
     if (CMES(DT) = '04') and (CDIA(DT) > '30') then
       DT_VALIDA := false;
     if (CMES(DT) = '06') and (CDIA(DT) > '30') then
       DT_VALIDA := false;
     if (CMES(DT) = '09') and (CDIA(DT) > '30') then
       DT_VALIDA := false;
     if (CMES(DT) = '11') and (CDIA(DT) > '30') then
       DT_VALIDA := false;
     if (DT_ANSI(DT) > DT_ANSI('04/10/1582')) and
       (DT_ANSI(DT) < DT_ANSI('15/10/1582')) then
       DT_VALIDA := false;
   end;

   function DJ_VALIDA(DJ : real) : boolean;
   begin
     DJ_VALIDA := true;
     if (DJ < 1721424) or (DJ > 5373484) then
       DJ_VALIDA := false;
   end;

   function JULIANO(DT : string) : real;
   var
     DIA, MES, ANO, A, B, C, D, E, F : real;
     CODIGO : integer;
   begin
     val(CDIA(DT), DIA, CODIGO);
     val(CMES(DT), MES, CODIGO);
     val(CANO(DT), ANO, CODIGO);
     if (MES < 3) then
       begin
         ANO := ANO - 1;
         MES := MES + 12;
       end;
     if (DT_ANSI(DT) >= DT_ANSI('15/10/1582')) then
       begin
         A := int(ANO / 100);
         B := int(A / 4);
         C := 2 - A + B;
       end
     else
       C := 0;
     D := int(365.25 * (ANO + 4716));
     E := int(30.6001 * (MES + 1));
     F := D + E + DIA + 0.5 + C - 1524.5;
     JULIANO := int(F);
   end;

   function DT_CAL(DJ : real) : string;
   var
     A, B, C, D, E, F, G, H, I, J, K : real;
     DIA, MES, ANO : string;
     X, CODIGO : integer;
   begin
     A := DJ;
     if (A > 2299160) then
       begin
         B := int((A - 1867216.25) / 36524.25);
         C := A + 1 + B - int(B / 4);
       end
     else
       C := A;
     D := C + 1524;
     E := int((D - 122.1) / 365.25);
     F := int(E * 365.25);
     G := int((D - F) / 30.6001);
     H := D - F - int(G * 30.6001);
     if (G < 14) then
       I := G - 1
     else
       I := G - 13;
     if (I > 2) then
       J := E - 4716
     else
       J := E - 4715;
     if (J > 0) then
       K := J
     else
       K := abs(J + 1);
     str(int(H):1:0, DIA);
     str(int(I):1:0, MES);
     str(int(K):1:0, ANO);
     if (length(DIA) = 1) then
       insert('0', DIA, 1);
     if (length(MES) = 1) then
       insert('0', MES, 1);
     if (length(ANO) < 4) then
       begin
         val(ANO, X, CODIGO);
         X := X + 10000;
         str(X, ANO);
         delete(ANO, 1, 1);
       end;
     DT_CAL := DIA + '/' + MES + '/' + ANO;
   end;

   function DS_ABR(DT : string) : string;
   var
     A : real;
     B : byte;
   begin
     A := juliano(DT);
     B := (trunc(A) + 2) mod 7;
     case B of
       0 : DS_ABR := 'Sab';
       1 : DS_ABR := 'Dom';
       2 : DS_ABR := 'Seg';
       3 : DS_ABR := 'Ter';
       4 : DS_ABR := 'Qua';
       5 : DS_ABR := 'Qui';
       6 : DS_ABR := 'Sex';
     end;
   end;

   function DS_EXT(DT : string) : string;
   var
     A : real;
     B : byte;
   begin
     A := juliano(DT);
     B := (trunc(A) + 2) mod 7;
     case B of
       0 : DS_EXT := 'Sabado';
       1 : DS_EXT := 'Domingo';
       2 : DS_EXT := 'Segunda-feira';
       3 : DS_EXT := 'Terca-feira';
       4 : DS_EXT := 'Quarta-feira';
       5 : DS_EXT := 'Quinta-feira';
       6 : DS_EXT := 'Sexta-feira';
     end;
   end;

   function DS_NUM(DT : string) : byte;
   var
     A : real;
   begin
     A := juliano(DT);
     DS_NUM := (trunc(A) + 2) mod 7;
   end;

   procedure ENTRA_DJ(var DJ : real);
   var
     LINHA, COLUNA : byte;
   begin
     LINHA := wherey;
     COLUNA := wherex;
     repeat
       gotoxy(COLUNA, LINHA);
       clreol;
       readln(DJ);
     until (dj_valida(DJ));
   end;

   procedure ENTRA_DT(var DT : string);
   var
     LINHA, COLUNA : byte;
   begin
     LINHA := wherey;
     COLUNA := wherex;
     repeat
       gotoxy(COLUNA, LINHA);
       clreol;
       readln(DT);
     until (dt_valida(DT));
  end;

end.





