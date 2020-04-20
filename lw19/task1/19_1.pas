PROGRAM Prime(INPUT, OUTPUT);
CONST
  MIN = 2;
  MAX = 100;
VAR
  Sieve: SET OF MIN..MAX;
  UserMax, MainNumber, NextNumber: INTEGER;

BEGIN { Prime }
  WRITE('������� ��������: ');
  READLN(UserMax);
  WRITELN;  
  IF (MIN <= UserMax) AND (UserMax <= MAX)
  THEN
    BEGIN
      WRITE('������� ����� � ��������� �� ', UserMax, ' �����: ');
      Sieve := [MIN..MAX];
      NextNumber := MIN;
      MainNumber := MIN;
      WHILE MainNumber <= UserMax
      DO
        BEGIN
          WHILE NextNumber <= UserMax
          DO
            BEGIN
              Sieve := Sieve - [NextNumber];
              NextNumber := NextNumber + MainNumber     
            END;
          WRITE(MainNumber, ' ');
          WHILE (NOT(MainNumber IN Sieve)) AND (MainNumber <= UserMax)
          DO
            MainNumber := MainNumber + 1;    
          NextNumber := MainNumber
        END;
      WRITELN(OUTPUT)
    END
  ELSE
    WRITELN('������ ������� �����������')     
END. { Prime } 