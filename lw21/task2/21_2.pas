PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
TYPE
  LengthStr = 1 .. Len;
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
  Sieve = SET OF ' ' .. 'Z';
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  Ch1, Ch2: CHAR;
  AllUsedChars: Sieve;
  ChiperFile: TEXT;

PROCEDURE InitializeSieve(VAR Sieve: Sieve);
BEGIN  {InitializeChiper}
  Sieve := [' ', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
            'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
                    'X', 'Y', 'Z']
END;  {InitializeSieve}

PROCEDURE FillCode(VAR Code: Chiper; VAR Ind, Ch: CHAR);
BEGIN  {InitializeChiper}
  Code[Ind] := Ch
END;  {InitializeChiper}
 
PROCEDURE Encode(VAR Msg: Str; VAR Code: Chiper; VAR LenUserStr: INTEGER);
VAR
  Index: LengthStr;
BEGIN  {Encode}
  FOR Index := 1 TO LenUserStr
  DO
    BEGIN
      IF Msg[Index] IN AllUsedChars
      THEN
        WRITE(OUTPUT, Code[Msg[Index]])
      ELSE
        WRITE(OUTPUT, Msg[Index])
    END;
  WRITELN
END;  {Encode}

 
BEGIN  {Encryption}
  Code[' '] := '#'; 
  InitializeSieve(AllUsedChars);
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
          IF (Ch1 IN AllUsedChars) AND (NOT EOLN(ChiperFile))
          THEN
            BEGIN
              READ(ChiperFile, Ch2);
              IF Ch2 = ' '
              THEN
                WHILE (Ch2 = ' ') AND (NOT EOLN(ChiperFile))
                DO
                  READ(ChiperFile, Ch2);
              IF Ch2 IN AllUsedChars
              THEN    
                FillCode(Code, Ch1, Ch2)
              ELSE
                FillCode(Code, Ch1, Ch1)    
            END
        END;
      READLN(ChiperFile)
    END;   

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