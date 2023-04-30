unit frmMarshalExerciseU;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls, frameMarshalDemoTopU,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, WEBLib.WebCtrls, WEBLib.ExtCtrls, Vcl.StdCtrls, WEBLib.StdCtrls;

type
  TfrmMarshalExercise = class(TWebForm)
    divTheme: TWebHTMLDiv;
    divBody: TWebScrollBox;
    pnlTop: TWebPanel;
    btnMarshal: TWebButton;
    wdivVideoCards: TWebHTMLDiv;
    wdivNotes: TWebHTMLDiv;
    waNotes: TWebAccordion;
    wdivExercise: TWebHTMLDiv;
    wDivMarshal: TWebHTMLDiv;
    WebTimer1: TWebTimer;
    procedure WebFormCreate(Sender: TObject);
    procedure btnMarshalClick(Sender: TObject);
    procedure WebTimer1Timer(Sender: TObject);
  private
    procedure LoadBlogVideos;
    procedure LoadNotesAccordion;
    procedure LoadDockedMarshal;
    async;
  public
    wpMarshalTools: TWebPanel;
    WebGridPanel1: TWebGridPanel;
    WebHTMLDiv1: TWebHTMLDiv;
    WebHTMLDiv2: TWebHTMLDiv;
    WebHTMLDiv3: TWebHTMLDiv;
    { Public declarations }
  end;

var
  frmMarshalExercise: TfrmMarshalExercise;

implementation

{$R *.dfm}

uses {$IFDEF RTTK}WEBLib.SERTTK.Marshal, {$ENDIF} dmMarshalDemoU, frameMarshalDemoCardBlogRefU;

procedure TfrmMarshalExercise.btnMarshalClick(Sender: TObject);
begin
{$IFDEF RTTK}
  wDivMarshal.visible := false;
  TSERTTKMarshalAPI.ShowMarshal;
{$ENDIF}
end;

procedure TfrmMarshalExercise.LoadNotesAccordion;
const
  li_info = 'class="list-group-item list-group-item-secondary"';
  li_warn = 'class="list-group-item list-group-item-info"';
  li_alert = 'class="list-group-item list-group-item-danger"';
