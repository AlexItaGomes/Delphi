unit udmAgenda;

interface

uses
  System.SysUtils, System.Classes, udmBasico, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.DBClient, Datasnap.Provider, Dialogs;

type
  TdmAgenda = class(TdmBasico)
    dspAgenda: TDataSetProvider;
    cdsAgenda: TClientDataSet;
    dsAgenda: TDataSource;
    qryAgenda: TSQLQuery;
    qryAgendaAGEN_ID: TIntegerField;
    qryAgendaAGEN_EMPR_ID: TIntegerField;
    qryAgendaAGEN_CLIE_ID: TIntegerField;
    qryAgendaAGEN_CLIE_EMPR_ID: TIntegerField;
    qryAgendaAGEN_USER_ID_ATENDENTE: TIntegerField;
    qryAgendaAGEN_TPRC_ID: TIntegerField;
    qryAgendaAGEN_TPRC_EMPR_ID: TIntegerField;
    qryAgendaAGEN_HORA: TStringField;
    qryAgendaAGEN_DATA: TDateField;
    qryAgendaAGEN_OBS: TBlobField;
    qryAgendaAGEN_STATUS: TStringField;
    qryAgendaAGEN_CLIENTE: TStringField;
    qryAgendaAGEN_CLIE_ID_INDICACAO: TIntegerField;
    qryAgendaAGEN_CLIE_EMPR_ID_INDICACAO: TIntegerField;
    qryAgendaAGEN_DTA_CADASTRO: TDateField;
    qryAgendaAGEN_USER_ID: TIntegerField;
    qryAgendaCLIE_RAZAO_SOCIAL: TStringField;
    qryAgendaCLIE_FANTASIA: TStringField;
    qryAgendaRAZAO_INDICACAO: TStringField;
    qryAgendaFANTASIA_INDICACAO: TStringField;
    qryAgendaUSER_NOME_COMPLETO: TStringField;
    qryAgendaTPRC_DESCRICAO: TStringField;
    cdsAgendaAGEN_ID: TIntegerField;
    cdsAgendaAGEN_EMPR_ID: TIntegerField;
    cdsAgendaAGEN_CLIE_ID: TIntegerField;
    cdsAgendaAGEN_CLIE_EMPR_ID: TIntegerField;
    cdsAgendaAGEN_USER_ID_ATENDENTE: TIntegerField;
    cdsAgendaAGEN_TPRC_ID: TIntegerField;
    cdsAgendaAGEN_TPRC_EMPR_ID: TIntegerField;
    cdsAgendaAGEN_HORA: TStringField;
    cdsAgendaAGEN_DATA: TDateField;
    cdsAgendaAGEN_OBS: TBlobField;
    cdsAgendaAGEN_STATUS: TStringField;
    cdsAgendaAGEN_CLIENTE: TStringField;
    cdsAgendaAGEN_CLIE_ID_INDICACAO: TIntegerField;
    cdsAgendaAGEN_CLIE_EMPR_ID_INDICACAO: TIntegerField;
    cdsAgendaAGEN_DTA_CADASTRO: TDateField;
    cdsAgendaAGEN_USER_ID: TIntegerField;
    cdsAgendaCLIE_RAZAO_SOCIAL: TStringField;
    cdsAgendaCLIE_FANTASIA: TStringField;
    cdsAgendaRAZAO_INDICACAO: TStringField;
    cdsAgendaFANTASIA_INDICACAO: TStringField;
    cdsAgendaUSER_NOME_COMPLETO: TStringField;
    cdsAgendaTPRC_DESCRICAO: TStringField;
    qryAgendaCLIE_CEP: TStringField;
    qryAgendaCLIE_ENDERECO: TStringField;
    qryAgendaCLIE_BAIRRO: TStringField;
    qryAgendaCLIE_TELEFONE1: TStringField;
    cdsAgendaCLIE_CEP: TStringField;
    cdsAgendaCLIE_ENDERECO: TStringField;
    cdsAgendaCLIE_BAIRRO: TStringField;
    cdsAgendaCLIE_TELEFONE1: TStringField;
    qryAgendaAGEN_FOTO_ANT: TBlobField;
    qryAgendaAGEN_FOTO_DEP: TBlobField;
    cdsAgendaAGEN_FOTO_ANT: TBlobField;
    cdsAgendaAGEN_FOTO_DEP: TBlobField;
    qryOrdemServicoItens: TSQLQuery;
    qryOrdemServicoItensODIT_ID: TIntegerField;
    qryOrdemServicoItensODIT_EMPR_ID: TIntegerField;
    qryOrdemServicoItensODIT_ORDS_ID: TIntegerField;
    qryOrdemServicoItensODIT_ORDS_EMPR_ID: TIntegerField;
    qryOrdemServicoItensODIT_ORDS_CLIE_ID: TIntegerField;
    qryOrdemServicoItensODIT_ORDS_CLIE_EMPR_ID: TIntegerField;
    qryOrdemServicoItensODIT_TPIT_ID: TIntegerField;
    qryOrdemServicoItensODIT_TPIT_EMPR_ID: TIntegerField;
    qryOrdemServicoItensODIT_TPIT_TPRC_ID: TIntegerField;
    qryOrdemServicoItensODIT_TPIT_TPRC_EMPR_ID: TIntegerField;
    qryOrdemServicoItensODIT_TPIT_PROD_ID: TIntegerField;
    qryOrdemServicoItensODIT_TPIT_PROD_EMPR_ID: TIntegerField;
    qryOrdemServicoItensODIT_VLR_UNITARIO: TFMTBCDField;
    qryOrdemServicoItensODIT_QTDE: TFMTBCDField;
    qryOrdemServicoItensODIT_VLR_TOTAL: TFMTBCDField;
    qryOrdemServicoItensODIT_DTA_CADASTRO: TDateField;
    qryOrdemServicoItensODIT_USER_ID: TIntegerField;
    qryOrdemServicoItensPROD_DESCRICAO: TStringField;
    qryOrdemServicoItensPROD_UNIDADE: TStringField;
    qryOrdemServicoItensMARCA_PROD: TStringField;
    qryOrdemServicoItensMODELO_PROD: TStringField;
    qryOrdemServicoItensPROD_GARANTIA: TIntegerField;
    qryOrdemServicoItensGENE_IMAGE: TBlobField;
    dspOrdemServicoItens: TDataSetProvider;
    cdsOrdemServicoItens: TClientDataSet;
    cdsOrdemServicoItensODIT_TPIT_PROD_ID: TIntegerField;
    cdsOrdemServicoItensPROD_DESCRICAO: TStringField;
    cdsOrdemServicoItensPROD_UNIDADE: TStringField;
    cdsOrdemServicoItensPROD_GARANTIA: TIntegerField;
    cdsOrdemServicoItensODIT_VLR_UNITARIO: TFMTBCDField;
    cdsOrdemServicoItensODIT_QTDE: TFMTBCDField;
    cdsOrdemServicoItensODIT_VLR_TOTAL: TFMTBCDField;
    cdsOrdemServicoItensMARCA_PROD: TStringField;
    cdsOrdemServicoItensMODELO_PROD: TStringField;
    cdsOrdemServicoItensODIT_ID: TIntegerField;
    cdsOrdemServicoItensODIT_EMPR_ID: TIntegerField;
    cdsOrdemServicoItensODIT_ORDS_ID: TIntegerField;
    cdsOrdemServicoItensODIT_ORDS_EMPR_ID: TIntegerField;
    cdsOrdemServicoItensODIT_ORDS_CLIE_ID: TIntegerField;
    cdsOrdemServicoItensODIT_ORDS_CLIE_EMPR_ID: TIntegerField;
    cdsOrdemServicoItensODIT_TPIT_ID: TIntegerField;
    cdsOrdemServicoItensODIT_TPIT_EMPR_ID: TIntegerField;
    cdsOrdemServicoItensODIT_TPIT_TPRC_ID: TIntegerField;
    cdsOrdemServicoItensODIT_TPIT_TPRC_EMPR_ID: TIntegerField;
    cdsOrdemServicoItensODIT_TPIT_PROD_EMPR_ID: TIntegerField;
    cdsOrdemServicoItensODIT_DTA_CADASTRO: TDateField;
    cdsOrdemServicoItensODIT_USER_ID: TIntegerField;
    cdsOrdemServicoItensGENE_IMAGE: TBlobField;
    cdsOrdemServicoItensTOTALITENS: TAggregateField;
    dsOrdemServicoItens: TDataSource;
    qryPesqProduto: TSQLQuery;
    dspPesqProduto: TDataSetProvider;
    cdsPesqProduto: TClientDataSet;
    cdsPesqProdutoTPIT_PROD_ID: TIntegerField;
    cdsPesqProdutoPROD_DESCRICAO: TStringField;
    cdsPesqProdutoPROD_UNIDADE: TStringField;
    cdsPesqProdutoMARCA_PROD: TStringField;
    cdsPesqProdutoMODELO_PROD: TStringField;
    cdsPesqProdutoTPIT_VLR_GONDOLA: TFMTBCDField;
    cdsPesqProdutoTPIT_DTA_VIGENCIA: TDateField;
    cdsPesqProdutoTPIT_DTA_VALIDADE: TDateField;
    cdsPesqProdutoPROD_GARANTIA: TIntegerField;
    cdsPesqProdutoTPIT_ID: TIntegerField;
    cdsPesqProdutoTPIT_EMPR_ID: TIntegerField;
    cdsPesqProdutoTPIT_TPRC_ID: TIntegerField;
    cdsPesqProdutoTPIT_TPRC_EMPR_ID: TIntegerField;
    cdsPesqProdutoTPIT_PROD_EMPR_ID: TIntegerField;
    cdsPesqProdutoTPIT_VLR_MINIMO: TFMTBCDField;
    cdsPesqProdutoTPIT_VLR_ESPECIAL: TFMTBCDField;
    cdsPesqProdutoESTQ_EST_ATUAL: TFMTBCDField;
    cdsPesqProdutoESTQ_EST_DISP: TFMTBCDField;
    cdsPesqProdutoCOD_FORNEC1: TIntegerField;
    cdsPesqProdutoCOD_FORNEC2: TIntegerField;
    cdsPesqProdutoCOD_FORNEC3: TIntegerField;
    cdsPesqProdutoCOD_FORNEC4: TIntegerField;
    qryAgendaAGEN_VLR_TOTAL: TFMTBCDField;
    cdsAgendaAGEN_VLR_TOTAL: TFMTBCDField;
    qryAgendaAGEN_VLR_DESCONTO: TFMTBCDField;
    qryAgendaAGEN_VLR_PAGO: TFMTBCDField;
    cdsAgendaAGEN_VLR_DESCONTO: TFMTBCDField;
    cdsAgendaAGEN_VLR_PAGO: TFMTBCDField;
    cdsAgendaVALOR_PAGAR: TFloatField;
    qryAgendaAGEN_ORDS_ID: TIntegerField;
    qryAgendaAGEN_ORDS_EMPR_ID: TIntegerField;
    cdsAgendaAGEN_ORDS_ID: TIntegerField;
    cdsAgendaAGEN_ORDS_EMPR_ID: TIntegerField;
    qryOrdemServicoItensODIT_USER_ID_TEC: TIntegerField;
    cdsOrdemServicoItensODIT_USER_ID_TEC: TIntegerField;
    qryAgendaAGEN_TELEFONE: TStringField;
    cdsAgendaAGEN_TELEFONE: TStringField;
    cdsPesqProdutoPROD_DURACAO: TIntegerField;
    qryOrdemServicoItensPROD_DURACAO: TIntegerField;
    cdsOrdemServicoItensPROD_DURACAO: TIntegerField;
    qryAgendaAGEN_EXT_HORARIO: TIntegerField;
    qryAgendaAGEN_AGEN_ID: TIntegerField;
    qryAgendaAGEN_AGEN_EMPR_ID: TIntegerField;
    qryAgendaAGEN_BLOQUEAR_HORARIO: TIntegerField;
    cdsAgendaAGEN_EXT_HORARIO: TIntegerField;
    cdsAgendaAGEN_AGEN_ID: TIntegerField;
    cdsAgendaAGEN_AGEN_EMPR_ID: TIntegerField;
    cdsAgendaAGEN_BLOQUEAR_HORARIO: TIntegerField;
    qryAgendaAGEN_BAIXA_ESTOQUE: TIntegerField;
    cdsAgendaAGEN_BAIXA_ESTOQUE: TIntegerField;
    qryAgendaAGEN_FECHOU_FINANCEIRO: TIntegerField;
    cdsAgendaAGEN_FECHOU_FINANCEIRO: TIntegerField;
    qryAgendaAGEN_PIGMENTO_COR: TStringField;
    qryAgendaAGEN_PIGMENTO_MARCA: TStringField;
    qryAgendaAGEN_PIGMENTO_LOTE: TStringField;
    cdsAgendaAGEN_PIGMENTO_COR: TStringField;
    cdsAgendaAGEN_PIGMENTO_MARCA: TStringField;
    cdsAgendaAGEN_PIGMENTO_LOTE: TStringField;
    dspListaAtendimentos: TDataSetProvider;
    cdsListaAtendimentos: TClientDataSet;
    qryListaAtendimentos: TSQLQuery;
    dsListaAtendimentos: TDataSource;
    dspListaItensAtendimentos: TDataSetProvider;
    cdsListaItensAtendimentos: TClientDataSet;
    qryListaItensAtendimentos: TSQLQuery;
    dsListaItensAtendimentos: TDataSource;
    cdsListaAtendimentosAGEN_ID: TIntegerField;
    cdsListaAtendimentosAGEN_DTA_CADASTRO: TDateField;
    cdsListaAtendimentosAGEN_DATA: TDateField;
    cdsListaAtendimentosAGEN_HORA: TStringField;
    cdsListaAtendimentosAGEN_CLIE_ID: TIntegerField;
    cdsListaAtendimentosCLIE_FANTASIA: TStringField;
    cdsListaAtendimentosCLIE_ENDERECO: TStringField;
    cdsListaAtendimentosCLIE_BAIRRO: TStringField;
    cdsListaAtendimentosCLIE_CEP: TStringField;
    cdsListaAtendimentosCIDADE: TStringField;
    cdsListaAtendimentosUF: TStringField;
    cdsListaAtendimentosPROFISSIONAL: TStringField;
    cdsListaAtendimentosSTATUS: TStringField;
    cdsListaAtendimentosGLAUCOMA: TStringField;
    cdsListaAtendimentosDEPRESSAO: TStringField;
    cdsListaAtendimentosEPILEPSIA: TStringField;
    cdsListaAtendimentosMARCA_PASSO: TStringField;
    cdsListaAtendimentosHIPERTENSAO: TStringField;
    cdsListaAtendimentosHEPATITE: TStringField;
    cdsListaAtendimentosCLIE_HEPATITE_TIPO: TStringField;
    cdsListaAtendimentosDIABETES: TStringField;
    cdsListaAtendimentosCLIE_DIABETES_TIPO: TStringField;
    cdsListaAtendimentosCANCER: TStringField;
    cdsListaAtendimentosHIV: TStringField;
    cdsListaAtendimentosALCOOLIZADO: TStringField;
    cdsListaAtendimentosGRAVIDA: TStringField;
    cdsListaAtendimentosALERGICO: TStringField;
    cdsListaAtendimentosPROBLEMA_PELE: TStringField;
    cdsListaAtendimentosUTILIZOU_ANESTESIA: TStringField;
    cdsListaAtendimentosCLIE_TEMPO_ANESTESIA: TTimeField;
    cdsListaAtendimentosAGEN_PIGMENTO_COR: TStringField;
    cdsListaAtendimentosAGEN_PIGMENTO_MARCA: TStringField;
    cdsListaAtendimentosAGEN_PIGMENTO_LOTE: TStringField;
    cdsListaAtendimentosNIVEL_ANESTESIA: TStringField;
    cdsListaAtendimentosAGEN_OBS: TBlobField;
    cdsListaAtendimentosAGEN_ORDS_ID: TIntegerField;
    dspAniversario: TDataSetProvider;
    cdsAniversario: TClientDataSet;
    qryAniversario: TSQLQuery;
    dsAniversario: TDataSource;
    cdsAniversarioCLIE_ID: TIntegerField;
    cdsAniversarioCLIE_FANTASIA: TStringField;
    cdsAniversarioCLIE_TELEFONE1: TStringField;
    cdsAniversarioCLIE_TELEFONE2: TStringField;
    cdsAniversarioCLIE_TELEFONE3: TStringField;
    cdsAniversarioCLIE_TELEFONE4: TStringField;
    cdsAniversarioCLIE_DT_NASCIMENTO: TDateField;
    cdsListaItensAtendimentosPROD_DESCRICAO: TStringField;
    cdsListaItensAtendimentosPROD_DURACAO: TIntegerField;
    qryAgendaAGEN_ORIGEM_REAGENDAMENTO: TIntegerField;
    cdsAgendaAGEN_ORIGEM_REAGENDAMENTO: TIntegerField;
    qryAgendaAGEN_PIGMENTO_COR1: TStringField;
    qryAgendaAGEN_PIGMENTO_MARCA1: TStringField;
    qryAgendaAGEN_PIGMENTO_LOTE1: TStringField;
    qryAgendaAGEN_PIGMENTO_COR2: TStringField;
    qryAgendaAGEN_PIGMENTO_MARCA2: TStringField;
    qryAgendaAGEN_PIGMENTO_LOTE2: TStringField;
    cdsAgendaAGEN_PIGMENTO_COR1: TStringField;
    cdsAgendaAGEN_PIGMENTO_MARCA1: TStringField;
    cdsAgendaAGEN_PIGMENTO_LOTE1: TStringField;
    cdsAgendaAGEN_PIGMENTO_COR2: TStringField;
    cdsAgendaAGEN_PIGMENTO_MARCA2: TStringField;
    cdsAgendaAGEN_PIGMENTO_LOTE2: TStringField;
    cdsListaAtendimentosAGEN_PIGMENTO_COR1: TStringField;
    cdsListaAtendimentosAGEN_PIGMENTO_MARCA1: TStringField;
    cdsListaAtendimentosAGEN_PIGMENTO_LOTE1: TStringField;
    cdsListaAtendimentosAGEN_PIGMENTO_COR2: TStringField;
    cdsListaAtendimentosAGEN_PIGMENTO_MARCA2: TStringField;
    cdsListaAtendimentosAGEN_PIGMENTO_LOTE2: TStringField;
    qryAcertos: TSQLQuery;
    dspAcertos: TDataSetProvider;
    cdsAcertos: TClientDataSet;
    dsAcertos: TDataSource;
    cdsAcertosGENE_DESCR: TStringField;
    cdsAcertosACER_VLR_DOC: TFMTBCDField;
    cdsAcertosACER_DTA_CADASTRO: TDateField;
    cdsAcertosACER_DTA_VCTO: TDateField;
    cdsAcertosSTATUS: TStringField;
    qryItensSintetico: TSQLQuery;
    dspItensSintetico: TDataSetProvider;
    cdsItensSintetico: TClientDataSet;
    dsItensSintetico: TDataSource;
    cdsItensSinteticoAGEN_ID: TIntegerField;
    cdsItensSinteticoAGEN_DATA: TDateField;
    cdsItensSinteticoAGEN_HORA: TStringField;
    cdsItensSinteticoUSER_NOME_COMPLETO: TStringField;
    cdsItensSinteticoPROD_DESCRICAO: TStringField;
    cdsItensSinteticoPROD_DURACAO: TIntegerField;
    cdsItensSinteticoODIT_VLR_UNITARIO: TFMTBCDField;
    cdsItensSinteticoODIT_QTDE: TFMTBCDField;
    cdsItensSinteticoODIT_VLR_TOTAL: TFMTBCDField;
    qryAgendaCLIE_OBS: TBlobField;
    cdsAgendaCLIE_OBS: TBlobField;
    qryAgendaCLIE_DTA_CADASTRO: TDateField;
    cdsAgendaCLIE_DTA_CADASTRO: TDateField;
    cdsItensSinteticoSTATUS: TStringField;
    procedure cdsAgendaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsAgendaNewRecord(DataSet: TDataSet);
    procedure cdsOrdemServicoItensNewRecord(DataSet: TDataSet);
    procedure cdsAgendaAfterEdit(DataSet: TDataSet);
    procedure cdsOrdemServicoItensReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure dsListaAtendimentosDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAgenda: TdmAgenda;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TdmAgenda.cdsAgendaAfterEdit(DataSet: TDataSet);
