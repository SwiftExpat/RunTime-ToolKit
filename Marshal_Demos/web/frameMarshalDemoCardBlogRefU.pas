unit frameMarshalDemoCardBlogRefU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WEBLib.Controls, WEBLib.WebCtrls, JS, Web, dmMarshalDemoU;

type
  TfrmCardBlogRef = class(TFrame)
    wdivCardHeader: TWebHTMLDiv;
    wdivCardBody: TWebHTMLDiv;
    wdivCardFooter: TWebHTMLDiv;
  private
    procedure LoadVideoFrame(const AVideo: TDemoVideo);
  public
    procedure LoadVideo(const AVideo: TDemoVideo);
  end;

implementation

{$R *.dfm}

uses frameMarshalDemoCardBlogVideoU;

{ TfrmCardBlogRef }

procedure TfrmCardBlogRef.LoadVideo(const AVideo: TDemoVideo);
begin
  wdivCardHeader.html.Clear;
  wdivCardHeader.html.Add(AVideo.Title);
  wdivCardFooter.html.Clear;
  wdivCardFooter.html.Add(AVideo.Description);
  wdivCardBody.html.Clear;
  LoadVideoFrame(AVideo);
end;

procedure TfrmCardBlogRef.LoadVideoFrame(const AVideo: TDemoVideo);
var
  FBlogVideo: TfrmCardBlogVideo;
begin
  try
    FBlogVideo := TfrmCardBlogVideo.Create(self);
    FBlogVideo.Align := alClient;
    FBlogVideo.Parent := wdivCardBody;
    FBlogVideo.ElementClassName := 'ratio ratio-16x9';
    FBlogVideo.ElementPosition := epRelative;
    FBlogVideo.HeightStyle := ssAuto;
    FBlogVideo.WidthStyle := ssAuto;
    FBlogVideo.LoadFromForm;
    FBlogVideo.LoadVideo(AVideo);
  Except
    on E: Exception do // handle exception types
      Console.log(E.Message);
    else // handle everything else
      Console.log(String(JS.JSExceptValue));
  End;

end;

end.
