unit ufRel_Marcas_Produtos_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Marcas_Prod_Sinteticos = class(TfImpressoes)
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
  fRel_Marcas_Prod_Sinteticos: TfRel_Marcas_Prod_Sinteticos;

implementation

uses udmRel_Marcas_Produtos;

{$R *.dfm}

initialization
  fRel_Marcas_Prod_Sinteticos := TfRel_Marcas_Prod_Sinteticos.Create(nil);
finalization
  FreeAndNil(fRel_Marcas_Prod_Sinteticos);

end.
