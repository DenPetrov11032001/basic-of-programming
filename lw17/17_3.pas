PROGRAM Start(INPUT, OUTPUT);
VAR
  ToolDigit, Min, Max, SumArith, CountDigits: INTEGER;
  IsOverflow: BOOLEAN;

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
  Number := 0;
  Digit := 0;
  IsOverflow := FALSE;
  WHILE (NOT EOLN(SourceFile)) AND (NOT IsOverflow)
  DO
    BEGIN
      ReadDigit(SourceFile, Digit);  
      IF (Number >= 3276) AND (Digit > 7)
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

BEGIN { Start }
  Min := 0;
  Max := 0;
  SumArith := 0;
  CountDigits := 0;
  ToolDigit := 0;
  IsOverflow := FALSE;
  WHILE (NOT EOF(INPUT)) AND (NOT IsOverflow)
  DO
    BEGIN
      WHILE NOT EOLN(INPUT)
      DO
        BEGIN
          ReadNumber(INPUT, ToolDigit);
          IsOverflow := ((ToolDigit = -1) OR (ToolDigit < 0));
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
      IF (IsOverflow)
      THEN
        BREAK
      ELSE  
        READLN(INPUT)
    END; 
  IF (IsOverflow)
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