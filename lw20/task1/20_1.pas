PROGRAM XPrint(INPUT, OUTPUT);
CONST
  MIN = 1;
  MAX = 25;
TYPE
  Sieve = SET OF MIN..MAX;
VAR
  UserSieve: Sieve;
  Ch: CHAR;      
  
PROCEDURE PickUpSymbol(VAR Ch: CHAR; VAR SourceSieve: Sieve);
BEGIN{PickUpSymbol}
  CASE Ch OF
    'A': SourceSieve := [3, 7, 9, 11, 15, 16, 17, 18, 19, 20, 21, 25];
    'B': SourceSieve := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 20, 21, 22, 23, 24];
    'C': SourceSieve := [3, 4, 5, 7, 11, 17, 23, 24, 25];
    'D': SourceSieve := [1, 2, 3, 6, 9, 11, 15, 16, 19, 21, 22, 23];
    'E': SourceSieve := [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21, 22, 23, 24, 25];
    'F': SourceSieve := [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21];
    'G': SourceSieve := [3, 4, 5, 7, 11, 15, 17, 20, 23, 24, 25];
    'H': SourceSieve := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
    'I': SourceSieve := [1, 2, 3, 4, 5, 8, 13, 18, 21, 22, 23, 24, 25];
    'J': SourceSieve := [5, 10, 15, 16, 20, 22, 23, 24, 25];
    'K': SourceSieve := [1, 5, 6, 9, 11, 12, 13, 16, 19, 21, 25];
    'L': SourceSieve := [1, 6, 11, 16, 21, 22, 23, 24, 25]; 
    'M': SourceSieve := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
    'N': SourceSieve := [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];
    'O': SourceSieve := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'P': SourceSieve := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 21];
    'Q': SourceSieve := [2, 3, 4, 6, 10, 11, 15, 16, 19, 20, 22, 23, 24, 25];
    'R': SourceSieve := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 18, 21, 24];
    'S': SourceSieve := [2, 3, 4, 5, 6, 12, 13, 14, 20, 21, 22, 23, 24];
    'T': SourceSieve := [1, 2, 3, 4, 5, 8, 13, 18, 23];
    'U': SourceSieve := [1, 5, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'V': SourceSieve := [1, 5, 6, 10, 11, 15, 17, 19, 23];
    'W': SourceSieve := [1, 5, 6, 10, 11, 13, 15, 16, 18, 20, 22, 23, 24]; 
    'X': SourceSieve := [1, 5, 7, 9, 13, 17, 19, 21, 25];
    'Y': SourceSieve := [1, 5, 7, 9, 13, 18, 23];
    'Z': SourceSieve := [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25];
    ELSE
      WRITELN('Введен некорректный символ.')
  END  
END;{PickUpSymbol}          
    
PROCEDURE PrintSymbol(VAR SourceSieve: Sieve);     
VAR
  I: INTEGER;
BEGIN{PrintSymbol}
  IF SourceSieve <> []
  THEN
    BEGIN           
      FOR I := MIN TO MAX
      DO
        BEGIN
          IF I IN SourceSieve 
          THEN 
            WRITE('X')
          ELSE
            WRITE(' ');
          IF I MOD 5 = 0
          THEN
            WRITELN
        END 
    END 
  ELSE
    WRITELN             
END;{PrintSymbol}
 
BEGIN{XPrint}
 WRITELN('Набор корректных символов - английская раскладка в верхнем регистре');
 WRITE('Введите символ: ');
 READLN(Ch);
 WRITELN;
 UserSieve := [];
 PickUpSymbol(Ch, UserSieve);       
 PrintSymbol(UserSieve)
END.{XPrint}
