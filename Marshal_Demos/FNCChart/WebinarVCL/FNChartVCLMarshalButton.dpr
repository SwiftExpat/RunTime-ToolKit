program FNChartVCLMarshalButton;

uses
  Vcl.Forms,
  frmFncChartGridVCLUMarshalButton in 'frmFncChartGridVCLUMarshalButton.pas' {frmFncChartMarshalButton};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFncChartMarshalButton, frmFncChartMarshalButton);
  Application.Run;
end.
