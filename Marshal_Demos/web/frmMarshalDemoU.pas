unit frmMarshalDemoU;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, WEBLib.ComCtrls, Vcl.Controls, WEBLib.ExtCtrls, WEBLib.Actions, WEBLib.TreeNodes,
  Vcl.ComCtrls, Vcl.StdCtrls, WEBLib.StdCtrls, Vcl.Forms, frameMarshalDemoTopU, WEBLib.WebCtrls, WEBLib.Rating,
  WEBLib.Lists;

type
  TfrmMarshalDemo = class(TWebForm)
    pnlTop: TWebPanel;
    pcFeatures: TWebPageControl;
    tiFeatures: TWebTabSheet;
    tiRunTimeMemo: TWebTabSheet;
    tiFrames: TWebTabSheet;
    WebElementActionList1: TWebElementActionList;
    lbFeatures: TWebListBox;
    btnMarshal: TWebButton;
    pnlFramesTools: TWebPanel;
    pnlRTMemoTools: TWebPanel;
    btnMemoAdd: TWebButton;
    btnMemoDelete: TWebButton;
    memoRTCompFooter: TWebMemo;
    WebLabel1: TWebLabel;
    wpFrameHost: TWebPanel;
    WebHTMLDiv1: TWebHTMLDiv;
    divTheme: TWebHTMLDiv;
    wdivVideoCards: TWebHTMLDiv;
    divBody: TWebHTMLDiv;
    WebHTMLDiv4: TWebHTMLDiv;
    WebMemo1: TWebMemo;
    WebMemo2: TWebMemo;
    WebHTMLSpan1: TWebHTMLSpan;
    WebHTMLDiv5: TWebHTMLDiv;
    wdivNotes: TWebHTMLDiv;
    waNotes: TWebAccordion;
    WebScrollBox1: TWebScrollBox;
    procedure WebFormCreate(Sender: TObject);
    procedure btnMarshalClick(Sender: TObject);
    procedure btnMemoAddClick(Sender: TObject);
    procedure btnMemoDeleteClick(Sender: TObject);
  private
    FRuntimeMemo: TWebMemo;
    FFrame: TframeMarshalDemoTopLevel;
    procedure LoadFeatureTree;
    procedure LoadYouTubeVideos;
    procedure LoadNotesAccordion;
  public
    { Public declarations }
  end;

var
  frmMarshalDemo: TfrmMarshalDemo;

implementation

uses {$IFDEF RTTK}WEBLib.SERTTK.Marshal, {$ENDIF} dmMarshalDemoU;

{$R *.dfm}

procedure TfrmMarshalDemo.btnMarshalClick(Sender: TObject);
begin
{$IFDEF RTTK}
  TSERTTKMarshalAPI.ShowMarshal;
{$ENDIF}
end;

procedure TfrmMarshalDemo.btnMemoAddClick(Sender: TObject);
var
  s: string;
begin
  FRuntimeMemo := TWebMemo.Create(self);
  FRuntimeMemo.Parent := tiRunTimeMemo;
  FRuntimeMemo.Align := TAlign.alClient;
  for s in memoRTCompFooter.Lines do
    FRuntimeMemo.Lines.Add('Copy of : ' + s);
  btnMemoDelete.Enabled := true;
end;

procedure TfrmMarshalDemo.btnMemoDeleteClick(Sender: TObject);
begin
  if Assigned(FRuntimeMemo) then
    FRuntimeMemo.Free;
  btnMemoDelete.Enabled := false;
end;

procedure TfrmMarshalDemo.LoadFeatureTree;
begin
  lbFeatures.Items.Add('Features');
  dmMarshalDemo.cdsFeatures.first;
  while not dmMarshalDemo.cdsFeatures.EOF do
  begin
    lbFeatures.Items.Add(dmMarshalDemo.cdsFeatures.FieldByName('FeatureName').AsString);
    dmMarshalDemo.cdsFeatures.next;
  end;
end;

procedure TfrmMarshalDemo.LoadNotesAccordion;
const
  li_info = 'class="list-group-item list-group-item-secondary"';
  li_warn = 'class="list-group-item list-group-item-info"';
var
  sect: TAccordionSection;
  procedure AppendContent(const ASectionID: integer; const AContent: string);
  begin
    waNotes.Sections[ASectionID].Content := waNotes.Sections[ASectionID].Content + AContent;
  end;
  procedure BeginContent(const ASectionID: integer; const AContent: string);
  begin
    waNotes.Sections[ASectionID].Content := AContent;
  end;

