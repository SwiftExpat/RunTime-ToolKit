program RTTK_FMX_20;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmRttkFMXU in 'frmRttkFMXU.pas' {frmRTTKFMX},
  dmRttkFMXU in 'dmRttkFMXU.pas' {dmRTTK: TDataModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.CreateForm(TfrmRTTKFMX, frmRTTKFMX);
  Application.CreateForm(TdmRTTK, dmRTTK);
  Application.Run;
end.
