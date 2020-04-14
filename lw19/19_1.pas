PROGRAM Prime(INPUT, OUTPUT);
CONST
  MIN = 2;
  MAX = 100;
VAR
  Sieve: SET OF MIN..MAX;
  UserMax, UserMin, I, J: INTEGER;

BEGIN { Prime }
  WRITE('Введите минимум (простое число): ');
  READLN(UserMin);
  WRITE('Введите максимум: ');
  READLN(UserMax);
  WRITELN;  
  IF (UserMin >= MIN) AND (UserMax <= MAX) AND (UserMin <= UserMax)
  THEN
    BEGIN
      Sieve := [UserMin..UserMax];
      J := MIN;
      I := MIN;
      WHILE I <> (UserMax + 1)
      DO
        BEGIN
          J := I + 1;
          WHILE J <> (UserMax + 1)
          DO
            BEGIN
              IF J MOD I = 0
              THEN
                Sieve := Sieve - [J];
              J := J + 1
            END;
          I := I + 1
        END;
      I := UserMin;
      WRITE('Простые числа в диапазоне от ', UserMin, ' до ', UserMax, ' будут: ');
      WHILE I <> (UserMax + 1)
      DO
        BEGIN
          IF I IN Sieve
          THEN
            WRITE(I, ' ');
          I := I + 1
        END
    END
  ELSE
    WRITELN('Данные введены некорректно')     
END. { Prime } 
