unit ufRel_Grupos_Produtos_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Grupos_Produtos_Sintetico = class(TfImpressoes)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Grupos_Produtos_Sintetico: TfRel_Grupos_Produtos_Sintetico;

implementation

uses udmRel_Grupos_Produtos;

{$R *.dfm}

initialization
  fRel_Grupos_Produtos_Sintetico := TfRel_Grupos_Produtos_Sintetico.Create(nil);
finalization
  FreeAndNil(fRel_Grupos_Produtos_Sintetico);

end.
