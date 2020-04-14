PROGRAM SortDate(INPUT, OUTPUT);
USES DateUnit;
VAR
  Copying: BOOLEAN;
  D, VarDate: Date;
  TFile, DateFile: FileOfDate;
  FInput: TEXT;
 
BEGIN{SortDate}
  ASSIGN(DateFile, 'DF.TXT');
  ASSIGN(TFile, 'TF.TXT');
  ASSIGN(FInput, 'FI.TXT');
  REWRITE(DateFile);
  RESET(FInput);
  ReadDate(FInput, VarDate);
  READLN(FInput);
  WRITE(DateFile, VarDate);
  RESET(DateFile);
  WHILE NOT EOF(FInput)
  DO
    {ѕоместить новую дату в DateFile в соответствующее место}
    BEGIN
      RESET(DateFile);
      ReadDate(FInput,D);
      READLN(FInput);
      IF (D.Mo <> NoMonth)
      THEN
        BEGIN                
          {копируем элементы меньшие,чем D из DateFile в TFile}
          REWRITE(TFile);
          Copying := TRUE;
          WHILE NOT EOF(DateFile) AND Copying
          DO
            BEGIN
              READ(DateFile, VarDate);
              IF Less(VarDate, D)
              THEN
                WRITE(TFile, VarDate)
              ELSE
                Copying := FALSE
            END
        END;
      {копируем D в TFile}
      WRITE(TFile, D);
      {копируем остаток DateFile в TFile}
      IF NOT Copying
      THEN
        WRITE(TFile, VarDate);
      WHILE NOT EOF(DateFile)
      DO
        BEGIN
          READ(DateFile, VarDate);
          WRITE(TFile, VarDate)
        END;
      {копируем TFile в DateFile}
      REWRITE(DateFile);
      RESET(TFile);
      WHILE NOT EOF(TFile)
      DO
        BEGIN
          READ(TFiLe, VarDate);
          WRITE(DateFile, VarDate)
        END
    END;
  { опируем DateFile в OUTPUT}
  RESET(DateFile);
  CopyOut(DateFile)
END.{SortDate}
