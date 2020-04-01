PROGRAM Start(INPUT, OUTPUT);

PROCEDURE ReadNumber(VAR SourceFile: TEXT; VAR DigitSource: INTEGER);
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
      IF Digit > MAXINT 
      THEN 
        Digit := -1
    END;  
  DigitSource := Digit
END; { ReadNumber }  

PROCEDURE CalculateData(VAR SourceFile, DistinationFile: TEXT);
VAR
  ToolDigit, Min, Max, SumArith, CountDigits: INTEGER;
  
BEGIN { CalculateData }
  Min := 0;
  Max := 0;
  ToolDigit := 0;
  SumArith := 0;
  CountDigits := 0;
  WHILE NOT EOF(SourceFile) 
  DO
    BEGIN
      WHILE NOT EOLN(SourceFile) AND (ToolDigit <> -1) 
      DO
        BEGIN
          ReadNumber(SourceFile, ToolDigit);
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
        READLN(SourceFile)
      ELSE
        BREAK;
    END; 
  IF (ToolDigit = -1)
  THEN
    WRITELN(DistinationFile, 'Not correct input, one of number is more than 32767')
  ELSE
    BEGIN    
      WRITELN(DistinationFile, 'Max = ', Max);
      WRITELN(DistinationFile, 'Min = ', Min);
      SumArith := (SumArith) DIV (CountDigits);
      WRITELN(DistinationFile, 'SumArith = ', SumArith); 
    END 
END; { CalculateData }  

BEGIN { Start }
  CalculateData(INPUT, OUTPUT)
END. { Start }
