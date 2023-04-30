object FrameFNCChartTool: TFrameFNCChartTool
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Align = alClient
  TabOrder = 0
  object TMSFNCChartEditorDialog1: TTMSFNCChartEditorDialog
    Left = 176
    Top = 336
    Width = 26
    Height = 26
    Visible = True
  end
  object TMSFNCGraphicsPDFIO1: TTMSFNCGraphicsPDFIO
    Left = 112
    Top = 323
    Width = 26
    Height = 26
    Visible = True
    Options.DefaultFont.Name = 'Arial'
    Options.Header = 'TMS PDF Header'
    Options.Footer = 'TMS PDF Footer'
    Options.Margins.Left = 20.000000000000000000
    Options.Margins.Top = 50.000000000000000000
    Options.Margins.Right = 20.000000000000000000
    Options.Margins.Bottom = 50.000000000000000000
    Options.HeaderFont.Name = 'Arial'
    Options.FooterFont.Name = 'Arial'
    Options.HeaderMargins.Left = 5.000000000000000000
    Options.HeaderMargins.Top = 5.000000000000000000
    Options.HeaderMargins.Right = 5.000000000000000000
    Options.HeaderMargins.Bottom = 5.000000000000000000
    Options.FooterMargins.Left = 5.000000000000000000
    Options.FooterMargins.Top = 5.000000000000000000
    Options.FooterMargins.Right = 5.000000000000000000
    Options.FooterMargins.Bottom = 5.000000000000000000
    Options.PageNumberMargins.Left = 10.000000000000000000
    Options.PageNumberMargins.Top = 5.000000000000000000
    Options.PageNumberMargins.Right = 10.000000000000000000
    Options.PageNumberMargins.Bottom = 5.000000000000000000
    Options.PageNumberFormat = '%d'
    Options.PageNumberFont.Name = 'Arial'
  end
  object TMSFNCTableView1: TTMSFNCTableView
    Left = 0
    Top = 0
    Width = 250
    Height = 460
    Align = alLeft
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 2
    Stroke.Color = 11711154
    BitmapContainer = TMSFNCBitmapContainer1
    ItemAppearance.Font.Charset = DEFAULT_CHARSET
    ItemAppearance.Font.Color = 8026746
    ItemAppearance.Font.Height = -11
    ItemAppearance.Font.Name = 'Segoe UI'
    ItemAppearance.Font.Style = []
    ItemAppearance.Stroke.Kind = gskSolid
    ItemAppearance.Stroke.Color = 13420488
    ItemAppearance.SelectedFill.Color = 16578806
    ItemAppearance.SelectedStroke.Color = 15702829
    ItemAppearance.SelectedStroke.Width = 2.000000000000000000
    ItemAppearance.DisabledFill.Kind = gfkNone
    ItemAppearance.FixedHeight = 25.000000000000000000
    ItemAppearance.AccessoryDetailBitmaps = <>
    ItemAppearance.AccessoryFont.Charset = DEFAULT_CHARSET
    ItemAppearance.AccessoryFont.Color = 139
    ItemAppearance.AccessoryFont.Height = -11
    ItemAppearance.AccessoryFont.Name = 'Segoe UI'
    ItemAppearance.AccessoryFont.Style = [fsBold]
    ItemAppearance.ShowFocus = False
    DefaultItem.DetailControl = TMSFNCHTMLText1
    DefaultItem.VerticalTextAlign = gtaCenter
    DefaultItem.SelectedTextColor = clBlack
    Items = <
      item
        Text = 'Bugfix 376'
        VerticalTextAlign = gtaCenter
        TextColor = 8026746
        SelectedTextColor = 4539717
      end
      item
        Text = 'Bugfix 378'
        VerticalTextAlign = gtaCenter
        TextColor = 8026746
        SelectedTextColor = 4539717
      end
      item
        Text = 'Customer Update'
        VerticalTextAlign = gtaCenter
        TextColor = 8026746
        SelectedTextColor = 4539717
      end
      item
        Text = 'Install New server'
        VerticalTextAlign = gtaCenter
        TextColor = 8026746
        SelectedTextColor = 4539717
      end
      item
        Text = 'Meeting: Next Phase'
        VerticalTextAlign = gtaCenter
        TextColor = 8026746
        SelectedTextColor = 4539717
      end
      item
        Text = 'Release Planning'
        VerticalTextAlign = gtaCenter
        TextColor = 8026746
        SelectedTextColor = 4539717
      end>
    Header.Text = 'Header'
    Header.Fill.Color = 16380654
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = 4539717
    Header.Font.Height = -13
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = [fsBold]
    Header.Stroke.Kind = gskNone
    Header.Stroke.Color = 11711154
    Header.Height = 36.000000000000000000
    Footer.Text = 'Footer'
    Footer.Fill.Kind = gfkNone
    Footer.Fill.Color = 16380654
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = 4539717
    Footer.Font.Height = -13
    Footer.Font.Name = 'Segoe UI'
    Footer.Font.Style = []
    Footer.Stroke.Color = 11711154
    Footer.Height = 30.000000000000000000
    Interaction.AnimationFactor = 1.000000000000000000
    LookupBar.Font.Charset = DEFAULT_CHARSET
    LookupBar.Font.Color = clWindowText
    LookupBar.Font.Height = -11
    LookupBar.Font.Name = 'Segoe UI'
    LookupBar.Font.Style = []
    LookupBar.InActiveFont.Charset = DEFAULT_CHARSET
    LookupBar.InActiveFont.Color = clSilver
    LookupBar.InActiveFont.Height = -11
    LookupBar.InActiveFont.Name = 'Segoe UI'
    LookupBar.InActiveFont.Style = []
    Reload.Stroke.Width = 2.000000000000000000
    Categories = <>
    MoreOptions = <>
    MoreOptionAppearance.Font.Charset = DEFAULT_CHARSET
    MoreOptionAppearance.Font.Color = clWhite
    MoreOptionAppearance.Font.Height = -11
    MoreOptionAppearance.Font.Name = 'Segoe UI'
    MoreOptionAppearance.Font.Style = []
    CategoryAppearance.Font.Charset = DEFAULT_CHARSET
    CategoryAppearance.Font.Color = clWindowText
    CategoryAppearance.Font.Height = -11
    CategoryAppearance.Font.Name = 'Segoe UI'
    CategoryAppearance.Font.Style = []
    OnItemSelected = TMSFNCTableView1ItemSelected
    GlobalFont.Name = 'Segoe UI'
    GlobalFont.Scale = 1.000000000000000000
    GlobalFont.Style = []
    OnBeforeItemShowDetailControl = TMSFNCTableView1BeforeItemShowDetailControl
    ExplicitHeight = 480
  end
  object TMSFNCImage1: TTMSFNCImage
    Left = 250
    Top = 0
    Width = 390
    Height = 460
    Align = alClient
    ParentDoubleBuffered = False
    Color = clBtnFace
    DoubleBuffered = True
    TabOrder = 3
    Bitmaps = <>
    Fill.Kind = gfkNone
    Stroke.Kind = gskNone
    ExplicitHeight = 480
  end
  object TMSFNCBitmapContainer1: TTMSFNCBitmapContainer
    Left = 104
    Top = 224
    Width = 26
    Height = 26
    Visible = True
    Items = <>
  end
  object TMSFNCHTMLText1: TTMSFNCHTMLText
    Left = 72
    Top = 216
    Width = 100
    Height = 50
    ParentDoubleBuffered = False
    Color = clBtnFace
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 5
    Visible = False
    Fill.Kind = gfkNone
    Stroke.Kind = gskNone
    Stroke.Color = -1
    Text = 'TTMSFNCHTMLText'
    WordWrapping = True
  end
  object TMSFNCStatusBar1: TTMSFNCStatusBar
    Left = 0
    Top = 460
    Width = 640
    Height = 20
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 6
    Panels = <>
    PanelAppearance.Font.Charset = DEFAULT_CHARSET
    PanelAppearance.Font.Color = clWindowText
    PanelAppearance.Font.Height = -11
    PanelAppearance.Font.Name = 'Segoe UI'
    PanelAppearance.Font.Style = []
    ExplicitLeft = 320
    ExplicitTop = 232
    ExplicitWidth = 0
  end
end
