unit frmRttkFMXU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl,
  FMX.Objects, FMX.SERTTK.DT.Marshal, System.DateUtils, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo,
  Generics.Collections, frmFramedFMXU, System.Actions, FMX.ActnList, System.Rtti, FMX.Grid.Style, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Grid, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.Grid, frmChildFormFMXU, dmRttkFMXncU;

type
  TStallThread = class(TThread)
  strict private
    FStallTime: integer;
  protected
    procedure Execute; override;
  public
    constructor Create(AStallTime: integer);
  end;

  TLeakChild = class
  strict private
    FLeakDict: TDictionary<string, string>;
  public
    constructor Create;
  end;

  TLeakParent = class
  strict private
    FLeakChild: TLeakChild;
    FLeakList: TObjectList<TLeakChild>;
  public
    constructor Create;
  end;

  TDemoObject = class
  public
    Demostring: string;
  end;

  TfrmRTTKFMX = class(TForm)
    lytTools: TLayout;
    Label1: TLabel;
    Edit1: TEdit;
    tcWorkSpace: TTabControl;
    tiLabel: TTabItem;
    tiIfDef: TTabItem;
    CalloutRectangle1: TCalloutRectangle;
    lblAppHelp: TLabel;
    btnMarshal: TButton;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxGroupFooter1: TListBoxGroupFooter;
    ListBoxGroupFooter2: TListBoxGroupFooter;
    SERTTKMarshal1: TSERTTKMarshal;
    tiRunTimeComp: TTabItem;
    pnlRTCompButtons: TPanel;
    btnAddMemo: TCornerButton;
    btnDeleteMemo: TSpeedButton;
    memoRTCompFooter: TMemo;
    Panel1: TPanel;
    cbLeakObjects: TCheckBox;
    cbStallShutdown: TCheckBox;
    edtShutdownStall: TEdit;
    SERTTKAppInspector1: TSERTTKAppInspectorFMX;
    tiFramed: TTabItem;
    FramedFMX1: TFramedFMX;
    Timer1: TTimer;
    ActionList1: TActionList;
    memoFramedMessage: TMemo;
    tiSalesData: TTabItem;
    BindSourceDB1: TBindSourceDB;
    StringGrid1: TStringGrid;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    btnChildForm: TButton;
    btnNewDM: TButton;
    procedure btnMarshalClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lblAppHelpClick(Sender: TObject);
    procedure btnAddMemoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDeleteMemoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbLeakObjectsChange(Sender: TObject);
    procedure cbStallShutdownChange(Sender: TObject);
    procedure FramedFMX1Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure btnChildFormClick(Sender: TObject);
    procedure btnNewDMClick(Sender: TObject);
  private
    FRuntimeMemo: TMemo;
    FDemoObject: TDemoObject;
    FStallThread: TStallThread;
    FLeakRoot: TLeakParent;
    FChildForm: TfrmChildFormFMX;
    FDMRunTime: TdmAtRuntime;
    procedure TagDataSet;
  public
    { Public declarations }
  end;

var
  frmRTTKFMX: TfrmRTTKFMX;

implementation

{$R *.fmx}

uses
  dmRttkFMXU,
  // {$IFDEF DEBUG}
  FMX.SERTTK.Marshal
  // {$ENDIF}
    ;

procedure TfrmRTTKFMX.btnMarshalClick(Sender: TObject);
begin
{$IFDEF DEBUG}
  TSERTTKMarshalAPI.ShowMarshal;
{$ENDIF}
end;

procedure TfrmRTTKFMX.cbLeakObjectsChange(Sender: TObject);
begin
  memoRTCompFooter.Lines.Add('leaking objects');
  FLeakRoot := TLeakParent.Create;
end;

procedure TfrmRTTKFMX.cbStallShutdownChange(Sender: TObject);
begin
  memoRTCompFooter.Lines.Add('Shutdown Stalled');
  FStallThread := TStallThread.Create(edtShutdownStall.Text.ToInteger);
  FStallThread.Start;
end;

procedure TfrmRTTKFMX.Edit1Change(Sender: TObject);
begin
  // empty method
end;

procedure TfrmRTTKFMX.FormActivate(Sender: TObject);
begin
{$IFNDEF DEBUG}
  btnMarshal.Text := 'Disabled in Release';
  btnMarshal.Enabled := false;
{$ENDIF}
end;

procedure TfrmRTTKFMX.FormCreate(Sender: TObject);
begin
  btnDeleteMemo.Enabled := false;
  tcWorkSpace.ActiveTab := tiLabel;
  TagDataSet;
end;

