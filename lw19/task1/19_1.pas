PROGRAM Prime(INPUT, OUTPUT);
CONST
  MIN = 2;
  MAX = 100;
VAR
  Sieve: SET OF MIN..MAX;
  UserMax, UserMin, MainNumber, NextNumber: INTEGER;

BEGIN { Prime }
  WRITE('Введите минимум (простое число): ');
  READLN(UserMin);
  WRITE('Введите максимум: ');
  READLN(UserMax);
  WRITELN;  
  IF (UserMin >= MIN) AND (UserMax <= MAX) AND (UserMin <= UserMax)
  THEN
    BEGIN
      WRITE('Простые числа в диапазоне от ', UserMin, ' до ', UserMax, ' будут: ');
      Sieve := [UserMin..UserMax];
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
    WRITELN('Данные введены некорректно')     
END. { Prime } 