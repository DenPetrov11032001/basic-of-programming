UNIT EntityUnit;
{ unit for entity, in our case is tree }
INTERFACE
  USES ConstsUnit;             
  PROCEDURE InsertIntoTree(VAR Ptr: Tree; Data: Str50; VAR CountLeafs: INTEGER);  { insert data into tree, with sort }
  PROCEDURE PrintTree(VAR Ptr: Tree; VAR FOut: TEXT); { print sort tree into OutputFile } 
  PROCEDURE ClearTree(VAR Ptr: Tree); { clear tree, because delete all leafs } 
IMPLEMENTATION

  PROCEDURE InsertIntoTree(VAR Ptr: Tree; Data: Str50; VAR CountLeafs: INTEGER);
  BEGIN {Insert}
    IF (Ptr = NIL)
    THEN
      BEGIN
        NEW(Ptr);
        Ptr^.Word := Data;
        Ptr^.Count := One;     
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL;
        Ptr^.OverflowCount := FALSE;
        CountLeafs := CountLeafs + One
      END
    ELSE
      IF (Ptr^.Word <> Data)
      THEN
        IF (Ptr^.Word > Data)
        THEN
          InsertIntoTree(Ptr^.LLink, Data, CountLeafs)
        ELSE
          InsertIntoTree(Ptr^.RLink, Data, CountLeafs)
      ELSE
        IF (Ptr^.Count < MAXINT)
        THEN
          Ptr^.Count := Ptr^.Count + One
        ELSE
          Ptr^.OverflowCount := TRUE                    
  END; {Insert}  
  
  PROCEDURE PrintTree(VAR Ptr: Tree; VAR FOut: TEXT);
  BEGIN {PrintTree}
    IF Ptr <> NIL
    THEN
      BEGIN
        PrintTree(Ptr^.LLink, FOut);
        IF (NOT Ptr^.OverflowCount)
        THEN
          WRITELN(FOut, Ptr^.Word, ' ', Ptr^.Count)
        ELSE
          WRITELN(FOut, Ptr^.Word, ' ', OverflowCountStr);  
        PrintTree(Ptr^.RLink, FOut);
      END
  END; {PrintTree}
  
  PROCEDURE ClearTree(VAR Ptr: Tree);
  BEGIN {ClearTree}
    IF Ptr <> NIL
    THEN
      BEGIN
        ClearTree(Ptr^.LLink);
        DISPOSE(Ptr); 
        ClearTree(Ptr^.RLink)
      END
  END; {ClearTree}
        
END.  

