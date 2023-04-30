program FNChartVCLAppInspector;

uses
  Vcl.Forms,
  frmFncChartGridVCLUAppInspector in 'frmFncChartGridVCLUAppInspector.pas' {frmVCLChartAppInspector};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmVCLChartAppInspector, frmVCLChartAppInspector);
  Application.Run;
end.
