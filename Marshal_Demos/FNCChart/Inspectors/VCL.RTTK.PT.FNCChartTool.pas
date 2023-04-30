unit VCL.RTTK.PT.FNCChartTool;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, VCL.SERTTK.PluginTypes, VCL.StdCtrls, VCL.TMSFNCCustomComponent,
  VCL.TMSFNCChartEditor, VCL.TMSFNCChart, VCL.TMSFNCPDFIO, VCL.TMSFNCGraphicsPDFEngine, VCL.TMSFNCButton,
  VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCHTMLText, VCL.TMSFNCImage,
  VCL.TMSFNCBitmapContainer, VCL.TMSFNCCustomControl, VCL.TMSFNCTableView, VCL.TMSFNCStatusBar;

type
  TFrameFNCChartTool = class(TFrame)
    TMSFNCChartEditorDialog1: TTMSFNCChartEditorDialog;
    TMSFNCGraphicsPDFIO1: TTMSFNCGraphicsPDFIO;
    TMSFNCTableView1: TTMSFNCTableView;
    TMSFNCBitmapContainer1: TTMSFNCBitmapContainer;
    TMSFNCImage1: TTMSFNCImage;
    TMSFNCHTMLText1: TTMSFNCHTMLText;
    TMSFNCStatusBar1: TTMSFNCStatusBar;
    procedure TMSFNCTableView1ItemSelected(Sender: TObject; AItem: TTMSFNCTableViewItem);
    procedure TMSFNCTableView1BeforeItemShowDetailControl(Sender: TObject; AItem: TTMSFNCTableViewItem;
      ADetailControl: TControl; var AAllow: Boolean);
  private
    FChart: TTMSFNCChart; // used for references
    procedure ExportChartPDF(const AFile: string; const AResult: Boolean);
    procedure LogChartAction(const AMessage: string);
    function CaptureChartImage: integer;
    /// <summary>Checks assignment of adapter, data source and dataset</summary>
    /// <remarks>Displays as status bar panels</remarks>
    procedure StatusBarLoad;
  public
    procedure ShowEditor(Sender: TObject);
    procedure ExportPDF(Sender: TObject);
    procedure AssignChartToEditor(AChart: TTMSFNCChart);
  end;

  TSETransformFNCChart = class(TSERTTKPluginTransform)
  protected
    procedure ExecTransform; override;
  public
    constructor Create; reintroduce;
  end;

  TSESITFNCChart = class(TSERTTKPluginInspectTool)
  public
    function InitToolUI(const AInspectorCVInfo: TSERTTKPluginInspectorCVInfo): TSERTTKPluginToolInstance; override;
  end;

  TSERTTKPluginFNCChartTool = class(TSERTTKPluginToolInstance)
  strict private
    FChartUITool: TFrameFNCChartTool;
  protected
    procedure InitToolInstance; override;
  public
    function DisplayName: string; override;
  end;

implementation

{$R *.dfm}

uses  VCL.SEFNC.Logger, System.IOUtils, System.JSON, VCL.TMSFNCChartDatabaseAdapter;

{ TFrameFNCChartTool }

procedure TFrameFNCChartTool.AssignChartToEditor(AChart: TTMSFNCChart);
begin
  FChart := AChart;
  TMSFNCChartEditorDialog1.Chart := AChart;
  TMSFNCTableView1.Items.Clear;
  LogChartAction('Initial Capture');
  StatusBarLoad;
end;

procedure TFrameFNCChartTool.ExportChartPDF(const AFile: string; const AResult: Boolean);
const
  fmt_datetime = 'yyyy/mm/dd hh:nn:ss';
begin
  if AResult = false then
    exit;
  TMSFNCGraphicsPDFIO1.Information.Title := 'Export FNC Chart';
  TMSFNCGraphicsPDFIO1.ExportObject := FChart;
  TMSFNCGraphicsPDFIO1.Options.Header := TMSFNCGraphicsPDFIO1.Information.Title;
  TMSFNCGraphicsPDFIO1.Options.Footer := 'Exported @ ' + FormatDateTime(fmt_datetime, now);
  TMSFNCGraphicsPDFIO1.Save(AFile);
end;

procedure TFrameFNCChartTool.ExportPDF(Sender: TObject);
const
  txt_extension = 'PDF files (*.pdf)|*.PDF';
var
  fn, cn: string;
  fr: Boolean;
begin
  cn := FChart.Name;
  if cn.IsEmpty then
    fn := TPath.Combine(TTMSFNCUtils.GetTempPath, FChart.ClassName) + '.json'
  else
    fn := TPath.Combine(TTMSFNCUtils.GetTempPath, 'FNCChart' + cn) + '.json';
  fr := TTMSFNCUtils.SaveFile(fn, txt_extension, ExportChartPDF);
end;

procedure TFrameFNCChartTool.ShowEditor(Sender: TObject);
begin
  TMSFNCChartEditorDialog1.Execute;
  LogChartAction('Edit @' + FormatDateTime('hh:nn:ss', now));
end;

