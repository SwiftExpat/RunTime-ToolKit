object FrameSubFramedVCL: TFrameSubFramedVCL
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
        Control = Label1
        Row = 0
      end
      item
        Column = 1
        Control = Button1
        Row = 0
      end
      item
        Column = 0
        Control = Edit1
        Row = 1
      end
      item
        Column = 1
        Control = CheckBox1
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
    object Label1: TLabel
      Left = 95
      Top = 108
      Width = 131
      Height = 25
      Anchors = []
      Caption = 'Sub Frame Label'
      ExplicitLeft = 97
    end
    object Button1: TButton
      Left = 442
      Top = 108
      Width = 75
      Height = 25
      Anchors = []
      Caption = 'Button1'
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 100
      Top = 343
      Width = 121
      Height = 33
      Anchors = []
      TabOrder = 1
      Text = 'sub frame edit2'
    end
    object CheckBox1: TCheckBox
      Left = 431
      Top = 351
      Width = 97
      Height = 17
      Anchors = []
      Caption = 'CheckBox1'
      TabOrder = 2
    end
  end
  object ActionList1: TActionList
    Left = 296
    Top = 216
  end
  object Timer1: TTimer
    Left = 304
    Top = 224
  end
end
