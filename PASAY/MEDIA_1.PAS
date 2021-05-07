program MEDIA_TURMA;
var
  MD1, MD2, MD3, MD4, MD5, MD6, MD7, MD8 : real;
  SOMA, MEDIA : real;
begin
  SOMA := 0;
  readln(MD1, MD2, MD3, MD4, MD5, MD6, MD7, MD8);
  SOMA := MD1 + MD2 + MD3 + MD4 + MD5 + MD6 + MD7 + MD8; 
  MEDIA := SOMA / 8;
  writeln(MEDIA:2:2); 
end.