procedure TfrmRTTKFMX.FormDestroy(Sender: TObject);
begin
  FDemoObject.Free;
  FStallThread.Free;
  // {$IF RTLVersion111}
  // TGPUObjectsPool.Instance.Free;
  // {$ENDIF}
end;

procedure TfrmRTTKFMX.FramedFMX1Button1Click(Sender: TObject);
var
  i: integer;
  c: TComponent;
begin
  memoFramedMessage.Lines.Add('count = ' + FramedFMX1.ComponentCount.ToString);
  memoFramedMessage.Lines.Add('hash ' + FramedFMX1.GetHashCode.ToString);
  for i := 0 to FramedFMX1.ComponentCount - 1 do
  begin
    c := FramedFMX1.Components[i];
    if c.HasParent then
      memoFramedMessage.Lines.Add(c.ClassName + ' parent = ' + c.GetParentComponent.GetHashCode.ToString)
    else if Assigned(Owner) then
      memoFramedMessage.Lines.Add(c.ClassName + ' owner = ' + c.Owner.GetHashCode.ToString)
    else
      memoFramedMessage.Lines.Add(c.ClassName + ' parent = none , owner = none ')
  end;
end;

procedure TfrmRTTKFMX.lblAppHelpClick(Sender: TObject);
begin
  if lblAppHelp.Tag = 0 then
  begin
    lblAppHelp.TagString := DateTimeToStr(Now);
    lblAppHelp.Tag := 1;
  end
  else if (lblAppHelp.Tag = 1) and (SecondsBetween(Now, StrToDateTime(lblAppHelp.TagString)) < 5) then
  begin
    lblAppHelp.TagString := DateTimeToStr(Now);
    lblAppHelp.Tag := 2;
  end
  else if (lblAppHelp.Tag = 2) and (SecondsBetween(Now, StrToDateTime(lblAppHelp.TagString)) < 5) then
  begin
    TSERTTKMarshalAPI.ShowMarshal;
    lblAppHelp.Tag := 0;
    lblAppHelp.TagString := '';
  end
  else
  begin
    lblAppHelp.Tag := 0;
    lblAppHelp.TagString := '';
  end;
end;

procedure TfrmRTTKFMX.TagDataSet;
begin
  Edit1.TagString := 'Tag your it';
  Edit1.TagFloat := 3.1497;
  Edit1.Tag := 43;
  FDemoObject := TDemoObject.Create;
  FDemoObject.Demostring := 'Object of tag string';
  Edit1.TagObject := FDemoObject;
end;

procedure TfrmRTTKFMX.btnChildFormClick(Sender: TObject);
begin
  if FChildForm = nil then
    FChildForm := TfrmChildFormFMX.Create(Application);
  FChildForm.Show;
end;

procedure TfrmRTTKFMX.btnNewDMClick(Sender: TObject);
begin
  if FDMRunTime = nil then
    FDMRunTime := TdmAtRuntime.Create(Application);
end;

procedure TfrmRTTKFMX.btnDeleteMemoClick(Sender: TObject);
begin
  if Assigned(FRuntimeMemo) then
    FRuntimeMemo.Free;
  btnDeleteMemo.Enabled := false;
end;

procedure TfrmRTTKFMX.btnAddMemoClick(Sender: TObject);
var
  s: string;
begin
  FRuntimeMemo := TMemo.Create(self);
  FRuntimeMemo.Parent := tiRunTimeComp;
  FRuntimeMemo.Align := TAlignLayout.Client;
  for s in memoRTCompFooter.Lines do
    FRuntimeMemo.Lines.Add('Copy of : ' + s);
  btnDeleteMemo.Enabled := true;
end;

{ TStallThread }

constructor TStallThread.Create(AStallTime: integer);
begin
  inherited Create(true);
  FStallTime := AStallTime;
end;

procedure TStallThread.Execute;
begin
  inherited;
  NameThreadForDebugging(self.ClassName);
  while not Terminated do
    TThread.Sleep(FStallTime)

end;

{ TLeakParent }

constructor TLeakParent.Create;
var
  i: integer;
begin
  FLeakChild := TLeakChild.Create;
  FLeakList := TObjectList<TLeakChild>.Create;
  for i := 0 to 1000 do
    FLeakList.Add(TLeakChild.Create);
end;

{ TLeakChild }

constructor TLeakChild.Create;
const
  pfx_key = 'Key';
  pfx_val = 'Val';
var
  i: integer;
begin
  FLeakDict := TDictionary<string, string>.Create;
  for i := 0 to 5000 do
    FLeakDict.Add(pfx_key + i.ToString, pfx_val + i.ToString)
end;

end.
