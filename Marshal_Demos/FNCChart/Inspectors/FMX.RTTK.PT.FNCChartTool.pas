unit FMX.RTTK.PT.FNCChartTool;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.TMSFNCCustomComponent,
  FMX.TMSFNCChartEditor, FMX.Controls.Presentation, FMX.TMSFNCChart, FMX.SERTTK.PluginTypes, FMX.TMSFNCPDFIO,
  FMX.TMSFNCGraphicsPDFEngine, FMX.TMSFNCButton, FMX.TMSFNCPDFLib, FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics,
  FMX.TMSFNCGraphicsTypes, FMX.TMSFNCCustomControl, FMX.Layouts, FMX.TMSFNCBitmapContainer,
  FMX.TMSFNCImage, FMX.TMSFNCHTMLText, FMX.TMSFNCStatusBar, FMX.TMSFNCListBox, FMX.TMSFNCTreeViewBase,
  FMX.TMSFNCTreeViewData, FMX.TMSFNCCustomTreeView, FMX.TMSFNCTreeView, FMX.TMSFNCPageControl, FMX.TMSFNCTabSet,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TFrameFNCChartTool = class(TFrame)
    TMSFNCGraphicsPDFIO1: TTMSFNCGraphicsPDFIO;
    TMSFNCChartEditorDialog: TTMSFNCChartEditorDialog;
    TMSFNCBitmapContainer1: TTMSFNCBitmapContainer;
    TMSFNCImage1: TTMSFNCImage;
    TMSFNCStatusBar1: TTMSFNCStatusBar;
    TMSFNCListBox1: TTMSFNCListBox;
    TMSFNCPageControl1: TTMSFNCPageControl;
    TMSFNCPageControl1Page0: TTMSFNCPageControlContainer;
    TMSFNCPageControl1Page1: TTMSFNCPageControlContainer;
    TMSFNCPageControl1Page2: TTMSFNCPageControlContainer;
    TMSFNCTreeView1: TTMSFNCTreeView;
    Memo1: TMemo;
    procedure TMSFNCListBox1ItemClick(Sender: TObject; AItem: TTMSFNCListBoxItem);
  private
    FChart: TTMSFNCChart; // used for references
    /// <summary>Creates an entry in the listbox for an action</summary>
    /// <remarks>assigns the image index and json string</remarks>
    procedure LogChartAction(const AMessage: string);
    /// <summary>Callback for TTMSFNCUtils.SaveFile </summary>
    /// <remarks>Executes the export if result was true</remarks>
    procedure ExportChartPDF(const AFile: string; const AResult: Boolean);
    /// <summary>Captures bitmap image of chart component</summary>
    /// <remarks>Display is in a FNC image component and reference is in fnc listbox</remarks>
    /// <returns>Index of bitmap in the bitmap container</returns>
    function CaptureChartImage: integer;
    /// <summary>Checks assignment of adapter, data source and dataset</summary>
    /// <remarks>Displays as status bar panels</remarks>
    procedure StatusBarLoad;
  public
    /// <summary>Calls the FNC Chart editor from button click event</summary>
    /// <remarks>Exposed public for the button in the tool bar to access</remarks>
    procedure ShowEditor(Sender: TObject);
    /// <summary>Exports the FNC Chart as pdf using file save and a pdf component</summary>
    /// <remarks>Exposed public for the button in the tool bar to access</remarks>
    procedure ExportPDF(Sender: TObject);
    /// <summary>Passes the chart reference from the tool instance</summary>
    /// <remarks>Tool instance will check and cast the component to FNC Chart</remarks>
    procedure AssignChartToEditor(AChart: TTMSFNCChart);
  end;

  /// <summary>Classtype mapping for the registry. What class type does this inspector work for?</summary>
  /// <remarks>Regsitry controls disposal</remarks>
  /// <returns>Instance in the registry via the initialization section</returns>
  TSETransformFNCChart = class(TSERTTKPluginTransform)
  protected
    /// <summary>Assigns the tool instance to the component if class type matches</summary>
    /// <remarks>Called for each component in the application</remarks>
    procedure ExecTransform; override;
  public
    /// <summary>Assigns the classtype</summary>
    /// <remarks> /\/\ </remarks>
    constructor Create; reintroduce;
  end;

  /// <summary>Mapping class for transform to assign the inspector type to the component instance</summary>
  /// <remarks>intermediate class to later build the inspector UI</remarks>
  /// <returns>Reference for the component to later display inspectors</returns>
  TSESITFNCChart = class(TSERTTKPluginInspectTool)
  public
    /// <summary>Factory method to allow implementation of custom inspector</summary>
    /// <remarks>Called once the component tab has been created</remarks>
    /// <returns>Inspector to be initialized</returns>
    function InitToolUI(const AInspectorCVInfo: TSERTTKPluginInspectorCVInfo): TSERTTKPluginToolInstance; override;
  end;

  /// <summary>Custom inspector for TMSFNCChart</summary>
  /// <remarks>Creates the frame which implements inspector logic</remarks>
  /// <returns>Frame is parented to the client area and align is client</returns>
  TSERTTKPluginFNCChartTool = class(TSERTTKPluginToolInstance)
  strict private
    FChartUITool: TFrameFNCChartTool;
  protected
    /// <summary>Executes the initial inspector load procedures</summary>
    /// <remarks>Called when the click in the nav tree happens, late binding</remarks>
    /// <returns>The frame that implements the inspector functionality in the client area</returns>
    procedure InitToolInstance; override;
  public
    /// <summary>Returns the display name for the inspector tab</summary>
    /// <remarks> /\/\ </remarks>
    /// <returns>String display name</returns>
    function DisplayName: string; override;
  end;

