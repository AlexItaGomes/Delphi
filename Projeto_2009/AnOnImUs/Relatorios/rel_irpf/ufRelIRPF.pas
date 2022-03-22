unit ufRelIRPF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TRelIRPF = class(TfImpressoes)
    QRLabel3: TQRLabel;
    qr_01_Detalhes: TQRChildBand;
    qr_01_Rodape: TQRChildBand;
    qr_02_Titulo: TQRChildBand;
    QRLabel4: TQRLabel;
    qr_02_Detalhes: TQRChildBand;
    qr_02_Rodape: TQRChildBand;
    qr_03_Titulo: TQRChildBand;
    QRLabel5: TQRLabel;
    qr_03_Detalhes: TQRChildBand;
    qr_03_Rodape: TQRChildBand;
    qr_04_Titulo: TQRChildBand;
    QRLabel6: TQRLabel;
    qr_04_Detalhes: TQRChildBand;
    qr_04_Rodape: TQRChildBand;
    qr_05_Titulo: TQRChildBand;
    QRLabel7: TQRLabel;
    qr_05_Detalhes: TQRChildBand;
    qr_05_Rodape: TQRChildBand;
    qr_06_Titulo: TQRChildBand;
    QRLabel8: TQRLabel;
    qr_06_Detalhes: TQRChildBand;
    qr_06_Rodape: TQRChildBand;
    qr_07_Titulo: TQRChildBand;
    QRLabel9: TQRLabel;
    qr_07_Detalhes: TQRChildBand;
    qr_07_Rodape: TQRChildBand;
    qr_08_Titulo: TQRChildBand;
    QRLabel10: TQRLabel;
    qr_08_Detalhes: TQRChildBand;
    qr_08_Rodape: TQRChildBand;
    qr_09_Titulo: TQRChildBand;
    QRLabel11: TQRLabel;
    qr_09_Detalhes: TQRChildBand;
    qr_09_Rodape: TQRChildBand;
    qr_10_Titulo: TQRChildBand;
    qr_10_Detalhes: TQRChildBand;
    qr_10_Rodape: TQRChildBand;
    qr_11_Titulo: TQRChildBand;
    qr_11_Detalhes: TQRChildBand;
    qr_11_Rodape: TQRChildBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    qr_12_Titulo: TQRChildBand;
    qr_12_Detalhes: TQRChildBand;
    qr_12_Rodape: TQRChildBand;
    QRLabel14: TQRLabel;
    mmFontePagadora: TQRMemo;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    mmCNPJCPF: TQRMemo;
    mmRendimentos: TQRMemo;
    mmPrevidencia: TQRMemo;
    mmIRRetido: TQRMemo;
    mm13Salario: TQRMemo;
    mmTotalRetido: TQRMemo;
    mmTotalPrevidencia: TQRMemo;
    mmTotalIR: TQRMemo;
    mmTotal13: TQRMemo;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    mmPrevidencias: TQRMemo;
    mmPensao: TQRMemo;
    mmLivro: TQRMemo;
    mmDARF: TQRMemo;
    mmRendimentoPJ: TQRMemo;
    mmRendimentoEX: TQRMemo;
    mmMes: TQRMemo;
    mmTotalPrevidencias: TQRMemo;
    mmTotalPensao: TQRMemo;
    mmTotalLivro: TQRMemo;
    mmTotalDarf: TQRMemo;
    mmTotalRendimentosPJ: TQRMemo;
    mmTotalRendimentoEX: TQRMemo;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel33: TQRLabel;
    mmRendIsentosFonte: TQRMemo;
    mmRendIsentosValor: TQRMemo;
    mmRendIsentosTotalValor: TQRMemo;
    mmRendIsentosCNPJ: TQRMemo;
    QRLabel30: TQRLabel;
    mmOrigem: TQRMemo;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    mmRendSujeitoFonte: TQRMemo;
    mmRendSujeitoValor: TQRMemo;
    mmRendSujeitoCNPJ: TQRMemo;
    mmSujeitoOrigem: TQRMemo;
    mmRendSujeitoTotalValor: TQRMemo;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    mmRendSuspensoFonte: TQRMemo;
    mmRendSuspensoCNPJ: TQRMemo;
    QRLabel39: TQRLabel;
    mmRendSuspensoTotalValor: TQRMemo;
    mmRendSuspensoTotalDepJudicial: TQRMemo;
    mmRendSuspensoValor: TQRMemo;
    mmRendSuspensoDepJudicial: TQRMemo;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    mmImpPagoRetidoFonte: TQRMemo;
    mmImpPagoRetidoValor: TQRMemo;
    mmImpPagoRetidoCNPJ: TQRMemo;
    mmImpPagoRetidoOrigem: TQRMemo;
    mmImpPagoRetidoTotalValor: TQRMemo;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    mmPagamentosFonte: TQRMemo;
    mmPagamentosValor: TQRMemo;
    mmPagamentosCNPJ: TQRMemo;
    mmPagamentosDestino: TQRMemo;
    mmPagamentosTotalValor: TQRMemo;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    mmDoacoesFonte: TQRMemo;
    mmDoacoesValor: TQRMemo;
    mmDoacoesCNPJ: TQRMemo;
    mmDoacoesTotalValor: TQRMemo;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    mmBensDireitoDestino: TQRMemo;
    mmBensDireitoVlrAtual: TQRMemo;
    mmBensDireitoVlrTotalAtual: TQRMemo;
    QRLabel55: TQRLabel;
    mmBensDireitoVlrTotalAnterior: TQRMemo;
    mmBensDireitoVlrAnterior: TQRMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelIRPF: TRelIRPF;

implementation

{$R *.dfm}

initialization
  RelIRPF := TRelIRPF.Create(nil);
finalization
  FreeAndNil(RelIRPF);

end.
