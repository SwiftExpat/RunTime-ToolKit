unit dmRttkFMXU;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.DApt,
  FireDAC.Phys.SQLiteWrapper, Datasnap.DBClient, FireDAC.Phys.SQLiteWrapper.Stat;
// {$IF COMPILERVERSION > 33}FireDAC.Phys.SQLiteWrapper.Stat, {$ENDIF}

type
  TdmRTTK = class(TDataModule)
    FDMemTable: TFDMemTable;
    FDConnection: TFDConnection;
    FDQuerySales: TFDQuery;
    FDQuerySalesyear: TIntegerField;
    FDQuerySalesmonth: TIntegerField;
    FDSQLiteFunctionXmY: TFDSQLiteFunction;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    ClientDataSetSalesInfo: TClientDataSet;
    FDQuerySalesIndexed: TFDQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    FDMemTableYear: TIntegerField;
    FDMemTableMonth: TIntegerField;
    FDMemTableAmount: TBCDField;
    ClientDataSetSalesInfoYear: TIntegerField;
    ClientDataSetSalesInfoMonth: TIntegerField;
    ClientDataSetSalesInfoAmount: TBCDField;
    procedure FDConnectionAfterConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure FDSQLiteFunctionXmYCalculate(AFunc: TSQLiteFunctionInstance; AInputs: TSQLiteInputs;
      AOutput: TSQLiteOutput; var AUserData: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ClientDataSetSalesInfoAfterOpen(DataSet: TDataSet);
  private
    FQuery: TFDQuery;
    procedure CopyDataSet;
    procedure DataAppend2019;
    procedure DataAppend2020;
  public
    property MemQuery:TFDQuery read FQuery;
  end;

var
  dmRTTK: TdmRTTK;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

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
  FDConnection.Open();
  CopyDataSet;
  ClientDataSetSalesInfo.CreateDataSet;
  ClientDataSetSalesInfo.Open;
end;

procedure TdmRTTK.DataModuleDestroy(Sender: TObject);
begin
  FDMemTable.DisableControls;
  FDMemTable.Close;
  FDConnection.Close;
end;

{ schema objects from https://www.sqlitetutorial.net/sqlite-window-functions/sqlite-window-frame/ }
procedure TdmRTTK.FDConnectionAfterConnect(Sender: TObject);
begin
  FDConnection.ExecSQL
    ('CREATE TABLE SalesInfo (year INT NOT NULL, month INT NOT NULL, amount NUMERIC(10,2), PRIMARY KEY(year,month));');
  FDConnection.ExecSQL
    ('INSERT INTO SalesInfo(year,month,amount) VALUES(2018,1,100), (2018,2,120), (2018,3,120), (2018,4,110), (2018,5,130), (2018,6,140), (2018,7,150), (2018,8,120), (2018,9,110), (2018,10,150),(2018,11,170), (2018,12,200);');
{$IF COMPILERVERSION > 32}
  FDConnection.ExecSQL
    ('CREATE VIEW [Sales running total] as SELECT month, amount, SUM(amount) OVER (ORDER BY month) RunningTotal FROM SalesInfo;');
  FDConnection.ExecSQL
    ('CREATE VIEW [Sales_moving_average] as SELECT month, amount, AVG(amount) OVER (ORDER BY month ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING ) SalesMovingAverage FROM SalesInfo;');
{$ENDIF}
end;

procedure TdmRTTK.FDSQLiteFunctionXmYCalculate(AFunc: TSQLiteFunctionInstance; AInputs: TSQLiteInputs;
  AOutput: TSQLiteOutput; var AUserData: TObject);
begin
  AOutput.AsInteger := AInputs[0].AsInteger * AInputs[1].AsInteger;
end;

end.
