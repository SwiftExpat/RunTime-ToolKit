unit frmSubFramedVCLU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.Actions, Vcl.ActnList;

type
  TFrameSubFramedVCL = class(TFrame)
    Label1: TLabel;
    GridPanel1: TGridPanel;
    Button1: TButton;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    ActionList1: TActionList;
    Timer1: TTimer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