var
  sect, s1: TAccordionSection;
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
    '<p>Marshal provides runtime inspection of the forms, controls and datamodules of this Delphi / TMS Web Core application. </p>');
  AppendContent(0,
    '<ul ><li>Complete the exercises below as hands on learning for Marshal''s debugging abilities for an application.</li>');
  AppendContent(0,
    '<li>Optionally view the videos above to see Marshal in action, but the true purpose is for the learning exercise below.</li>');
  AppendContent(0,
    '<li>Source code  <a href="https://github.com/SwiftExpat/RunTime-ToolKit/tree/main/Samples/web" class="card-link"> on GitHub</a> , to explore how this demo was built.</li>');
  AppendContent(0,
    '<li>Purchase and product information available at <a href="https://swiftexpat.com" class="card-link"> SwiftExpat.com</a> .</li>');
  AppendContent(0, '</ul> <p> Complete the exercises using Marshal docked here to the right --> </p><ul>');
  AppendContent(0,
    '<li>*Marshal is provided as a modal form, available via the <span class="mark">Show Marshal Modal</span> button. You can reposition and resize the modal window.</li>');
  AppendContent(0, '<li>This demo uses a dock so that the modal window does not cover the instructions. </li>');
  AppendContent(0, '<li>Marshal''s goal is to not require extra design area, so a modal window is provided. </li>');
  AppendContent(0, '</ul>');
  BeginContent(1, '<p>2/16/2023 : Beta 4');
  AppendContent(1, '<ul ><li>Seperate into 3 exercises - less scrolling </li>');
  AppendContent(1, '<li>Marshal splash for UI notification</li></ul><p>');
  AppendContent(1, '<p>2/16/2023 : Beta 3');
  AppendContent(1, '<ul ><li>Improve exercise instructions</li>');
  AppendContent(1, '<li>Defect on App tools duplicated on re-show</li></ul><p>');
  AppendContent(1, '<p>2/14/2023 : Beta 2');
  AppendContent(1, '<ul ><li>Fixed session view defect & added exercise</li>');
  AppendContent(1, '<li>Performance improved for session view</li></ul><p>');
  AppendContent(1, '<p>2/12/2023 : Beta 1');
  AppendContent(1, '<ul ><li>Fixed long delay on Marshal display</li>');
  AppendContent(1, '<li>Removed sections from application info for Web Core</li></ul><p>');

  s1 := waNotes.Sections.Insert(1); // add;
  s1.Caption := 'Exercise 1 - Object Plus - Adjust ElementClassName';
  s1.Content := '<ol><p>The videos above are in the vidCards row, use Object Plus to adjust them.</p> ';

  sect := waNotes.Sections.Insert(2); // add;
  sect.Caption := 'Exercise 2 - Marshal Navigation - TDataset Inspection';
  sect.Content :=
    '<ol ><p>The videos above are displayed using bootstrap cards populated from data in a TDataset. </p>';

  sect := waNotes.Sections.Insert(3); // add;
  sect.Caption := 'Exercise 3 - Session Review - using Marshal''s session';
  sect.Content := '<ol >';

  AppendContent(2, '<ol ><li>Navigation - Display Marshal using the blue button at the top left of the page.');
  AppendContent(2, '<ul class="list-group "><li ' + li_info +
    ' ><span class="mark">Structure View</span> contains your applications forms, datamodules and components.</li> ');
  AppendContent(2, '<li ' + li_info +
    ' >The application object is given the first tab and assigned dedicated inspectors. Inspectors are displayed in the client area and assigned by class type.</li></ul> ');
  AppendContent(2, '</li>');
  AppendContent(2,
    '<li>Navigate Datamodule - Use the structure view tree to expand <span class="mark">dmMarshalDemo</span> and click on the <span class="mark">cdsVideos</span> .</li>');

  AppendContent(2, '<ul class="list-group "><li ' + li_info +
    ' ><span class="mark">Object Plus</span> is the default inspector, it allows you to inspect and modify properties and events.</li> ');
  AppendContent(2, '<li ' + li_info +
    ' >A second inspector, <span class="mark">DataSet Grid</span>, is assigned because <span class="mark">cdsVideos</span> is a TDataset.</li></ul> ');
  AppendContent(2, '</li>');
  { dataset }
  AppendContent(2,
    '<li>TDataSet - Inspect <span class="mark">cdsVideos</span> to see the data populating the videos. </li>');
  AppendContent(2, '<ul class="list-group "><li ' + li_info +
    ' >Select the Object Plus <span class="mark"> events </span> tab to notice the <span class="mark">AfterOpen</span> event is assigned to populate the data.</li> ');
  AppendContent(2, '<li ' + li_info +
    ' >Select the <span class="mark">Dataset Grid </span> inspector tab and you see a grid with the data used to populate the cards.</li></ul> ');
  AppendContent(2, '</li>');
  AppendContent(2, '</ol>');
  { card group }
  AppendContent(1, '<li>Form Navigation - Inspect the form to modify the videos displayed above.</li>');
  AppendContent(1, '<ul class="list-group "><li ' + li_info +
    ' >Using the structure view, expand <span class="mark">frmMarshalExercise</span>, expand <span class="mark">divTheme</span>, expand <span class="mark">divBody</span> and select <span class="mark">wdivVideoCards</span>.</li> ');
  AppendContent(1, '<li ' + li_info +
    ' >Inspect the property <span class="mark">ElementClassName</span> , it is set to <span class="mark">row</span> from bootstrap. This is the row for the cards.</li> ');
  AppendContent(1, '<li ' + li_warn +
    ' >The cards are Delphi frames created in a div tag to be the columns. The loop is based on the data in <span class="mark">cdsVideos</span> which will be explored in exercise 2.</li></ul> ');
  AppendContent(1, '</li>');
  { frames }
  AppendContent(1,
    '<li>Row Inspection - Expand <span class="mark">wdivVideoCards</span> in the structure view and you will see the 3 THTMLDiv components that create the columns for the cards and control the width. </li>');
  AppendContent(1, '<ul class="list-group "><li ' + li_info +
    ' >Select the <span class="mark">DivComp0</span> and use Object Plus to inspect the <span class="mark">ElementClassName</span>, it is set to <span class="mark">col-sm-5</span> to control the column width. </li> ');
  AppendContent(1, '<li ' + li_warn +
    ' >Expand the frame to explore how the card is built using a header, body and footer.  Poistion is controlled using <span class="mark">ChildOrder</span> and relative positioning.</li></ul> ');
  AppendContent(1, '</li>');

  { Grid }
  AppendContent(1,
    '<li>Column Fix - The cards are horizontal based on a row with 3 grid columns of different sizes configured on the <span class="mark">DivComp#</span> component using the <span class="mark">ElementClassName</span> setting ex. <span class="mark">col-sm-#</span>. </li>');
  AppendContent(1, '<ul class="list-group "><li ' + li_warn +
    ' >The cards should be equal size, so the total of the columns must equal 12 to fill the row. Adjust the columns using Marshal to see the changes.</li> ');
  AppendContent(1, '<li ' + li_info +
    ' >Select <span class="mark">DivComp0</span> and use Object Plus to modify the <span class="mark">ElementClassName</span> property to <span class="mark">col-sm-4</span>. </li> ');
  AppendContent(1, '<li ' + li_info +
    ' >Select <span class="mark">DivComp2</span> and use Object Plus to modify the <span class="mark">ElementClassName</span> property to <span class="mark">col-sm-4</span>. </li> ');
  AppendContent(1, '<li ' + li_warn +
    ' ><span class="mark">DivComp1</span> is already set to <span class="mark">col-sm-4</span> due to the math applied in the source code.</li></ul> ');
  AppendContent(1, '</ul> </li>');
  AppendContent(1, '</ol>');

  { Review }
  AppendContent(3,
    '<li>Marshal records changes in the session.  View the session using the <span class="mark">Show Session</span> button above the structure View.</li>');
  AppendContent(3, '<ul class="list-group "><li ' + li_info +
    ' >The session contains the application info report and object modification details. Object plus records property modifications in the session.</li> ');
  AppendContent(3, '<li ' + li_info +
    ' >Review the object modification events which capture the <span class="mark">path</span> of the component, the <span class="mark">property</span> changed, <span class="mark">before value</span> and <span class="mark">after value</span>. </li> ');
  AppendContent(3, '<li ' + li_alert + ' >Currently the Web Core implmentation does not support screen capture.</li> ');
  AppendContent(3, '<li ' + li_info +
    ' >Bookmarks allow you to add a comment to the session, click the <span class="mark">Bookmark</span> button and enter: adjust the css class to col-sm-4. </li> ');
  AppendContent(3, '</ul> </li>');
  AppendContent(3, '</ol>');

  s1.Expanded := true; // append the content first before expanding
  waNotes.Sections[0].Expanded := true;
