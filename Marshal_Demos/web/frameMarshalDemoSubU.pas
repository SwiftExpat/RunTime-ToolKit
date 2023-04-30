unit frameMarshalDemoSubU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WEBLib.ExtCtrls, WEBLib.ComCtrls, WEBLib.Controls;

type
  TFrameMarshalSubFrame = class(TFrame)
    WebPanel1: TWebPanel;
    WebProgressBar1: TWebProgressBar;
    WebTimer1: TWebTimer;
    procedure WebTimer1Timer(Sender: TObject);
  private
    FPct: integer;
  public
    procedure StartTimer;
  end;

implementation

{$R *.dfm}

procedure TFrameMarshalSubFrame.StartTimer;
begin
  FPct := 1;
  WebTimer1.Enabled := true;
end;

procedure TFrameMarshalSubFrame.WebTimer1Timer(Sender: TObject);
begin
  if FPct >= 94 then
    FPct := 1
  else
    FPct := FPct + 3;
  WebProgressBar1.Position := FPct;
  WebPanel1.Caption := 'PCT is currently ' + FPCT.ToString;
end;

end.
