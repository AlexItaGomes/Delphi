unit ufRel_Modelos_Produtos_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Modelos_Produtos_Sintetico = class(TfImpressoes)
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
  fRel_Modelos_Produtos_Sintetico: TfRel_Modelos_Produtos_Sintetico;

implementation

uses udmRel_Modelos_Produtos;

{$R *.dfm}

end.
