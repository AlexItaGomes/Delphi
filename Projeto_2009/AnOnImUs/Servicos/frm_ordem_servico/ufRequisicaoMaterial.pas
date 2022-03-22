unit ufRequisicaoMaterial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRequisicaoMaterial = class(TfImpressoes)
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
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
    lbDtCadastro: TQRLabel;
    lbDtAgendamento: TQRLabel;
    QRLabel15: TQRLabel;
    lbTecnico: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    lbEquipamento: TQRLabel;
    lbUnidade: TQRLabel;
    lbMarca: TQRLabel;
    lbModelo: TQRLabel;
    lbNrPedido: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
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
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText37: TQRDBText;
    lbFornecedor: TQRLabel;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRLabel53: TQRLabel;
    QRShape6: TQRShape;
    lbGrupoPecasServicos: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRBand4: TQRBand;
    QRShape1: TQRShape;
    QRShape5: TQRShape;
    QRDBText24: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel13: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRequisicaoMaterial: TfRequisicaoMaterial;

implementation

uses udmOrdemServico;

{$R *.dfm}

procedure TfRequisicaoMaterial.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  with dmOrdemServico, cdsListaPecasRequisicao do
  begin
    Close;
    Params.ParamByName('ORDS_ID').AsInteger := cdsListaOSORDS_ID.AsInteger;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Params.ParamByName('CLIE_ID').AsInteger := cdsClientesCLIE_ID.AsInteger;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Open;
  end;
end;

end.
