unit udmControle_Obras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmControle_Obras = class(TdmBasico)
    qryControle_Obras: TSQLQuery;
    dspControle_Obras: TDataSetProvider;
    cdsControle_Obras: TClientDataSet;
    dsControle_Obras: TDataSource;
    qryControle_ObrasOBRA_ID: TIntegerField;
    qryControle_ObrasOBRA_EMPR_ID: TIntegerField;
    qryControle_ObrasOBRA_ENG_RESPONSAVEL: TStringField;
    qryControle_ObrasOBRA_DESCRICAO: TStringField;
    qryControle_ObrasOBRA_ENDERECO: TStringField;
    qryControle_ObrasOBRA_BAIRRO: TStringField;
    qryControle_ObrasOBRA_AREA_CONTRUIDA: TFMTBCDField;
    qryControle_ObrasOBRA_AREA_TOTAL: TFMTBCDField;
    qryControle_ObrasOBRA_VLR_INVESTIMENTO: TFMTBCDField;
    qryControle_ObrasOBRA_VLR_TOTAL: TFMTBCDField;
    qryControle_ObrasOBRA_DTA_PREV_INICIO_OBRA: TDateField;
    qryControle_ObrasOBRA_DTA_PREV_FIM_OBRA: TDateField;
    qryControle_ObrasOBRA_DTA_INICIO_OBRA: TDateField;
    qryControle_ObrasOBRA_DTA_FIM_OBRA: TDateField;
    qryControle_ObrasOBRA_STATUS: TIntegerField;
    qryControle_ObrasOBRA_DTA_CADASTRO: TDateField;
    qryControle_ObrasOBRA_USER_ID: TIntegerField;
    qryControle_ObrasCIDADE: TStringField;
    qryControle_ObrasUF: TStringField;
    cdsControle_ObrasOBRA_ID: TIntegerField;
    cdsControle_ObrasOBRA_EMPR_ID: TIntegerField;
    cdsControle_ObrasOBRA_ENG_RESPONSAVEL: TStringField;
    cdsControle_ObrasOBRA_DESCRICAO: TStringField;
    cdsControle_ObrasOBRA_ENDERECO: TStringField;
    cdsControle_ObrasOBRA_BAIRRO: TStringField;
    cdsControle_ObrasOBRA_AREA_CONTRUIDA: TFMTBCDField;
    cdsControle_ObrasOBRA_AREA_TOTAL: TFMTBCDField;
    cdsControle_ObrasOBRA_VLR_INVESTIMENTO: TFMTBCDField;
    cdsControle_ObrasOBRA_VLR_TOTAL: TFMTBCDField;
    cdsControle_ObrasOBRA_DTA_PREV_INICIO_OBRA: TDateField;
    cdsControle_ObrasOBRA_DTA_PREV_FIM_OBRA: TDateField;
    cdsControle_ObrasOBRA_DTA_INICIO_OBRA: TDateField;
    cdsControle_ObrasOBRA_DTA_FIM_OBRA: TDateField;
    cdsControle_ObrasOBRA_STATUS: TIntegerField;
    cdsControle_ObrasOBRA_DTA_CADASTRO: TDateField;
    cdsControle_ObrasOBRA_USER_ID: TIntegerField;
    cdsControle_ObrasCIDADE: TStringField;
    cdsControle_ObrasUF: TStringField;
    qryEtapas_Obras: TSQLQuery;
    dspEtapas_Obras: TDataSetProvider;
    cdsEtapas_Obras: TClientDataSet;
    dsEtapas_Obras: TDataSource;
    qryEtapas_ObrasOBET_ID: TIntegerField;
    qryEtapas_ObrasOBET_EMPR_ID: TIntegerField;
    qryEtapas_ObrasOBET_OBRA_ID: TIntegerField;
    qryEtapas_ObrasOBET_OBRA_EMPR_ID: TIntegerField;
    qryEtapas_ObrasOBET_DESCRICAO: TStringField;
    qryEtapas_ObrasOBET_DTA_PREV_INICIO: TDateField;
    qryEtapas_ObrasOBET_DTA_PREV_FIM: TDateField;
    qryEtapas_ObrasOBET_DTA_INICIO: TDateField;
    qryEtapas_ObrasOBET_DTA_FIM: TDateField;
    qryEtapas_ObrasOBET_VLR_PREVISAO: TFMTBCDField;
    qryEtapas_ObrasOBET_STATUS: TIntegerField;
    qryEtapas_ObrasOBET_SEQUENCIA: TIntegerField;
    qryEtapas_ObrasOBET_SEQUENCIA_ANTERIOR: TIntegerField;
    qryEtapas_ObrasOBET_DTA_CADASTRO: TDateField;
    qryEtapas_ObrasOBET_USER_ID: TIntegerField;
    qryPesq_Praca: TSQLQuery;
    dspPesq_Praca: TDataSetProvider;
    cdsPesq_Praca: TClientDataSet;
    cdsPesq_PracaGENE_ID: TIntegerField;
    cdsPesq_PracaGENE_DESCR: TStringField;
    cdsPesq_PracaGENE_PAR1: TStringField;
    dsPesq_Praca: TDataSource;
    qryControle_ObrasOBRA_GENE_EMPR_ID_PRACA: TIntegerField;
    qryControle_ObrasOBRA_GENE_TGEN_ID_PRACA: TIntegerField;
    qryControle_ObrasOBRA_GENE_ID_PRACA: TIntegerField;
    cdsControle_ObrasOBRA_GENE_EMPR_ID_PRACA: TIntegerField;
    cdsControle_ObrasOBRA_GENE_TGEN_ID_PRACA: TIntegerField;
    cdsControle_ObrasOBRA_GENE_ID_PRACA: TIntegerField;
    cdsEtapas_ObrasOBET_ID: TIntegerField;
    cdsEtapas_ObrasOBET_EMPR_ID: TIntegerField;
    cdsEtapas_ObrasOBET_OBRA_ID: TIntegerField;
    cdsEtapas_ObrasOBET_OBRA_EMPR_ID: TIntegerField;
    cdsEtapas_ObrasOBET_DESCRICAO: TStringField;
    cdsEtapas_ObrasOBET_DTA_PREV_INICIO: TDateField;
    cdsEtapas_ObrasOBET_DTA_PREV_FIM: TDateField;
    cdsEtapas_ObrasOBET_DTA_INICIO: TDateField;
    cdsEtapas_ObrasOBET_DTA_FIM: TDateField;
    cdsEtapas_ObrasOBET_VLR_PREVISAO: TFMTBCDField;
    cdsEtapas_ObrasOBET_STATUS: TIntegerField;
    cdsEtapas_ObrasOBET_SEQUENCIA: TIntegerField;
    cdsEtapas_ObrasOBET_SEQUENCIA_ANTERIOR: TIntegerField;
    cdsEtapas_ObrasOBET_DTA_CADASTRO: TDateField;
    cdsEtapas_ObrasOBET_USER_ID: TIntegerField;
    qryItensEtapas: TSQLQuery;
    dspItensEtapas: TDataSetProvider;
    cdsItensEtapas: TClientDataSet;
    dsItensEtapas: TDataSource;
    qryItensEtapasOBEI_ID: TIntegerField;
    qryItensEtapasOBEI_EMPR_ID: TIntegerField;
    qryItensEtapasOBEI_OBET_ID: TIntegerField;
    qryItensEtapasOBEI_OBET_EMPR_ID: TIntegerField;
    qryItensEtapasOBEI_OBET_OBRA_ID: TIntegerField;
    qryItensEtapasOBEI_OBET_OBRA_EMPR_ID: TIntegerField;
    qryItensEtapasOBEI_PROD_ID: TIntegerField;
    qryItensEtapasOBEI_PROD_EMPR_ID: TIntegerField;
    qryItensEtapasOBEI_QTDE: TFMTBCDField;
    qryItensEtapasOBEI_DTA_CADASTRO: TDateField;
    qryItensEtapasOBEI_USER_ID: TIntegerField;
    qryItensEtapasPROD_DESCRICAO: TStringField;
    qryItensEtapasPROD_UNIDADE: TStringField;
    qryItensEtapasGRUPO_PROD: TStringField;
    qryItensEtapasMARCA_PROD: TStringField;
    qryItensEtapasMODELO_PROD: TStringField;
    cdsItensEtapasOBEI_ID: TIntegerField;
    cdsItensEtapasOBEI_EMPR_ID: TIntegerField;
    cdsItensEtapasOBEI_OBET_ID: TIntegerField;
    cdsItensEtapasOBEI_OBET_EMPR_ID: TIntegerField;
    cdsItensEtapasOBEI_OBET_OBRA_ID: TIntegerField;
    cdsItensEtapasOBEI_OBET_OBRA_EMPR_ID: TIntegerField;
    cdsItensEtapasOBEI_PROD_ID: TIntegerField;
    cdsItensEtapasOBEI_PROD_EMPR_ID: TIntegerField;
    cdsItensEtapasOBEI_QTDE: TFMTBCDField;
    cdsItensEtapasOBEI_DTA_CADASTRO: TDateField;
    cdsItensEtapasOBEI_USER_ID: TIntegerField;
    cdsItensEtapasPROD_DESCRICAO: TStringField;
    cdsItensEtapasPROD_UNIDADE: TStringField;
    cdsItensEtapasGRUPO_PROD: TStringField;
    cdsItensEtapasMARCA_PROD: TStringField;
    cdsItensEtapasMODELO_PROD: TStringField;
    qryPesqProdutos: TSQLQuery;
    dspPesqProdutos: TDataSetProvider;
    cdsPesqProdutos: TClientDataSet;
    cdsPesqProdutosPROD_ID: TIntegerField;
    cdsPesqProdutosPROD_DESCRICAO: TStringField;
    cdsPesqProdutosPROD_UNIDADE: TStringField;
    cdsPesqProdutosGRUPO_PROD: TStringField;
    cdsPesqProdutosMARCA_PROD: TStringField;
    cdsPesqProdutosMODELO_PROD: TStringField;
    cdsPesqProdutosPROD_FLG_FRACIONADO: TIntegerField;
    qryItensEtapasPROD_FLG_FRACIONADO: TIntegerField;
    cdsItensEtapasPROD_FLG_FRACIONADO: TIntegerField;
    qryItensEtapasOBEI_VLR_UNIT: TFMTBCDField;
    cdsItensEtapasOBEI_VLR_UNIT: TFMTBCDField;
    qryPesqObra: TSQLQuery;
    dspPesqObra: TDataSetProvider;
    cdsPesqObra: TClientDataSet;
    cdsPesqObraOBRA_ID: TIntegerField;
    cdsPesqObraOBRA_DESCRICAO: TStringField;
    cdsPesqObraOBRA_DTA_PREV_INICIO_OBRA: TDateField;
    cdsPesqObraOBRA_DTA_PREV_FIM_OBRA: TDateField;
    cdsPesqObraOBRA_DTA_INICIO_OBRA: TDateField;
    cdsPesqObraOBRA_DTA_FIM_OBRA: TDateField;
    qryPesqSeq: TSQLQuery;
    dspPesqSeq: TDataSetProvider;
    cdsPesqSeq: TClientDataSet;
    cdsPesqSeqOBET_SEQUENCIA: TIntegerField;
    cdsPesqSeqOBET_DESCRICAO: TStringField;
    cdsPesqSeqOBET_DTA_PREV_INICIO: TDateField;
    cdsPesqSeqOBET_DTA_PREV_FIM: TDateField;
    procedure cdsControle_ObrasNewRecord(DataSet: TDataSet);
    procedure cdsControle_ObrasBeforeDelete(DataSet: TDataSet);
    procedure cdsEtapas_ObrasNewRecord(DataSet: TDataSet);
    procedure cdsItensEtapasNewRecord(DataSet: TDataSet);
    procedure cdsEtapas_ObrasReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmControle_Obras: TdmControle_Obras;