end;

procedure TfrmMarshalExercise.LoadBlogVideos;
var
  fVideoCard: TfrmCardBlogRef;
  i: integer;
  fdiv: TWebHTMLDiv;

begin
  dmMarshalDemo.cdsVideos.first;
  i := 0;
  while not dmMarshalDemo.cdsVideos.EOF do
  begin
    try
      fdiv := TWebHTMLDiv.Create(self);
      fdiv.ChildOrder := i;
      fdiv.Parent := wdivVideoCards;
      fdiv.ElementPosition := epRelative;
      fdiv.HeightStyle := ssAuto;
      fdiv.WidthStyle := ssAuto;
      fdiv.tag := (5 - i);
      fdiv.ElementClassName := 'col-sm-' + fdiv.tag.ToString;
      fdiv.Name := 'DivComp' + i.ToString;
      fVideoCard := TfrmCardBlogRef.Create(self);
      fVideoCard.Align := alClient;
      fVideoCard.Parent := fdiv; // wdivVideoCards;
      fVideoCard.ElementClassName := 'card bg-info';
      fVideoCard.ElementPosition := epRelative;
      fVideoCard.HeightStyle := ssAuto;
      fVideoCard.WidthStyle := ssAuto;
      fVideoCard.LoadFromForm;
      fVideoCard.BeginUpdate;
      fVideoCard.LoadVideo(dmMarshalDemo.CurrentVideo);
      fVideoCard.EndUPdate;

    Except
      on E: Exception do // handle exception types
        Console.log(E.Message);
      else // handle everything else
        Console.log(String(JS.JSExceptValue));
    End;
    dmMarshalDemo.cdsVideos.next;
    inc(i);
  end;

end;

procedure TfrmMarshalExercise.LoadDockedMarshal;
begin
  TSERTTKMarshalAPI.LoadDockedForm(wDivMarshal.ElementID);
end;

procedure TfrmMarshalExercise.WebFormCreate(Sender: TObject);
begin
  LoadBlogVideos;
  LoadNotesAccordion;
  WebTimer1.Enabled := true;
  WebGridPanel1.tag := 23;
end;

procedure TfrmMarshalExercise.WebTimer1Timer(Sender: TObject);
begin
  WebTimer1.Enabled := false;
  LoadDockedMarshal;
end;

end.
