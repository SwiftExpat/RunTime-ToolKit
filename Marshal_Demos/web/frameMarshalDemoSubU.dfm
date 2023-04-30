object FrameMarshalSubFrame: TFrameMarshalSubFrame
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object WebPanel1: TWebPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    Caption = 'SubFrame panel'
    ExplicitLeft = -3
    ExplicitTop = -3
    object WebProgressBar1: TWebProgressBar
      Left = 0
      Top = 456
      Width = 640
      Height = 24
      WidthPercent = 25.000000000000000000
      Align = alBottom
      Position = 25
      Value = pbvPercentage
    end
  end
  object WebTimer1: TWebTimer
    Interval = 100
    OnTimer = WebTimer1Timer
    Left = 392
    Top = 112
  end
end
