unit ufRel_Entrada_Nota_Fiscal_Analitico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Entrada_Nota_Fiscal_Analitico = class(TfImpressoes)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel26: TQRLabel;
    lbItem: TQRLabel;
    QRBand4: TQRBand;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRShape1: TQRShape;
    ChildBand2: TQRChildBand;
    QRLabel34: TQRLabel;
    lbTotalDoc: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    fltItem,
    fltTotalDoc : Real;
  public
    { Public declarations }
  end;

var
  fRel_Entrada_Nota_Fiscal_Analitico: TfRel_Entrada_Nota_Fiscal_Analitico;

implementation

uses udmRel_Entrada_Nota_Fiscal;

{$R *.dfm}

procedure TfRel_Entrada_Nota_Fiscal_Analitico.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lbItem.Caption := FormatFloat('###,###,##0.0000',fltItem);
end;

procedure TfRel_Entrada_Nota_Fiscal_Analitico.ChildBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lbTotalDoc.Caption := FormatFloat('###,###,##0.0000',fltTotalDoc);
end;

procedure TfRel_Entrada_Nota_Fiscal_Analitico.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  with dmRel_Entrada_Nota_Fiscal do begin
    with cdsItensNotaFiscal do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('NFEN_ID').AsInteger := cdsRelNotaFiscalNFEN_ID.AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
    with cdsAcertosNotaFiscal do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('NFEN_ID').AsInteger := cdsRelNotaFiscalNFEN_ID.AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
  end;
  fltItem     := 0;
  fltTotalDoc := 0;
end;

procedure TfRel_Entrada_Nota_Fiscal_Analitico.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if dmRel_Entrada_Nota_Fiscal.cdsAcertosNotaFiscal.IsEmpty then begin
    QRBand4.Height    := 0;
    ChildBand2.Height := 0;
  end else begin
    QRBand4.Height    := 50;
  end;
end;

procedure TfRel_Entrada_Nota_Fiscal_Analitico.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  dmRel_Entrada_Nota_Fiscal.cdsItensNotaFiscal.Next;
  if dmRel_Entrada_Nota_Fiscal.cdsItensNotaFiscal.Eof then begin
    ChildBand1.Height := 50
  end else begin
    dmRel_Entrada_Nota_Fiscal.cdsItensNotaFiscal.Prior;
    ChildBand1.Height := 0;
  end;
end;

procedure TfRel_Entrada_Nota_Fiscal_Analitico.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  fltItem := fltItem + dmRel_Entrada_Nota_Fiscal.cdsItensNotaFiscalNFIT_VLR_TOTAL_ITEM.AsFloat;
end;

procedure TfRel_Entrada_Nota_Fiscal_Analitico.QRSubDetail2AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  dmRel_Entrada_Nota_Fiscal.cdsAcertosNotaFiscal.Next;
  if dmRel_Entrada_Nota_Fiscal.cdsAcertosNotaFiscal.Eof then begin
    ChildBand2.Height := 50
  end else begin
    dmRel_Entrada_Nota_Fiscal.cdsAcertosNotaFiscal.Prior;
    ChildBand2.Height := 0;
  end;
end;

procedure TfRel_Entrada_Nota_Fiscal_Analitico.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  fltTotalDoc := fltTotalDoc + dmRel_Entrada_Nota_Fiscal.cdsAcertosNotaFiscalNFAC_VALOR_DOC.AsFloat;
end;

end.
