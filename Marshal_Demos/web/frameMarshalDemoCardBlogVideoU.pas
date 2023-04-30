unit frameMarshalDemoCardBlogVideoU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WEBLib.Controls, WEBLib.WebCtrls, JS, Web, dmMarshalDemoU;

type
  TfrmCardBlogVideo = class(TFrame)
    WebYoutube1: TWebYoutube;
  private
    procedure SetVideoID(const AVideoID: string);
  public
    procedure LoadVideo(const AVideo: TDemoVideo);
  end;

implementation

{$R *.dfm}
{ TFrame3 }

procedure TfrmCardBlogVideo.LoadVideo(const AVideo: TDemoVideo);
begin
  SetVideoID(AVideo.VideoID);
end;

procedure TfrmCardBlogVideo.SetVideoID(const AVideoID: string);
begin
  WebYoutube1.VideoID := AVideoID;
end;

end.
