unit frameMarshalDemoTopU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, frameMarshalDemoSubu,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, WEBLib.StdCtrls, WEBLib.ExtCtrls, WEBLib.Controls;

type
  TframeMarshalDemoTopLevel = class(TFrame)
    WebLabel1: TWebLabel;
    WebLinkLabel1: TWebLinkLabel;
    WebPanel1: TWebPanel;
  private
    FFrame: TFrameMarshalSubFrame;
    procedure SubFrameCreate;
  public
    procedure SetupLabels;
  end;

implementation

{$R *.dfm}
{ TframeMarshalDemoTopLevel }

procedure TframeMarshalDemoTopLevel.SetupLabels;
begin
  WebLabel1.Caption := 'what now';
  WebLinkLabel1.Caption := 'TWebLinkLabel';
  SubFrameCreate;

end;

procedure TframeMarshalDemoTopLevel.SubFrameCreate;
begin
  FFrame := TFrameMarshalSubFrame.Create(self);
  FFrame.Align := alClient;
  FFrame.Parent := WebPanel1;
  FFrame.LoadFromForm;
  FFrame.StartTimer;
end;

end.
