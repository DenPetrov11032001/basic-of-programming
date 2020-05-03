PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
TYPE
  LengthStr = 1 .. Len;
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  Ch1, Ch2: CHAR;
  ChiperFile: TEXT;

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
      IF Msg[Index] IN ['A' .. 'Z']
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
END;  {Encode}

 
BEGIN  {Encryption}
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
          IF (Ch1 IN ['A' .. 'Z']) AND (NOT EOLN(ChiperFile))
          THEN
            BEGIN
              READ(ChiperFile, Ch2);
              IF Ch2 = ' '
              THEN
                WHILE (Ch2 = ' ') AND (NOT EOLN(ChiperFile))
                DO
                  READ(ChiperFile, Ch2);
              IF Ch2 IN ['A' .. 'Z']
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