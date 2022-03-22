unit ufRel_Contas_Receber_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRWebFilt, QRExport, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Contas_Receber_Sintetico = class(TfImpressoes)
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    c: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    lbAberto: TQRLabel;
    lbPago: TQRLabel;
    lbCanc: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    lbTotal: TQRLabel;
    QRShape2: TQRShape;
    QRLabel21: TQRLabel;
    lbTotalValido: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
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
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
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
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRBand5: TQRBand;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    lbAbertoGer: TQRLabel;
    lbPagoGer: TQRLabel;
    lbCancGer: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    lbTotalGer: TQRLabel;
    QRShape1: TQRShape;
    QRLabel33: TQRLabel;
    lbTotalValidoGer: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel27: TQRLabel;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrepRelatorioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Contas_Receber_Sintetico: TfRel_Contas_Receber_Sintetico;
  floatAberto,
  floatPago,
  floatCanc,
  floatTotAberto,
  floatTotPago,
  floatTotCanc : Real;

implementation

uses udmRel_Contas_Receber;

{$R *.dfm}

procedure TfRel_Contas_Receber_Sintetico.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  with dmRel_Contas_Receber.cdsRel_Contas_Receber do begin
    if FieldByName('CREC_STATUS').AsString = 'A' then
      floatAberto := floatAberto + FieldByName('CREC_VALOR_DOC').AsFloat;
    if (FieldByName('CREC_STATUS').AsString = 'A') and (FieldByName('CREC_VALOR_PAGO').AsFloat > 0) then
      floatAberto := floatAberto + FieldByName('CREC_VALOR_PAGO').AsFloat;
    if (FieldByName('CREC_STATUS').AsString = 'A') and (FieldByName('CREC_VALOR_PAGO').AsFloat > 0) then
      floatPago := floatPago + FieldByName('CREC_VALOR_PAGO').AsFloat;
    if (FieldByName('CREC_STATUS').AsString = 'F') then
      floatPago := floatPago + FieldByName('CREC_VALOR_PAGO').AsFloat;
    if (FieldByName('CREC_STATUS').AsString = 'C') then
      floatCanc := floatCanc + FieldByName('CREC_VALOR_DOC').AsFloat;
  end;
end;

procedure TfRel_Contas_Receber_Sintetico.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lbAberto.Caption      := 'R$ ' + FormatFloat('##,###,###0.00',floatAberto);
  lbPago.Caption        := 'R$ ' + FormatFloat('##,###,###0.00',floatPago);
  lbCanc.Caption        := 'R$ ' + FormatFloat('##,###,###0.00',floatCanc);
  lbTotal.Caption       := 'R$ ' + FormatFloat('##,###,###0.00',(floatAberto + floatPago + floatCanc));
  lbTotalValido.Caption := 'R$ ' + FormatFloat('##,###,###0.00',(floatAberto + floatPago));
  floatTotAberto := floatTotAberto + floatAberto;
  floatTotPago   := floatTotPago   + floatPago;
  floatTotCanc   := floatTotCanc   + floatCanc;
end;

procedure TfRel_Contas_Receber_Sintetico.QRBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lbAbertoGer.Caption      := 'R$ ' + FormatFloat('##,###,###0.00',floatTotAberto);
  lbPagoGer.Caption        := 'R$ ' + FormatFloat('##,###,###0.00',floatTotPago);
  lbCancGer.Caption        := 'R$ ' + FormatFloat('##,###,###0.00',floatTotCanc);
  lbTotalGer.Caption       := 'R$ ' + FormatFloat('##,###,###0.00',(floatTotAberto + floatTotPago + floatTotCanc));
  lbTotalValidoGer.Caption := 'R$ ' + FormatFloat('##,###,###0.00',(floatTotAberto + floatTotPago));
end;

procedure TfRel_Contas_Receber_Sintetico.qrepRelatorioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  floatTotAberto := 0;
  floatTotPago   := 0;
  floatTotCanc   := 0;
end;

procedure TfRel_Contas_Receber_Sintetico.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  floatAberto := 0;
  floatPago   := 0;
  floatCanc   := 0;
end;

end.
