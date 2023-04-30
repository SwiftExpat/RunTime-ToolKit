object frmChildForm: TfrmChildForm
  Left = 0
  Top = 0
  Caption = 'frmChildForm'
  ClientHeight = 424
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  inline FramedVCL1: TFramedVCL
    Left = 0
    Top = 0
    Width = 618
    Height = 424
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -22
    ExplicitTop = -56
    inherited GridPanel1: TGridPanel
      Width = 618
      Height = 424
      ControlCollection = <
        item
          Column = 0
          Control = FramedVCL1.Button1
          Row = 0
        end
        item
          Column = 1
          Control = FramedVCL1.Label1
          Row = 0
        end
        item
          Column = 0
          ColumnSpan = 2
          Control = FramedVCL1.FrameSubFramedVCL1
          Row = 1
        end>
      inherited Button1: TButton
        Left = 117
        Top = 94
      end
      inherited Label1: TLabel
        Left = 446
        Top = 99
        Width = 34
        Height = 15
        ExplicitLeft = 454
        ExplicitTop = 108
        ExplicitWidth = 34
        ExplicitHeight = 15
      end
      inherited FrameSubFramedVCL1: TFrameSubFramedVCL
        Top = 212
        Width = 616
        Height = 211
        inherited GridPanel1: TGridPanel
          Width = 616
          Height = 211
          ControlCollection = <
            item
              Column = 0
              Control = FramedVCL1.FrameSubFramedVCL1.Label1
              Row = 0
            end
            item
              Column = 1
              Control = FramedVCL1.FrameSubFramedVCL1.Button1
              Row = 0
            end
            item
              Column = 0
              Control = FramedVCL1.FrameSubFramedVCL1.Edit1
              Row = 1
            end
            item
              Column = 1
              Control = FramedVCL1.FrameSubFramedVCL1.CheckBox1
              Row = 1
            end>
          inherited Label1: TLabel
            Left = 111
            Top = 45
            Width = 87
            Height = 15
            ExplicitWidth = 87
            ExplicitHeight = 15
          end
          inherited Button1: TButton
            Left = 424
            Top = 40
          end
          inherited Edit1: TEdit
            Left = 94
            Top = 146
            Height = 23
            ExplicitTop = 167
            ExplicitHeight = 23
          end
          inherited CheckBox1: TCheckBox
            Left = 413
            Top = 149
          end
        end
      end
    end
  end
end
