PROGRAM XPrint(INPUT, OUTPUT);
CONST
  MIN = 0;
  MAX = 25;
  LENROW = 250;
  COUNTSYMBOLS = 10;  
TYPE
  Sieve = SET OF MIN..MAX;
  ArrayCoords = ARRAY[0..LENROW] OF MIN..MAX;
VAR
  ArrayFirstRow, ArraySecondRow, ArrayThirdRow, ArrayFourthRow, ArrayFifthRow: ArrayCoords;
  Coordinate, IndexFirst, IndexSecond, IndexThird, IndexFourth, IndexFifth, CountUserSymbols: INTEGER;
  UserSieve: Sieve;
  Ch: CHAR;                              

PROCEDURE InitIndexes(VAR IndexFirst, IndexSecond, IndexThird, IndexFourth,
                           IndexFifth: INTEGER);
BEGIN{InitIndexes}
  IndexFirst := 1;
  IndexSecond := 1;
  IndexThird := 1;
  IndexFourth := 1;
  IndexFifth := 1
END;{InitIndexes} 

PROCEDURE ClearArray(VAR ArrayRow: ArrayCoords; VAR IndexLast: INTEGER);
VAR
  I: INTEGER;
BEGIN{ClearArray}
  FOR I := 1 TO IndexLast
  DO
    ArrayRow[I] := 0
END;{ClearArray}

