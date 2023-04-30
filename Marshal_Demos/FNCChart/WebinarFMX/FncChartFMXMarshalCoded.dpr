program FncChartFMXMarshalCoded;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmFncChartGridFMXUCoded in 'frmFncChartGridFMXUCoded.pas' {frmFmxMarshalCodedOptions};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFmxMarshalCodedOptions, frmFmxMarshalCodedOptions);
  Application.Run;
end.
