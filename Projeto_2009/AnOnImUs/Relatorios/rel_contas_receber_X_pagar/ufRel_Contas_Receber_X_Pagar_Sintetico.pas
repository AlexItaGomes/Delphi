unit ufRel_Contas_Receber_X_Pagar_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRWebFilt, QRExport, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Contas_Receber_X_Pagar_Sintetico = class(TfImpressoes)
    QRLabel12: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    GroupFooterBand1: TQRBand;
    QRSubDetail2: TQRSubDetail;
    GroupFooterBand2: TQRBand;
    GroupHeaderBand1: TQRBand;
    QRLabel36: TQRLabel;
    QRBand4: TQRBand;
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
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    c: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    lbAberto: TQRLabel;
    lbPago: TQRLabel;
    lbCanc: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    lbTotal: TQRLabel;
    QRShape2: TQRShape;
    QRLabel40: TQRLabel;
    lbTotalValido: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    lbAbertoPag: TQRLabel;
    lbPagoPag: TQRLabel;
    lbCancPag: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    lbTotalPag: TQRLabel;
    QRShape4: TQRShape;
    QRLabel50: TQRLabel;
    lbTotalValidoPag: TQRLabel;
    lb1: TQRLabel;
    lbReceberAberto: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    lbTotalReceber: TQRLabel;
    QRShape6: TQRShape;
    QRLabel58: TQRLabel;
    lbLiquido: TQRLabel;
    lb3: TQRLabel;
    lbPagarAberto: TQRLabel;
    lb2: TQRLabel;
    lbTotalPagar: TQRLabel;
    QRShape7: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel45: TQRLabel;
    lbReceitaLiquida: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel46: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText30: TQRDBText;
    lbSaldoBancario: TQRLabel;
    lbSaldo: TQRLabel;
    lbSomaSaldo: TQRLabel;
    lbReceitaSaldo: TQRLabel;
    lbReceitaTotalSaldo: TQRLabel;
    lbIgualSaldo: TQRLabel;
    QRLabel51: TQRLabel;
    lbSaldoCaixa: TQRLabel;
    QRLabel53: TQRLabel;
    procedure qrepRelatorioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GroupFooterBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GroupFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Contas_Receber_X_Pagar_Sintetico: TfRel_Contas_Receber_X_Pagar_Sintetico;
  floatAbertoRec,
  floatPagoRec,
  floatCancRec,
  floatAbertoPag,
  floatPagoPag,
  floatCancPag,
  floatSaldoCaixa,
  floatSaldBancario : Real;

implementation

uses udmRel_Contas_Receber_X_Pagar;

{$R *.dfm}

procedure TfRel_Contas_Receber_X_Pagar_Sintetico.GroupFooterBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lbAberto.Caption      := 'R$ ' + FormatFloat('##,###,###0.00',floatAbertoRec);
  lbPago.Caption        := 'R$ ' + FormatFloat('##,###,###0.00',floatPagoRec);
  lbCanc.Caption        := 'R$ ' + FormatFloat('##,###,###0.00',floatCancRec);
  lbTotal.Caption       := 'R$ ' + FormatFloat('##,###,###0.00',(floatAbertoRec + floatPagoRec + floatCancRec));
  lbTotalValido.Caption := 'R$ ' + FormatFloat('##,###,###0.00',(floatAbertoRec + floatPagoRec));
end;

procedure TfRel_Contas_Receber_X_Pagar_Sintetico.GroupFooterBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lbAbertoPag.Caption      := 'R$ ' + FormatFloat('##,###,###0.00',floatAbertoPag);
  lbPagoPag.Caption        := 'R$ ' + FormatFloat('##,###,###0.00',floatPagoPag);
  lbCancPag.Caption        := 'R$ ' + FormatFloat('##,###,###0.00',floatCancPag);
  lbTotalPag.Caption       := 'R$ ' + FormatFloat('##,###,###0.00',(floatAbertoPag + floatPagoPag + floatCancPag));
  lbTotalValidoPag.Caption := 'R$ ' + FormatFloat('##,###,###0.00',(floatAbertoPag + floatPagoPag));
