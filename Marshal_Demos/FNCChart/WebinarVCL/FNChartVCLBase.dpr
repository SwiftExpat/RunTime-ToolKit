program FNChartVCLBase;

uses
  Vcl.Forms,
  frmFncChartGridVCLU in 'frmFncChartGridVCLU.pas' {frmChartSalesVCL};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmChartSalesVCL, frmChartSalesVCL);
  Application.Run;
end.
