PROGRAM Start(INPUT, OUTPUT);
VAR
  ToolDigit, Min, Max, SumArith, CountDigits: INTEGER;
  IntDataFile: TEXT;

PROCEDURE CreateIntDataFile(VAR IntDataFile: TEXT);
VAR
  Ch: CHAR;
BEGIN { CreateIntDataFile }
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
  RESET(IntDataFile)
END; { CreateIntDataFile }

PROCEDURE ReadNumber(VAR SourceFile: TEXT; VAR DigitSource: INTEGER);
VAR
  MiddleDigit: INTEGER;
  Ch: CHAR;
  
BEGIN { ReadNumber }
  RESET(SourceFile);
  DigitSource := 0;
  MiddleDigit := 0;
  WHILE (NOT EOLN(SourceFile)) AND (DigitSource <> -1)
  DO
    BEGIN
      READ(SourceFile, MiddleDigit); 
      IF (MiddleDigit >= MAXINT) AND (DigitSource > 0) 
      THEN 
        DigitSource := -1
      ELSE
        DigitSource := DigitSource + MiddleDigit;
      IF DigitSource > MAXINT 
      THEN 
        DigitSource := -1
    END
END; { ReadNumber }  

BEGIN { Start }
  Min := 0;
  Max := 0;
  ToolDigit := 0;
  SumArith := 0;
  CountDigits := 0;
  WHILE NOT EOF(INPUT) 
  DO
    BEGIN
      WHILE NOT EOLN(INPUT) AND (ToolDigit <> -1) 
      DO
        BEGIN
          CreateIntDataFile(IntDataFile);
          ReadNumber(IntDataFile, ToolDigit);
          CountDigits := CountDigits + 1;
          IF (ToolDigit = -1)
          THEN
            BREAK
          ELSE
            BEGIN
              SumArith := SumArith + ToolDigit;
              IF ToolDigit > Max
              THEN
                Max := ToolDigit;
              IF ToolDigit < Min
              THEN
                Min := ToolDigit
            END
        END;
      IF (ToolDigit <> -1) 
      THEN
        READLN(INPUT)
      ELSE
        BREAK
    END; 
  IF (ToolDigit = -1)
  THEN
    WRITELN(OUTPUT, 'Not correct input, one of number is more than 32767')
  ELSE
    BEGIN    
      WRITELN(OUTPUT, 'Max = ', Max);
      WRITELN(OUTPUT, 'Min = ', Min);
      SumArith := (SumArith) DIV (CountDigits);
      WRITELN(OUTPUT, 'SumArith = ', SumArith) 
    END 
END. { Start }
