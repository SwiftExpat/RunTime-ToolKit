object dmAtRuntime: TdmAtRuntime
  Height = 1080
  Width = 1440
  PixelsPerInch = 144
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 696
    Top = 520
  end
  object FDQuery1: TFDQuery
    Left = 584
    Top = 360
  end
end