end;

procedure TfRel_Contas_Receber_X_Pagar_Sintetico.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lbTotalReceber.Caption      := 'R$ ' + FormatFloat('##,###,###0.00',floatAbertoRec + floatPagoRec);
  lbReceberAberto.Caption     := 'R$ ' + FormatFloat('##,###,###0.00',floatAbertoRec);
  lbTotalPagar.Caption        := 'R$ ' + FormatFloat('##,###,###0.00',floatAbertoPag + floatPagoPag);
  lbPagarAberto.Caption       := 'R$ ' + FormatFloat('##,###,###0.00',floatAbertoPag);
  lbLiquido.Caption           := 'R$ ' + FormatFloat('##,###,###0.00',(floatAbertoRec + floatPagoRec) - (floatAbertoPag + floatPagoPag));
  lbReceitaLiquida.Caption    := 'R$ ' + FormatFloat('##,###,###0.00',(floatAbertoRec - floatAbertoPag));
  lbSaldo.Caption             := 'R$ ' + FormatFloat('##,###,###0.00',floatSaldBancario);
  lbSaldoCaixa.Caption        := 'R$ ' + FormatFloat('##,###,###0.00',floatSaldoCaixa);
  lbReceitaTotalSaldo.Caption := 'R$ ' + FormatFloat('##,###,###0.00',(floatAbertoRec - floatAbertoPag)+floatSaldBancario+floatSaldoCaixa);
end;

procedure TfRel_Contas_Receber_X_Pagar_Sintetico.qrepRelatorioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  floatAbertoRec := 0;
  floatPagoRec   := 0;
  floatCancRec   := 0;
  floatAbertoPag := 0;
  floatPagoPag   := 0;
  floatCancPag   := 0;
end;

procedure TfRel_Contas_Receber_X_Pagar_Sintetico.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  with dmRel_Contas_Receber_X_Pagar.cdsRel_Contas_Receber do begin
    if FieldByName('CREC_STATUS').AsString = 'A' then
      floatAbertoRec := floatAbertoRec + FieldByName('CREC_VALOR_DOC').AsFloat;
    if (FieldByName('CREC_STATUS').AsString = 'A') and (FieldByName('CREC_VALOR_PAGO').AsFloat > 0) then begin
      floatAbertoRec := floatAbertoRec - FieldByName('CREC_VALOR_PAGO').AsFloat;
      floatPagoRec   := floatPagoRec + FieldByName('CREC_VALOR_PAGO').AsFloat;
    end;
    if (FieldByName('CREC_STATUS').AsString = 'F') then
      floatPagoRec := floatPagoRec + FieldByName('CREC_VALOR_PAGO').AsFloat;
    if (FieldByName('CREC_STATUS').AsString = 'C') then
      floatCancRec := floatCancRec + FieldByName('CREC_VALOR_DOC').AsFloat;
  end;
end;

procedure TfRel_Contas_Receber_X_Pagar_Sintetico.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  with dmRel_Contas_Receber_X_Pagar.cdsRel_Contas_Pagar do begin
    if FieldByName('CPAG_STATUS').AsString = 'A' then
      floatAbertoPag := floatAbertoPag + FieldByName('CPAG_VALOR_DOC').AsFloat;
    if (FieldByName('CPAG_STATUS').AsString = 'A') and (FieldByName('CPAG_VALOR_PAGO').Value > 0) then begin
      floatAbertoPag := floatAbertoPag - FieldByName('CPAG_VALOR_PAGO').AsFloat;
      floatPagoPag   := floatPagoPag + FieldByName('CPAG_VALOR_PAGO').AsFloat;
    end;
    if (FieldByName('CPAG_STATUS').AsString = 'F') then
      floatPagoPag := floatPagoPag + FieldByName('CPAG_VALOR_PAGO').AsFloat;
    if (FieldByName('CPAG_STATUS').AsString = 'C') then
      floatCancPag := floatCancPag + FieldByName('CPAG_VALOR_DOC').AsFloat;
  end;
end;

end.