begin
  inherited;
  DataSet.Edit;
  DataSet.FieldByName('AGEN_VLR_TOTAL').AsFloat    := 0;
  DataSet.FieldByName('AGEN_VLR_PAGO').AsFloat     := 0;
end;

procedure TdmAgenda.cdsAgendaNewRecord(DataSet: TDataSet);
begin
  inherited;
  try
    DataSet.FieldByName('AGEN_ID').AsInteger := funcLocal.ObterSequencia('AGENDA',funcLocal.Empr_ID);
    DataSet.FieldByName('AGEN_EMPR_ID').AsInteger := funcLocal.Empr_ID;
    DataSet.FieldByName('AGEN_CLIE_ID').AsInteger := funcLocal.ClientePadrao;
    DataSet.FieldByName('AGEN_CLIE_EMPR_ID').AsInteger := funcLocal.Empr_ID;
    DataSet.FieldByName('AGEN_CLIE_EMPR_ID_INDICACAO').AsInteger := funcLocal.Empr_ID;
    DataSet.FieldByName('AGEN_TPRC_ID').AsInteger := funcLocal.TabPrecoPadrao;
    DataSet.FieldByName('AGEN_TPRC_EMPR_ID').AsInteger := funcLocal.Empr_ID;
    DataSet.FieldByName('AGEN_STATUS').AsString := 'A';
    DataSet.FieldByName('AGEN_VLR_TOTAL').AsFloat := 0;
    DataSet.FieldByName('AGEN_VLR_PAGO').AsFloat := 0;
    DataSet.FieldByName('AGEN_VLR_DESCONTO').AsFloat := 0;
    DataSet.FieldByName('AGEN_ORDS_ID').AsInteger := -1;
    DataSet.FieldByName('AGEN_ORDS_EMPR_ID').AsInteger := funcLocal.Empr_ID;
    DataSet.FieldByName('AGEN_EXT_HORARIO').AsInteger := 0;
    DataSet.FieldByName('AGEN_AGEN_EMPR_ID').AsInteger := 0;
    DataSet.FieldByName('AGEN_BLOQUEAR_HORARIO').AsInteger := 0;
    DataSet.FieldByName('AGEN_BAIXA_ESTOQUE').AsInteger := 0;
    DataSet.FieldByName('AGEN_FECHOU_FINANCEIRO').AsInteger := 0;
    DataSet.FieldByName('AGEN_ORIGEM_REAGENDAMENTO').AsInteger := 0;
    DataSet.FieldByName('AGEN_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor();
    DataSet.FieldByName('AGEN_USER_ID').AsInteger := funcLocal.User_ID;
  except
  end;
end;

procedure TdmAgenda.cdsAgendaReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmAgenda','cdsAgendaReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmAgenda.cdsOrdemServicoItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('ODIT_ID').AsString                 := funcLocal.ObterSequencia('ORDEM_SERVICO_ITENS',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('ODIT_EMPR_ID').AsInteger           := funcLocal.Empr_ID;
  DataSet.FieldByName('ODIT_ORDS_ID').AsInteger           := cdsAgendaAGEN_ORDS_ID.AsInteger;
  DataSet.FieldByName('ODIT_ORDS_EMPR_ID').AsInteger      := funcLocal.Empr_ID;
  DataSet.FieldByName('ODIT_ORDS_CLIE_ID').AsInteger      := cdsAgendaAGEN_CLIE_ID.AsInteger;
  DataSet.FieldByName('ODIT_ORDS_CLIE_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('ODIT_TPIT_EMPR_ID').AsInteger      := funcLocal.Empr_ID;
  DataSet.FieldByName('ODIT_TPIT_TPRC_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('ODIT_TPIT_PROD_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('ODIT_VLR_UNITARIO').AsFloat        := 0;
  DataSet.FieldByName('ODIT_QTDE').AsFloat                := 1;
  DataSet.FieldByName('ODIT_VLR_TOTAL').AsFloat           := 0;
  DataSet.FieldByName('ODIT_DTA_CADASTRO').AsDateTime     := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('ODIT_USER_ID').AsInteger           := funcLocal.User_ID;
end;

procedure TdmAgenda.cdsOrdemServicoItensReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  ShowMessage(e.Message);
end;

procedure TdmAgenda.dsListaAtendimentosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with cdsListaItensAtendimentos do begin
    Close;
    Params.ParamByName('ORDS_ID').AsInteger := cdsListaAtendimentosAGEN_ORDS_ID.AsInteger;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Open;
  end;
end;

initialization
  dmAgenda := TdmAgenda.Create(nil);
finalization
  FreeAndNil(dmAgenda);


end.
