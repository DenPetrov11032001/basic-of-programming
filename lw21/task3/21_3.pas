PROGRAM Decryption(INPUT, OUTPUT);
CONST
  Len = 20;
TYPE
  LengthStr = 1 .. Len;
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
  SieveChars = SET OF 'A' .. 'Z';
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  SieveCorrectChars: SieveChars;
  SieveUsedChars: SieveChars;

PROCEDURE InitializeSieve(VAR Sieve: SieveChars);
BEGIN  {InitializeChiper}
  Sieve := ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
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
          WHILE (Ch1 = ' ') AND (NOT EOLN(ChiperFile))
          DO
            READ(ChiperFile, Ch1);
          IF (Ch1 IN SieveCorrectChars) AND (NOT EOLN(ChiperFile))
          THEN
            BEGIN
              READ(ChiperFile, Ch2);
              IF Ch2 = ' '
              THEN
                WHILE (Ch2 = ' ') AND (NOT EOLN(ChiperFile))
                DO
                  READ(ChiperFile, Ch2);
              IF Ch2 IN SieveCorrectChars
              THEN
                BEGIN 
                  Code[Ch2] := Ch1;
                  SieveUsedChars := SieveUsedChars + [Ch1]   
                END
              ELSE
                BEGIN
                  Code[Ch2] := Ch2;
                  SieveUsedChars := SieveUsedChars + [Ch1]  
                END  
            END
        END;
      READLN(ChiperFile)
    END
END;
 
PROCEDURE Decode(VAR Msg: Str; VAR Code: Chiper; VAR LenUserStr: INTEGER);
VAR
  Index: LengthStr;
BEGIN  {Decode}
  FOR Index := 1 TO LenUserStr
  DO
    BEGIN
      IF (Msg[Index] IN SieveCorrectChars) AND (Msg[Index] IN SieveUsedChars) 
      THEN
        WRITE(OUTPUT, Code[Msg[Index]])
      ELSE
        IF Msg[Index] = ' '
        THEN
          WRITE(OUTPUT, '@')
        ELSE  
          WRITE(OUTPUT, Msg[Index])
    END;
  WRITELN
END;  {Decode}
 
BEGIN  {Decryption} 
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
      Decode(Msg, Code, I)   
    END 
END.  {Decryption}