object frmRTTKVCL: TfrmRTTKVCL
  Left = 0
  Top = 0
  Caption = 'RTTK VCL Sample'
  ClientHeight = 336
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 22
    Align = alTop
    TabOrder = 0
    object SERTTKMarshal1: TSERTTKMarshal
      Left = 1
      Top = 1
      Width = 75
      Height = 20
      Align = alLeft
      Caption = 'Marshal'
      TabOrder = 0
    end
    object btnChildForm: TButton
      Left = 559
      Top = 1
      Width = 75
      Height = 20
      Align = alRight
      Caption = 'Child Form'
      TabOrder = 1
      OnClick = btnChildFormClick
    end
    object btnRuntimeDM: TButton
      Left = 484
      Top = 1
      Width = 75
      Height = 20
      Align = alRight
      Caption = 'Runtime DM'
      TabOrder = 2
      OnClick = btnRuntimeDMClick
    end
  end
  object pcWorkSpace: TPageControl
    Left = 0
    Top = 22
    Width = 635
    Height = 314
    ActivePage = tsIfDef
    Align = alClient
    TabOrder = 1
    object tsLabel: TTabSheet
      Caption = 'Label'
      object pnlFoxLabel: TPanel
        Left = 160
        Top = 108
        Width = 121
        Height = 57
        Align = alCustom
        TabOrder = 0
        object Label1: TLabel
          Left = 1
          Top = 1
          Width = 235
          Height = 55
          Align = alLeft
          Caption = 'Fox Jump Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitHeight = 39
        end
        object Edit1: TEdit
          Left = 0
          Top = 16
          Width = 121
          Height = 21
          TabOrder = 0
          Text = 'The Quick Brown Fox Jumped over the lazy Moon'
          OnChange = Edit1Change
        end
      end
      object ListBox1: TListBox
        Left = 0
        Top = 0
        Width = 121
        Height = 286
        Align = alLeft
        ItemHeight = 13
        TabOrder = 1
      end
    end
    object tsIfDef: TTabSheet
      Caption = 'If Defined'
      ImageIndex = 1
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 627
        Height = 13
        Align = alTop
        Caption = 'Label2'
        ExplicitWidth = 31
      end
      object Panel1: TPanel
        Left = 222
        Top = 88
        Width = 185
        Height = 81
        Align = alCustom
        BorderStyle = bsSingle
        Caption = 'Application Help : Disabled in  release'
        TabOrder = 0
        VerticalAlignment = taAlignTop
        object btnMarshal: TButton
          Left = 1
          Top = 51
          Width = 179
          Height = 25
          Align = alBottom
          Caption = 'Marshal'
          TabOrder = 0
          OnClick = btnMarshalClick
        end
      end
      object Panel3: TPanel
        Left = 3
        Top = 242
        Width = 598
        Height = 41
        Caption = 'Panel3'
        TabOrder = 1
        object cbLeakObjects: TCheckBox
          Left = 48
          Top = 16
          Width = 97
          Height = 17
          Caption = 'Leak Objects'
          TabOrder = 0
          OnClick = cbLeakObjectsClick
        end
        object cbStallShutdown: TCheckBox
          Left = 338
          Top = 16
          Width = 97
          Height = 17
          Caption = 'Stall Shutdown'
          TabOrder = 1
          OnClick = cbStallShutdownClick
        end
        object edtShutdownStall: TMaskEdit
          Left = 448
          Top = 16
          Width = 121
          Height = 21
          TabOrder = 2
          Text = '2500'
        end
      end
    end
    object tsRunTimeComp: TTabSheet
      Caption = 'RT Comps'
      ImageIndex = 2
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 627
        Height = 41
        Align = alTop
        Caption = 'Panel2'
        TabOrder = 0
        object btnDeleteMemo: TSpeedButton
          Left = 504
          Top = 1
          Width = 122
          Height = 39
          Align = alRight
          Caption = 'Delete Memo'
          OnClick = btnDeleteMemoClick
        end
        object btnAddMemo: TButton
          Left = 1
          Top = 1
          Width = 75
          Height = 39
          Align = alLeft
          Caption = 'Add Memo'
          TabOrder = 0
          OnClick = btnAddMemoClick
        end
      end
      object memoRTCompFooter: TMemo
        Left = 0
        Top = 197
        Width = 627
        Height = 89
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Consolas'
        Font.Style = []
        Lines.Strings = (
          'Click on Add Memo to create a memo in the client area at runtime'
          'Refresh the tree in Marshal'
          'Click on Delete memo to remove the runtime object'
          'Refresh the form in Marshal')
        ParentFont = False
        TabOrder = 1
      end
    end
    object tsFramed: TTabSheet
      Caption = 'tsFramed'
      ImageIndex = 3
      object memoFramedMessage: TMemo
        Left = 0
        Top = 197
        Width = 627
        Height = 89
        Align = alBottom
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
      end
      inline FramedVCL1: TFramedVCL
        Left = 0
        Top = 0
        Width = 627
        Height = 197
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 627
        ExplicitHeight = 197
        inherited GridPanel1: TGridPanel
          Width = 627
          Height = 197
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
          ExplicitWidth = 627
          ExplicitHeight = 197
          inherited Button1: TButton
            Left = 119
            Top = 37
            OnClick = FramedTestVCL1Button1Click
            ExplicitLeft = 119
            ExplicitTop = 37
          end
          inherited Label1: TLabel
            Top = 43
            Width = 31
            Height = 13
            ExplicitLeft = 454
            ExplicitTop = 108
            ExplicitWidth = 31
            ExplicitHeight = 13
          end
          inherited FrameSubFramedVCL1: TFrameSubFramedVCL
            Top = 99
            Width = 625
            Height = 97
            ExplicitTop = 99
            ExplicitWidth = 625
            ExplicitHeight = 97
            inherited GridPanel1: TGridPanel
              Width = 625
              Height = 97
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
              ExplicitWidth = 625
              ExplicitHeight = 97
              inherited Label1: TLabel
                Left = 117
                Top = 18
                Width = 79
                Height = 13
                ExplicitLeft = 141
                ExplicitTop = 18
                ExplicitWidth = 79
                ExplicitHeight = 13
              end
              inherited Button1: TButton
                ExplicitLeft = 431
                ExplicitTop = 12
              end
              inherited Edit1: TEdit
                Top = 62
                Height = 21
                ExplicitLeft = 96
                ExplicitTop = 62
                ExplicitHeight = 21
              end
              inherited CheckBox1: TCheckBox
                ExplicitLeft = 420
                ExplicitTop = 64
              end
            end
          end
        end
      end
    end
    object tsSalesData: TTabSheet
      Caption = 'SalesData'
      ImageIndex = 4
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 627
        Height = 286
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Year'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Month'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Amount'
            Visible = True
          end>
      end
    end
  end
  object SERTTKAppInspectorVCL1: TSERTTKAppInspectorVCL
    FormWidth = 960
    FormHeight = 720
    StartupDelay = 250
    ShowOnStartup = False
    Left = 492
    Top = 118
  end
  object ActionList1: TActionList
    Left = 304
    Top = 176
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 32880
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
    end
    object ControlAction1: TControlAction
      Caption = 'ControlAction1'
    end
  end
  object Timer1: TTimer
    Left = 312
    Top = 184
  end
  object DataSource1: TDataSource
    DataSet = dmRTTK.FDMemTable
    Left = 320
    Top = 192
  end
end
