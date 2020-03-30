PROGRAM SeventeenOne(INPUT, OUTPUT);
VAR
  Data: TEXT;
  Digit: INTEGER;
  
PROCEDURE ConvertToIntFile(VAR F, DistinationFile: TEXT);
VAR
  Ch: CHAR;
BEGIN { ConvertToIntFile }
  REWRITE(DistinationFile);
  WHILE NOT EOLN(F)
  DO
    BEGIN
       READ(F, Ch);
       IF (Ch = '1') OR (Ch = '2') OR (Ch = '3') OR (Ch = '4') OR (Ch = '5') 
       OR (Ch = '6') OR (Ch = '7') OR (Ch = '8') OR (Ch = '9')
       THEN
         WRITELN(DistinationFile, Ch)
    END
END; { ConvertToIntFile }
  
PROCEDURE ReadDigits(VAR F: TEXT; VAR D: INTEGER);
VAR
  MiddleDigit: INTEGER;
BEGIN { ReadDigit }
  D := 0;
  RESET(F);
  WHILE NOT EOF(F)
  DO
    BEGIN
      WHILE NOT EOLN(F)
      DO
        BEGIN
          READ(F, MiddleDigit);
          D := D + MiddleDigit
        END;
      READLN(F)
    END;
  WRITELN(OUTPUT, D)
END; { ReadDigit }  

BEGIN { SeventeenOne }
  ConvertToIntFile(INPUT, Data);
  ReadDigits(Data, Digit)
END. { SeventeenOne }
