unit ufRel_Tabela_Preco_Analitico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Tabela_Preco_Analitco = class(TfImpressoes)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRSubDetail1: TQRSubDetail;
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
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrepRelatorioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    arrayVisual : array[1..6] of Boolean;
  end;

var
  fRel_Tabela_Preco_Analitco: TfRel_Tabela_Preco_Analitco;

implementation

uses udmRel_Tabela_Preco;

{$R *.dfm}

procedure TfRel_Tabela_Preco_Analitco.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  with dmRel_Tabela_Preco do begin
    with cdsItensTabelaPreco do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('TPRC_ID').AsInteger := cdsTabelaPrecoTPRC_ID.AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
  end;
end;

procedure TfRel_Tabela_Preco_Analitco.qrepRelatorioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  QRLabel17.Enabled  := arrayVisual[1];
  QRLabel18.Enabled  := arrayVisual[2];
  QRLabel19.Enabled  := arrayVisual[3];
  QRLabel20.Enabled  := arrayVisual[4];
  QRLabel21.Enabled  := arrayVisual[5];
  QRLabel22.Enabled  := arrayVisual[6];

  QRDBText12.Enabled := arrayVisual[1];
  QRDBText13.Enabled := arrayVisual[2];
  QRDBText14.Enabled := arrayVisual[3];
  QRDBText15.Enabled := arrayVisual[4];
  QRDBText16.Enabled := arrayVisual[5];
  QRDBText17.Enabled := arrayVisual[6];
end;

end.
