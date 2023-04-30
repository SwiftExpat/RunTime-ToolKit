unit frmFncChartGridFMXUAI;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, frmFncChartGridFMXU,
  FMX.SERTTK.DT.Marshal;

type
  TfrmFmxChartAppInspector = class(TfrmChartSalesFMX)
    SERTTKAppInspectorFMX1: TSERTTKAppInspectorFMX;
  private
    { Private declarations }
  public
    procedure SpiderLegendClick(Sender: TObject); override;
  end;

var
  frmFmxChartAppInspector: TfrmFmxChartAppInspector;

implementation

uses
  FMX.SERTTK.Marshal,   // necessary to implement the click event in case you close the window
  FMX.RTTK.PT.FNCChartTool; // only needed if using FNC Chart
{$R *.fmx}
{ TfrmFmxChartAppInspector }

procedure TfrmFmxChartAppInspector.SpiderLegendClick(Sender: TObject);
begin
  TSERTTKMarshalAPI.ShowMarshal;   //in case you closed the Marshal window
end;

end.
