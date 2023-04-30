program FNChartVCLMarshalCoded;

uses
  Vcl.Forms,
  frmFncChartGridVCLUCoded in 'frmFncChartGridVCLUCoded.pas' {frmVCLMarshalCodedOptions};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmVCLMarshalCodedOptions, frmVCLMarshalCodedOptions);
  Application.Run;
end.
