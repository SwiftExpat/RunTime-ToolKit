unit dmRttkVCLU;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper, FireDAC.DApt, FireDAC.Phys.SQLiteWrapper.Stat, Datasnap.DBClient;
// {$IF COMPILERVERSION > 33}FireDAC.Phys.SQLiteWrapper.Stat, {$ENDIF}

type
  TdmRTTK = class(TDataModule)
    FDConnection: TFDConnection;
    FDMemTable: TFDMemTable;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDSQLiteFunctionXmY: TFDSQLiteFunction;
    FDQuerySales: TFDQuery;
    FDMemTableYear: TIntegerField;
    FDMemTableMonth: TIntegerField;
    FDMemTableAmount: TBCDField;
    ClientDataSetSalesInfo: TClientDataSet;
    ClientDataSetSalesInfoYear: TIntegerField;
    ClientDataSetSalesInfoMonth: TIntegerField;
    ClientDataSetSalesInfoAmount: TBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
    procedure FDSQLiteFunctionXmYCalculate(AFunc: TSQLiteFunctionInstance; AInputs: TSQLiteInputs;
      AOutput: TSQLiteOutput; var AUserData: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ClientDataSetSalesInfoAfterOpen(DataSet: TDataSet);
  strict private
    FStallTime: integer;
    procedure DataAppend2019;
    procedure DataAppend2020;
  private
    FQuery: TFDQuery;
    procedure CopyDataSet;
  public
    procedure StallShutdown(AStallTime: integer);
  end;

var
  dmRTTK: TdmRTTK;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

uses WinAPI.Windows;

procedure TdmRTTK.ClientDataSetSalesInfoAfterOpen(DataSet: TDataSet);
var
  i: integer;
begin
  for i := 1 to 12 do
  begin
    DataSet.Append;
    DataSet.Fields[0].AsInteger := 2021;
    DataSet.Fields[1].AsInteger := i;
    DataSet.Fields[2].AsInteger := i * 175;
    DataSet.Post;
  end;
end;

procedure TdmRTTK.CopyDataSet;
begin
  FQuery := TFDQuery.Create(self);
  FQuery.Connection := FDConnection;
  FQuery.Open('Select * from SalesInfo');
  DataAppend2019;
  FDMemTable.CopyDataSet(FQuery, [coStructure, coRestart, coAppend]);
  DataAppend2020;
end;

procedure TdmRTTK.DataAppend2019;
var
  i: integer;
begin
  for i := 1 to 12 do
  begin
    FQuery.Append;
    FQuery.Fields[0].AsInteger := 2019;
    FQuery.Fields[1].AsInteger := i;
    FQuery.Fields[2].AsInteger := i * 125;
    FQuery.Post;
  end;
end;

procedure TdmRTTK.DataAppend2020;
var
  i: integer;
begin
  for i := 1 to 12 do
  begin
    FQuery.Append;
    FQuery.Fields[0].AsInteger := 2020;
    FQuery.Fields[1].AsInteger := i;
    FQuery.Fields[2].AsInteger := i * 150;
    FQuery.Post;
  end;
end;

procedure TdmRTTK.DataModuleCreate(Sender: TObject);
begin
  FDSQLiteFunctionXmY.Active := true;
  FDConnection.Open();

  CopyDataSet;
  ClientDataSetSalesInfo.CreateDataSet;
  ClientDataSetSalesInfo.Open;
end;

procedure TdmRTTK.DataModuleDestroy(Sender: TObject);
begin
  OutputDebugString('DataModule destroyed');
  ClientDataSetSalesInfo.Close;
  FDMemTable.Close;      //comment to simulate bad shutdown
  FDSQLiteFunctionXmY.Active := false;
  FDConnection.Close;
  { This is to simulate a slow closing database and ensure Deputy continues to poll }
//  if FStallTime > 0 then
//  begin
//    TThread.Sleep(FStallTime);
//    OutputDebugString('Destroy after thread sleep');
//  end;

end;

procedure TdmRTTK.FDConnectionAfterConnect(Sender: TObject);
begin
  FDConnection.ExecSQL
    ('CREATE TABLE SalesInfo (year INT NOT NULL, month INT NOT NULL, amount NUMERIC(10,2), PRIMARY KEY(year,month));');
  FDConnection.ExecSQL
    ('INSERT INTO SalesInfo(year,month,amount) VALUES(2018,1,100), (2018,2,120), (2018,3,120), (2018,4,110), (2018,5,130), (2018,6,140), (2018,7,150), (2018,8,120), (2018,9,110), (2018,10,150),(2018,11,170), (2018,12,200);');
  FDConnection.ExecSQL('CREATE TABLE Multiply_Limit (Multiplier INT NOT NULL);');
  FDConnection.ExecSQL
    ('INSERT INTO Multiply_Limit(Multiplier) VALUES(1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12);');
{$IF COMPILERVERSION > 32}
  FDConnection.ExecSQL
    ('CREATE VIEW [Sales running total] as SELECT month, amount, SUM(amount) OVER (ORDER BY month) RunningTotal FROM SalesInfo;');
  FDConnection.ExecSQL
    ('CREATE VIEW [Sales_moving_average] as SELECT month, amount, AVG(amount) OVER (ORDER BY month ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING ) SalesMovingAverage FROM SalesInfo;');
  FDConnection.ExecSQL
    ('CREATE VIEW [Multiply_Twos] as select Multiplier, XmY( Multiplier, 2) as Twos from Multiply_Limit;');
  FDConnection.ExecSQL
    ('CREATE VIEW [Multiply_Threes] as select Multiplier, XmY( Multiplier, 3) as Threes from Multiply_Limit;');
  FDConnection.ExecSQL
    ('CREATE VIEW [Multiply_Fours] as select Multiplier, XmY( Multiplier, 4) as Fours from Multiply_Limit;');
  FDConnection.ExecSQL
    ('CREATE VIEW [Multiply_Fives] as select Multiplier, XmY( Multiplier, 5) as Fives from Multiply_Limit;');
  FDConnection.ExecSQL
    ('CREATE VIEW [Multiply_Sixes] as select Multiplier, XmY( Multiplier, 6) as Sixes from Multiply_Limit;');
  FDConnection.ExecSQL
    ('CREATE VIEW [Multiply_Sevens] as select Multiplier, XmY( Multiplier, 7) as Sevens from Multiply_Limit;');
  FDConnection.ExecSQL
    ('CREATE VIEW [Multiply_Quiz] as  Select m3.Multiplier, m3.Threes, m7.Sevens from multiply_threes m3 inner join multiply_sevens m7 on m3.Multiplier = m7.Multiplier;');
{$ENDIF}
end;

procedure TdmRTTK.FDSQLiteFunctionXmYCalculate(AFunc: TSQLiteFunctionInstance; AInputs: TSQLiteInputs;
  AOutput: TSQLiteOutput; var AUserData: TObject);
begin
  AOutput.AsInteger := AInputs[0].AsInteger * AInputs[1].AsInteger;
end;

procedure TdmRTTK.StallShutdown(AStallTime: integer);
begin
  FStallTime := AStallTime;
end;

end.
