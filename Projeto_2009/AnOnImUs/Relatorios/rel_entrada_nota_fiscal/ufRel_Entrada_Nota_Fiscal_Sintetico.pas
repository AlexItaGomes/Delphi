unit ufRel_Entrada_Nota_Fiscal_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Entrada_Nota_Fiscal_Sintetico = class(TfImpressoes)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand4: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    lbTotalProd: TQRLabel;
    lbTotalDesc: TQRLabel;
    lbTotalNota: TQRLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrepRelatorioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    fltTotalProd,
    fltTotalDesc,
    fltTotalNota  : Real;
  public
    { Public declarations }
  end;

var
  fRel_Entrada_Nota_Fiscal_Sintetico: TfRel_Entrada_Nota_Fiscal_Sintetico;

implementation

uses udmRel_Entrada_Nota_Fiscal;

{$R *.dfm}

procedure TfRel_Entrada_Nota_Fiscal_Sintetico.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lbTotalProd.Caption := FormatFloat('###,###,##0.0000',fltTotalProd);
  lbTotalDesc.Caption := FormatFloat('###,###,##0.0000',fltTotalDesc);
  lbTotalNota.Caption := FormatFloat('###,###,##0.0000',fltTotalNota);
end;

procedure TfRel_Entrada_Nota_Fiscal_Sintetico.qrepRelatorioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  fltTotalProd := 0;
  fltTotalDesc := 0;
  fltTotalNota := 0;
end;

procedure TfRel_Entrada_Nota_Fiscal_Sintetico.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  fltTotalProd := fltTotalProd + dmRel_Entrada_Nota_Fiscal.cdsRelNotaFiscalNFEN_VLR_TOTAL_PROD.AsFloat;
  fltTotalDesc := fltTotalDesc + dmRel_Entrada_Nota_Fiscal.cdsRelNotaFiscalNFEN_VLR_TOTAL_DESC.AsFloat;
  fltTotalNota := fltTotalNota + dmRel_Entrada_Nota_Fiscal.cdsRelNotaFiscalNFEN_VLR_TOTAL_NOTA.AsFloat;
end;

end.
