PROGRAM Start(INPUT, OUTPUT);
VAR
  ToolDigit, Min, Max, SumArith, CountDigits: INTEGER;
  IntDataFile: TEXT;
  IsOverflow: BOOLEAN;

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

BEGIN { Start }
  Min := 0;
  Max := 0;
  ToolDigit := 0;
  SumArith := 0;
  CountDigits := 0;
  WHILE (NOT EOF(INPUT)) AND (NOT IsOverflow)
  DO
    BEGIN
      WHILE NOT EOLN(INPUT) AND (ToolDigit <> -1) 
      DO
        BEGIN
          CreateIntDataFile(IntDataFile);
          ReadNumber(IntDataFile, ToolDigit);
          IsOverflow := (ToolDigit = -1) OR (SumArith > (MAXINT - ToolDigit));
          CountDigits := CountDigits + 1;
          IF (IsOverflow)
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