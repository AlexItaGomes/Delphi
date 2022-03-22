unit ufRel_Ordem_Servico_Tecnico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, StdCtrls, Mask, DBCtrls;

type
  TfRel_Ordem_Servico_Tecnico = class(TfImpressoes)
    QRBand4: TQRBand;
    lbCaption: TQRLabel;
    qrTipo: TQRDBText;
    QRBand5: TQRBand;
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
    lbCodEquip: TQRLabel;
    lbEquipamento: TQRLabel;
    lbUnidade: TQRLabel;
    lbMarca: TQRLabel;
    lbModelo: TQRLabel;
    lbNrPedido: TQRLabel;
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
    ChildBand2: TQRChildBand;
    QRShape1: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    qrCodigo: TQRMemo;
    qrDescricao: TQRMemo;
    qrUnid: TQRMemo;
    qrGarantia: TQRMemo;
    qrMarca: TQRMemo;
    qrModelo: TQRMemo;
    qrUnit: TQRMemo;
    qrQtde: TQRMemo;
    qrTotal: TQRMemo;
    lbDtAgendamento: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel3: TQRLabel;
    qrAgrupamento: TQRGroup;
    QRLabel14: TQRLabel;
    QRDBText18: TQRDBText;
    DBEdit1: TDBEdit;
    QRDBText21: TQRDBText;
    QRLabel15: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrAgrupamentoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrepRelatorioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    intI : Integer;
    FTipo: Integer;
  public
    property Tipo : Integer   read FTipo    write FTipo;
  end;

var
  fRel_Ordem_Servico_Tecnico: TfRel_Ordem_Servico_Tecnico;

implementation

uses udmRel_Ordem_Servicos;

{$R *.dfm}

procedure TfRel_Ordem_Servico_Tecnico.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrCodigo.Lines.Clear;
  qrDescricao.Lines.Clear;
  qrUnid.Lines.Clear;
  qrGarantia.Lines.Clear;
  qrMarca.Lines.Clear;
  qrModelo.Lines.Clear;
  qrUnit.Lines.Clear;
  qrQtde.Lines.Clear;
  qrTotal.Lines.Clear;
  with dmRel_Ordem_Servico do begin
    with cdsOrdemServicoItens do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('ORDS_ID').AsInteger := cdsRel_Ordem_ServicoORDS_ID.AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('CLIE_ID').AsInteger := cdsRel_Ordem_ServicoORDS_CLIE_ID.AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
      if not IsEmpty then begin
        First;
        while not Eof do begin
          qrCodigo.Lines.Add(FieldByName('ODIT_TPIT_PROD_ID').AsString);
          qrDescricao.Lines.Add(FieldByName('PROD_DESCRICAO').AsString);
          qrUnid.Lines.Add(FieldByName('PROD_UNIDADE').AsString);
          qrGarantia.Lines.Add(FieldByName('PROD_GARANTIA').AsString);
          qrMarca.Lines.Add(FieldByName('MARCA_PROD').AsString);
          qrModelo.Lines.Add(FieldByName('MODELO_PROD').AsString);
          qrUnit.Lines.Add(FormatFloat('###,###,##0.00',FieldByName('ODIT_VLR_UNITARIO').AsFloat));
          qrQtde.Lines.Add(FormatFloat('###,###,##0.00',FieldByName('ODIT_QTDE').AsFloat));
          qrTotal.Lines.Add(FormatFloat('###,###,##0.00',FieldByName('ODIT_VLR_TOTAL').AsFloat));
          Next;
        end;
      end;
    end;
  end;
  inc(intI);
end;

procedure TfRel_Ordem_Servico_Tecnico.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLabel32.Caption := FormatFloat('000000',intI);
end;

procedure TfRel_Ordem_Servico_Tecnico.qrepRelatorioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  case Tipo of
    1 : begin
      qrAgrupamento.Expression  := 'cdsRel_Ordem_Servico.USER_NOME_COMPLETO';
      lbCaption.Caption         := 'Técnico:';
      qrTipo.DataField          := 'USER_NOME_COMPLETO';
    end;
    2 : begin
      qrAgrupamento.Expression  := 'cdsRel_Ordem_Servico.ATENDENTE';
      lbCaption.Caption         := 'Atendente:';
      qrTipo.DataField          := 'ATENDENTE';
    end;
  end;
end;

procedure TfRel_Ordem_Servico_Tecnico.qrAgrupamentoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  intI := 0;
end;

end.
