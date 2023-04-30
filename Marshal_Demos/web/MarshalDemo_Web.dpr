program MarshalDemo_Web;

uses
  Vcl.Forms,
  WEBLib.Forms,
  frmMarshalDemoU in 'frmMarshalDemoU.pas' {frmMarshalDemo: TWebForm} {*.html},
  dmMarshalDemoU in 'dmMarshalDemoU.pas' {dmMarshalDemo: TWebDataModule},
  frameMarshalDemoTopU in 'frameMarshalDemoTopU.pas' {frameMarshalDemoTopLevel: TFrame},
  frameMarshalDemoSubU in 'frameMarshalDemoSubU.pas' {FrameMarshalSubFrame: TFrame},
  frmMarshalExerciseU in 'frmMarshalExerciseU.pas' {frmMarshalExercise: TWebForm} {*.html},
  frameMarshalDemoCardBlogRefU in 'frameMarshalDemoCardBlogRefU.pas' {frmCardBlogRef: TFrame},
  frameMarshalDemoCardBlogVideoU in 'frameMarshalDemoCardBlogVideoU.pas' {frmCardBlogVideo: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmMarshalDemo, dmMarshalDemo);
  Application.CreateForm(TfrmMarshalExercise, frmMarshalExercise);
  Application.Run;
end.
