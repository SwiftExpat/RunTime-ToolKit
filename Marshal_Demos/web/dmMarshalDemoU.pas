unit dmMarshalDemoU;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Modules, Data.DB, WEBLib.CDS;

type
  TDemoVideo = class
  public
    VideoID: string;
    Title: string;
    Description: string;
  end;

  TdmMarshalDemo = class(TWebDataModule)
    cdsFeatures: TWebClientDataSet;
    cdsFeaturesFeatureName: TStringField;
    cdsVideos: TWebClientDataSet;
    cdsVideosVideoID: TStringField;
    cdsVideosTitle: TStringField;
    cdsVideosDescription: TStringField;
    procedure WebDataModuleCreate(Sender: TObject);
    procedure cdsFeaturesAfterOpen(DataSet: TDataSet);
    procedure cdsVideosAfterOpen(DataSet: TDataSet);
  private
    procedure cdsFeaturesInsert(AFeatureName: string);
    procedure cdsVideosInsert(const AVideoID,ATitle, ADescription : string);
  public
    function CurrentVideo: TDemoVideo;
  end;

var
  dmMarshalDemo: TdmMarshalDemo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdmMarshalDemo.cdsFeaturesAfterOpen(DataSet: TDataSet);
begin
  cdsFeaturesInsert('Feature 1');
  cdsFeaturesInsert('Feature 2');
  cdsFeaturesInsert('Feature 3');
end;

procedure TdmMarshalDemo.cdsFeaturesInsert(AFeatureName: string);
begin
  cdsFeatures.Insert;
  cdsFeatures.FieldByName('FeatureName').AsString := AFeatureName;
  cdsFeatures.Post;
end;

procedure TdmMarshalDemo.cdsVideosAfterOpen(DataSet: TDataSet);
begin
  cdsVideosInsert('394wOxhvi5Y', 'Marshal Basics', 'Marshal Navigation and Object Plus are covered in detail here');
  cdsVideosInsert('gafTIxVz4nY', 'Data Heuristics', 'Explore how to use Marshal data tools to diagnose TDataset issues');
    cdsVideosInsert('WcJ9gEcIWHA', 'Visual Impact', 'Explore custom inspectors and learn benefits of inspectors by data types');
end;

procedure TdmMarshalDemo.cdsVideosInsert(const AVideoID,ATitle, ADescription : string);
begin
  cdsVideos.Append;
  cdsVideos.FieldByName('VideoID').AsString := AVideoID;
  cdsVideos.FieldByName('Description').AsString := ADescription;
  cdsVideos.FieldByName('Title').AsString := ATitle;
  cdsVideos.Post;
end;

function TdmMarshalDemo.CurrentVideo: TDemoVideo;
begin
  result := TDemoVideo.Create;
  result.VideoID := cdsVideos.FieldByName('VideoID').AsString;
  result.Description := cdsVideos.FieldByName('Description').AsString;
  result.Title := cdsVideos.FieldByName('Title').AsString;
end;

procedure TdmMarshalDemo.WebDataModuleCreate(Sender: TObject);
begin
  cdsFeatures.Open;
  cdsVideos.Open;
end;

end.
