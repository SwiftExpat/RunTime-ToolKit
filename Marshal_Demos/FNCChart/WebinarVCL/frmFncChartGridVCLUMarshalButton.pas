unit frmFncChartGridVCLUMarshalButton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frmFncChartGridVCLU, VCL.SERTTK.DT.Marshal;

type
  TfrmFncChartMarshalButton = class(TfrmChartSalesVCL)
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

{$R *.dfm}

uses Vcl.RTTK.PT.FNCChartTool; // only needed if using FNC Chart

procedure TfrmFncChartMarshalButton.FormResize(Sender: TObject);
begin    // align the button to the top right
  SERTTKMarshal1.Left := round( (self.Width ) - (SERTTKMarshal1.Width*self.ScaleFactor));
end;

end.
