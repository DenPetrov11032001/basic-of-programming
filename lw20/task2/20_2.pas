PROGRAM XPrint(INPUT, OUTPUT);
CONST
  MINCOORD = 0;
  MAXCOORD = 25;
  LENROW = 250;
  COUNTSYMBOLS = 10;  
TYPE
  ArrayCoords = ARRAY[1..LENROW] OF MINCOORD..MAXCOORD;
VAR
  ArrayFirstRow, ArraySecondRow, ArrayThirdRow, ArrayFourthRow, ArrayFifthRow: ArrayCoords;
  Coordinate, IndexFirst, IndexSecond, IndexThird, IndexFourth, IndexFifth, Symbol,
  MinBorder, MaxBorder, CountUserSymbols: INTEGER;
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

PROCEDURE FillArray(VAR ArrayFirstRow, ArraySecondRow, ArrayThirdRow, ArrayFourthRow,
                        ArrayFifthRow: ArrayCoords; VAR Coordinate, IndexFirst,
                        IndexSecond, IndexThird, IndexFourth, IndexFifth: INTEGER);
BEGIN{FillArray}
  CASE Coordinate OF
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
      END 
  END
END;{FillArray}                        
    
PROCEDURE PrintRow(VAR ArrayRow: ArrayCoords; VAR MinBorder, MaxBorder, CountUserSymbols: INTEGER);     
VAR
  I, J, K: INTEGER;
BEGIN{PrintRow}
  FOR I := 1 TO CountUserSymbols
  DO
    BEGIN   
      K := 1;     
      FOR J := MinBorder TO MaxBorder
      DO
        BEGIN
          IF (J = ArrayRow[K]) 
          THEN 
            BEGIN
              WRITE('X');
              K := K + 1
            END
          ELSE
            WRITE(' ')
        END;
    END;
  WRITELN  
END;{PrintRow}                         
 
BEGIN{XPrint}
 WHILE NOT EOF(INPUT)
 DO
   BEGIN
     CountUserSymbols := 0;
     InitIndexes(IndexFirst, IndexSecond, IndexThird, IndexFourth, IndexFifth);
     FOR Symbol := 1 TO COUNTSYMBOLS
     DO
       BEGIN
         WHILE NOT EOLN(INPUT)
         DO
           BEGIN
             READ(INPUT, Coordinate);
             IF NOT EOLN(INPUT)
             THEN
               BEGIN
                 READ(INPUT, Ch);
                 IF NOT EOLN(INPUT)
                 THEN
                   READ(INPUT, Ch)
               END;
             FillArray(ArrayFirstRow, ArraySecondRow, ArrayThirdRow, ArrayFourthRow,
                        ArrayFifthRow, Coordinate, IndexFirst, IndexSecond,
                        IndexThird, IndexFourth, IndexFifth);          
           END;
         IF NOT EOF(INPUT)
         THEN
           BEGIN
             CountUserSymbols := CountUserSymbols + 1;    
             READLN(INPUT)
           END;                       
       END;       
     MinBorder := 1;
     MaxBorder := 5;        
     PrintRow(ArrayFirstRow, MinBorder, MaxBorder, CountUserSymbols);
     
     MinBorder := 6;
     MaxBorder := 10;       
     PrintRow(ArraySecondRow, MinBorder, MaxBorder, CountUserSymbols);
     
     MinBorder := 11;
     MaxBorder := 15;     
     PrintRow(ArrayThirdRow, MinBorder, MaxBorder, CountUserSymbols); 
     
     MinBorder := 16;
     MaxBorder := 20;    
     PrintRow(ArrayFourthRow, MinBorder, MaxBorder, CountUserSymbols);
     
     MinBorder := 21;
     MaxBorder := 25;    
     PrintRow(ArrayFifthRow, MinBorder, MaxBorder, CountUserSymbols);  
     
     ClearArray(ArrayFirstRow, IndexFirst);
     ClearArray(ArraySecondRow, IndexSecond); 
     ClearArray(ArrayThirdRow, IndexThird); 
     ClearArray(ArrayFourthRow, IndexFourth); 
     ClearArray(ArrayFifthRow, IndexFifth);
     InitIndexes(IndexFirst, IndexSecond, IndexThird, IndexFourth, IndexFifth);   
   END    
END.{XPrint}