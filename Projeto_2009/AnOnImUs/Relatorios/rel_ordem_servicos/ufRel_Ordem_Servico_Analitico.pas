unit ufRel_Ordem_Servico_Analitico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, SQLExpr;

type
  TfRel_Ordem_Servico_Analitico = class(TfImpressoes)
    QRShape6: TQRShape;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
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
    lbNrPedido: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape1: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    lbGrupoPecasServicos: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
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
    QRDBText21: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBRichText1: TQRDBRichText;
    QRDBRichText2: TQRDBRichText;
    QRSubDetail1: TQRSubDetail;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRBand5: TQRBand;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText37: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel23: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText26: TQRDBText;
    QRShape7: TQRShape;
    chdRecebimento: TQRChildBand;
    QRLabel52: TQRLabel;
    QRDBText45: TQRDBText;
    lbMarca: TQRLabel;
    lbModelo: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    lbFornecedor: TQRLabel;
    QRDBText46: TQRDBText;
    chdEntrega: TQRChildBand;
    ChildBand4: TQRChildBand;
    QRShape8: TQRShape;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRShape9: TQRShape;
    qrDescrReceb: TQRMemo;
    qrItemReceb: TQRMemo;
    QRShape10: TQRShape;
    QRLabel54: TQRLabel;
    qrDescrEntreg: TQRMemo;
    qrItemEntreg: TQRMemo;
    QRShape11: TQRShape;
    QRLabel55: TQRLabel;
    ChildBand2: TQRChildBand;
    qrmmRecebimento: TQRMemo;
    qrmmEntrega: TQRMemo;
    QRLabel13: TQRLabel;
    QRDBText47: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText48: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText49: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText50: TQRDBText;
    QRDBImage1: TQRDBImage;
    QRLabel20: TQRLabel;
    QRDBText51: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    procedure CarregaEntrega;
    procedure CarregaRecebimento;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Ordem_Servico_Analitico: TfRel_Ordem_Servico_Analitico;

implementation

uses udmRel_Ordem_Servicos;

{$R *.dfm}

procedure TfRel_Ordem_Servico_Analitico.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  with dmRel_Ordem_Servico do begin
    QRLabel41.Caption := FormatFloat('###,###,##0.00',(cdsRel_Ordem_ServicoORDS_VLR_TOTAL_OS.AsFloat -
                                                      (cdsRel_Ordem_ServicoORDS_VLR_DESCONTO.AsFloat +
                                                       cdsRel_Ordem_ServicoORDS_VLR_PAGO.AsFloat)));
  end;
end;

procedure TfRel_Ordem_Servico_Analitico.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  with dmRel_Ordem_Servico do begin
    with cdsOrdemServicoItens do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('ORDS_ID').AsInteger := cdsRel_Ordem_ServicoORDS_ID.AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('CLIE_ID').AsInteger := cdsRel_Ordem_ServicoORDS_CLIE_ID.AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
    with cdsAcertos_OS do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('ORDS_ID').AsInteger := cdsRel_Ordem_ServicoORDS_ID.AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
  end;
  CarregaRecebimento;
  CarregaEntrega;
end;

procedure TfRel_Ordem_Servico_Analitico.CarregaRecebimento;
var
  qryCons,
  qryConsI : TSQLQuery;
begin
  try
    chdRecebimento.Frame.DrawTop := false;
    ChildBand2.Frame.DrawTop     := false;
    chdRecebimento.Height        := 0;
    qrDescrReceb.Lines.Clear;
    qrItemReceb.Lines.Clear;
    qrmmRecebimento.Lines.Clear;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      GENE_ID,');
        sql.Add('      GENE_DESCR,');
        sql.Add('      GENE_PAR1');
        sql.Add('FROM  GENERICA');
        sql.Add('WHERE GENE_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   GENE_TGEN_ID = 509');
        sql.Add('ORDER BY');
        sql.Add('      GENE_ID');
        Open;
        if not IsEmpty then begin
          chdRecebimento.Frame.DrawTop := true;
          chdRecebimento.Height        := 37;
          First;
          qryConsI := TSQLQuery.Create(nil);
          qryConsI.SQLConnection := funcLocal.Conexao;
          while not eof do begin
            qrDescrReceb.Lines.Add(Trim(qryCons.Fields[1].AsString));
            qrDescrReceb.Lines.Add('');
            qrItemReceb.Lines.Add('-----------------');
            qrItemReceb.Lines.Add('');
            if qryCons.Fields[2].AsString <> '' then begin
              ChildBand1.Frame.DrawTop := True;
              qrmmRecebimento.Lines.Add('TERMO DE RECEBIMENTO');
              qrmmRecebimento.Lines.Add('');
              qrmmRecebimento.Lines.Add(Trim(qryCons.Fields[2].AsString));
            end;
            qryConsI.Close;
            qryConsI.sql.Clear;
            qryConsI.sql.Add('SELECT');
            qryConsI.sql.Add('      GENE_DESCR');
            qryConsI.sql.Add('FROM  GENERICA');
            qryConsI.sql.Add('WHERE GENE_EMPR_ID           = ' + IntToStr(funcLocal.Empr_ID));
            qryConsI.sql.Add('AND   GENE_TGEN_ID           = 511');
            qryConsI.sql.Add('AND   GENE_GENE_EMPR_ID_PROP = ' + IntToStr(funcLocal.Empr_ID));
            qryConsI.sql.Add('AND   GENE_GENE_TGEN_ID_PROP = 509');
            qryConsI.sql.Add('AND   GENE_GENE_ID_PROD      = ' + qryCons.Fields[0].AsString);
            qryConsI.sql.Add('ORDER BY');
            qryConsI.sql.Add('      GENE_ID');
            qryConsI.Open;
            qryConsI.First;
            while not qryConsI.Eof do begin
              qrDescrReceb.Lines.Add(Trim(qryConsI.Fields[0].AsString));
              qrItemReceb.Lines.Add('Sim (  ) Não (  )');
              qryConsI.Next;
            end;
            Next;
            if not Eof then begin
              qrDescrReceb.Lines.Add('');
              qrItemReceb.Lines.Add('');
            end;
          end;
        end;
      end;
    except on e: exception do begin
      funcLocal.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1);
      funcLocal.ReportaErro('TfImprimirOS','CarregaRecebimento',e.Message);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    try
      qryConsI.Close;
      FreeAndNil(qryConsI);
    except
    end;
  end;
