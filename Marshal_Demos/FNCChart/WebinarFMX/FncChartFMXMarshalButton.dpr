program FncChartFMXMarshalButton;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmFncChartGridFMXUMB in 'frmFncChartGridFMXUMB.pas' {frmFncChartMarshalButton};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFncChartMarshalButton, frmFncChartMarshalButton);
  Application.Run;
end.
