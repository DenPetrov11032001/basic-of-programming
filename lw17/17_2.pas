PROGRAM SeventeenTwo(INPUT, OUTPUT);
VAR
  Number: INTEGER;

PROCEDURE ReadDigit(VAR SourceFile: TEXT; VAR Digit: INTEGER);
VAR 
  Ch: CHAR;
  
BEGIN { ReadDigit }
  IF NOT EOLN(SourceFile)
  THEN
    READ(SourceFile, Ch);  
  Digit := -1;  
  IF (Ch = '0') THEN Digit := 0;
  IF (Ch = '1') THEN Digit := 1;
  IF (Ch = '2') THEN Digit := 2;
  IF (Ch = '3') THEN Digit := 3;
  IF (Ch = '4') THEN Digit := 4;
  IF (Ch = '5') THEN Digit := 5;
  IF (Ch = '6') THEN Digit := 6;
  IF (Ch = '7') THEN Digit := 7;
  IF (Ch = '8') THEN Digit := 8;
  IF (Ch = '9') THEN Digit := 9
END; { ReadDigit }

PROCEDURE ReadNumber(VAR SourceFile: TEXT; VAR Number: INTEGER);
VAR
  Digit: INTEGER;
  IsOverflow: BOOLEAN;
  
BEGIN { ReadNumber }
  Digit := 0;
  IsOverflow := FALSE;
  WHILE (NOT EOLN(SourceFile)) AND (NOT IsOverflow)
  DO
    BEGIN
      ReadDigit(SourceFile, Digit);
      IF ((Number >= 3276) AND (Digit > 7))
      THEN
        IsOverflow := TRUE;
      IF (Digit <> -1) AND (NOT IsOverflow)
      THEN
        Number := Number * 10 + Digit;
      IF IsOverflow THEN BREAK   
    END;
  IF IsOverflow
  THEN
    Number := -1  
END; { ReadNumber }  

BEGIN { SeventeenTwo }
  ReadNumber(INPUT, Number);
  IF (Number = -1)
  THEN
    WRITELN(OUTPUT, 'OVERFLOW DATA')
  ELSE  
    WRITELN(OUTPUT, Number)
END. { SeventeenTwo }