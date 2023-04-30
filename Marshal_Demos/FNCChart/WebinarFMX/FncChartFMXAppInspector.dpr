program FncChartFMXAppInspector;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmFncChartGridFMXUAI in 'frmFncChartGridFMXUAI.pas' {frmFmxChartAppInspector};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFmxChartAppInspector, frmFmxChartAppInspector);
  Application.Run;
end.
