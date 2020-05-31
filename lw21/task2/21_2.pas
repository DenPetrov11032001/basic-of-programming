PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
TYPE
  LengthStr = 1 .. Len;
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
  SieveChars = SET OF ' ' .. 'Z';
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  SieveCorrectChars: SieveChars;
  SieveUsedChars: SieveChars;

PROCEDURE InitializeSieve(VAR Sieve: SieveChars);
BEGIN  {InitializeChiper}
  Sieve := [' ', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
            'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
                    'X', 'Y', 'Z']
END;  {InitializeSieve}

PROCEDURE InitializeCode(VAR Code: Chiper; VAR SieveUsedChars: SieveChars);
VAR 
  Ch1, Ch2: CHAR;
  ChiperFile: TEXT;
BEGIN
  ASSIGN(ChiperFile, 'Chiper.txt');
  RESET(ChiperFile);
  WHILE NOT EOF(ChiperFile)
  DO
    BEGIN
      WHILE NOT EOLN(ChiperFile)
      DO
        BEGIN
          READ(ChiperFile, Ch1);
          IF (Ch1 IN SieveCorrectChars) AND (NOT EOLN(ChiperFile))
          THEN
            BEGIN
              READ(ChiperFile, Ch2);
              READ(ChiperFile, Ch2);
              Code[Ch1] := Ch2;
              SieveUsedChars := SieveUsedChars + [Ch1]   
            END
        END;
      READLN(ChiperFile)
    END
END;
 
PROCEDURE Encode(VAR Msg: Str; VAR Code: Chiper; VAR LenUserStr: INTEGER);
VAR
  Index: LengthStr;
BEGIN  {Encode}
  FOR Index := 1 TO LenUserStr
  DO
    BEGIN
      IF (Msg[Index] IN SieveCorrectChars) AND (Msg[Index] IN SieveUsedChars) 
      THEN
        WRITE(OUTPUT, Code[Msg[Index]])
      ELSE
        WRITE(OUTPUT, Msg[Index])
    END;
  WRITELN
END;  {Encode}
 
BEGIN  {Encryption} 
  InitializeSieve(SieveCorrectChars);
  InitializeCode(Code, SieveUsedChars);
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      I := 0;
      WHILE NOT EOLN(INPUT) AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(INPUT, Msg[I]);
          WRITE(OUTPUT, Msg[I])
        END;
      READLN(INPUT);
      WRITELN(OUTPUT);
      Encode(Msg, Code, I)   
    END 
END.  {Encryption}