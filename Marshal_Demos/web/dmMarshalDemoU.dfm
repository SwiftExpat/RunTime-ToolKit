object dmMarshalDemo: TdmMarshalDemo
  OnCreate = WebDataModuleCreate
  Height = 427
  Width = 625
  PixelsPerInch = 144
  object cdsFeatures: TWebClientDataSet
    AfterOpen = cdsFeaturesAfterOpen
    Params = <>
    Left = 144
    Top = 72
    object cdsFeaturesFeatureName: TStringField
      FieldName = 'FeatureName'
    end
  end
  object cdsVideos: TWebClientDataSet
    AfterOpen = cdsVideosAfterOpen
    Params = <>
    Left = 288
    Top = 192
    object cdsVideosVideoID: TStringField
      FieldName = 'VideoID'
    end
    object cdsVideosTitle: TStringField
      FieldName = 'Title'
    end
    object cdsVideosDescription: TStringField
      FieldName = 'Description'
    end
  end
end
