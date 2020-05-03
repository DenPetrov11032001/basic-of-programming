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
  AllUsedChars: Sieve;
  I: INTEGER;

PROCEDURE InitializeSieve(VAR Sieve: Sieve);
BEGIN  {InitializeChiper}
  Sieve := [' ', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
            'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
                    'X', 'Y', 'Z']
END;  {InitializeSieve}

PROCEDURE Initialize(VAR Code: Chiper);
BEGIN  {Initialize}
  Code[' '] := '@';
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
END;  {Initialize}
 
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
 InitializeSieve(AllUsedChars); 
 Initialize(Code);
 WHILE NOT EOF
 DO
   BEGIN
     I := 0;
     WHILE NOT EOLN AND (I < Len)
     DO
       BEGIN
         I := I + 1;
         READ(Msg[I]);
         WRITE(Msg[I])
       END;
     READLN;
     WRITELN;
     Encode(Msg, Code, I)   
   END 
END.  {Encryption}