implementation

{$R *.fmx}

uses  FMX.SEFNC.Logger, System.IOUtils, System.JSON, FMX.TMSFNCChartDatabaseAdapter;

procedure TFrameFNCChartTool.AssignChartToEditor(AChart: TTMSFNCChart);
begin
  FChart := AChart;
  TMSFNCChartEditorDialog.Chart := AChart;
  TMSFNCListBox1.Items.Clear;
  LogChartAction('Initial Capture');
  StatusBarLoad;
end;

procedure TFrameFNCChartTool.ShowEditor(Sender: TObject);
begin
  TMSFNCChartEditorDialog.Execute;
  LogChartAction('Edit @' + FormatDateTime('hh:nn:ss', now));
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
    fn := TPath.Combine(TTMSFNCUtils.GetTempPath, FChart.ClassName) + '.pdf'
  else
    fn := TPath.Combine(TTMSFNCUtils.GetTempPath, 'FNCChart' + cn) + '.pdf';
  fr := TTMSFNCUtils.SaveFile(fn, txt_extension, ExportChartPDF);
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
  if FChart.Width > FChart.height then
    TMSFNCGraphicsPDFIO1.Options.PageOrientation := TTMSFNCPDFlibPageOrientation.poLandscape;
  TMSFNCGraphicsPDFIO1.Save(AFile);
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
      sp.Text := TextGreen('Adapter Active');
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
      sp.Text := TextRed('Adapter InActive')
  else
    sp.Text := TextRed('NO Adapter!')
end;

procedure TFrameFNCChartTool.LogChartAction(const AMessage: string);
var
  tvi: TTMSFNCListBoxItem;
  ts: TStringStream;
begin
  tvi := TMSFNCListBox1.Items.Add;
  tvi.Text := AMessage;
  tvi.DataInteger := CaptureChartImage;
  ts := TStringStream.Create;
  try
    FChart.SaveToJSONStream(ts);
    ts.Position := 0;
    tvi.DataString := ts.DataString;
    TMSFNCListBox1.ItemIndex := tvi.Index;
  finally
    ts.Free;
  end;
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

procedure TFrameFNCChartTool.TMSFNCListBox1ItemClick(Sender: TObject; AItem: TTMSFNCListBoxItem);
var
  JV: TJSONValue;
  o: TTMSFNCTreeViewViewJSONOptions;
begin
  o := TTMSFNCTreeViewViewJSONOptions.Create;
  try
    o.ArrayItemPrefix := 'Item ';
    o.NameHTMLTemplate := '<b><#NAME></b>'; // #NAME and #VALUE are mandatory names to use for the ViewJSON method.
    o.ValueHTMLTemplate := '<font color="red"><#VALUE></font>';
    try
      TMSFNCImage1.Bitmap := TMSFNCBitmapContainer1.Items[AItem.DataInteger].Bitmap;
      JV := TJSONObject.ParseJSONValue(AItem.DataString);
      Memo1.Lines.Clear;
      Memo1.Lines.Add(JV.Format(1));
      TMSFNCTreeView1.ViewJSONFromText(AItem.DataString, o);
    except
      on E: Exception do
    end;
  finally
    FreeAndNil(JV);
    o.Free;
  end;
end;

{ TSETransformFNCChart }

constructor TSETransformFNCChart.Create;
begin // what class type will this transform be mapped for?
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
  inherited; // code to create tool here
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
