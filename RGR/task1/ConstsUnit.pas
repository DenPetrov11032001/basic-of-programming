UNIT ConstsUnit;
{ unit for static, const data }
INTERFACE
  TYPE 
    Tree = ^NodeType;
    NodeType = RECORD
                 Word: STRING;
                 Count: INTEGER;
                 OverflowCount: BOOLEAN;
                 LLink, RLink: Tree
               END; 
    Str50 = STRING[50];           
  CONST
    UpperCase: SET OF CHAR = ['A' .. 'Z', 'À' .. 'ß', '¨'];
    LowerCase: SET OF CHAR = ['a' .. 'z', 'à' .. 'ÿ', '¸'];
    CorrectChars: SET OF CHAR = UpperCase + LowerCase; 
    Zero = 0;
    One = 1;
    CodeToUpper = 32;
    CodeForRuELow = 168;
    CodeForRuEUpp = 184;
    CodeForRuENorm = 229;
    MaxLeafs = 10000;
    OverflowCountStr = 'Overflow count this word';
END.  