procedure TFrameFNCChartTool.StatusBarLoad;
var
  sp: TTMSFNCStatusBarPanel;
  adapter: TTMSFNCChartDatabaseAdapter;
  function AddPanel: TTMSFNCStatusBarPanel;
  begin
    result := TMSFNCStatusBar1.Panels.Add;
    result.Style := TTMSFNCStatusBarPanelStyle.spsHTML;
    result.AutoSize := true;
  end;
  function TextGreen(AText: string): string;
  begin
    result := '<FONT color="#008800" >' + AText + '</FONT>';
  end;
  function TextRed(AText: string): string;
  begin
    result := '<FONT color="#FF0000">' + AText + '</FONT>';
  end;

begin
  sp := AddPanel;
  if Assigned(FChart.adapter) then
    if FChart.adapter.Active then
    begin
      sp.Text := TextGreen('Adapter active');
      adapter := TTMSFNCChartDatabaseAdapter(FChart.adapter);
      sp := AddPanel;
      if Assigned(adapter.Source.DataSource) then
        if adapter.Source.DataSource.Enabled then
        begin
          sp.Text := TextGreen('DataSource Active');
          sp := AddPanel;
          if Assigned(adapter.Source.DataSource.DataSet) then
            if adapter.Source.DataSource.DataSet.Active then
              sp.Text := TextGreen('DataSet Active')
            else
              sp.Text := TextRed('DataSet InActive')
          else
            sp.Text := TextRed('DataSet Not Assigned');
        end
        else
          sp.Text := TextRed('DataSource Disabled')
      else
        sp.Text := TextRed('DataSource not Assigned')
    end
    else
      sp.Text := TextRed('Adapter inactive')
  else
    sp.Text := TextRed('NO Adapter!')
end;

function TFrameFNCChartTool.CaptureChartImage: integer;
var
  bmi: TTMSFNCBitmapItem;
  lms: TMemoryStream;
begin
  lms := TMemoryStream.Create;
  try
    FChart.MakeScreenshot.SaveToStream(lms);
    lms.Position := 0;
    bmi := TMSFNCBitmapContainer1.Items.Add;
    bmi.Bitmap.LoadFromStream(lms);
    result := bmi.Index;
    TMSFNCImage1.Bitmap := bmi.Bitmap;
  finally
    lms.Free;
  end;
end;

procedure TFrameFNCChartTool.LogChartAction(const AMessage: string);
var
  tvi: TTMSFNCTableViewItem;
  ts: TStringStream;
begin
  tvi := TMSFNCTableView1.Items.Add;
  tvi.Text := AMessage;
  tvi.DataInteger := CaptureChartImage;
  ts := TStringStream.Create;
  try
    FChart.SaveToJSONStream(ts);
    ts.Position := 0;
    tvi.DataString := ts.DataString;
  finally
    ts.Free;
  end;
end;

procedure TFrameFNCChartTool.TMSFNCTableView1BeforeItemShowDetailControl(Sender: TObject; AItem: TTMSFNCTableViewItem;
  ADetailControl: TControl; var AAllow: Boolean);
var
  JV: TJSONValue;
begin
  try
    try
      JV := TJSONObject.ParseJSONValue(AItem.DataString);
      TMSFNCHTMLText1.Text := JV.Format(1);
    except
      on E: Exception do
    end;
  finally
    FreeAndNil(JV);
  end;
end;

procedure TFrameFNCChartTool.TMSFNCTableView1ItemSelected(Sender: TObject; AItem: TTMSFNCTableViewItem);
begin
  TMSFNCImage1.Bitmap := TMSFNCBitmapContainer1.Items[AItem.DataInteger].Bitmap;
end;

{ TSETransformFNCChart }

constructor TSETransformFNCChart.Create;
begin
  inherited Create(TTMSFNCChart);
end;

procedure TSETransformFNCChart.ExecTransform;
begin
  try // add tool reference class to the Inspectors list
    RepoItem.ToolAdd(TSESITFNCChart.Create(RepoItem));
  except
    on E: Exception do
      Logger.Debug(E.Message)
  end;
end;

{ TSESITFNCChart }

function TSESITFNCChart.InitToolUI(const AInspectorCVInfo: TSERTTKPluginInspectorCVInfo): TSERTTKPluginToolInstance;
begin
  result := TSERTTKPluginFNCChartTool.Create(self, AInspectorCVInfo);
end;

{ TSERTTKPluginFNCChartTool }

function TSERTTKPluginFNCChartTool.DisplayName: string;
begin
  result := 'FNC Chart Editor';
end;

procedure TSERTTKPluginFNCChartTool.InitToolInstance;
begin
  inherited;
  FChartUITool := TFrameFNCChartTool.Create(self.ToolPage.Container);
  FChartUITool.Parent := self.ToolArea;
  if Assigned(self.ToolInfo.AppComponent) and (self.ToolInfo.AppComponent is TTMSFNCChart) then
    FChartUITool.AssignChartToEditor(TTMSFNCChart(self.ToolInfo.AppComponent));
  Toolbar.NewButton('Show Editor', FChartUITool.ShowEditor);
  Toolbar.NewButton('Save to PDF', FChartUITool.ExportPDF);
end;

initialization

MarshalPlugins.AddTransform(TSETransformFNCChart.Create);

end.
