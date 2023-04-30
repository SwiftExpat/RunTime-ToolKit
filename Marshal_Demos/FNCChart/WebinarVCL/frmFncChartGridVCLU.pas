unit frmFncChartGridVCLU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.TMSFNCTypes, Vcl.TMSFNCUtils, Vcl.TMSFNCGraphics, Vcl.TMSFNCGraphicsTypes,
  Vcl.TMSFNCGridCell, Vcl.TMSFNCGridOptions, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Vcl.TMSFNCCustomControl, Vcl.TMSFNCCustomScrollControl,
  Vcl.TMSFNCGridData, Vcl.TMSFNCCustomGrid, Vcl.TMSFNCGrid, Vcl.TMSFNCChart, Vcl.ExtCtrls, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.TMSFNCChartDatabaseAdapter, Vcl.TMSFNCCustomComponent,
  Vcl.TMSFNCGridDatabaseAdapter;

type
  TfrmChartSalesVCL = class(TForm)
    GridPanel1: TGridPanel;
    TMSFNCGrid1: TTMSFNCGrid;
    FDConnection: TFDConnection;
    dsSalesBarChart: TDataSource;
    dsSalesGrid: TDataSource;
    dsSalesSpider: TDataSource;
    fdqSalesChart: TFDQuery;
    FDMemTableSalesGrid: TFDMemTable;
    TMSFNCGridDatabaseAdapter1: TTMSFNCGridDatabaseAdapter;
    chartDBAdaptStackedBar: TTMSFNCChartDatabaseAdapter;
    fdqSalesChartMonth: TIntegerField;
    fdqSalesChartmdisp: TStringField;
    fdqSalesChartSA2018: TBCDField;
    fdqSalesChartSA2019: TBCDField;
    fdqSalesChartSA2020: TBCDField;
    TMSFNCBarChart1: TTMSFNCBarChart;
    TMSFNCStackedAreaChart1: TTMSFNCStackedAreaChart;
    chartDBAdaptStackedArea: TTMSFNCChartDatabaseAdapter;
    fdqSalesLines: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    BCDField3: TBCDField;
    dsSalesLines: TDataSource;
    TMSFNCSpiderChart1: TTMSFNCSpiderChart;
    chartDBAdaptSpider: TTMSFNCChartDatabaseAdapter;
    fdqSalesSpider: TFDQuery;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    BCDField4: TBCDField;
    BCDField5: TBCDField;
    BCDField6: TBCDField;
    tmrUpdateChart: TTimer;
    procedure FDConnectionAfterConnect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCStackedAreaChart1LegendItemClick(Sender: TObject; AIndex: Integer);
    procedure chartDBAdaptStackedAreaFieldsToSeries(Sender: TObject; AFields: TFields; ASeries: TTMSFNCChartSerie);
    procedure chartDBAdaptSpiderFieldsToPoint(Sender: TObject; AFields: TFields; ASeries: TTMSFNCChartSerie;
      APoint: TTMSFNCChartPoint);
    procedure chartDBAdaptSpiderFieldsToSeries(Sender: TObject; AFields: TFields; ASeries: TTMSFNCChartSerie);
    procedure TMSFNCSpiderChart1LegendItemClick(Sender: TObject; AIndex: Integer);
    procedure TMSFNCBarChart1LegendItemClick(Sender: TObject; AIndex: Integer);
  private
    FQuery: TFDQuery;
    /// <summary>
    /// Runs ETL process to populate the chart data
    /// </summary>
    procedure ChartDataETL;
    /// <summary>
    /// Updates the dataset with random amounts for the year
    /// </summary>
    procedure DataAppend(AYear, ABaseAmount: Integer);
    /// <summary>
    /// Sets tag data for VCL object to be seen in Object Plus
    /// </summary>
    procedure UpdateTagData;
    /// <summary>
    /// Sets Grid column size
    /// </summary>
    procedure UpdateGridColumns;
  public
    procedure SpiderLegendClick(Sender: TObject); virtual;
    procedure StackLegendClick(Sender: TObject); virtual;
  end;

var
  frmChartSalesVCL: TfrmChartSalesVCL;

implementation

