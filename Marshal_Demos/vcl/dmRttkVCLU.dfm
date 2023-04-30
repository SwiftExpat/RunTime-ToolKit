object dmRTTK: TdmRTTK
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 720
  Width = 960
  PixelsPerInch = 144
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=:memory:'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    Left = 384
    Top = 36
  end
  object FDMemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 624
    Top = 36
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
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 768
    Top = 588
  end
  object FDSQLiteFunctionXmY: TFDSQLiteFunction
    DriverLink = FDPhysSQLiteDriverLink1
    FunctionName = 'XmY'
    ArgumentsCount = 2
    OnCalculate = FDSQLiteFunctionXmYCalculate
    Left = 240
    Top = 336
  end
  object FDQuerySales: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select year, month, amount from SalesInfo')
    Left = 216
    Top = 168
  end
  object ClientDataSetSalesInfo: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = ClientDataSetSalesInfoAfterOpen
    Left = 456
    Top = 336
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
end
