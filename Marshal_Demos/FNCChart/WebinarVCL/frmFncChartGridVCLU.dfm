object frmChartSalesVCL: TfrmChartSalesVCL
  Left = 0
  Top = 0
  Caption = 'VCL Base From'
  ClientHeight = 895
  ClientWidth = 1379
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 25
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 1379
    Height = 895
    Align = alClient
    Caption = 'GridPanel1'
    ColumnCollection = <
      item
        Value = 50.478260869565220000
      end
      item
        Value = 30.478260869565220000
      end
      item
        Value = 19.043478260869570000
      end>
    ControlCollection = <
      item
        Column = 2
        Control = TMSFNCGrid1
        Row = 1
      end
      item
        Column = 0
        ColumnSpan = 3
        Control = TMSFNCBarChart1
        Row = 0
      end
      item
        Column = 0
        Control = TMSFNCStackedAreaChart1
        Row = 1
      end
      item
        Column = 1
        Control = TMSFNCSpiderChart1
        Row = 1
      end>
    RowCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ShowCaption = False
    TabOrder = 0
    object TMSFNCGrid1: TTMSFNCGrid
      AlignWithMargins = True
      Left = 1119
      Top = 450
      Width = 256
      Height = 441
      Align = alClient
      ParentDoubleBuffered = False
      DoubleBuffered = True
      TabOrder = 0
      DefaultRowHeight = 40.000000000000000000
      FixedColumns = 0
      ColumnCount = 4
      Options.Bands.Enabled = True
      Options.Editing.CalcFormat = '%g'
      Options.Grouping.CalcFormat = '%g'
      Options.Grouping.GroupCountFormat = '(%d)'
      Options.IO.XMLEncoding = 'ISO-8859-1'
      Options.Mouse.ClickMargin = 0
      Options.Mouse.ColumnSizeMargin = 6
      Options.Mouse.RowSizeMargin = 6
      Adapter = TMSFNCGridDatabaseAdapter1
      Columns = <
        item
          BorderWidth = 1
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = 4539717
          FixedFont.Height = -11
          FixedFont.Name = 'Segoe UI'
          FixedFont.Style = [fsBold]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8026746
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ID = ''
          Width = 70.000000000000000000
        end
        item
          BorderWidth = 1
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = 4539717
          FixedFont.Height = -11
          FixedFont.Name = 'Segoe UI'
          FixedFont.Style = [fsBold]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8026746
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ID = ''
          Width = 250.000000000000000000
        end
        item
          BorderWidth = 1
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = 4539717
          FixedFont.Height = -11
          FixedFont.Name = 'Segoe UI'
          FixedFont.Style = [fsBold]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8026746
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ID = ''
          Width = 100.000000000000000000
        end
        item
          BorderWidth = 1
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = 4539717
          FixedFont.Height = -11
          FixedFont.Name = 'Segoe UI'
          FixedFont.Style = [fsBold]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8026746
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ID = ''
          Width = 100.000000000000000000
        end
        item
          BorderWidth = 1
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = 4539717
          FixedFont.Height = -11
          FixedFont.Name = 'Segoe UI'
          FixedFont.Style = [fsBold]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8026746
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ID = ''
          Width = 90.000000000000000000
        end>
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = -11
      DefaultFont.Name = 'Segoe UI'
      DefaultFont.Style = []
      TopRow = 1
      Appearance.FixedLayout.Fill.Color = 16380654
      Appearance.FixedLayout.Font.Charset = DEFAULT_CHARSET
      Appearance.FixedLayout.Font.Color = 4539717
      Appearance.FixedLayout.Font.Height = -13
      Appearance.FixedLayout.Font.Name = 'Segoe UI'
      Appearance.FixedLayout.Font.Style = [fsBold]
      Appearance.NormalLayout.Fill.Color = 16578806
      Appearance.NormalLayout.Font.Charset = DEFAULT_CHARSET
      Appearance.NormalLayout.Font.Color = 8026746
      Appearance.NormalLayout.Font.Height = -11
      Appearance.NormalLayout.Font.Name = 'Segoe UI'
      Appearance.NormalLayout.Font.Style = []
      Appearance.GroupLayout.Fill.Color = 12817262
      Appearance.GroupLayout.Font.Charset = DEFAULT_CHARSET
      Appearance.GroupLayout.Font.Color = clBlack
      Appearance.GroupLayout.Font.Height = -11
      Appearance.GroupLayout.Font.Name = 'Segoe UI'
      Appearance.GroupLayout.Font.Style = []
      Appearance.SummaryLayout.Fill.Color = 14009785
      Appearance.SummaryLayout.Font.Charset = DEFAULT_CHARSET
      Appearance.SummaryLayout.Font.Color = clBlack
      Appearance.SummaryLayout.Font.Height = -11
      Appearance.SummaryLayout.Font.Name = 'Segoe UI'
      Appearance.SummaryLayout.Font.Style = []
      Appearance.SelectedLayout.Fill.Color = 16441019
      Appearance.SelectedLayout.Font.Charset = DEFAULT_CHARSET
      Appearance.SelectedLayout.Font.Color = 4539717
      Appearance.SelectedLayout.Font.Height = -11
      Appearance.SelectedLayout.Font.Name = 'Segoe UI'
      Appearance.SelectedLayout.Font.Style = []
      Appearance.FocusedLayout.Fill.Color = 16039284
      Appearance.FocusedLayout.Font.Charset = DEFAULT_CHARSET
      Appearance.FocusedLayout.Font.Color = 4539717
      Appearance.FocusedLayout.Font.Height = -11
      Appearance.FocusedLayout.Font.Name = 'Segoe UI'
      Appearance.FocusedLayout.Font.Style = []
      Appearance.FixedSelectedLayout.Fill.Color = 14599344
      Appearance.FixedSelectedLayout.Font.Charset = DEFAULT_CHARSET
      Appearance.FixedSelectedLayout.Font.Color = clBlack
      Appearance.FixedSelectedLayout.Font.Height = -11
      Appearance.FixedSelectedLayout.Font.Name = 'Segoe UI'
      Appearance.FixedSelectedLayout.Font.Style = []
      Appearance.BandLayout.Fill.Color = 16711679
      Appearance.BandLayout.Font.Charset = DEFAULT_CHARSET
      Appearance.BandLayout.Font.Color = 8026746
      Appearance.BandLayout.Font.Height = -11
      Appearance.BandLayout.Font.Name = 'Segoe UI'
      Appearance.BandLayout.Font.Style = []
      Appearance.ProgressLayout.Format = '%.0f%%'
      LeftCol = 0
      ScrollMode = scmItemScrolling
      GlobalFont.Scale = 1.000000000000000000
      GlobalFont.Style = []
      DesignTimeSampleData = True
      object TMSFNCGridDatabaseAdapter1: TTMSFNCGridDatabaseAdapter
        Left = 560
        Top = 264
        Width = 39
        Height = 39
        Visible = True
        Grid = TMSFNCGrid1
        DataSource = dsSalesGrid
        Columns = <>
      end
    end
    object TMSFNCBarChart1: TTMSFNCBarChart
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 1371
      Height = 440
      ParentCustomHint = False
      Appearance.ColorList = <
        item
          Color = 16105559
        end
        item
          Color = 5644279
        end
        item
          Color = 7936771
        end
        item
          Color = 12275349
        end
        item
          Color = 1296366
        end
        item
          Color = 4350195
        end
        item
          Color = 16544551
        end
        item
          Color = 5820321
        end
        item
          Color = 10922240
        end
        item
          Color = 16376965
        end>
      Appearance.GlobalFont.Color = -1
      Appearance.GlobalFont.Scale = 1.000000000000000000
      Appearance.GlobalFont.Style = []
      Appearance.ColorScheme = ccsExcel
      Appearance.MonochromeColor = 11829830
      NativeCanvas = True
      ClickMargin = 10.000000000000000000
      Crosshair.Visible = True
      Crosshair.Modes = [ccmPointBased]
      Legend.Fill.Color = 16775416
      Legend.Stroke.Color = clGray
      Legend.Font.Charset = DEFAULT_CHARSET
      Legend.Font.Color = clWindowText
      Legend.Font.Height = -11
      Legend.Font.Name = 'Segoe UI'
      Legend.Font.Style = []
      Legend.Left = 10.000000000000000000
      Legend.Position = lpBottomRight
      Legend.Top = 10.000000000000000000
      Stroke.Color = clGray
      SeriesMargins.Left = 0
      SeriesMargins.Top = 0
      SeriesMargins.Right = 0
      SeriesMargins.Bottom = 0
      Series = <
        item
          AnimationFactor = 4.000000000000000000
          AutoYRange = arCommonZeroBased
          Bar.Width = 65.000000000000000000
          Bar.Spacing = 20.000000000000000000
          MultiPoint.Width = 65.000000000000000000
          Pie.Size = 200.000000000000000000
          Pie.Margins.Left = 10
          Pie.Margins.Top = 10
          Pie.Margins.Right = 10
          Pie.Margins.Bottom = 10
          Pie.SweepAngle = 360.000000000000000000
          Fill.Color = 12874308
          LegendText = 'Series 0'
          Labels.Fill.Color = 16775416
          Labels.Font.Charset = DEFAULT_CHARSET
          Labels.Font.Color = clWindowText
          Labels.Font.Height = -11
          Labels.Font.Name = 'Segoe UI'
          Labels.Font.Style = []
          Labels.Format = '%.2f'
          Labels.OffsetY = -10.000000000000000000
          Labels.Stroke.Color = clGray
          Labels.Visible = True
          Markers.Fill.Color = 12874308
          Markers.Height = 10.000000000000000000
          Markers.Stroke.Color = 6437154
          Markers.Visible = True
          Markers.Width = 10.000000000000000000
          MaxX = 10.000000000000000000
          MaxY = 10.000000000000000000
          MaxYOffsetPercentage = 10.000000000000000000
          Mode = smStatistical
          Offset3DX = 15.000000000000000000
          Offset3DY = 15.000000000000000000
          Points = <
            item
              Annotations = <>
              YValue = 60.000000000000000000
              YValueSecond = 50.000000000000000000
              YValueVariable = 60.000000000000000000
              YValueLow = 30.000000000000000000
              YValueClose = 55.000000000000000000
              YValueHigh = 60.000000000000000000
              YValueOpen = 30.000000000000000000
              YValueMedian = 59.000000000000000000
            end
            item
              Annotations = <>
              XValue = 1.000000000000000000
              YValue = 41.000000000000000000
              YValueSecond = 26.000000000000000000
              YValueVariable = 41.000000000000000000
              YValueLow = 18.000000000000000000
              YValueClose = 32.000000000000000000
              YValueHigh = 41.000000000000000000
              YValueOpen = 31.000000000000000000
              YValueMedian = 44.000000000000000000
            end
            item
              Annotations = <>
              XValue = 2.000000000000000000
              YValue = 110.000000000000000000
              YValueSecond = 96.000000000000000000
              YValueVariable = 110.000000000000000000
              YValueLow = 67.000000000000000000
              YValueClose = 107.000000000000000000
              YValueHigh = 110.000000000000000000
              YValueOpen = 75.000000000000000000
              YValueMedian = 113.000000000000000000
            end
            item
              Annotations = <>
              XValue = 3.000000000000000000
              YValue = 86.000000000000000000
              YValueSecond = 69.000000000000000000
              YValueVariable = 86.000000000000000000
              YValueLow = 28.000000000000000000
              YValueClose = 31.000000000000000000
              YValueHigh = 86.000000000000000000
              YValueOpen = 50.000000000000000000
              YValueMedian = 89.000000000000000000
            end
            item
              Annotations = <>
              XValue = 4.000000000000000000
              YValue = 122.000000000000000000
              YValueSecond = 110.000000000000000000
              YValueVariable = 122.000000000000000000
              YValueLow = 51.000000000000000000
              YValueClose = 95.000000000000000000
              YValueHigh = 122.000000000000000000
              YValueOpen = 95.000000000000000000
              YValueMedian = 120.000000000000000000
            end
            item
              Annotations = <>
              XValue = 5.000000000000000000
              YValue = 87.000000000000000000
              YValueSecond = 71.000000000000000000
              YValueVariable = 87.000000000000000000
              YValueLow = 49.000000000000000000
              YValueClose = 68.000000000000000000
              YValueHigh = 87.000000000000000000
              YValueOpen = 51.000000000000000000
              YValueMedian = 86.000000000000000000
            end
            item
              Annotations = <>
              XValue = 6.000000000000000000
              YValue = 99.000000000000000000
              YValueSecond = 89.000000000000000000
              YValueVariable = 99.000000000000000000
              YValueLow = 49.000000000000000000
              YValueClose = 55.000000000000000000
              YValueHigh = 99.000000000000000000
              YValueOpen = 70.000000000000000000
              YValueMedian = 98.000000000000000000
            end
            item
              Annotations = <>
              XValue = 7.000000000000000000
              YValue = 25.000000000000000000
              YValueSecond = 12.000000000000000000
              YValueVariable = 25.000000000000000000
              YValueLow = 7.000000000000000000
              YValueClose = 12.000000000000000000
              YValueHigh = 25.000000000000000000
              YValueOpen = 17.000000000000000000
              YValueMedian = 29.000000000000000000
            end
            item
              Annotations = <>
              XValue = 8.000000000000000000
              YValue = 99.000000000000000000
              YValueSecond = 81.000000000000000000
              YValueVariable = 99.000000000000000000
              YValueLow = 46.000000000000000000
              YValueClose = 76.000000000000000000
              YValueHigh = 99.000000000000000000
              YValueOpen = 52.000000000000000000
              YValueMedian = 101.000000000000000000
            end
            item
              Annotations = <>
              XValue = 9.000000000000000000
              YValue = 85.000000000000000000
              YValueSecond = 69.000000000000000000
              YValueVariable = 85.000000000000000000
              YValueLow = 37.000000000000000000
              YValueClose = 52.000000000000000000
              YValueHigh = 85.000000000000000000
              YValueOpen = 44.000000000000000000
              YValueMedian = 84.000000000000000000
            end
            item
              Annotations = <>
              XValue = 10.000000000000000000
              YValue = 52.000000000000000000
              YValueSecond = 39.000000000000000000
              YValueVariable = 52.000000000000000000
              YValueLow = 22.000000000000000000
              YValueClose = 43.000000000000000000
              YValueHigh = 52.000000000000000000
              YValueOpen = 28.000000000000000000
              YValueMedian = 54.000000000000000000
            end>
          Legend.Fill.Color = 16775416
          Legend.Font.Charset = DEFAULT_CHARSET
          Legend.Font.Color = clWindowText
          Legend.Font.Height = -11
          Legend.Font.Name = 'Segoe UI'
          Legend.Font.Style = []
          Legend.Left = -10.000000000000000000
          Legend.Stroke.Color = clGray
          Stroke.Color = 6437154
          XGrid.Visible = True
          XValues.MajorUnit = 1.000000000000000000
          XValues.MajorUnitFont.Charset = DEFAULT_CHARSET
          XValues.MajorUnitFont.Color = clWindowText
          XValues.MajorUnitFont.Height = -11
          XValues.MajorUnitFont.Name = 'Segoe UI'
          XValues.MajorUnitFont.Style = []
          XValues.MajorUnitFormat = '%.0f'
          XValues.MajorUnitSpacing = 5.000000000000000000
          XValues.MajorUnitTickMarkSize = 10.000000000000000000
          XValues.MajorUnitTickMarkColor = clSilver
          XValues.MinorUnitFont.Charset = DEFAULT_CHARSET
          XValues.MinorUnitFont.Color = clWindowText
          XValues.MinorUnitFont.Height = -11
          XValues.MinorUnitFont.Name = 'Segoe UI'
          XValues.MinorUnitFont.Style = []
          XValues.MinorUnitFormat = '%.0f'
          XValues.MinorUnitSpacing = 5.000000000000000000
          XValues.MinorUnitTickMarkSize = 7.000000000000000000
          XValues.MinorUnitTickMarkColor = clSilver
          XValues.Title.Font.Charset = DEFAULT_CHARSET
          XValues.Title.Font.Color = clWindowText
          XValues.Title.Font.Height = -11
          XValues.Title.Font.Name = 'Segoe UI'
          XValues.Title.Font.Style = []
          XValues.Title.TextMargins.Left = 0
          XValues.Title.TextMargins.Top = 0
          XValues.Title.TextMargins.Right = 0
          XValues.Title.TextMargins.Bottom = 0
          XValues.Title.Text = 'X-Axis Series 1'
          YGrid.Visible = True
          YValues.MajorUnit = 1.000000000000000000
          YValues.MajorUnitFont.Charset = DEFAULT_CHARSET
          YValues.MajorUnitFont.Color = clWindowText
          YValues.MajorUnitFont.Height = -11
          YValues.MajorUnitFont.Name = 'Segoe UI'
          YValues.MajorUnitFont.Style = []
          YValues.MajorUnitFormat = '%.2f'
          YValues.MajorUnitSpacing = 5.000000000000000000
          YValues.MajorUnitTickMarkSize = 10.000000000000000000
          YValues.MajorUnitTickMarkColor = clSilver
          YValues.MinorUnitFont.Charset = DEFAULT_CHARSET
          YValues.MinorUnitFont.Color = clWindowText
          YValues.MinorUnitFont.Height = -11
          YValues.MinorUnitFont.Name = 'Segoe UI'
          YValues.MinorUnitFont.Style = []
          YValues.MinorUnitFormat = '%.2f'
          YValues.MinorUnitSpacing = 5.000000000000000000
          YValues.MinorUnitTickMarkSize = 7.000000000000000000
          YValues.MinorUnitTickMarkColor = clSilver
          YValues.Title.Font.Charset = DEFAULT_CHARSET
          YValues.Title.Font.Color = clWindowText
          YValues.Title.Font.Height = -11
          YValues.Title.Font.Name = 'Segoe UI'
          YValues.Title.Font.Style = []
          YValues.Title.TextMargins.Left = 0
          YValues.Title.TextMargins.Top = 0
          YValues.Title.TextMargins.Right = 0
          YValues.Title.TextMargins.Bottom = 0
          YValues.Title.Text = 'Y-Axis Series 1'
          Crosshair.XTextStroke.Color = 12874308
          Crosshair.XTextFill.Color = 12874308
          Crosshair.XTextFont.Charset = DEFAULT_CHARSET
          Crosshair.XTextFont.Color = clWhite
          Crosshair.XTextFont.Height = -11
          Crosshair.XTextFont.Name = 'Segoe UI'
          Crosshair.XTextFont.Style = []
          Crosshair.YTextStroke.Color = 12874308
          Crosshair.YTextFill.Color = 12874308
          Crosshair.YTextFont.Charset = DEFAULT_CHARSET
          Crosshair.YTextFont.Color = clWhite
          Crosshair.YTextFont.Height = -11
          Crosshair.YTextFont.Name = 'Segoe UI'
          Crosshair.YTextFont.Style = []
          Crosshair.HorizontalLineStroke.Color = 12874308
          Crosshair.VerticalLineStroke.Color = 12874308
        end
        item
          AnimationFactor = 4.000000000000000000
          AutoYRange = arCommonZeroBased
          Bar.Width = 65.000000000000000000
          Bar.Spacing = 20.000000000000000000
          MultiPoint.Width = 65.000000000000000000
          Pie.Size = 200.000000000000000000
          Pie.Margins.Left = 10
          Pie.Margins.Top = 10
          Pie.Margins.Right = 10
          Pie.Margins.Bottom = 10
          Pie.SweepAngle = 360.000000000000000000
          Fill.Color = 3243501
          LegendText = 'Series 1'
          Labels.Fill.Color = 16775416
          Labels.Font.Charset = DEFAULT_CHARSET
          Labels.Font.Color = clWindowText
          Labels.Font.Height = -11
          Labels.Font.Name = 'Segoe UI'
          Labels.Font.Style = []
          Labels.Format = '%.2f'
          Labels.OffsetY = -10.000000000000000000
          Labels.Stroke.Color = clGray
          Labels.Visible = True
          Markers.Fill.Color = 3243501
          Markers.Height = 10.000000000000000000
          Markers.Stroke.Color = 1588854
          Markers.Width = 10.000000000000000000
          MaxX = 10.000000000000000000
          MaxY = 10.000000000000000000
          MaxYOffsetPercentage = 10.000000000000000000
          Mode = smStatistical
          Offset3DX = 15.000000000000000000
          Offset3DY = 15.000000000000000000
          Points = <
            item
              Annotations = <>
              YValue = 23.000000000000000000
              YValueSecond = 11.000000000000000000
              YValueVariable = 23.000000000000000000
              YValueLow = 5.000000000000000000
              YValueClose = 20.000000000000000000
              YValueHigh = 23.000000000000000000
              YValueOpen = 16.000000000000000000
              YValueMedian = 20.000000000000000000
            end
            item
              Annotations = <>
              XValue = 1.000000000000000000
              YValue = 123.000000000000000000
              YValueSecond = 111.000000000000000000
              YValueVariable = 123.000000000000000000
              YValueLow = 50.000000000000000000
              YValueClose = 110.000000000000000000
              YValueHigh = 123.000000000000000000
              YValueOpen = 86.000000000000000000
              YValueMedian = 122.000000000000000000
            end
            item
              Annotations = <>
              XValue = 2.000000000000000000
              YValue = 71.000000000000000000
              YValueSecond = 60.000000000000000000
              YValueVariable = 71.000000000000000000
              YValueLow = 19.000000000000000000
              YValueClose = 55.000000000000000000
              YValueHigh = 71.000000000000000000
              YValueOpen = 30.000000000000000000
              YValueMedian = 73.000000000000000000
            end
            item
              Annotations = <>
              XValue = 3.000000000000000000
              YValue = 39.000000000000000000
              YValueSecond = 26.000000000000000000
              YValueVariable = 39.000000000000000000
              YValueLow = 10.000000000000000000
              YValueClose = 16.000000000000000000
              YValueHigh = 39.000000000000000000
              YValueOpen = 20.000000000000000000
              YValueMedian = 35.000000000000000000
            end
            item
              Annotations = <>
              XValue = 4.000000000000000000
              YValue = 35.000000000000000000
              YValueSecond = 23.000000000000000000
              YValueVariable = 35.000000000000000000
              YValueLow = 9.000000000000000000
              YValueClose = 31.000000000000000000
              YValueHigh = 35.000000000000000000
              YValueOpen = 15.000000000000000000
              YValueMedian = 31.000000000000000000
            end
            item
              Annotations = <>
              XValue = 5.000000000000000000
              YValue = 72.000000000000000000
              YValueSecond = 57.000000000000000000
              YValueVariable = 72.000000000000000000
              YValueLow = 38.000000000000000000
              YValueClose = 55.000000000000000000
              YValueHigh = 72.000000000000000000
              YValueOpen = 44.000000000000000000
              YValueMedian = 69.000000000000000000
            end
            item
              Annotations = <>
              XValue = 6.000000000000000000
              YValue = 79.000000000000000000
              YValueSecond = 67.000000000000000000
              YValueVariable = 79.000000000000000000
              YValueLow = 37.000000000000000000
              YValueClose = 52.000000000000000000
              YValueHigh = 79.000000000000000000
              YValueOpen = 60.000000000000000000
              YValueMedian = 80.000000000000000000
            end
            item
              Annotations = <>
              XValue = 7.000000000000000000
              YValue = 67.000000000000000000
              YValueSecond = 57.000000000000000000
              YValueVariable = 67.000000000000000000
              YValueLow = 29.000000000000000000
              YValueClose = 54.000000000000000000
              YValueHigh = 67.000000000000000000
              YValueOpen = 38.000000000000000000
              YValueMedian = 70.000000000000000000
            end
            item
              Annotations = <>
              XValue = 8.000000000000000000
              YValue = 121.000000000000000000
              YValueSecond = 105.000000000000000000
              YValueVariable = 121.000000000000000000
              YValueLow = 52.000000000000000000
              YValueClose = 89.000000000000000000
              YValueHigh = 121.000000000000000000
              YValueOpen = 80.000000000000000000
              YValueMedian = 123.000000000000000000
            end
            item
              Annotations = <>
              XValue = 9.000000000000000000
              YValue = 21.000000000000000000
              YValueSecond = 3.000000000000000000
              YValueVariable = 21.000000000000000000
              YValueLow = 3.000000000000000000
              YValueClose = 8.000000000000000000
              YValueHigh = 21.000000000000000000
              YValueOpen = 8.000000000000000000
              YValueMedian = 22.000000000000000000
            end
            item
              Annotations = <>
              XValue = 10.000000000000000000
              YValue = 81.000000000000000000
              YValueSecond = 63.000000000000000000
              YValueVariable = 81.000000000000000000
              YValueLow = 33.000000000000000000
              YValueClose = 61.000000000000000000
              YValueHigh = 81.000000000000000000
              YValueOpen = 68.000000000000000000
              YValueMedian = 77.000000000000000000
            end>
          Legend.Fill.Color = 16775416
          Legend.Font.Charset = DEFAULT_CHARSET
          Legend.Font.Color = clWindowText
          Legend.Font.Height = -11
          Legend.Font.Name = 'Segoe UI'
          Legend.Font.Style = []
          Legend.Left = -10.000000000000000000
          Legend.Stroke.Color = clGray
          Stroke.Color = 1588854
          XValues.MajorUnit = 1.000000000000000000
          XValues.MajorUnitFont.Charset = DEFAULT_CHARSET
          XValues.MajorUnitFont.Color = clWindowText
          XValues.MajorUnitFont.Height = -11
          XValues.MajorUnitFont.Name = 'Segoe UI'
          XValues.MajorUnitFont.Style = []
          XValues.MajorUnitFormat = '%.0f'
          XValues.MajorUnitSpacing = 5.000000000000000000
          XValues.MajorUnitTickMarkSize = 10.000000000000000000
          XValues.MajorUnitTickMarkColor = clSilver
          XValues.MinorUnitFont.Charset = DEFAULT_CHARSET
          XValues.MinorUnitFont.Color = clWindowText
          XValues.MinorUnitFont.Height = -11
          XValues.MinorUnitFont.Name = 'Segoe UI'
          XValues.MinorUnitFont.Style = []
          XValues.MinorUnitFormat = '%.0f'
          XValues.MinorUnitSpacing = 5.000000000000000000
          XValues.MinorUnitTickMarkSize = 7.000000000000000000
          XValues.MinorUnitTickMarkColor = clSilver
          XValues.Title.Font.Charset = DEFAULT_CHARSET
          XValues.Title.Font.Color = clWindowText
          XValues.Title.Font.Height = -11
          XValues.Title.Font.Name = 'Segoe UI'
          XValues.Title.Font.Style = []
          XValues.Title.TextMargins.Left = 0
          XValues.Title.TextMargins.Top = 0
          XValues.Title.TextMargins.Right = 0
          XValues.Title.TextMargins.Bottom = 0
          XValues.Title.Text = 'X-Axis Series 2'
          XValues.Positions = []
          YValues.MajorUnit = 1.000000000000000000
          YValues.MajorUnitFont.Charset = DEFAULT_CHARSET
          YValues.MajorUnitFont.Color = clWindowText
          YValues.MajorUnitFont.Height = -11
          YValues.MajorUnitFont.Name = 'Segoe UI'
          YValues.MajorUnitFont.Style = []
          YValues.MajorUnitFormat = '%.2f'
          YValues.MajorUnitSpacing = 5.000000000000000000
          YValues.MajorUnitTickMarkSize = 10.000000000000000000
          YValues.MajorUnitTickMarkColor = clSilver
          YValues.MinorUnitFont.Charset = DEFAULT_CHARSET
          YValues.MinorUnitFont.Color = clWindowText
          YValues.MinorUnitFont.Height = -11
          YValues.MinorUnitFont.Name = 'Segoe UI'
          YValues.MinorUnitFont.Style = []
          YValues.MinorUnitFormat = '%.2f'
          YValues.MinorUnitSpacing = 5.000000000000000000
          YValues.MinorUnitTickMarkSize = 7.000000000000000000
          YValues.MinorUnitTickMarkColor = clSilver
          YValues.Title.Font.Charset = DEFAULT_CHARSET
          YValues.Title.Font.Color = clWindowText
          YValues.Title.Font.Height = -11
          YValues.Title.Font.Name = 'Segoe UI'
          YValues.Title.Font.Style = []
          YValues.Title.TextMargins.Left = 0
          YValues.Title.TextMargins.Top = 0
          YValues.Title.TextMargins.Right = 0
          YValues.Title.TextMargins.Bottom = 0
          YValues.Title.Text = 'Y-Axis Series 2'
          YValues.Positions = []
          Crosshair.XTextStroke.Color = 3243501
          Crosshair.XTextFill.Color = 3243501
          Crosshair.XTextFont.Charset = DEFAULT_CHARSET
          Crosshair.XTextFont.Color = clWhite
          Crosshair.XTextFont.Height = -11
          Crosshair.XTextFont.Name = 'Segoe UI'
          Crosshair.XTextFont.Style = []
          Crosshair.YTextStroke.Color = 3243501
          Crosshair.YTextFill.Color = 3243501
          Crosshair.YTextFont.Charset = DEFAULT_CHARSET
          Crosshair.YTextFont.Color = clWhite
          Crosshair.YTextFont.Height = -11
          Crosshair.YTextFont.Name = 'Segoe UI'
          Crosshair.YTextFont.Style = []
          Crosshair.HorizontalLineStroke.Color = 3243501
          Crosshair.VerticalLineStroke.Color = 3243501
        end>
      Title.Fill.Kind = gfkNone
      Title.Fill.Color = 16775416
      Title.Stroke.Color = clGray
      Title.Font.Charset = DEFAULT_CHARSET
      Title.Font.Color = clWindowText
      Title.Font.Height = -11
      Title.Font.Name = 'Segoe UI'
      Title.Font.Style = []
      Title.Height = 35.000000000000000000
      Title.TextHorizontalAlignment = gtaLeading
      Title.TextMargins.Left = 3
      Title.TextMargins.Top = 3
      Title.TextMargins.Right = 3
      Title.TextMargins.Bottom = 3
      Title.Text = 
        'Retail 3rd party sales totals of hand picked, cold pressed, firs' +
        't harvest, extra virgin, low altitude, select premium, export qu' +
        'ality, fresh packed, spanish olive oil by WeCanPressYourOlivesFr' +
        'eshIt LLC exported and imported for your private label sales'
      XAxis.Fill.Kind = gfkNone
      XAxis.Fill.Color = 16775416
      XAxis.Stroke.Color = clGray
      XAxis.Height = 35.000000000000000000
      YAxis.Fill.Kind = gfkNone
      YAxis.Fill.Color = 16775416
      YAxis.Stroke.Color = clGray
      YAxis.Width = 35.000000000000000000
      Adapter = chartDBAdaptStackedBar
      DefaultLoadOptions.XValuesFormatString = '%.0f'
      DefaultLoadOptions.YValuesFormatString = '%.2f'
      DefaultLoadOptions.MaxYOffsetPercentage = 5.000000000000000000
      OnLegendItemClick = TMSFNCBarChart1LegendItemClick
      Align = alClient
      TabOrder = 1
      object chartDBAdaptStackedBar: TTMSFNCChartDatabaseAdapter
        Left = 472
        Top = 272
        Width = 39
        Height = 39
        Visible = True
        AutoCreateSeries = False
        Source.DataSource = dsSalesBarChart
        Source.Series = <
          item
            YValue = 'SA2018'
            XValue = 'Month'
            XLabel = 'mdisp'
          end
          item
            YValue = 'SA2019'
            XValue = 'Month'
            XLabel = 'mdisp'
          end
          item
            YValue = 'SA2020'
            XValue = 'Month'
            XLabel = 'mdisp'
          end>
      end
    end
    object TMSFNCStackedAreaChart1: TTMSFNCStackedAreaChart
      Left = 1
      Top = 447
      Width = 695
      Height = 447
      Appearance.ColorList = <
        item
          Color = 16105559
        end
        item
          Color = 5644279
        end
        item
          Color = 7936771
        end
        item
          Color = 12275349
        end
        item
          Color = 1296366
        end
        item
          Color = 4350195
        end
        item
          Color = 16544551
        end
        item
          Color = 5820321
        end
        item
          Color = 10922240
        end
        item
          Color = 16376965
        end>
      Appearance.GlobalFont.Color = -1
      Appearance.GlobalFont.Scale = 1.000000000000000000
      Appearance.GlobalFont.Style = []
      Appearance.ColorScheme = ccsExcel
      Appearance.MonochromeColor = 11829830
      NativeCanvas = True
      ClickMargin = 10.000000000000000000
      Legend.Fill.Color = 16775416
      Legend.Stroke.Color = clGray
      Legend.Font.Charset = DEFAULT_CHARSET
      Legend.Font.Color = clWindowText
      Legend.Font.Height = -11
      Legend.Font.Name = 'Segoe UI'
      Legend.Font.Style = []
      Legend.Left = 10.000000000000000000
      Legend.Top = 10.000000000000000000
      Stroke.Color = clGray
      SeriesMargins.Left = 0
      SeriesMargins.Top = 0
      SeriesMargins.Right = 0
      SeriesMargins.Bottom = 0
      Series = <>
      Title.Fill.Kind = gfkNone
      Title.Fill.Color = 16775416
      Title.Stroke.Color = clGray
      Title.Font.Charset = DEFAULT_CHARSET
      Title.Font.Color = clWindowText
      Title.Font.Height = -11
      Title.Font.Name = 'Segoe UI'
      Title.Font.Style = []
      Title.Height = 35.000000000000000000
      Title.TextMargins.Left = 3
      Title.TextMargins.Top = 3
      Title.TextMargins.Right = 3
      Title.TextMargins.Bottom = 3
      Title.Text = 'Spanish Olive Oil by Month'
      XAxis.Fill.Kind = gfkNone
      XAxis.Fill.Color = 16775416
      XAxis.Stroke.Color = clGray
      XAxis.Height = 35.000000000000000000
      YAxis.Fill.Kind = gfkNone
      YAxis.Fill.Color = 16775416
      YAxis.Stroke.Color = clGray
      YAxis.Width = 35.000000000000000000
      Adapter = chartDBAdaptStackedArea
      DefaultLoadOptions.XValuesFormatString = '%.0f'
      DefaultLoadOptions.YValuesFormatString = '%.2f'
      DefaultLoadOptions.MaxYOffsetPercentage = 5.000000000000000000
      OnLegendItemClick = TMSFNCStackedAreaChart1LegendItemClick
      Align = alClient
      TabOrder = 2
      object chartDBAdaptStackedArea: TTMSFNCChartDatabaseAdapter
        Left = 488
        Top = 96
        Width = 39
        Height = 39
        Visible = True
        AutoCreateSeries = False
        Source.DataSource = dsSalesLines
        Source.Series = <
          item
            YValue = 'SA2018'
            XValue = 'Month'
            XLabel = 'mdisp'
          end
          item
            YValue = 'SA2019'
            XValue = 'Month'
            XLabel = 'mdisp'
          end
          item
            YValue = 'SA2020'
            XValue = 'Month'
            XLabel = 'mdisp'
          end>
        OnFieldsToSeries = chartDBAdaptStackedAreaFieldsToSeries
      end
    end
    object TMSFNCSpiderChart1: TTMSFNCSpiderChart
      Left = 696
      Top = 447
      Width = 420
      Height = 447
      Appearance.ColorList = <
        item
          Color = 16105559
        end
        item
          Color = 5644279
        end
        item
          Color = 7936771
        end
        item
          Color = 12275349
        end
        item
          Color = 1296366
        end
        item
          Color = 4350195
        end
        item
          Color = 16544551
        end
        item
          Color = 5820321
        end
        item
          Color = 10922240
        end
        item
          Color = 16376965
        end>
      Appearance.GlobalFont.Color = -1
      Appearance.GlobalFont.Scale = 1.000000000000000000
      Appearance.GlobalFont.Style = []
      Appearance.ColorScheme = ccsExcel
      Appearance.MonochromeColor = 11829830
      NativeCanvas = True
      ClickMargin = 10.000000000000000000
      Legend.Fill.Color = 16775416
      Legend.Stroke.Color = clGray
      Legend.Font.Charset = DEFAULT_CHARSET
      Legend.Font.Color = clWindowText
      Legend.Font.Height = -11
      Legend.Font.Name = 'Segoe UI'
      Legend.Font.Style = []
      Legend.Left = 10.000000000000000000
      Legend.Top = 10.000000000000000000
      Stroke.Color = clGray
      SeriesMargins.Left = 0
      SeriesMargins.Top = 20
      SeriesMargins.Right = 0
      SeriesMargins.Bottom = 20
      Series = <
        item
          AnimationFactor = 4.000000000000000000
          AutoYRange = arCommonZeroBased
          Bar.Width = 65.000000000000000000
          Bar.Spacing = 20.000000000000000000
          MultiPoint.Width = 65.000000000000000000
          Pie.Size = 200.000000000000000000
          Pie.Margins.Left = 10
          Pie.Margins.Top = 10
          Pie.Margins.Right = 10
          Pie.Margins.Bottom = 10
          Pie.SweepAngle = 360.000000000000000000
          Fill.Color = 12874308
          LegendText = 'Series 0'
          Labels.Fill.Color = 16775416
          Labels.Font.Charset = DEFAULT_CHARSET
          Labels.Font.Color = clWindowText
          Labels.Font.Height = -11
          Labels.Font.Name = 'Segoe UI'
          Labels.Font.Style = []
          Labels.Format = '%.2f'
          Labels.OffsetY = -10.000000000000000000
          Labels.Stroke.Color = clGray
          Markers.Fill.Color = 12874308
          Markers.Height = 10.000000000000000000
          Markers.Stroke.Color = 6437154
          Markers.Width = 10.000000000000000000
          MaxX = 10.000000000000000000
          MaxY = 10.000000000000000000
          MaxYOffsetPercentage = 10.000000000000000000
          Offset3DX = 15.000000000000000000
          Offset3DY = 15.000000000000000000
          Points = <
            item
              Annotations = <>
              YValue = 30.000000000000000000
              YValueSecond = 14.000000000000000000
              YValueVariable = 30.000000000000000000
              YValueLow = 5.000000000000000000
              YValueClose = 7.000000000000000000
              YValueHigh = 30.000000000000000000
              YValueOpen = 13.000000000000000000
              YValueMedian = 29.000000000000000000
            end
            item
              Annotations = <>
              XValue = 1.000000000000000000
              YValue = 20.000000000000000000
              YValueSecond = 7.000000000000000000
              YValueVariable = 20.000000000000000000
              YValueLow = 1.000000000000000000
              YValueClose = 6.000000000000000000
              YValueHigh = 20.000000000000000000
              YValueOpen = 8.000000000000000000
              YValueMedian = 19.000000000000000000
            end
            item
              Annotations = <>
              XValue = 2.000000000000000000
              YValue = 38.000000000000000000
              YValueSecond = 19.000000000000000000
              YValueVariable = 38.000000000000000000
              YValueLow = 6.000000000000000000
              YValueClose = 13.000000000000000000
              YValueHigh = 38.000000000000000000
              YValueOpen = 8.000000000000000000
              YValueMedian = 40.000000000000000000
            end
            item
              Annotations = <>
              XValue = 3.000000000000000000
              YValue = 25.000000000000000000
              YValueSecond = 7.000000000000000000
              YValueVariable = 25.000000000000000000
              YValueLow = 7.000000000000000000
              YValueClose = 14.000000000000000000
              YValueHigh = 25.000000000000000000
              YValueOpen = 18.000000000000000000
              YValueMedian = 20.000000000000000000
            end
            item
              Annotations = <>
              XValue = 4.000000000000000000
              YValue = 28.000000000000000000
              YValueSecond = 17.000000000000000000
              YValueVariable = 28.000000000000000000
              YValueLow = 6.000000000000000000
              YValueClose = 17.000000000000000000
              YValueHigh = 28.000000000000000000
              YValueOpen = 23.000000000000000000
              YValueMedian = 29.000000000000000000
            end
            item
              Annotations = <>
              XValue = 5.000000000000000000
              YValue = 27.000000000000000000
              YValueSecond = 17.000000000000000000
              YValueVariable = 27.000000000000000000
              YValueLow = 7.000000000000000000
              YValueClose = 10.000000000000000000
              YValueHigh = 27.000000000000000000
              YValueOpen = 12.000000000000000000
              YValueMedian = 30.000000000000000000
            end>
          Legend.Fill.Color = 16775416
          Legend.Font.Charset = DEFAULT_CHARSET
          Legend.Font.Color = clWindowText
          Legend.Font.Height = -11
          Legend.Font.Name = 'Segoe UI'
          Legend.Font.Style = []
          Legend.Left = -10.000000000000000000
          Legend.Stroke.Color = clGray
          Legend.Visible = True
          Stroke.Color = 6437154
          XGrid.Visible = True
          XValues.MajorUnit = 1.000000000000000000
          XValues.MajorUnitFont.Charset = DEFAULT_CHARSET
          XValues.MajorUnitFont.Color = clWindowText
          XValues.MajorUnitFont.Height = -11
          XValues.MajorUnitFont.Name = 'Segoe UI'
          XValues.MajorUnitFont.Style = []
          XValues.MajorUnitFormat = '%.0f'
          XValues.MajorUnitSpacing = 5.000000000000000000
          XValues.MajorUnitTickMarkSize = 10.000000000000000000
          XValues.MajorUnitTickMarkColor = clSilver
          XValues.MinorUnitFont.Charset = DEFAULT_CHARSET
          XValues.MinorUnitFont.Color = clWindowText
          XValues.MinorUnitFont.Height = -11
          XValues.MinorUnitFont.Name = 'Segoe UI'
          XValues.MinorUnitFont.Style = []
          XValues.MinorUnitFormat = '%.0f'
          XValues.MinorUnitSpacing = 5.000000000000000000
          XValues.MinorUnitTickMarkSize = 7.000000000000000000
          XValues.MinorUnitTickMarkColor = clSilver
          XValues.Title.Font.Charset = DEFAULT_CHARSET
          XValues.Title.Font.Color = clWindowText
          XValues.Title.Font.Height = -11
          XValues.Title.Font.Name = 'Segoe UI'
          XValues.Title.Font.Style = []
          XValues.Title.TextMargins.Left = 0
          XValues.Title.TextMargins.Top = 0
          XValues.Title.TextMargins.Right = 0
          XValues.Title.TextMargins.Bottom = 0
          XValues.Title.Text = 'X-Axis Series 1'
          YGrid.Visible = True
          YValues.MajorUnit = 1.000000000000000000
          YValues.MajorUnitFont.Charset = DEFAULT_CHARSET
          YValues.MajorUnitFont.Color = clWindowText
          YValues.MajorUnitFont.Height = -11
          YValues.MajorUnitFont.Name = 'Segoe UI'
          YValues.MajorUnitFont.Style = []
          YValues.MajorUnitFormat = '%.2f'
          YValues.MajorUnitSpacing = 5.000000000000000000
          YValues.MajorUnitTickMarkSize = 10.000000000000000000
          YValues.MajorUnitTickMarkColor = clSilver
          YValues.MinorUnitFont.Charset = DEFAULT_CHARSET
          YValues.MinorUnitFont.Color = clWindowText
          YValues.MinorUnitFont.Height = -11
          YValues.MinorUnitFont.Name = 'Segoe UI'
          YValues.MinorUnitFont.Style = []
          YValues.MinorUnitFormat = '%.2f'
          YValues.MinorUnitSpacing = 5.000000000000000000
          YValues.MinorUnitTickMarkSize = 7.000000000000000000
          YValues.MinorUnitTickMarkColor = clSilver
          YValues.Title.Font.Charset = DEFAULT_CHARSET
          YValues.Title.Font.Color = clWindowText
          YValues.Title.Font.Height = -11
          YValues.Title.Font.Name = 'Segoe UI'
          YValues.Title.Font.Style = []
          YValues.Title.TextMargins.Left = 0
          YValues.Title.TextMargins.Top = 0
          YValues.Title.TextMargins.Right = 0
          YValues.Title.TextMargins.Bottom = 0
          YValues.Title.Text = 'Y-Axis Series 1'
          Crosshair.XTextStroke.Color = 12874308
          Crosshair.XTextFill.Color = 12874308
          Crosshair.XTextFont.Charset = DEFAULT_CHARSET
          Crosshair.XTextFont.Color = clWhite
          Crosshair.XTextFont.Height = -11
          Crosshair.XTextFont.Name = 'Segoe UI'
          Crosshair.XTextFont.Style = []
          Crosshair.YTextStroke.Color = 12874308
          Crosshair.YTextFill.Color = 12874308
          Crosshair.YTextFont.Charset = DEFAULT_CHARSET
          Crosshair.YTextFont.Color = clWhite
          Crosshair.YTextFont.Height = -11
          Crosshair.YTextFont.Name = 'Segoe UI'
          Crosshair.YTextFont.Style = []
          Crosshair.HorizontalLineStroke.Color = 12874308
          Crosshair.VerticalLineStroke.Color = 12874308
        end>
      Title.Fill.Kind = gfkNone
      Title.Fill.Color = 16775416
      Title.Stroke.Color = clGray
      Title.Font.Charset = DEFAULT_CHARSET
      Title.Font.Color = clWindowText
      Title.Font.Height = -11
      Title.Font.Name = 'Segoe UI'
      Title.Font.Style = []
      Title.Height = 35.000000000000000000
      Title.TextMargins.Left = 3
      Title.TextMargins.Top = 3
      Title.TextMargins.Right = 3
      Title.TextMargins.Bottom = 3
      Title.Text = 'TMS FNC Chart'
      XAxis.Fill.Kind = gfkNone
      XAxis.Fill.Color = 16775416
      XAxis.Stroke.Color = clGray
      XAxis.Height = 35.000000000000000000
      YAxis.Fill.Kind = gfkNone
      YAxis.Fill.Color = 16775416
      YAxis.Stroke.Color = clGray
      YAxis.Width = 35.000000000000000000
      Adapter = chartDBAdaptSpider
      DefaultLoadOptions.XValuesFormatString = '%.0f'
      DefaultLoadOptions.YValuesFormatString = '%.2f'
      DefaultLoadOptions.MaxYOffsetPercentage = 5.000000000000000000
      OnLegendItemClick = TMSFNCSpiderChart1LegendItemClick
      Align = alClient
      TabOrder = 3
      object chartDBAdaptSpider: TTMSFNCChartDatabaseAdapter
        Left = 112
        Top = 304
        Width = 39
        Height = 39
        Visible = True
        AutoCreateSeries = False
        Source.DataSource = dsSalesSpider
        Source.Series = <
          item
            YValue = 'SA2018'
            XValue = 'Month'
            XLabel = 'mdisp'
          end
          item
            YValue = 'SA2019'
            XValue = 'Month'
            XLabel = 'mdisp'
          end
          item
            YValue = 'SA2020'
            XValue = 'Month'
            XLabel = 'mdisp'
          end>
        OnFieldsToSeries = chartDBAdaptSpiderFieldsToSeries
        OnFieldsToPoint = chartDBAdaptSpiderFieldsToPoint
      end
    end
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=:memory:'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    Left = 824
    Top = 808
  end
  object dsSalesBarChart: TDataSource
    DataSet = fdqSalesChart
    Left = 824
    Top = 504
  end
  object dsSalesGrid: TDataSource
    DataSet = FDMemTableSalesGrid
    Left = 976
    Top = 496
  end
  object dsSalesSpider: TDataSource
    DataSet = fdqSalesSpider
    Left = 1152
    Top = 488
  end
  object fdqSalesChart: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from sales_chart')
    Left = 824
    Top = 648
    object fdqSalesChartMonth: TIntegerField
      FieldName = 'Month'
      Origin = 'Month'
      Required = True
    end
    object fdqSalesChartmdisp: TStringField
      FieldName = 'mdisp'
      Origin = 'mdisp'
      Size = 32767
    end
    object fdqSalesChartSA2018: TBCDField
      FieldName = 'SA2018'
      Origin = 'SA2018'
      Precision = 10
      Size = 2
    end
    object fdqSalesChartSA2019: TBCDField
      FieldName = 'SA2019'
      Origin = 'SA2019'
      Precision = 10
      Size = 2
    end
    object fdqSalesChartSA2020: TBCDField
      FieldName = 'SA2020'
      Origin = 'SA2020'
      Precision = 10
      Size = 2
    end
  end
  object FDMemTableSalesGrid: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 992
    Top = 640
  end
  object fdqSalesLines: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from sales_chart')
    Left = 696
    Top = 656
    object IntegerField1: TIntegerField
      FieldName = 'Month'
      Origin = 'Month'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'mdisp'
      Origin = 'mdisp'
      Size = 32767
    end
    object BCDField1: TBCDField
      FieldName = 'SA2018'
      Origin = 'SA2018'
      Precision = 10
      Size = 2
    end
    object BCDField2: TBCDField
      FieldName = 'SA2019'
      Origin = 'SA2019'
      Precision = 10
      Size = 2
    end
    object BCDField3: TBCDField
      FieldName = 'SA2020'
      Origin = 'SA2020'
      Precision = 10
      Size = 2
    end
  end
  object dsSalesLines: TDataSource
    DataSet = fdqSalesLines
    Left = 696
    Top = 528
  end
  object fdqSalesSpider: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'Select m.month, m.displayName as mdisp, s1.amount as SA2018, s2.' +
        'amount as SA2019, s3.amount as SA2020 from Chart_Months m left j' +
        'oin '
      
        ' sales_2018 s1 on m.month = s1.month left join sales_2019 s2 on ' +
        'm.month = s2.month left join sales_2020 s3 on m.month = s3.month' +
        ';'
      '')
    Left = 1160
    Top = 640
    object IntegerField2: TIntegerField
      FieldName = 'Month'
      Origin = 'Month'
      Required = True
    end
    object StringField2: TStringField
      FieldName = 'mdisp'
      Origin = 'mdisp'
      Size = 32767
    end
    object BCDField4: TBCDField
      FieldName = 'SA2018'
      Origin = 'SA2018'
      Precision = 10
      Size = 2
    end
    object BCDField5: TBCDField
      FieldName = 'SA2019'
      Origin = 'SA2019'
      Precision = 10
      Size = 2
    end
    object BCDField6: TBCDField
      FieldName = 'SA2020'
      Origin = 'SA2020'
      Precision = 10
      Size = 2
    end
  end
  object tmrUpdateChart: TTimer
    Left = 680
    Top = 456
  end
end
