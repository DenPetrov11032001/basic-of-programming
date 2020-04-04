PROGRAM SeventeenTwo(INPUT, OUTPUT);
VAR
  IntDataFile: TEXT;
  Ch: CHAR;
  Sum: INTEGER;

PROCEDURE ReadNumber(VAR SourceFile: TEXT; VAR Sum: INTEGER);
VAR
  Digit: INTEGER;
  IsOverflow: BOOLEAN;
  
BEGIN { ReadNumber }
  RESET(IntDataFile);
  Digit := 0;
  IsOverflow := FALSE;
  WHILE (NOT EOLN(SourceFile)) AND (NOT IsOverflow)
  DO
    BEGIN
      READ(SourceFile, Digit);    
      IsOverflow := (MAXINT DIV 10 < Sum) OR ((MAXINT DIV 10 = Sum) 
                      AND (MAXINT MOD 10 < Digit));
      IF NOT IsOverflow
      THEN
        Sum := Sum + Digit
    END;
  IF IsOverflow
  THEN
    Sum := -1  
END; { ReadNumber }  

BEGIN { SeventeenTwo }
  REWRITE(IntDataFile);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      IF (Ch = '0') OR (Ch = '1') OR (Ch = '2') OR (Ch = '3') OR (Ch = '4') OR (Ch = '5') 
      OR (Ch = '6') OR (Ch = '7') OR (Ch = '8') OR (Ch = '9')
      THEN
        WRITE(IntDataFile, Ch)
      ELSE
        BREAK
    END;
  ReadNumber(IntDataFile, Sum);
  IF (Sum = -1)
  THEN
    WRITELN(OUTPUT, 'OVERFLOW DATA')
  ELSE  
    WRITELN(OUTPUT, Sum)
END. { SeventeenTwo }