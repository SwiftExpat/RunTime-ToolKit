object FramedVCL: TFramedVCL
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Align = alClient
  TabOrder = 0
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    Caption = 'GridPanel1'
    ColumnCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = Button1
        Row = 0
      end
      item
        Column = 1
        Control = Label1
        Row = 0
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = FrameSubFramedVCL1
        Row = 1
      end>
    RowCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    TabOrder = 0
    DesignSize = (
      640
      480)
    object Button1: TButton
      Left = 123
      Top = 108
      Width = 75
      Height = 25
      Anchors = []
      Caption = 'Button1'
      TabOrder = 0
    end
    object Label1: TLabel
      Left = 454
      Top = 108
      Width = 51
      Height = 25
      Anchors = []
      Caption = 'Label1'
      ExplicitLeft = 184
      ExplicitTop = 256
    end
    inline FrameSubFramedVCL1: TFrameSubFramedVCL
      Left = 1
      Top = 240
      Width = 638
      Height = 239
      Align = alClient
      Anchors = []
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 240
      ExplicitWidth = 638
      ExplicitHeight = 239
      inherited GridPanel1: TGridPanel
        Width = 638
        Height = 239
        ControlCollection = <
          item
            Column = 0
            Control = FrameSubFramedVCL1.Label1
            Row = 0
          end
          item
            Column = 1
            Control = FrameSubFramedVCL1.Button1
            Row = 0
          end
          item
            Column = 0
            Control = FrameSubFramedVCL1.Edit1
            Row = 1
          end
          item
            Column = 1
            Control = FrameSubFramedVCL1.CheckBox1
            Row = 1
          end>
        ExplicitWidth = 638
        ExplicitHeight = 239
        inherited Label1: TLabel
          Left = 91
          Top = 12
          ExplicitLeft = 134
          ExplicitTop = 47
        end
        inherited Button1: TButton
          Left = 431
          Top = 12
          ExplicitLeft = 440
          ExplicitTop = 47
        end
        inherited Edit1: TEdit
          Left = 96
          Top = 56
          ExplicitLeft = 99
          ExplicitTop = 162
        end
        inherited CheckBox1: TCheckBox
          Left = 420
          Top = 64
          ExplicitLeft = 429
          ExplicitTop = 170
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 304
    Top = 224
  end
  object Timer1: TTimer
    Left = 312
    Top = 232
  end
end
