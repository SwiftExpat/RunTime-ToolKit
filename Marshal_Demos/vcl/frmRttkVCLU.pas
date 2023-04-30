unit frmRttkVCLU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Generics.Collections, Vcl.Mask, frmFramedVCLU, System.Actions, Vcl.ActnList,
  Data.DB, Vcl.Grids, Vcl.DBGrids, frmChildFormU, dmRttkVCLncU, VCL.SERTTK.DT.Marshal;

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

  TfrmRTTKVCL = class(TForm)
    pnlTop: TPanel;
    pnlFoxLabel: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    pcWorkSpace: TPageControl;
    tsLabel: TTabSheet;
    tsIfDef: TTabSheet;
    btnMarshal: TButton;
    Label2: TLabel;
    Panel1: TPanel;
    ListBox1: TListBox;
    SERTTKMarshal1: TSERTTKMarshal;
    tsRunTimeComp: TTabSheet;
    Panel2: TPanel;
    memoRTCompFooter: TMemo;
    btnAddMemo: TButton;
    btnDeleteMemo: TSpeedButton;
    Panel3: TPanel;
    cbLeakObjects: TCheckBox;
    cbStallShutdown: TCheckBox;
    edtShutdownStall: TMaskEdit;
    SERTTKAppInspectorVCL1: TSERTTKAppInspectorVCL;
    tsFramed: TTabSheet;
    memoFramedMessage: TMemo;
    FramedVCL1: TFramedVCL;
    ActionList1: TActionList;
    Timer1: TTimer;
    tsSalesData: TTabSheet;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Action1: TAction;
    Action2: TAction;
    ControlAction1: TControlAction;
    btnChildForm: TButton;
    btnRuntimeDM: TButton;
    procedure btnMarshalClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnAddMemoClick(Sender: TObject);
    procedure btnDeleteMemoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbLeakObjectsClick(Sender: TObject);
    procedure cbStallShutdownClick(Sender: TObject);
    procedure FramedTestVCL1Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure btnChildFormClick(Sender: TObject);
    procedure btnRuntimeDMClick(Sender: TObject);
  private
    FRuntimeMemo: TMemo;
    FStallThread: TStallThread;
    FLeakRoot: TLeakParent;
    FChildForm: TfrmChildForm;
    FRunTimeDm: TdmAtRuntime;
  public
    { Public declarations }
  end;

var
  frmRTTKVCL: TfrmRTTKVCL;

implementation

{$R *.dfm}

uses
{$IFDEF DEBUG}
  Vcl.SERTTK.Marshal,
{$ENDIF}
  dmRTTKVCLU;

procedure TfrmRTTKVCL.btnMarshalClick(Sender: TObject);
begin
{$IFDEF DEBUG}
  TSERTTKMarshalAPI.ShowMarshal;
{$ENDIF}
end;

procedure TfrmRTTKVCL.Action1Execute(Sender: TObject);
begin
  memoRTCompFooter.Lines.Add('Shutdown Stalled');
end;

procedure TfrmRTTKVCL.btnAddMemoClick(Sender: TObject);
var
  s: string;
begin
  FRuntimeMemo := TMemo.Create(self);
  FRuntimeMemo.Parent := tsRunTimeComp;
  FRuntimeMemo.Align := TAlign.alClient;
  for s in memoRTCompFooter.Lines do
    FRuntimeMemo.Lines.Add('Copy of : ' + s);
  btnDeleteMemo.Enabled := true;
end;

procedure TfrmRTTKVCL.btnChildFormClick(Sender: TObject);
begin
  if FChildForm = nil then
    FChildForm := TfrmChildForm.Create(Application);
  FChildForm.Show;
end;

procedure TfrmRTTKVCL.btnRuntimeDMClick(Sender: TObject);
begin
  if FRunTimeDm = nil then
    FRunTimeDm := TdmAtRuntime.Create(Application);
end;

procedure TfrmRTTKVCL.btnDeleteMemoClick(Sender: TObject);
begin
  if Assigned(FRuntimeMemo) then
    FRuntimeMemo.Free;
  btnDeleteMemo.Enabled := false;
end;

procedure TfrmRTTKVCL.cbLeakObjectsClick(Sender: TObject);
begin
  if cbLeakObjects.Checked then
  begin
    memoRTCompFooter.Lines.Add('leaking objects');
    FLeakRoot := TLeakParent.Create;
  end;
end;

procedure TfrmRTTKVCL.cbStallShutdownClick(Sender: TObject);
begin
  if cbStallShutdown.Checked then
  begin
    memoRTCompFooter.Lines.Add('Shutdown Stalled');
    dmRTTK.StallShutdown(edtShutdownStall.EditText.ToInteger);
    FStallThread := TStallThread.Create(edtShutdownStall.EditText.ToInteger);
    FStallThread.Start;
  end;
end;

procedure TfrmRTTKVCL.Edit1Change(Sender: TObject);
begin
  // empty method
end;

procedure TfrmRTTKVCL.FormActivate(Sender: TObject);
begin
{$IFNDEF DEBUG}
  btnMarshal.Caption := 'Disabled in Release';
  btnMarshal.Enabled := false;
{$ENDIF}
end;

procedure TfrmRTTKVCL.FormCreate(Sender: TObject);
begin
  pcWorkSpace.ActivePage := tsLabel;
  btnDeleteMemo.Enabled := false;
end;

procedure TfrmRTTKVCL.FormDestroy(Sender: TObject);
begin
  //FStallThread.Free;
  OutputDebugString('VCL form destroyed');
end;

procedure TfrmRTTKVCL.FramedTestVCL1Button1Click(Sender: TObject);
var
  i: integer;
  c: TComponent;
begin
  memoFramedMessage.Lines.Add('count = ' + FramedVCL1.ComponentCount.ToString);
  memoFramedMessage.Lines.Add('hash ' + FramedVCL1.GetHashCode.ToString);
  for i := 0 to FramedVCL1.ComponentCount - 1 do
  begin
    c := FramedVCL1.Components[i];
    if c.HasParent then
      memoFramedMessage.Lines.Add(c.ClassName + ' parent = ' + c.GetParentComponent.GetHashCode.ToString)
    else if Assigned(Owner) then
      memoFramedMessage.Lines.Add(c.ClassName + ' owner = ' + c.Owner.GetHashCode.ToString)
    else
      memoFramedMessage.Lines.Add(c.ClassName + ' parent = none , owner = none ')
  end;
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
