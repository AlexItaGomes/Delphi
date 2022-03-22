unit ufRel_Anual_Evolutivo_Analitico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Anual_Evolutivo_Analitico = class(TfImpressoes)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRSubDetail1: TQRSubDetail;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Anual_Evolutivo_Analitico: TfRel_Anual_Evolutivo_Analitico;

implementation

uses udmRel_Anual_Evolutivo;

{$R *.dfm}

end.
