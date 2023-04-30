unit frmFncChartGridVCLUCoded;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmFncChartGridVCLU, Vcl.StdCtrls;

type
  TfrmVCLMarshalCodedOptions = class(TfrmChartSalesVCL)
    StaticText1: TStaticText; // hidden for chart demo
    StaticText2: TStaticText; // hidden for chart demo
    procedure StaticText1Click(Sender: TObject);
    procedure StaticText2Click(Sender: TObject);
  private
    function ClickCountShow(AChart: TControl): boolean;
    procedure MarshalCode(Sender: TObject);
    procedure MarshalCodeWithOptions(Sender: TObject);
  public
    procedure SpiderLegendClick(Sender: TObject); override;
    procedure StackLegendClick(Sender: TObject); override;
  end;

var
  frmVCLMarshalCodedOptions: TfrmVCLMarshalCodedOptions;

implementation

{$R *.dfm}

uses
  Vcl.SERTTK.Marshal, // Required for Marshal
  Vcl.RTTK.PT.FNCChartTool, // only needed if using FNC Chart
  Vcl.SERTTK.MarshalTypes; // only needed for Marshal options

const
  marshal_show_clicks = 2;

  /// <summary>Click counter to prevent opening Marshal on the first click.</summary>
  /// <remarks>This allows you to hide Marshal functionality unless you know the right click count</remarks>
function TfrmVCLMarshalCodedOptions.ClickCountShow(AChart: TControl): boolean;
begin
  result := AChart.Tag = marshal_show_clicks;
  if result then
    AChart.Tag := 0
  else
    AChart.Tag := AChart.Tag + 1;
end;

/// <summary>Shows Marshal if the click count is met</summary>
procedure TfrmVCLMarshalCodedOptions.MarshalCode(Sender: TObject);
begin
  if ClickCountShow(TControl(Sender)) then
    TSERTTKMarshalAPI.ShowMarshal;
end;

/// <summary>Shows Marshal with custom options if the click count is met</summary>
procedure TfrmVCLMarshalCodedOptions.MarshalCodeWithOptions(Sender: TObject);
var
  lMarshalOptions: TSERTTKMarshalOptions;
begin
  if ClickCountShow(TControl(Sender)) then
  begin
    lMarshalOptions := MarshalMV.MarshalOptions;
    lMarshalOptions.FormWidth := 1024;
    lMarshalOptions.FormHeight := 720;
    TSERTTKMarshalAPI.ShowMarshal;
  end;
end;

/// <summary>Shows Marshal with custom options if the click count is met</summary>
/// <remarks>Legend click is mapped in base form. This is implementation for inherited form </remarks>
procedure TfrmVCLMarshalCodedOptions.SpiderLegendClick(Sender: TObject);
begin
  MarshalCodeWithOptions(Sender);
  inherited;
end;

/// <summary>Shows Marshal if the click count is met</summary>
/// <remarks>Legend click is mapped in base form. This is implementation for inherited form</remarks>
procedure TfrmVCLMarshalCodedOptions.StackLegendClick(Sender: TObject);
begin
  MarshalCode(Sender);
  inherited;
end;

/// <summary>Shows Marshal if the click count is met</summary>
/// <remarks>Hidden for chart demo, shown as an option if no other control is available.</remarks>
procedure TfrmVCLMarshalCodedOptions.StaticText1Click(Sender: TObject);
begin
  MarshalCode(Sender);
end;

/// <summary>Shows Marshal with custom options if the click count is met</summary>
/// <remarks>Hidden for chart demo, shown as an option if no other control is availalbe.</remarks>
procedure TfrmVCLMarshalCodedOptions.StaticText2Click(Sender: TObject);
begin
  MarshalCodeWithOptions(Sender);
end;

end.
