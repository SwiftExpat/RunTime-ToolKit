unit frmChildFormU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmFramedVCLU;

type
  TfrmChildForm = class(TForm)
    FramedVCL1: TFramedVCL;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChildForm: TfrmChildForm;

implementation

{$R *.dfm}

end.
