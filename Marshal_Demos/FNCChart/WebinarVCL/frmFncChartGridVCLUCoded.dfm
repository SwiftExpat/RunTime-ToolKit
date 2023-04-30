object frmVCLMarshalCodedOptions: TfrmVCLMarshalCodedOptions
  Left = 0
  Top = 0
  Caption = 'VCL Marshal Options via 3 clicks on chart legend item'
  ClientHeight = 424
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    618
    424)
  TextHeight = 15
  object StaticText1: TStaticText
    Left = 400
    Top = 304
    Width = 61
    Height = 19
    Anchors = [akRight, akBottom]
    Caption = 'StaticText1'
    TabOrder = 0
    Visible = False
    OnClick = StaticText1Click
  end
  object StaticText2: TStaticText
    Left = 400
    Top = 352
    Width = 61
    Height = 19
    Anchors = [akRight, akBottom]
    Caption = 'StaticText2'
    TabOrder = 1
    Visible = False
    OnClick = StaticText2Click
  end
end
