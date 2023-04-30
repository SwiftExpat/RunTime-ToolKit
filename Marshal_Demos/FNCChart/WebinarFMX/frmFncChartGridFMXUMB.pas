unit frmFncChartGridFMXUMB;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, frmFncChartGridFMXU, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.SERTTK.DT.Marshal;

type
  TfrmFncChartMarshalButton = class(TfrmChartSalesFMX)
    SERTTKMarshal1: TSERTTKMarshal;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFncChartMarshalButton: TfrmFncChartMarshalButton;

implementation

uses FMX.RTTK.PT.FNCChartTool; // only needed if using FNC Chart
{$R *.fmx}

procedure TfrmFncChartMarshalButton.FormResize(Sender: TObject);
begin // align the button to the top right
  SERTTKMarshal1.Position.X := round((self.ClientWidth - SERTTKMarshal1.Width));
end;

end.
