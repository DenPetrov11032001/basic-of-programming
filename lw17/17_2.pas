PROGRAM SeventeenTwo(INPUT, OUTPUT);

PROCEDURE ReadNumber(VAR SourceFile, DistinationFile: TEXT);
VAR
  MiddleDigit, Digit: INTEGER;
  Ch: CHAR;
  MiddleFile: TEXT;
  
BEGIN { ReadNumber }
  REWRITE(MiddleFile);
  WHILE (NOT EOLN(SourceFile)) AND (Ch <> 'E')
  DO
    BEGIN
      READ(SourceFile, Ch);
      IF (Ch = '0') OR (Ch = '1') OR (Ch = '2') OR (Ch = '3') OR (Ch = '4') OR (Ch = '5') 
      OR (Ch = '6') OR (Ch = '7') OR (Ch = '8') OR (Ch = '9')
      THEN
         WRITE(MiddleFile, Ch)
      ELSE
        Ch := 'E'
    END;
  RESET(MiddleFile);
  Digit := 0;
  WHILE (NOT EOLN(MiddleFile)) AND (Digit <> -1)
  DO
    BEGIN
      READ(MiddleFile, MiddleDigit);
      IF (MiddleDigit >= MAXINT) AND (Digit > 0) 
      THEN 
        Digit := -1
      ELSE
        Digit := Digit + MiddleDigit;
      IF Digit > MAXINT THEN Digit := -1
    END;
  WRITELN(DistinationFile, Digit)
END; { ReadNumber }  

BEGIN { SeventeenTwo }
  ReadNumber(INPUT, OUTPUT)
END. { SeventeenTwo }
