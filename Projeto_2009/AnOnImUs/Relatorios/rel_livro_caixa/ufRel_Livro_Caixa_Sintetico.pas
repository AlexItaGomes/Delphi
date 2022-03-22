unit ufRel_Livro_Caixa_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRExport, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, SQLExpr, Funcoes, ufImpressoes, QRWebFilt;

type
  TfRel_Livro_Caixa_Sintetico = class(TfImpressoes)
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
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
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    lblCredito: TQRLabel;
    lblDebito: TQRLabel;
    lblSaldo_Mov: TQRLabel;
    lblTitBancario: TQRLabel;
    lblTitLiquido: TQRLabel;
    lblBancario: TQRLabel;
    lblTotLiquid: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    lblMovCred: TQRLabel;
    lblMovDeb: TQRLabel;
    lblMovLiq: TQRLabel;
    QRShape1: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrepRelatorioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    function SaldoBancario: Real;
    { Private declarations }
  public
    { Public declarations }
    floatCred,
    floatDeb,
    floatTotCred,
    floatTotDeb  : Real;
    boolCheck    : Boolean;
  end;

var
  fRel_Livro_Caixa_Sintetico: TfRel_Livro_Caixa_Sintetico;

implementation

uses udmLivro_Caixa;

{$R *.dfm}

procedure TfRel_Livro_Caixa_Sintetico.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  try
  with dmLivro_Caixa do begin
    if cdsRel_Livro_CaixaLCAX_VLR_LANCAMENTO.AsFloat > 0 then begin
      cdsRel_Livro_Caixa.Edit;
      cdsRel_Livro_CaixaPLCT_TIPO.AsString := 'C';
      floatCred    := floatCred    + cdsRel_Livro_CaixaLCAX_VLR_LANCAMENTO.AsFloat;
      floatTotCred := floatTotCred + cdsRel_Livro_CaixaLCAX_VLR_LANCAMENTO.AsFloat;
    end else begin
      floatDeb     := floatDeb     + cdsRel_Livro_CaixaLCAX_VLR_LANCAMENTO.AsFloat;
      floatTotDeb  := floatTotDeb  + cdsRel_Livro_CaixaLCAX_VLR_LANCAMENTO.AsFloat;
    end;
  end;
  except on e: exception do
    showmessage(e.message);
  end;
end;

procedure TfRel_Livro_Caixa_Sintetico.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lblMovCred.Caption := FormatFloat('###,###,##0.00',floatCred);
  lblMovDeb.Caption  := FormatFloat('###,###,##0.00',floatDeb);
  lblMovLiq.Caption  := FormatFloat('###,###,##0.00',(floatCred - (floatDeb * -1)));
end;

procedure TfRel_Livro_Caixa_Sintetico.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  floatValor : Real;
begin
  inherited;
  lblCredito.Caption   := FormatFloat('0.00##.###,##',floatTotCred);
  lblDebito.Caption    := FormatFloat('0.00##.###,##',floatTotDeb);
  lblSaldo_Mov.Caption := FormatFloat('0.00##.###,##',(floatTotCred - (floatTotDeb * -1)));
  if boolCheck then begin
    lblTitBancario.Visible := true;
    lblBancario.Visible    := true;
    lblTitLiquido.Visible  := true;
    lblTotLiquid.Visible   := true;
    floatValor             := SaldoBancario;
    lblBancario.Caption    := FormatFloat('###,###,##0.00',floatValor);
    lblTotLiquid.Caption   := FormatFloat('###,###,##0.00',(dmLivro_Caixa.cdsRel_Livro_CaixaLCAX_VLR_SALDO.AsFloat + floatValor));
  end else begin
    lblTitBancario.Visible := false;
    lblBancario.Visible    := false;
    lblTitLiquido.Visible  := false;
    lblTotLiquid.Visible   := false;
  end;
end;

procedure TfRel_Livro_Caixa_Sintetico.qrepRelatorioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  floatCred    := 0;
  floatDeb     := 0;
  floatTotCred := 0;
  floatTotDeb  := 0;
end;

procedure TfRel_Livro_Caixa_Sintetico.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  floatCred := 0;
  floatDeb  := 0;
end;

function TfRel_Livro_Caixa_Sintetico.SaldoBancario : Real;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := 0;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(SUM(CBCO_SALDO_ATUAL),0)');
        sql.Add('FROM  CONTAS_BANCARIAS');
        sql.Add('WHERE CBCO_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   CBCO_ATIVO   = 1');
        Open;
      end;
      Result := qryCons.Fields[0].AsFloat;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'SaldoBancario',funcLocal.User_Login,e.Message);
      funcLocal.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

end.
