unit ufRel_Saida_Avulsa_Produtos_Analitico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Saida_Avulsa_Prod_Analitico = class(TfImpressoes)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape1: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel9: TQRLabel;
    lbTotal: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    fltTotal : Real;
  public
    { Public declarations }
  end;

var
  fRel_Saida_Avulsa_Prod_Analitico: TfRel_Saida_Avulsa_Prod_Analitico;

implementation

uses udmRel_Saida_Avulsa_Produtos;

{$R *.dfm}

procedure TfRel_Saida_Avulsa_Prod_Analitico.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lbTotal.Caption := FormatFloat('0.0000',fltTotal);
end;

procedure TfRel_Saida_Avulsa_Prod_Analitico.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  with dmRel_Saida_Avulsa_Produtos,cdsItensSaidaAvulsa do begin
    Close;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Params.ParamByName('SAAV_ID').AsInteger := cdsRelSaidaAvulsaSAAV_ID.AsInteger;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Open;
  end;
  fltTotal := 0;
end;

procedure TfRel_Saida_Avulsa_Prod_Analitico.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  dmRel_Saida_Avulsa_Produtos.cdsItensSaidaAvulsa.Next;
  if dmRel_Saida_Avulsa_Produtos.cdsItensSaidaAvulsa.Eof then begin
    ChildBand1.Height := 50;
  end else begin
    dmRel_Saida_Avulsa_Produtos.cdsItensSaidaAvulsa.Prior;
    ChildBand1.Height := 0;
  end;
end;

procedure TfRel_Saida_Avulsa_Prod_Analitico.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  fltTotal := fltTotal + dmRel_Saida_Avulsa_Produtos.cdsItensSaidaAvulsaSAIT_QTDE.AsFloat;
end;

end.
