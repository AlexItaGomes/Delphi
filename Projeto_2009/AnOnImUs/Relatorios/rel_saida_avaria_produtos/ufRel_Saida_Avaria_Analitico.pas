unit ufRel_Saida_Avaria_Analitico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Saida_Avaria_Analitica = class(TfImpressoes)
    QRShape1: TQRShape;
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
    QRLabel9: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel10: TQRLabel;
    lbQtde: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    lbTotal: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    fltQtde,
    fltTotal : Real;
  public
    { Public declarations }
  end;

var
  fRel_Saida_Avaria_Analitica: TfRel_Saida_Avaria_Analitica;

implementation

uses udmRel_Saida_Avaria;

{$R *.dfm}

procedure TfRel_Saida_Avaria_Analitica.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lbQtde.Caption  := FormatFloat('0.0000',fltQtde);
  lbTotal.Caption := FormatFloat('0.0000',fltTotal);
end;

procedure TfRel_Saida_Avaria_Analitica.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  with dmRel_Saida_Avaria,cdsItensSaidaAvaria do begin
    Close;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Params.ParamByName('SIAV_ID').AsInteger := funcLocal.Empr_ID;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Open;
  end;
  fltQtde  := 0;
  fltTotal := 0;
end;

procedure TfRel_Saida_Avaria_Analitica.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  dmRel_Saida_Avaria.cdsItensSaidaAvaria.Next;
  if dmRel_Saida_Avaria.cdsItensSaidaAvaria.Eof then begin
    ChildBand1.Height := 50;
  end else begin
    dmRel_Saida_Avaria.cdsItensSaidaAvaria.Prior;
    ChildBand1.Height := 0;
  end;
end;

procedure TfRel_Saida_Avaria_Analitica.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  fltQtde  := fltQtde  + dmRel_Saida_Avaria.cdsItensSaidaAvariaSIIT_QTDE.AsFloat;
  fltTotal := fltTotal + dmRel_Saida_Avaria.cdsItensSaidaAvariaSIIT_VLR_TOTAL.AsFloat;
end;

end.
