PROGRAM Start(INPUT, OUTPUT);
CONST 
  MAXINT = 32767;
  
PROCEDURE ReadNumber(VAR SourceFile, DistinationFile: TEXT);
VAR
  ToolDigit, Min, Max, SumArith, CountDigits: INTEGER;
  
BEGIN { ReadNumber }
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
          READ(SourceFile, ToolDigit);
          CountDigits := CountDigits + 1;
          IF (ToolDigit >= MAXINT)
          THEN
            ToolDigit := -1
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
END; { ReadNumber }  

BEGIN { Start }
  ReadDigit(INPUT, OUTPUT)
END. { Start }