{$R *.dfm}

procedure TfrmChartSalesVCL.ChartDataETL;
begin
  FQuery := TFDQuery.Create(self);
  FQuery.Connection := FDConnection;
  FQuery.Open('Select * from SalesInfo order by year desc, month');
  DataAppend(2020, 150);
  fdqSalesChart.Active := true; // THIS LINE NEEDS TO MOVE AFTER APPEND 2020
  DataAppend(2019, 125);
  FQuery.Active := false;
  FQuery.Active := true; // re-fectch data with the order by
  FDMemTableSalesGrid.CopyDataSet(FQuery, [coStructure, coRestart, coAppend]);
  fdqSalesSpider.Active := true;
  fdqSalesLines.Active := true;
end;

procedure TfrmChartSalesVCL.DataAppend(AYear, ABaseAmount: Integer);
var
  i: Integer;
begin
  for i := 1 to 12 do
  begin
    FQuery.Append;
    FQuery.Fields[0].AsInteger := AYear;
    FQuery.Fields[1].AsInteger := i;
    FQuery.Fields[2].AsInteger := ABaseAmount + Random(ABaseAmount);
    FQuery.Post;
  end;
end;

procedure TfrmChartSalesVCL.FDConnectionAfterConnect(Sender: TObject);
begin
  FDConnection.ExecSQL('CREATE TABLE Chart_Months (Month INT NOT NULL, DisplayName Varchar);');
  FDConnection.ExecSQL
    ('INSERT INTO Chart_Months(Month, DisplayName) VALUES(1, ''Jan''), (2, ''Feb''), (3, ''Mar''), (4, ''Apr''), (5, ''May''), (6, ''Jun''), (7, ''Jul''), (8, ''Aug''), (9, ''Sept''), (10, ''Oct''), (11, ''Nov''), (12, ''Dec'');');
  FDConnection.ExecSQL
    ('CREATE TABLE SalesInfo (year INT NOT NULL, month INT NOT NULL, amount NUMERIC(10,2), PRIMARY KEY(year,month));');
  FDConnection.ExecSQL
    ('INSERT INTO SalesInfo(year,month,amount) VALUES(2018,1,100), (2018,2,120), (2018,3,120), (2018,4,110), (2018,5,130), (2018,6,140), (2018,7,150), (2018,8,120), (2018,9,110), (2018,10,150),(2018,11,170), (2018,12,200);');
  FDConnection.ExecSQL
    ('CREATE VIEW [Sales running total] as SELECT month, amount, SUM(amount) OVER (ORDER BY month) RunningTotal FROM SalesInfo;');
  FDConnection.ExecSQL
    ('CREATE VIEW [Sales_moving_average] as SELECT month, amount, AVG(amount) OVER (ORDER BY month ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING ) SalesMovingAverage FROM SalesInfo;');
  FDConnection.ExecSQL('CREATE VIEW [Sales_2018] as SELECT month, amount, year FROM SalesInfo where year = 2018;');
  FDConnection.ExecSQL('CREATE VIEW [Sales_2019] as SELECT month, amount, year FROM SalesInfo where year = 2019;');
  FDConnection.ExecSQL('CREATE VIEW [Sales_2020] as SELECT month, amount, year FROM SalesInfo where year = 2020;');
  FDConnection.ExecSQL
    ('CREATE VIEW [Sales_Chart] as  Select m.month, m.displayName as mdisp, s1.amount as SA2018, s2.amount as SA2019, s3.amount as SA2020 from Chart_Months m left join '
    + ' sales_2018 s1 on m.month = s1.month left join sales_2019 s2 on m.month = s2.month left join sales_2020 s3 on m.month = s3.month;');

end;

procedure TfrmChartSalesVCL.FormCreate(Sender: TObject);
begin
  Randomize; // initialize Random
  FDConnection.Open(); // Open the database - SQLite in memory instance
  ChartDataETL; // Run ETL before DataAdapters
  TMSFNCGridDatabaseAdapter1.Active := true;
  chartDBAdaptStackedBar.Active := true;
  chartDBAdaptStackedArea.Active := true;
  chartDBAdaptSpider.Active := true;
  UpdateGridColumns;
  UpdateTagData;
  self.Caption := 'FNC Sales Dashboard by SwiftExpat - ' + self.Caption;
