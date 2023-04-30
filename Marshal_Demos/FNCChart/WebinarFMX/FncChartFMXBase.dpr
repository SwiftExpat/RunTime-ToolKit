program FncChartFMXBase;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmFncChartGridFMXU in 'frmFncChartGridFMXU.pas' {frmChartSalesFMX};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmChartSalesFMX, frmChartSalesFMX);
  Application.Run;
end.