begin
  BeginContent(0,
    '<p>Marshal provides runtime inspection of the forms, controls and datamodules of this Delphi / TMS Web Core application');
  AppendContent(0, '<br>Use this demo application to learn what Marshal can inspect and modify in an application.');
  AppendContent(0, '<br>The videos above can be used to see Marshal in action, but are also to make the exercise below interesting.');
  BeginContent(1, '<p>2/12/2023 : Beta 1');
  AppendContent(1, '<ul ><li>Fixed long delay on Marshal display</li>');
  AppendContent(1, '<li>Removed sections from application info for Web Core</li></ul><p>');
  sect := waNotes.Sections.Insert(1); // add;
  sect.Caption := 'Exercise 1 - Binding the YouTube Videos to a TDataSet';
  sect.Content :=
    '<p>The videos above are displayed using a bootstrap card group pouplated from data in a TDataset. Frames are used to create cards that display Youtube control and video description.</p>';
  AppendContent(1, '<ol ><li>Display Marshal using the blue button at the top left of the page.');
  AppendContent(1, '<ul class="list-group "><li ' + li_info +
    ' >Structure View contains your applications forms, datamodules and components.</li> ');
  AppendContent(1, '<li ' + li_info + ' >Inspectors are displayed by class type in the client area.</li></ul> ');
  AppendContent(1, '</li>');
  AppendContent(1,
    '<li>Use the structure view tree to expand <span class="mark">dmMarshalDemo</span>  and click on the <span class="mark">cdsVideos</span> .</li>');

  AppendContent(1, '<ul class="list-group "><li ' + li_info +
    ' >Object Plus is the default inspector, it allows you to inspect and modify properties and events.</li> ');
  AppendContent(1, '<li ' + li_info +
    ' >A second inspector, DataSet Grid, is assigned because <span class="mark">cdsVideos</span> is a TDataset.</li></ul> ');
  AppendContent(1, '</li>');
  {dataset}
  AppendContent(1, '<li>Inpect <span class="mark">cdsVideos</span> to see the data populating the videos. </li>');
  AppendContent(1, '<ul class="list-group "><li ' + li_info +
    ' >Select the Object Plus events tab to notice the AfterOpen event is assigned to populate the data.</li> ');
  AppendContent(1, '<li ' + li_info +
    ' >Select the Dataset Grid inspector tab and you see a grid with the data used to populate the cards.</li></ul> ');
  AppendContent(1, '</li>');
  {card group}
  AppendContent(1,
    '<li>Next you will inspect the form UI elements. The videos are displayed using a cardgroup, each card is a frame populated from <span class="mark">cdsVideos</span>. </li>');
  AppendContent(1, '<ul class="list-group "><li ' + li_info +
    ' >Using the structure view, expand <span class="mark">frmMarshalDemo</span>, expand <span class="mark">divTheme</span>, expand <span class="mark">divBody</span> and select <span class="mark">wdivVideoCards</span>.</li> ');
  AppendContent(1, '<li ' + li_info +
    ' >Inspect the property <span class="mark">ElementClassName</span> , it is set to <span class="mark">card-group</span> from bootstrap.</li> ');
  AppendContent(1, '<li ' + li_warn +
    ' >From this point the cardgroup is created using frames and the data from <span class="mark">cdsVideos</span> .</li></ul> ');
  AppendContent(1, '</li>');
  {frames}
  AppendContent(1,
    '<li>Expand <span class="mark">wdivVideoCards</span> in the structure view and you will see the 3 frames that create the cards for the videos. </li>');
  AppendContent(1, '<ul class="list-group "><li ' + li_info +
    ' >Select the first frame and use Object Plus to inspect the <span class="mark">ElementClassName</span>, it is set to <span class="mark">card</span> </li> ');
  AppendContent(1, '<li ' + li_warn +
    ' >TFrame at design time does not have the <span class="mark">ElementClassName</span> property, it is assigned at runtime only. </li> ');
  AppendContent(1, '<li ' + li_warn +
    ' >Expand the frame to reveal <span class="mark">wdivCardRow</span> and then select <span class="mark">wdivVideo</span> .</li></ul> ');
  AppendContent(1, '</li>');

 {Grid}
  AppendContent(1,
    '<li>The video cards are horizontal based on grid columns and rows, inspect the <span class="mark">ElementClassName</span> to reveal the setting is <span class="mark">col-6</span>. </li>');
  AppendContent(1, '<ul class="list-group "><li ' + li_warn +
    ' >The video cards are not responsive, so you might see overlapping text as you execute the following.  This is by design to excercise Marshal.</li> ');
  AppendContent(1, '<li ' + li_info +
    ' >Change the <span class="mark">ElementClassName</span> setting to <span class="mark">col-8</span>, the text is now behind the video because the row overflowed. </li> ');
  AppendContent(1, '<li ' + li_info +
    ' >Change the <span class="mark">ElementClassName</span> setting to <span class="mark">col-5</span>, the text is now visible and a little wider. </li> ');


  AppendContent(1, '</ul> </li>');
  AppendContent(1, '</ol>');
  sect.Expanded := true;
end;

procedure TfrmMarshalDemo.LoadYouTubeVideos;

begin

end;

procedure TfrmMarshalDemo.WebFormCreate(Sender: TObject);
begin
  LoadFeatureTree;
  FFrame := TframeMarshalDemoTopLevel.Create(self);
  FFrame.Align := alClient;
  FFrame.Parent := WebHTMLDiv1;
  FFrame.LoadFromForm;
  try
    // raise Exception.Create('I created this');
    FFrame.SetupLabels;
  Except
    on E: Exception do // handle exception types
      Console.log(E.Message);
    else // handle everything else
      Console.log(String(JS.JSExceptValue));
  End;
  LoadYouTubeVideos;
  WebMemo1.Lines.Clear;
  WebMemo1.Lines.Add('Use this demo to explore Marshal''s features in the TMS Web Core environment.');
  WebMemo1.Lines.Add('Review the videos above, quick 5 min guided explainations, and / or explore at your own pace.');
  pcFeatures.ActivePageIndex := 0;
  LoadNotesAccordion;
end;

end.