end;

procedure TfRel_Ordem_Servico_Analitico.CarregaEntrega;
var
  qryCons,
  qryConsI : TSQLQuery;
begin
  try
    chdEntrega.Frame.DrawTop := false;
    ChildBand2.Frame.DrawTop := false;
    chdEntrega.Height        := 0;
    qrDescrEntreg.Lines.Clear;
    qrmmEntrega.Lines.Clear;
    qrItemEntreg.Lines.Clear;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      GENE_ID,');
        sql.Add('      GENE_DESCR,');
        sql.Add('      GENE_PAR1');
        sql.Add('FROM  GENERICA');
        sql.Add('WHERE GENE_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   GENE_TGEN_ID = 510');
        sql.Add('ORDER BY');
        sql.Add('      GENE_ID');
        Open;
        if not IsEmpty then begin
          chdEntrega.Frame.DrawTop := true;
          chdEntrega.Height        := 37;
          First;
          qryConsI := TSQLQuery.Create(nil);
          qryConsI.SQLConnection := funcLocal.Conexao;
          while not eof do begin
            qrDescrEntreg.Lines.Add(Trim(qryCons.Fields[1].AsString));
            qrDescrEntreg.Lines.Add('');
            qrItemEntreg.Lines.Add('-----------------');
            qrItemEntreg.Lines.Add('');
            if qryCons.Fields[2].AsString <> '' then begin
              ChildBand1.Frame.DrawTop := True;
              qrmmRecebimento.Lines.Add('TERMO DE RECEBIMENTO');
              qrmmRecebimento.Lines.Add('');
              qrmmRecebimento.Lines.Add(Trim(qryCons.Fields[2].AsString));
            end;
            qryConsI.Close;
            qryConsI.sql.Clear;
            qryConsI.sql.Add('SELECT');
            qryConsI.sql.Add('      GENE_DESCR');
            qryConsI.sql.Add('FROM  GENERICA');
            qryConsI.sql.Add('WHERE GENE_EMPR_ID           = ' + IntToStr(funcLocal.Empr_ID));
            qryConsI.sql.Add('AND   GENE_TGEN_ID           = 512');
            qryConsI.sql.Add('AND   GENE_GENE_EMPR_ID_PROP = ' + IntToStr(funcLocal.Empr_ID));
            qryConsI.sql.Add('AND   GENE_GENE_TGEN_ID_PROP = 510');
            qryConsI.sql.Add('AND   GENE_GENE_ID_PROD      = ' + qryCons.Fields[0].AsString);
            qryConsI.sql.Add('ORDER BY');
            qryConsI.sql.Add('      GENE_ID');
            qryConsI.Open;
            qryConsI.First;
            while not qryConsI.Eof do begin
              qrDescrEntreg.Lines.Add(Trim(qryConsI.Fields[0].AsString));
              qrItemEntreg.Lines.Add('Sim (  ) Não (  )');
              qryConsI.Next;
            end;
            Next;
            if not Eof then begin
              qrDescrEntreg.Lines.Add('');
              qrItemEntreg.Lines.Add('');
            end;
          end;
        end;
      end;
    except on e: exception do begin
      funcLocal.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1);
      funcLocal.ReportaErro('TfImprimirOS','CarregaRecebimento',e.Message);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    try
      qryConsI.Close;
      FreeAndNil(qryConsI);
    except
    end;
  end;
end;

end.
