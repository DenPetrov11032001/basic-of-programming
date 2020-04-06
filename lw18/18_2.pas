PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
  MaxScore = 100;
  MinScore = 0;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 0 .. NumberOfScores;
  Student: 0 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER; 
  Ch: CHAR;  
  NameStudentFile: TEXT; 
  IsOverflow: BOOLEAN; 
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 0;
 IsOverflow := FALSE;
  WHILE (Student < ClassSize) AND (NOT IsOverflow)
  DO 
    BEGIN
      WRITELN(OUTPUT, 'Enter the student''s grade soname and number');
      REWRITE(NameStudentFile);
      READ(INPUT, Ch);
      IF Ch = ' '
      THEN
        BEGIN
          WHILE NOT EOLN(INPUT) AND (Ch = ' ')
          DO
            READ(INPUT, Ch);
          WRITE(NameStudentFile, Ch)
        END
      ELSE
        WRITE(NameStudentFile, Ch);
      WHILE (NOT EOLN(INPUT)) AND (Ch <> ' ')
      DO
        BEGIN
          READ(INPUT, Ch);
          IF Ch <> ' '
          THEN
            WRITE(NameStudentFile, Ch)
        END;
      TotalScore := 0;
      WhichScore := 0;
      WHILE (WhichScore < ClassSize)  AND (NOT IsOverflow)
      DO
        BEGIN
          IF NOT EOLN(INPUT)
          THEN
            READ(NextScore);
          IsOverflow := (NextScore < MinScore) OR (NextScore > MaxScore);
          IF NOT IsOverflow
          THEN
            BEGIN
              TotalScore := TotalScore + NextScore;
              WhichScore := WhichScore + 1
            END
        END;
      READLN(INPUT);
      IF NOT IsOverflow
      THEN
        BEGIN
          TotalScore := TotalScore * 10;
          Ave := TotalScore DIV NumberOfScores;
          WRITE(OUTPUT, 'Average rating of the ');
          RESET(NameStudentFile);
          WHILE NOT EOLN(NameStudentFile)
          DO
            BEGIN
              READ(NameStudentFile, Ch);
              WRITE(OUTPUT, Ch)
            END;
          IF Ave MOD 10 >= 5
          THEN
            WRITELN(OUTPUT, ': is ', Ave DIV 10 + 1)  
          ELSE
            WRITELN(OUTPUT, ': is ', Ave DIV 10);
          ClassTotal := ClassTotal + TotalScore;
          Student := Student + 1
        END;
    END;
  WRITELN;  
  IF IsOverflow
  THEN
    WRITELN(OUTPUT, 'NOT CORRECT DATA')
  ELSE
    BEGIN  
      WRITELN(OUTPUT, 'Class average:');
      ClassTotal := ClassTotal DIV ((ClassSize - 1) * NumberOfScores);
      WRITELN(OUTPUT, ClassTotal DIV 10, '.',  ClassTotal MOD 10:1)
  END;
END.  {AverageScore}