end;

procedure TfrmChartSalesVCL.TMSFNCBarChart1LegendItemClick(Sender: TObject; AIndex: Integer);
begin
  if AIndex = 0 then
  begin
    TMSFNCBarChart1.Title.Text := 'Olive Oil Sales Month By Year';
    TMSFNCBarChart1.Title.TextHorizontalAlignment := TTMSFNCGraphicsTextAlign.gtaCenter;
    TMSFNCBarChart1.Title.Font.Size := 18;
    TMSFNCBarChart1.Legend.Position := TTMSFNCChartLegendPosition.lpTopLeft;
  end
  else if AIndex = 1 then
  begin
    fdqSalesChart.Active := false;
    fdqSalesChart.Active := true;
    dsSalesSpider.Enabled := false; // error for showing chart inspector capabilities
  end;
end;

procedure TfrmChartSalesVCL.TMSFNCSpiderChart1LegendItemClick(Sender: TObject; AIndex: Integer);
begin
  SpiderLegendClick(Sender);
end;

procedure TfrmChartSalesVCL.SpiderLegendClick(Sender: TObject);
begin
  // override this in descending class to launch Marshal
end;

procedure TfrmChartSalesVCL.TMSFNCStackedAreaChart1LegendItemClick(Sender: TObject; AIndex: Integer);
begin
  StackLegendClick(Sender);
end;

procedure TfrmChartSalesVCL.StackLegendClick(Sender: TObject);
begin
  // override this in descending class to launch Marshal
end;

procedure TfrmChartSalesVCL.UpdateGridColumns;
begin
  TMSFNCGrid1.Columns[1].Width := TMSFNCGrid1.Columns[0].Width;
end;

procedure TfrmChartSalesVCL.UpdateTagData;
const
  Pi = 3.1415;
begin
  TMSFNCBarChart1.Tag := round(Pi * 1000);

  TMSFNCGrid1.DataString := 'You have been Tagged';
  TMSFNCGrid1.DataInteger := round(Pi * 1000);
  TMSFNCGrid1.DataBoolean := true;
  TMSFNCGrid1.DataObject := self;
end;

procedure TfrmChartSalesVCL.chartDBAdaptSpiderFieldsToPoint(Sender: TObject; AFields: TFields;
  ASeries: TTMSFNCChartSerie; APoint: TTMSFNCChartPoint);
begin
  APoint.LegendText := AFields.FieldByName('mdisp').AsString;
end;

procedure TfrmChartSalesVCL.chartDBAdaptSpiderFieldsToSeries(Sender: TObject; AFields: TFields;
  ASeries: TTMSFNCChartSerie);
begin
  ASeries.YGrid.SpiderLegend := true;
  ASeries.YValues.MajorUnitFormat := '%.0m';
  ASeries.YValues.MinorUnitFormat := '%.0m';
  ASeries.YValues.MajorUnit := 50.0;
  ASeries.YValues.MinorUnit := 25.0;
  ASeries.YValues.AutoUnits := false;
  ASeries.AutoYRange := arCommonZeroBased;
  ASeries.Pie.Stacked := true;
  ASeries.Pie.AutoSize := true;
  ASeries.Pie.Size := 150;
  ASeries.Fill.Opacity := 0.5 - (ASeries.Index / 10);
  ASeries.Stroke.Color := ASeries.Fill.Color;
  ASeries.Stroke.Width := 3;
  ASeries.Pie.Margins.Left := 50;
  ASeries.Pie.Margins.Top := 50;
  ASeries.Pie.Margins.Bottom := 50;
  ASeries.Pie.StartAngle := -90;
end;

procedure TfrmChartSalesVCL.chartDBAdaptStackedAreaFieldsToSeries(Sender: TObject; AFields: TFields;
  ASeries: TTMSFNCChartSerie);
begin
  ASeries.Enable3D := true;
  ASeries.Fill.Opacity := 0.5;
  ASeries.Labels.Format := '%.0m';
  ASeries.Labels.Visible := true;
end;

end.
