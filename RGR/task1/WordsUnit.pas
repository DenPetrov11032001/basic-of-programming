UNIT WordsUnit;
{ unit for work with words }
INTERFACE
  USES ConstsUnit;
  PROCEDURE ToLowerCase(VAR Ch: CHAR); { transpose all char case to lower }
  PROCEDURE GetWord(VAR FIn: TEXT; VAR Data: Str50); 
  { get correct word from FIn to Data} 
IMPLEMENTATION
  
  PROCEDURE ToLowerCase(VAR Ch: CHAR);
  BEGIN {ToLowerCase}
    IF (Ch IN UpperCase)
    THEN
      Ch := Chr(Ord(Ch) + CodeToUpper);    
    IF ((Ord(Ch) = CodeForRuELow) OR (Ord(Ch) = CodeForRuEUpp))
    THEN
      Ch := Chr(CodeForRuENorm)   
  END; {ToLowerCase}      
    
  PROCEDURE GetWord(VAR FIn: TEXT; VAR Data: Str50); 
  VAR
    Ch: CHAR; 
  BEGIN {GetStatistic}
    Data := '';
    WHILE NOT EOLN(FIn)
    DO
      BEGIN
        READ(FIn, Ch);
        IF (Ch IN CorrectChars)
        THEN
          BEGIN
            ToLowerCase(Ch);
            Data := Data + Ch            
          END
        ELSE
          BREAK      
      END              
  END; {GetStatistic} 
  
END.  