implementation

{$R *.dfm}

procedure TdmControle_Obras.cdsControle_ObrasBeforeDelete(DataSet: TDataSet);
var
  qryCons : TSQLQuery;
begin
  inherited;
  if not funcLocal.DeletaRegistro('OBRAS',DataSet.FieldByName('OBRA_ID').AsString,'') then begin

  end else begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          try
            funcLocal.StartCommit
          except
          end;
          sql.Add('DELETE FROM OBRAS_ETAPAS');
          sql.Add('WHERE  OBET_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND    OBET_OBRA_ID      = ' + DataSet.FieldByName('OBRA_ID').AsString);
          sql.Add('AND    OBET_OBRA_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL;
          try
            funcLocal.Commit;
          except
          end;
        end;
      except on e: exception do begin
        funcLocal.Alerta('Erro no processo de exclusão do registro.'+#13+'['+e.Message+']',1);
        funcLocal.ReportaErro('TdmControle_Obras','cdsControle_ObrasBeforeDelete',e.Message);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
end;

procedure TdmControle_Obras.cdsControle_ObrasNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('OBRA_ID').AsString                   := funcLocal.ObterSequencia('OBRAS',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('OBRA_EMPR_ID').AsInteger             := funcLocal.Empr_ID;
  DataSet.FieldByName('OBRA_GENE_EMPR_ID_PRACA').AsInteger := 0;
  DataSet.FieldByName('OBRA_GENE_TGEN_ID_PRACA').AsInteger := 501;
  DataSet.FieldByName('OBRA_AREA_CONTRUIDA').AsFloat        := 0;
  DataSet.FieldByName('OBRA_AREA_TOTAL').AsFloat            := 0;
  DataSet.FieldByName('OBRA_VLR_INVESTIMENTO').AsFloat      := 0;
  DataSet.FieldByName('OBRA_VLR_TOTAL').AsFloat             := 0;
  DataSet.FieldByName('OBRA_STATUS').AsInteger              := 0;
  DataSet.FieldByName('OBRA_DTA_CADASTRO').AsDateTime       := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('OBRA_USER_ID').AsInteger             := funcLocal.User_ID; 
end;

procedure TdmControle_Obras.cdsEtapas_ObrasNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('OBET_ID').AsInteger            := StrToInt(funcLocal.ObterSequencia('OBRAS_ETAPAS',IntToStr(funcLocal.Empr_ID)));
  DataSet.FieldByName('OBET_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('OBET_OBRA_ID').AsInteger       := cdsControle_ObrasOBRA_ID.AsInteger;
  DataSet.FieldByName('OBET_OBRA_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('OBET_VLR_PREVISAO').AsFloat    := 0;
  DataSet.FieldByName('OBET_STATUS').AsInteger        := 0;
  DataSet.FieldByName('OBET_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('OBET_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmControle_Obras.cdsEtapas_ObrasReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmControle_Obras','cdsEtapas_ObrasReconcileError',e.Message);
  funcLocal.Alerta('Erro no processo de salvar etapa da obra.'+#13+'['+e.Message+']',1)
end;

procedure TdmControle_Obras.cdsItensEtapasNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('OBEI_ID').AsString                 := funcLocal.ObterSequencia('OBRAS_ETAPAS_ITENS',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('OBEI_EMPR_ID').AsInteger           := funcLocal.Empr_ID;
  DataSet.FieldByName('OBEI_OBET_ID').AsInteger           := cdsEtapas_ObrasOBET_ID.AsInteger;
  DataSet.FieldByName('OBEI_OBET_EMPR_ID').AsInteger      := funcLocal.Empr_ID;
  DataSet.FieldByName('OBEI_OBET_OBRA_ID').AsInteger      := cdsControle_ObrasOBRA_ID.AsInteger;
  DataSet.FieldByName('OBEI_OBET_OBRA_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('OBEI_PROD_EMPR_ID').AsInteger      := funcLocal.Empr_ID;
  DataSet.FieldByName('OBEI_QTDE').AsFloat                := 1;
  DataSet.FieldByName('OBEI_VLR_UNIT').AsFloat            := 0;
  DataSet.FieldByName('OBEI_DTA_CADASTRO').AsDateTime     := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('OBEI_USER_ID').AsInteger           := funcLocal.User_ID;
end;

initialization
  if dmControle_Obras = nil then
    dmControle_Obras := TdmControle_Obras.Create(nil);

finalization
  FreeAndNil(dmControle_Obras);

end.
