UNIT StatisticUnit;
{ unit for work with statistic }
INTERFACE
  USES WordsUnit, EntityUnit, ConstsUnit;
  PROCEDURE GetStatistic(VAR FIn, FOut: TEXT); { calculate statistic from FIn to FOut} 
IMPLEMENTATION

  PROCEDURE GetStatistic(VAR FIn, FOut: TEXT); 
  VAR 
    Data: Str50;
    Root: Tree;
    CountLeafs: INTEGER;
  BEGIN {GetStatistic}
    RESET(FIn);
    REWRITE(FOut);
    Root := NIL;
    CountLeafs := Zero;
    WHILE NOT EOF(FIn)
    DO
      BEGIN
        GetWord(FIn, Data);
        IF (Data <> '')
        THEN
          InsertIntoTree(Root, Data, CountLeafs);                   
        IF (NOT EOF(FIn)) AND (EOLN(FIn))
        THEN
          READLN(FIn);
        IF (CountLeafs >= MaxLeafs)
        THEN
          BREAK  
      END;  
    PrintTree(Root, FOut)
  END; {GetStatistic} 
  
END.  

