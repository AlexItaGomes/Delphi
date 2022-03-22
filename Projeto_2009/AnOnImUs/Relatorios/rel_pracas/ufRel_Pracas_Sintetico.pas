unit ufRel_Pracas_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Pracas_Sintetico = class(TfImpressoes)
    QRLabel3: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Pracas_Sintetico: TfRel_Pracas_Sintetico;

implementation

uses udmRelPracas;

{$R *.dfm}

initialization
  fRel_Pracas_Sintetico := TfRel_Pracas_Sintetico.Create(nil);
finalization
  FreeAndNil(fRel_Pracas_Sintetico);
end.
