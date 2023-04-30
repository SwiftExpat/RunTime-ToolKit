program RTTK.VCL_21;

uses
  Vcl.Forms,
  frmRttkVCLU in 'frmRttkVCLU.pas' {frmRTTKVCL},
  dmRttkVCLU in 'dmRttkVCLU.pas' {dmRTTK: TDataModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRTTKVCL, frmRTTKVCL);
  Application.CreateForm(TdmRTTK, dmRTTK);
  Application.Run;
end.
