object frmMarshalExercise: TfrmMarshalExercise
  Width = 1101
  Height = 1129
  Caption = 'Marshal Demo Web 2023'
  CSSLibrary = cssBootstrap
  ElementFont = efCSS
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  OnCreate = WebFormCreate
  object divTheme: TWebHTMLDiv
    Left = 0
    Top = 0
    Width = 1101
    Height = 1129
    ElementClassName = 'theme1 bg-warning w-100 h-100 overflow-hidden'
    Align = alClient
    Role = ''
    object divBody: TWebScrollBox
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 1081
      Height = 1109
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      ElementClassName = 'bg-dark rounded'
      Align = alClient
      BorderStyle = bsSingle
      object pnlTop: TWebPanel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 1071
        Height = 60
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ElementClassName = 'card  '
        Align = alTop
        Caption = 'Marshal Web Core Demo :  Fix Stair-Step Videos'
        ElementBodyClassName = 'card-body'
        ElementFont = efCSS
        ElementPosition = epRelative
      end
      object wdivVideoCards: TWebHTMLDiv
        AlignWithMargins = True
        Left = 3
        Top = 73
        Width = 1075
        Height = 325
        ElementClassName = 'row'
        ElementID = 'vidcards'
        HeightStyle = ssAuto
        Align = alTop
        ChildOrder = 1
        ElementPosition = epRelative
        ElementFont = efCSS
        HTML.Strings = (
          '  ')
        Role = ''
      end
      object wdivNotes: TWebHTMLDiv
        AlignWithMargins = True
        Left = 3
        Top = 404
        Width = 1075
        Height = 756
        ElementClassName = 'bg-light rounded row'
        HeightStyle = ssAuto
        WidthStyle = ssAuto
        Align = alTop
        ChildOrder = 2
        ElementPosition = epRelative
        ElementFont = efCSS
        Role = ''
        object wdivExercise: TWebHTMLDiv
          AlignWithMargins = True
          Left = 8
          Top = 8
          Width = 353
          Height = 740
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          ElementClassName = 'col-sm-6 rounded'
          HeightStyle = ssAuto
          WidthStyle = ssAuto
          Align = alLeft
          ElementPosition = epRelative
          ElementFont = efCSS
          Role = ''
          object waNotes: TWebAccordion
            AlignWithMargins = True
            Left = 8
            Top = 8
            Width = 337
            Height = 724
            Margins.Left = 8
            Margins.Top = 8
            Margins.Right = 8
            Margins.Bottom = 8
            ElementClassName = 'accordion rounded'
            HeightStyle = ssAuto
            WidthStyle = ssAuto
            Align = alClient
            ChildOrder = 3
            ElementFont = efCSS
            ElementSectionClassName = 'accordion-item'
            ElementContentClassName = 'accordion-body text-wrap'
            ElementPosition = epIgnore
            Sections = <
              item
                Caption = 'Marshal Front End Inspection - Collapse after reading'
                Content = 'Contenet for sectino 1'
                Tag = 0
              end
              item
                Caption = 'Release notes - updates to this demo'
                Content = 'Contenet for section 2'
                Tag = 0
              end>
          end
        end
        object WebHTMLDiv3: TWebHTMLDiv
          Left = 369
          Top = 0
          Width = 706
          Height = 756
          ElementClassName = 'col-sm-6 bg-info rounded'
          HeightStyle = ssAuto
          WidthStyle = ssAuto
          Align = alClient
          ChildOrder = 2
          ElementPosition = epIgnore
          ElementFont = efCSS
          Role = ''
          object WebGridPanel1: TWebGridPanel
            Left = 0
            Top = 0
            Width = 706
            Height = 756
            ElementClassName = 'bg-warning rounded'
            HeightStyle = ssAuto
            WidthStyle = ssAuto
            Align = alClient
            ColumnCollection = <
              item
                SizeStyle = ssAuto
                Value = 95
              end
              item
                SizeStyle = ssAuto
                Value = 5
              end>
            ControlCollection = <
              item
                Column = 0
                Row = 0
                Control = wpMarshalTools
              end
              item
                Column = 0
                Row = 0
                Control = WebHTMLDiv1
              end
              item
                Column = 0
                Row = 0
                Control = wDivMarshal
              end
              item
                Column = 0
                Row = 0
                Control = WebHTMLDiv2
              end>
            Color = clWhite
            ElementPosition = epIgnore
            GridLineColor = clBlack
            RowCollection = <
              item
                Value = 5
              end
              item
                Value = 95
              end>
            DesignSize = (
              706
              756)
            object wpMarshalTools: TWebPanel
              Left = 2
              Top = 2
              Width = 667
              Height = 34
              ElementClassName = 'card  bg-info'
              ElementID = 'kkkkk'
              HeightStyle = ssAuto
              WidthStyle = ssAuto
              Align = alClient
              Alignment = taRightJustify
              Anchors = []
              Caption = '.                               Marshal Docked'
              ElementBodyClassName = 'text-end bg-info'
              ElementFont = efCSS
              ElementPosition = epIgnore
              ShowCaption = False
              object btnMarshal: TWebButton
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 125
                Height = 28
                Align = alLeft
                Caption = 'Show Marshal Modal'
                ElementClassName = 'btn btn-primary'
                ElementID = 'marshal-btn'
                ElementFont = efCSS
                ElementPosition = epRelative
                HeightStyle = ssAuto
                HeightPercent = 100.000000000000000000
                WidthStyle = ssAuto
                WidthPercent = 100.000000000000000000
                OnClick = btnMarshalClick
              end
            end
            object WebHTMLDiv1: TWebHTMLDiv
              Left = 673
              Top = 2
              Width = 100
              Height = 40
              HeightStyle = ssAuto
              WidthStyle = ssAuto
              Anchors = []
              ChildOrder = 1
              ElementPosition = epIgnore
              ElementFont = efCSS
              Role = ''
            end
            object wDivMarshal: TWebHTMLDiv
              AlignWithMargins = True
              Left = 2
              Top = 40
              Width = 667
              Height = 714
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Margins.Bottom = 10
              ElementID = 'elMarshal'
              HeightStyle = ssAuto
              WidthStyle = ssAuto
              Align = alClient
              Anchors = []
              ChildOrder = 2
              ElementPosition = epIgnore
              ElementFont = efCSS
              Role = ''
            end
            object WebHTMLDiv2: TWebHTMLDiv
              Left = 673
              Top = 40
              Width = 100
              Height = 40
              HeightStyle = ssAuto
              WidthStyle = ssAuto
              Anchors = []
              ChildOrder = 3
              ElementPosition = epIgnore
              ElementFont = efCSS
              Role = ''
            end
          end
        end
      end
    end
  end
  object WebTimer1: TWebTimer
    Enabled = False
    Interval = 200
    OnTimer = WebTimer1Timer
    Left = 496
    Top = 416
  end
end