PROCEDURE PickUpSymbol(VAR Ch: CHAR; VAR SourceSieve: Sieve);
BEGIN{PickUpSymbol}
  CASE Ch OF
    'A': SourceSieve := [3, 7, 9, 11, 15, 16, 17, 18, 19, 20, 21, 25];
    'B': SourceSieve := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 20, 21, 22, 23, 24];
    'C': SourceSieve := [3, 4, 5, 7, 11, 17, 23, 24, 25];
    'D': SourceSieve := [1, 2, 3, 6, 9, 11, 15, 16, 19, 21, 22, 23];
    'E': SourceSieve := [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21, 22, 23, 24, 25];
    'F': SourceSieve := [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21];
    'G': SourceSieve := [3, 4, 5, 7, 11, 15, 17, 20, 23, 24, 25];
    'H': SourceSieve := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
    'I': SourceSieve := [1, 2, 3, 4, 5, 8, 13, 18, 21, 22, 23, 24, 25];
    'J': SourceSieve := [5, 10, 15, 16, 20, 22, 23, 24, 25];
    'K': SourceSieve := [1, 5, 6, 9, 11, 12, 13, 16, 19, 21, 25];
    'L': SourceSieve := [1, 6, 11, 16, 21, 22, 23, 24, 25]; 
    'M': SourceSieve := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
    'N': SourceSieve := [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];
    'O': SourceSieve := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'P': SourceSieve := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 21];
    'Q': SourceSieve := [2, 3, 4, 6, 10, 11, 15, 16, 19, 20, 22, 23, 24, 25];
    'R': SourceSieve := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 18, 21, 24];
    'S': SourceSieve := [2, 3, 4, 5, 6, 12, 13, 14, 20, 21, 22, 23, 24];
    'T': SourceSieve := [1, 2, 3, 4, 5, 8, 13, 18, 23];
    'U': SourceSieve := [1, 5, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'V': SourceSieve := [1, 5, 6, 10, 11, 15, 17, 19, 23];
    'W': SourceSieve := [1, 5, 6, 10, 11, 13, 15, 16, 18, 20, 22, 23, 24]; 
    'X': SourceSieve := [1, 5, 7, 9, 13, 17, 19, 21, 25];
    'Y': SourceSieve := [1, 5, 7, 9, 13, 18, 23];
    'Z': SourceSieve := [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25]
  END  
END;{PickUpSymbol}                        

PROCEDURE FillArray(VAR ArrayFirstRow, ArraySecondRow, ArrayThirdRow, ArrayFourthRow,
                        ArrayFifthRow: ArrayCoords; VAR IndexFirst, IndexSecond, 
                        IndexThird, IndexFourth, IndexFifth: INTEGER; Coordinate: INTEGER);
BEGIN{FillArray}
  CASE Coordinate OF
    0:
      BEGIN
        ArrayFirstRow[IndexFirst] := Coordinate;
        IndexFirst := IndexFirst + 1;
        ArraySecondRow[IndexSecond] := Coordinate;
        IndexSecond := IndexSecond + 1;
        ArrayThirdRow[IndexThird] := Coordinate;
        IndexThird := IndexThird + 1;
        ArrayFourthRow[IndexFourth] := Coordinate;
        IndexFourth := IndexFourth + 1;
        ArrayFifthRow[IndexFifth] := Coordinate;
        IndexFifth := IndexFifth + 1
      END;
    1..5: 
      BEGIN
        ArrayFirstRow[IndexFirst] := Coordinate;
        IndexFirst := IndexFirst + 1
      END;  
    6..10: 
      BEGIN
        ArraySecondRow[IndexSecond] := Coordinate;
        IndexSecond := IndexSecond + 1
      END;  
    11..15: 
      BEGIN
        ArrayThirdRow[IndexThird] := Coordinate;
        IndexThird := IndexThird + 1
      END;  
    16..20: 
      BEGIN
        ArrayFourthRow[IndexFourth] := Coordinate;
        IndexFourth := IndexFourth + 1
      END;  
    21..25: 
      BEGIN
        ArrayFifthRow[IndexFifth] := Coordinate;
        IndexFifth := IndexFifth + 1
      END; 
  END;
END;{FillArray}                        
    
PROCEDURE PrintRow(VAR ArrayRow: ArrayCoords; MinBorder, MaxBorder, CountUserSymbols: INTEGER);     
VAR
  I, J, K: INTEGER;
  FinishSymbol: BOOLEAN;
BEGIN{PrintRow}
  K := 1;
  FOR I := 1 TO CountUserSymbols
  DO
    BEGIN 
      FinishSymbol := FALSE;
      FOR J := MinBorder TO MaxBorder
      DO
        BEGIN
          IF ArrayRow[K] = 0
          THEN
            BEGIN
              FinishSymbol := TRUE;
              K := K + 1
            END;  
          IF (J = ArrayRow[K]) AND (FinishSymbol = FALSE)  
          THEN 
            BEGIN
              WRITE('X');
              K := K + 1
            END
          ELSE  
            WRITE(' ');
          IF (J = MaxBorder) AND (ArrayRow[K] = 0 )
          THEN
            K := K + 1   
        END; 
      WRITE(' ')    
    END;
  WRITELN  
END;{PrintRow}                         
 
BEGIN{XPrint}
  WHILE NOT EOF     
  DO
    BEGIN
      InitIndexes(IndexFirst, IndexSecond, IndexThird, IndexFourth, IndexFifth);
      FOR CountUserSymbols := 1 TO COUNTSYMBOLS
      DO
        BEGIN
          IF NOT EOF AND NOT EOLN
          THEN
            BEGIN
              READ(Ch);
              IF Ch <> ' '
              THEN
                BEGIN
                  PickUpSymbol(Ch, UserSieve);
                  FOR Coordinate := 1 TO MAX
                  DO
                    BEGIN
                      IF Coordinate IN UserSieve
                      THEN
                        FillArray(ArrayFirstRow, ArraySecondRow, ArrayThirdRow, 
                                  ArrayFourthRow, ArrayFifthRow, IndexFirst, IndexSecond, 
                                  IndexThird, IndexFourth, IndexFifth, Coordinate)                           
                    END;
                  FillArray(ArrayFirstRow, ArraySecondRow, ArrayThirdRow, 
                                  ArrayFourthRow, ArrayFifthRow, IndexFirst, IndexSecond, 
                                  IndexThird, IndexFourth, IndexFifth, 0)                               
                END                
            END; 
          IF EOF 
          THEN 
            BREAK;
          IF EOLN AND NOT EOF
          THEN
            READLN     
        END;
             
      PrintRow(ArrayFirstRow, 1, 5, CountUserSymbols);    
      PrintRow(ArraySecondRow, 6, 10, CountUserSymbols);  
      PrintRow(ArrayThirdRow, 11, 15, CountUserSymbols);   
      PrintRow(ArrayFourthRow, 16, 20, CountUserSymbols);   
      PrintRow(ArrayFifthRow, 21, 25, CountUserSymbols);   
     
      ClearArray(ArrayFirstRow, IndexFirst);
      ClearArray(ArraySecondRow, IndexSecond); 
      ClearArray(ArrayThirdRow, IndexThird); 
      ClearArray(ArrayFourthRow, IndexFourth); 
      ClearArray(ArrayFifthRow, IndexFifth);
      InitIndexes(IndexFirst, IndexSecond, IndexThird, IndexFourth, IndexFifth); 
             
      WRITELN  
    END
END.{XPrint}
