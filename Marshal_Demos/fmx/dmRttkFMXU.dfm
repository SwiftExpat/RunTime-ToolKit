object dmRTTK: TdmRTTK
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 720
  Width = 960
  PixelsPerInch = 144
  object FDMemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 456
    Top = 336
    object FDMemTableYear: TIntegerField
      FieldName = 'Year'
    end
    object FDMemTableMonth: TIntegerField
      FieldName = 'Month'
    end
    object FDMemTableAmount: TBCDField
      FieldName = 'Amount'
      Precision = 10
      Size = 2
    end
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=:memory:'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    Left = 432
    Top = 228
  end
  object FDQuerySales: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select year, month, amount from SalesInfo')
    Left = 264
    Top = 348
    object FDQuerySalesyear: TIntegerField
      FieldName = 'year'
      Origin = 'year'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuerySalesmonth: TIntegerField
      FieldName = 'month'
      Origin = 'month'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object FDSQLiteFunctionXmY: TFDSQLiteFunction
    DriverLink = FDPhysSQLiteDriverLink1
    Active = True
    FunctionName = 'XmY'
    ArgumentsCount = 2
    OnCalculate = FDSQLiteFunctionXmYCalculate
    Left = 348
    Top = 492
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 624
    Top = 528
  end
  object ClientDataSetSalesInfo: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = ClientDataSetSalesInfoAfterOpen
    Left = 144
    Top = 60
    object ClientDataSetSalesInfoYear: TIntegerField
      FieldName = 'Year'
    end
    object ClientDataSetSalesInfoMonth: TIntegerField
      FieldName = 'Month'
    end
    object ClientDataSetSalesInfoAmount: TBCDField
      FieldName = 'Amount'
    end
  end
  object FDQuerySalesIndexed: TFDQuery
    Indexes = <
      item
        Active = True
        Selected = True
        Name = 'MonthascYeardesc'
        Fields = 'year;month'
        CaseInsFields = 'month'
        DescFields = 'month'
      end>
    IndexName = 'MonthascYeardesc'
    Connection = FDConnection
    SQL.Strings = (
      'select year, month, amount from SalesInfo')
    Left = 708
    Top = 144
    object IntegerField1: TIntegerField
      FieldName = 'year'
      Origin = 'year'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'month'
      Origin = 'month'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
end
