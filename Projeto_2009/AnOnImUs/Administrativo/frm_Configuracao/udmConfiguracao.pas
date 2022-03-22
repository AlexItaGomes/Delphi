unit udmConfiguracao;

interface

uses
  SysUtils, Classes, Funcoes, Forms, SQLExpr, FMTBcd, DB, DBClient, Provider;

type
  TdmConfiguracao = class(TDataModule)
    qryConfiguracao: TSQLQuery;
    dspConfiguracao: TDataSetProvider;
    cdsConfiguracao: TClientDataSet;
    dsConfiguracao: TDataSource;
    qryConfiguracaoEMPR_RAZAO_SOCIAL: TStringField;
    qryConfiguracaoCSIS_EMPR_ID: TIntegerField;
    qryConfiguracaoCSIS_REPORTA_ERROS: TIntegerField;
    qryConfiguracaoCSIS_USER_ID: TIntegerField;
    qryConfiguracaoCSIS_DTA_CADASTRO: TDateField;
    cdsConfiguracaoCSIS_EMPR_ID: TIntegerField;
    cdsConfiguracaoEMPR_RAZAO_SOCIAL: TStringField;
    cdsConfiguracaoCSIS_REPORTA_ERROS: TIntegerField;
    cdsConfiguracaoCSIS_USER_ID: TIntegerField;
    cdsConfiguracaoCSIS_DTA_CADASTRO: TDateField;
    qryConfiguracaoCSIS_VISUAL_FINANCEIRO: TIntegerField;
    cdsConfiguracaoCSIS_VISUAL_FINANCEIRO: TIntegerField;
    qryConfiguracaoCSIS_JURO: TFMTBCDField;
    qryConfiguracaoCSIS_MORA: TFMTBCDField;
    cdsConfiguracaoCSIS_JURO: TFMTBCDField;
    cdsConfiguracaoCSIS_MORA: TFMTBCDField;
    qryConfiguracaoCSIS_PERCENTE_RENDA: TIntegerField;
    cdsConfiguracaoCSIS_PERCENTE_RENDA: TIntegerField;
    qryConfiguracaoCSIS_ESTOQUE_NEGATIVO: TIntegerField;
    cdsConfiguracaoCSIS_ESTOQUE_NEGATIVO: TIntegerField;
    qryConfiguracaoCSIS_TPRC_ID: TIntegerField;
    qryConfiguracaoCSIS_TPRC_EMPR_ID: TIntegerField;
    qryConfiguracaoCSIS_CLIE_ID: TIntegerField;
    qryConfiguracaoCSIS_CLIE_EMPR_ID: TIntegerField;
    cdsConfiguracaoCSIS_TPRC_ID: TIntegerField;
    cdsConfiguracaoCSIS_TPRC_EMPR_ID: TIntegerField;
    cdsConfiguracaoCSIS_CLIE_ID: TIntegerField;
    cdsConfiguracaoCSIS_CLIE_EMPR_ID: TIntegerField;
    qryConfiguracaoTPRC_DESCRICAO: TStringField;
    qryConfiguracaoCLIE_RAZAO_SOCIAL: TStringField;
    cdsConfiguracaoTPRC_DESCRICAO: TStringField;
    cdsConfiguracaoCLIE_RAZAO_SOCIAL: TStringField;
    qryConfiguracaoCSIS_VERSION_SYSTEM: TIntegerField;
    qryConfiguracaoCSIS_REAGENDAR_OS: TIntegerField;
    qryConfiguracaoCSIS_FORCAR_REAGENDA: TIntegerField;
    cdsConfiguracaoCSIS_VERSION_SYSTEM: TIntegerField;
    cdsConfiguracaoCSIS_REAGENDAR_OS: TIntegerField;
    cdsConfiguracaoCSIS_FORCAR_REAGENDA: TIntegerField;
    qryConfOS: TSQLQuery;
    dspConfOS: TDataSetProvider;
    cdsConfOS: TClientDataSet;
    dsConfOS: TDataSource;
    qryConfOSCFOS_ID: TIntegerField;
    qryConfOSCFOS_EMPR_ID: TIntegerField;
    qryConfOSCFOS_CSIS_EMPR_ID: TIntegerField;
    qryConfOSCFOS_FCOD_EQUIP: TStringField;
    qryConfOSCFOS_FEQUIPAMENTO: TStringField;
    qryConfOSCFOS_FUNIDADE: TStringField;
    qryConfOSCFOS_FMARCA: TStringField;
    qryConfOSCFOS_FMODELO: TStringField;
    qryConfOSCFOS_FGARANTIA: TStringField;
    qryConfOSCFOS_FNRPEDIDO: TStringField;
    qryConfOSCFOS_FCOD_FORNECEDOR: TStringField;
    qryConfOSCFOS_FFORNECEDOR: TStringField;
    qryConfOSCFOS_FCOD_TECNICO: TStringField;
    qryConfOSCFOS_FTECNICO: TStringField;
    qryConfOSCFOS_FDTCADASTRO: TStringField;
    qryConfOSCFOS_FDTINSTALACAO: TStringField;
    qryConfOSCFOS_FDTENTREGA: TStringField;
    qryConfOSCFOS_FGRUPO_EQUIP: TStringField;
    qryConfOSCFOS_FGRUPO_PECAS_SERVICOS: TStringField;
    qryConfOSCFOS_FDTAGENDAMENTO: TStringField;
    qryConfOSCFOS_DTA_CADASTRO: TDateField;
    qryConfOSCFOS_USER_ID: TIntegerField;
    cdsConfOSCFOS_ID: TIntegerField;
    cdsConfOSCFOS_EMPR_ID: TIntegerField;
    cdsConfOSCFOS_CSIS_EMPR_ID: TIntegerField;
    cdsConfOSCFOS_FCOD_EQUIP: TStringField;
    cdsConfOSCFOS_FEQUIPAMENTO: TStringField;
    cdsConfOSCFOS_FUNIDADE: TStringField;
    cdsConfOSCFOS_FMARCA: TStringField;
    cdsConfOSCFOS_FMODELO: TStringField;
    cdsConfOSCFOS_FGARANTIA: TStringField;
    cdsConfOSCFOS_FNRPEDIDO: TStringField;
    cdsConfOSCFOS_FCOD_FORNECEDOR: TStringField;
    cdsConfOSCFOS_FFORNECEDOR: TStringField;
    cdsConfOSCFOS_FCOD_TECNICO: TStringField;
    cdsConfOSCFOS_FTECNICO: TStringField;
    cdsConfOSCFOS_FDTCADASTRO: TStringField;
    cdsConfOSCFOS_FDTINSTALACAO: TStringField;
    cdsConfOSCFOS_FDTENTREGA: TStringField;
    cdsConfOSCFOS_FGRUPO_EQUIP: TStringField;
    cdsConfOSCFOS_FGRUPO_PECAS_SERVICOS: TStringField;
    cdsConfOSCFOS_FDTAGENDAMENTO: TStringField;
    cdsConfOSCFOS_DTA_CADASTRO: TDateField;
    cdsConfOSCFOS_USER_ID: TIntegerField;
    qryConfiguracaoCSIS_INTEGRAR_PRODUTOS: TIntegerField;
    qryConfiguracaoCSIS_INTEGRAR_CLIENTES: TIntegerField;
    cdsConfiguracaoCSIS_INTEGRAR_PRODUTOS: TIntegerField;
    cdsConfiguracaoCSIS_INTEGRAR_CLIENTES: TIntegerField;
    qryConfOSCFOS_DIAS_REAGENDAMENTO: TIntegerField;
    cdsConfOSCFOS_DIAS_REAGENDAMENTO: TIntegerField;
    qryConfiguracaoCSIS_VLR_META_ANO: TFMTBCDField;
    cdsConfiguracaoCSIS_VLR_META_ANO: TFMTBCDField;
    qryConfiguracaoCSIS_TIPO_MENU: TIntegerField;
    cdsConfiguracaoCSIS_TIPO_MENU: TIntegerField;
    qryConfiguracaoCSIS_CONTROLA_LIMITE_CREDITO: TIntegerField;
    cdsConfiguracaoCSIS_CONTROLA_LIMITE_CREDITO: TIntegerField;
    qryConfOSCFOS_MENSAGEM_RODAPE: TIntegerField;
    cdsConfOSCFOS_MENSAGEM_RODAPE: TIntegerField;
    qryConfiguracaoEMPR_CNPJ: TStringField;
    cdsConfiguracaoEMPR_CNPJ: TStringField;
    qryConfiguracaoCSIS_EMPRESA_MATRIZ: TIntegerField;
    qryConfiguracaoCSIS_TIPO_EMPRESA: TIntegerField;
    qryConfiguracaoCSIS_OPTANTE_SIMPLES: TIntegerField;
    qryConfiguracaoCSIS_ALIQUOTA_PADRAO_PIS: TFMTBCDField;
    qryConfiguracaoCSIS_ALIQUOTA_PADRAO_COFINS: TFMTBCDField;
    cdsConfiguracaoCSIS_EMPRESA_MATRIZ: TIntegerField;
    cdsConfiguracaoCSIS_TIPO_EMPRESA: TIntegerField;
    cdsConfiguracaoCSIS_OPTANTE_SIMPLES: TIntegerField;
    cdsConfiguracaoCSIS_ALIQUOTA_PADRAO_PIS: TFMTBCDField;
    cdsConfiguracaoCSIS_ALIQUOTA_PADRAO_COFINS: TFMTBCDField;
    qryConfiguracaoCSIS_SEPARAR_TELEATENDIMENTO: TIntegerField;
    cdsConfiguracaoCSIS_SEPARAR_TELEATENDIMENTO: TIntegerField;
    qryConfOSCFOS_USER_ID_TEC_OS: TIntegerField;
    cdsConfOSCFOS_USER_ID_TEC_OS: TIntegerField;
    qryConfiguracaoCSIS_TRAB_TIPO_AGENDAMENTO: TIntegerField;
    cdsConfiguracaoCSIS_TRAB_TIPO_AGENDAMENTO: TIntegerField;
    qryConfiguracaoCSIS_USAR_PADRAO_TELEFONE: TIntegerField;
    cdsConfiguracaoCSIS_USAR_PADRAO_TELEFONE: TIntegerField;
    qryConfiguracaoCSIS_INFORMA_NR_PEDIDO: TIntegerField;
    qryConfiguracaoCSIS_TRAB_FORNEC_EQUIP: TIntegerField;
    qryConfiguracaoCSIS_TRAB_STATUS_OS: TIntegerField;
    cdsConfiguracaoCSIS_INFORMA_NR_PEDIDO: TIntegerField;
    cdsConfiguracaoCSIS_TRAB_FORNEC_EQUIP: TIntegerField;
    cdsConfiguracaoCSIS_TRAB_STATUS_OS: TIntegerField;
    qryConfiguracaoCSIS_FILTRAR_PLANO_CONTAS_PAI: TIntegerField;
    cdsConfiguracaoCSIS_FILTRAR_PLANO_CONTAS_PAI: TIntegerField;
    qryConfiguracaoCSIS_VINCULAR_CARTAO_CREDITO: TIntegerField;
    cdsConfiguracaoCSIS_VINCULAR_CARTAO_CREDITO: TIntegerField;
    qryIRPF: TSQLQuery;
    dspIRPF: TDataSetProvider;
    cdsIRPF: TClientDataSet;
    dsIRPF: TDataSource;
    qryIRPFIRPF_EMPR_ID: TIntegerField;
    qryIRPFIRPF_ALIMENTADOS: TStringField;
    qryIRPFIRPF_RENDIMENTOS_RECEBIDOS: TStringField;
    qryIRPFIRPF_CONTRIBUICAO_PREVIDENCIA: TStringField;
    qryIRPFIRPF_IMPOSTO_RETIDO_FONTE: TStringField;
    qryIRPFIRPF_13_SALARIO: TStringField;
    qryIRPFIRPF_RENDIMENTOS_PESSOA_FISICA: TStringField;
    qryIRPFIRPF_REDIMENTOS_EXTERIOR: TStringField;
    qryIRPFIRPF_PREVIDENCIA_OFICIAL: TStringField;
    qryIRPFIRPF_PENSAO_ALIMENTICIA: TStringField;
    qryIRPFIRPF_LIVRO_CAIXA: TStringField;
    qryIRPFIRPF_DARF_PAGO: TStringField;
    qryIRPFIRPF_RENDIMENTOS_ISENTOS: TStringField;
    qryIRPFIRPF_RENDIMENTOS_SUJEITOS_TRIB: TStringField;
    qryIRPFIRPF_RENDIMENTOS_TRIBUTAVEIS_PJ: TStringField;
    qryIRPFIRPF_RENDIMENTOS_RECEB_ACUMUL: TStringField;
    qryIRPFIRPF_IMPOSTO_PAGO_RETIDO: TStringField;
    qryIRPFIRPF_PAGAMENTOS_EFETUADOS: TStringField;
    qryIRPFIRPF_DOACOES_EFETUADAS: TStringField;
    qryIRPFIRPF_BENS_DIREITOS: TStringField;
    qryIRPFIRPF_DIVIDAS_ONUS: TStringField;
    qryIRPFIRPF_DOACOES_PARTIDOS_POLITICOS: TStringField;
    qryIRPFIRPF_DTA_CADASTRO: TDateField;
    qryIRPFIRPF_USER_ID: TIntegerField;
    cdsIRPFIRPF_EMPR_ID: TIntegerField;
    cdsIRPFIRPF_ALIMENTADOS: TStringField;
    cdsIRPFIRPF_RENDIMENTOS_RECEBIDOS: TStringField;
    cdsIRPFIRPF_CONTRIBUICAO_PREVIDENCIA: TStringField;
    cdsIRPFIRPF_IMPOSTO_RETIDO_FONTE: TStringField;
    cdsIRPFIRPF_13_SALARIO: TStringField;
    cdsIRPFIRPF_RENDIMENTOS_PESSOA_FISICA: TStringField;
    cdsIRPFIRPF_REDIMENTOS_EXTERIOR: TStringField;
    cdsIRPFIRPF_PREVIDENCIA_OFICIAL: TStringField;
    cdsIRPFIRPF_PENSAO_ALIMENTICIA: TStringField;
    cdsIRPFIRPF_LIVRO_CAIXA: TStringField;
    cdsIRPFIRPF_DARF_PAGO: TStringField;
    cdsIRPFIRPF_RENDIMENTOS_ISENTOS: TStringField;
    cdsIRPFIRPF_RENDIMENTOS_SUJEITOS_TRIB: TStringField;
    cdsIRPFIRPF_RENDIMENTOS_TRIBUTAVEIS_PJ: TStringField;
    cdsIRPFIRPF_RENDIMENTOS_RECEB_ACUMUL: TStringField;
    cdsIRPFIRPF_IMPOSTO_PAGO_RETIDO: TStringField;
    cdsIRPFIRPF_PAGAMENTOS_EFETUADOS: TStringField;
    cdsIRPFIRPF_DOACOES_EFETUADAS: TStringField;
    cdsIRPFIRPF_BENS_DIREITOS: TStringField;
    cdsIRPFIRPF_DIVIDAS_ONUS: TStringField;
    cdsIRPFIRPF_DOACOES_PARTIDOS_POLITICOS: TStringField;
    cdsIRPFIRPF_DTA_CADASTRO: TDateField;
    cdsIRPFIRPF_USER_ID: TIntegerField;
    qryIRPFIRPF_REND_TRIB_DEP_JUDICIAIS: TStringField;
    cdsIRPFIRPF_REND_TRIB_DEP_JUDICIAIS: TStringField;
    qryIRPFIRPF_RENDIMENTOS_POUPANCA: TStringField;
    cdsIRPFIRPF_RENDIMENTOS_POUPANCA: TStringField;
    qryConfiguracaoCSIS_PERC_FUNDO_RESERVA: TFMTBCDField;
    qryConfiguracaoCSIS_APLICA_FDR_VLR_LIQUIDO: TIntegerField;
    cdsConfiguracaoCSIS_PERC_FUNDO_RESERVA: TFMTBCDField;
    cdsConfiguracaoCSIS_APLICA_FDR_VLR_LIQUIDO: TIntegerField;
    qryConfiguracaoCSIS_PERC_RESERVA_LUCRO: TFMTBCDField;
    qryConfiguracaoCSIS_PERC_RESERVA_LEGAL: TFMTBCDField;
    qryConfiguracaoCSIS_PERC_RESERVA_ESTATUTARIAS: TFMTBCDField;
    qryConfiguracaoCSIS_APLICA_FDE_VLR_LIQUIDO: TIntegerField;
    cdsConfiguracaoCSIS_PERC_RESERVA_LUCRO: TFMTBCDField;
    cdsConfiguracaoCSIS_PERC_RESERVA_LEGAL: TFMTBCDField;
    cdsConfiguracaoCSIS_PERC_RESERVA_ESTATUTARIAS: TFMTBCDField;
    cdsConfiguracaoCSIS_APLICA_FDE_VLR_LIQUIDO: TIntegerField;
    qryConfiguracaoCSIS_REPLICA_CLIENTE_FORNECEDOR: TIntegerField;
    cdsConfiguracaoCSIS_REPLICA_CLIENTE_FORNECEDOR: TIntegerField;
    qryConfiguracaoCSIS_INICIO_TRABALHO: TTimeField;
    qryConfiguracaoCSIS_FINAL_TRABALHO: TTimeField;
    cdsConfiguracaoCSIS_INICIO_TRABALHO: TTimeField;
    cdsConfiguracaoCSIS_FINAL_TRABALHO: TTimeField;
    qryConfiguracaoCSIS_INTERVALO_HORARIO: TTimeField;
    cdsConfiguracaoCSIS_INTERVALO_HORARIO: TTimeField;
    qryConfiguracaoCSIS_HR_ALMOCO_INICIO: TTimeField;
    qryConfiguracaoCSIS_HR_ALMOCO_FIM: TTimeField;
    qryConfiguracaoCSIS_OCULTA_CLIENTES: TIntegerField;
    cdsConfiguracaoCSIS_HR_ALMOCO_INICIO: TTimeField;
    cdsConfiguracaoCSIS_HR_ALMOCO_FIM: TTimeField;
    cdsConfiguracaoCSIS_OCULTA_CLIENTES: TIntegerField;
    qryConfiguracaoCSIS_TX_CREDITO: TFMTBCDField;
    qryConfiguracaoCSIS_TX_DEBITO: TFMTBCDField;
    qryConfiguracaoCSIS_DIAS_DEP_CREDITO: TIntegerField;
    qryConfiguracaoCSIS_DIAS_DEP_DEBITO: TIntegerField;
    cdsConfiguracaoCSIS_TX_CREDITO: TFMTBCDField;
    cdsConfiguracaoCSIS_TX_DEBITO: TFMTBCDField;
    cdsConfiguracaoCSIS_DIAS_DEP_CREDITO: TIntegerField;
    cdsConfiguracaoCSIS_DIAS_DEP_DEBITO: TIntegerField;
    qryConfiguracaoCSIS_TIPO: TStringField;
    qryConfiguracaoCSIS_CHAVE: TStringField;
    qryConfiguracaoCSIS_BSYS: TStringField;
    qryConfiguracaoCSIS_RECIBO_PGTOPARCIAL: TIntegerField;
    cdsConfiguracaoCSIS_TIPO: TStringField;
    cdsConfiguracaoCSIS_CHAVE: TStringField;
    cdsConfiguracaoCSIS_BSYS: TStringField;
    cdsConfiguracaoCSIS_RECIBO_PGTOPARCIAL: TIntegerField;
    qryConfiguracaoCSIS_CBCO_ID_CREDITO: TIntegerField;
    qryConfiguracaoCSIS_CBCO_EMPR_ID_CREDITO: TIntegerField;
    qryConfiguracaoCSIS_CBCO_ID_DEBITO: TIntegerField;
    qryConfiguracaoCSIS_CBCO_EMPR_ID_DEBITO: TIntegerField;
    cdsConfiguracaoCSIS_CBCO_ID_CREDITO: TIntegerField;
    cdsConfiguracaoCSIS_CBCO_EMPR_ID_CREDITO: TIntegerField;
    cdsConfiguracaoCSIS_CBCO_ID_DEBITO: TIntegerField;
    cdsConfiguracaoCSIS_CBCO_EMPR_ID_DEBITO: TIntegerField;
    qryAgendaRetornos: TSQLQuery;
    dspAgendaRetornos: TDataSetProvider;
    cdsAgendaRetornos: TClientDataSet;
    dsAgendaRetornos: TDataSource;
    qryAgendaRetornosCFAR_EMPR_ID: TIntegerField;
    qryAgendaRetornosCFAR_PROD_ID: TIntegerField;
    qryAgendaRetornosCFAR_PROD_EMPR_ID: TIntegerField;
    qryAgendaRetornosCFAR_DIA_RETORNO: TIntegerField;
    qryAgendaRetornosCFAR_DTA_CADASTRO: TDateField;
    qryAgendaRetornosCFAR_USER_ID: TIntegerField;
    qryAgendaRetornosPROD_DESCRICAO: TStringField;
    cdsAgendaRetornosCFAR_EMPR_ID: TIntegerField;
    cdsAgendaRetornosCFAR_PROD_ID: TIntegerField;
    cdsAgendaRetornosCFAR_PROD_EMPR_ID: TIntegerField;
    cdsAgendaRetornosCFAR_DIA_RETORNO: TIntegerField;
    cdsAgendaRetornosCFAR_DTA_CADASTRO: TDateField;
    cdsAgendaRetornosCFAR_USER_ID: TIntegerField;
    cdsAgendaRetornosPROD_DESCRICAO: TStringField;
    qryConfiguracaoCSIS_FORN_ID_CARTAO_CRED: TIntegerField;
    qryConfiguracaoCSIS_FORN_ID_CARTAO_DEB: TIntegerField;
    cdsConfiguracaoCSIS_FORN_ID_CARTAO_CRED: TIntegerField;
    cdsConfiguracaoCSIS_FORN_ID_CARTAO_DEB: TIntegerField;
    qryConfiguracaoCSIS_SOLICITA_NR_TRANSACAO: TIntegerField;
    cdsConfiguracaoCSIS_SOLICITA_NR_TRANSACAO: TIntegerField;
    qryConfiguracaoCSIS_BKP_SEGUNDA: TIntegerField;
    qryConfiguracaoCSIS_BKP_TERCA: TIntegerField;
    qryConfiguracaoCSIS_BKP_QUARTA: TIntegerField;
    qryConfiguracaoCSIS_BKP_QUINTA: TIntegerField;
    qryConfiguracaoCSIS_BKP_SEXTA: TIntegerField;
    qryConfiguracaoCSIS_BKP_SABADO: TIntegerField;
    qryConfiguracaoCSIS_BKP_DOMINGO: TIntegerField;
    qryConfiguracaoCSIS_BKP_HORA1: TTimeField;
    qryConfiguracaoCSIS_BKP_HORA2: TTimeField;
    qryConfiguracaoCSIS_BKP_HORA3: TTimeField;
    cdsConfiguracaoCSIS_BKP_SEGUNDA: TIntegerField;
    cdsConfiguracaoCSIS_BKP_TERCA: TIntegerField;
    cdsConfiguracaoCSIS_BKP_QUARTA: TIntegerField;
    cdsConfiguracaoCSIS_BKP_QUINTA: TIntegerField;
    cdsConfiguracaoCSIS_BKP_SEXTA: TIntegerField;
    cdsConfiguracaoCSIS_BKP_SABADO: TIntegerField;
    cdsConfiguracaoCSIS_BKP_DOMINGO: TIntegerField;
    cdsConfiguracaoCSIS_BKP_HORA1: TTimeField;
    cdsConfiguracaoCSIS_BKP_HORA2: TTimeField;
    cdsConfiguracaoCSIS_BKP_HORA3: TTimeField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsConfiguracaoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsConfiguracaoNewRecord(DataSet: TDataSet);
    procedure cdsConfOSNewRecord(DataSet: TDataSet);
    procedure cdsConfiguracaoBeforeDelete(DataSet: TDataSet);
    procedure cdsIRPFNewRecord(DataSet: TDataSet);
    procedure cdsConfiguracaoAfterEdit(DataSet: TDataSet);
    procedure cdsAgendaRetornosNewRecord(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmConfiguracao: TdmConfiguracao;

implementation

{$R *.dfm}

procedure TdmConfiguracao.cdsAgendaRetornosNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('CFAR_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('CFAR_PROD_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('CFAR_DIA_RETORNO').AsInteger   := 0;
  DataSet.FieldByName('CFAR_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor();
  DataSet.FieldByName('CFAR_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmConfiguracao.cdsConfiguracaoAfterEdit(DataSet: TDataSet);
begin
  DataSet.FieldByName('CSIS_CBCO_EMPR_ID_CREDITO').AsInteger    := funcLocal.Empr_ID;
  DataSet.FieldByName('CSIS_CBCO_EMPR_ID_DEBITO').AsInteger     := funcLocal.Empr_ID;
end;

procedure TdmConfiguracao.cdsConfiguracaoBeforeDelete(DataSet: TDataSet);
begin
  if funcLocal.DeletaRegistro('CONF_SISTEMA',cdsConfiguracaoCSIS_EMPR_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmConfiguracao.cdsConfiguracaoNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('CSIS_EMPR_ID').AsInteger                 := funcLocal.Empr_ID;
  DataSet.FieldByName('CSIS_REPORTA_ERROS').AsInteger           := 1;
  DataSet.FieldByName('CSIS_VISUAL_FINANCEIRO').AsInteger       := 1;
  DataSet.FieldByName('CSIS_JURO').AsFloat                      := 0;
  DataSet.FieldByName('CSIS_MORA').AsFloat                      := 0;
  DataSet.FieldByName('CSIS_PERCENTE_RENDA').AsInteger          := 70;
  DataSet.FieldByName('CSIS_ESTOQUE_NEGATIVO').AsInteger        := 0;
  DataSet.FieldByName('CSIS_TPRC_EMPR_ID').AsInteger            := 0;
  DataSet.FieldByName('CSIS_CLIE_EMPR_ID').AsInteger            := 0;
  DataSet.FieldByName('CSIS_REAGENDAR_OS').AsInteger            := 0;
  DataSet.FieldByName('CSIS_FORCAR_REAGENDA').AsInteger         := 0;
  DataSet.FieldByName('CSIS_INTEGRAR_PRODUTOS').AsInteger       := 0;
  DataSet.FieldByName('CSIS_INTEGRAR_CLIENTES').AsInteger       := 0;
  DataSet.FieldByName('EMPR_RAZAO_SOCIAL').AsString             := funcLocal.Empr_Razao;
  DataSet.FieldByName('CSIS_VLR_META_ANO').AsFloat              := 0;
  DataSet.FieldByName('CSIS_TIPO_MENU').AsInteger               := 2;
  DataSet.FieldByName('CSIS_CONTROLE_LIMITE_CREDITO').AsInteger := 0;
  DataSet.FieldByName('CSIS_SEPARAR_TELEATENDIMENTO').AsInteger := 1;
  DataSet.FieldByName('CSIS_USAR_PADRAO_TELEFONE').AsInteger    := 0;
  DataSet.FieldByName('CSIS_INFORMA_NR_PEDIDO').AsInteger       := 0;
  DataSet.FieldByName('CSIS_TRAB_FORNEC_EQUIP').AsInteger       := 0;
  DataSet.FieldByName('CSIS_TRAB_STATUS_OS').AsInteger          := 0;
  DataSet.FieldByName('CSIS_CBCO_EMPR_ID_CREDITO').AsInteger    := funcLocal.Empr_ID;
  DataSet.FieldByName('CSIS_CBCO_EMPR_ID_DEBITO').AsInteger     := funcLocal.Empr_ID;
  DataSet.FieldByName('CSIS_DTA_CADASTRO').AsDateTime           := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('CSIS_USER_ID').AsInteger                 := funcLocal.User_ID;
end;

procedure TdmConfiguracao.cdsConfiguracaoReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  funcLocal.Alerta('Erro ao tentar salvar os dados de configuração.'+#13+'['+e.Message+']',1)
end;

procedure TdmConfiguracao.cdsConfOSNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('CFOS_ID').AsString                     := funcLocal.ObterSequencia('CONF_ORDEM_SERVICO',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('CFOS_EMPR_ID').AsInteger               := funcLocal.Empr_ID;
  DataSet.FieldByName('CFOS_CSIS_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
  DataSet.FieldByName('CFOS_FCOD_EQUIP').AsString             := 'Cód. Equip.';
  DataSet.FieldByName('CFOS_FEQUIPAMENTO').AsString           := 'Equipamento';
  DataSet.FieldByName('CFOS_FUNIDADE').AsString               := 'Unid.';
  DataSet.FieldByName('CFOS_FMARCA').AsString                 := 'Marca';
  DataSet.FieldByName('CFOS_FMODELO').AsString                := 'Modelo';
  DataSet.FieldByName('CFOS_FGARANTIA').AsString              := 'Garantia';
  DataSet.FieldByName('CFOS_FNRPEDIDO').AsString              := 'Nrº Pedido/Fabricante/Série';
  DataSet.FieldByName('CFOS_FCOD_FORNECEDOR').AsString        := 'Cód. Fornec.';
  DataSet.FieldByName('CFOS_FFORNECEDOR').AsString            := 'Fornecedor';
  DataSet.FieldByName('CFOS_FCOD_TECNICO').AsString           := 'Cód. Técnico';
  DataSet.FieldByName('CFOS_FTECNICO').AsString               := 'Técnico';
  DataSet.FieldByName('CFOS_FDTCADASTRO').AsString            := 'Dt. Cadastro';
  DataSet.FieldByName('CFOS_FDTINSTALACAO').AsString          := 'Dt. Instalação';
  DataSet.FieldByName('CFOS_FDTENTREGA').AsString             := 'Dt. Entrega';
  DataSet.FieldByName('CFOS_FGRUPO_EQUIP').AsString           := 'Equipamentos do Cliente';
  DataSet.FieldByName('CFOS_FGRUPO_PECAS_SERVICOS').AsString  := 'Peças/serviços';
  DataSet.FieldByName('CFOS_FDTAGENDAMENTO').AsString         := 'Dt. Agendamento';
  DataSet.FieldByName('CFOS_DIAS_REAGENDAMENTO').AsInteger    := 30;
  DataSet.FieldByName('CFOS_DTA_CADASTRO').AsDateTime         := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('CFOS_USER_ID').AsInteger               := funcLocal.User_ID;
end;

procedure TdmConfiguracao.cdsIRPFNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('IRPF_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('IRPF_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor();
  DataSet.FieldByName('IRPF_USER_ID').AsInteger := funcLocal.User_ID;
end;

procedure TdmConfiguracao.DataModuleCreate(Sender: TObject);
var
  intI     : Integer;
  formPrinc : TForm;
begin
  formPrinc := Application.MainForm;
  funcLocal := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
  for intI := 0 to Self.ComponentCount - 1 do begin
    if (Components[intI] is TSQLQuery) then begin
      (Components[intI] as TSQLQuery).SQLConnection := funcLocal.Conexao;
    end;
    if (Components[intI] is TClientDataSet) then begin
      (Components[intI] as TClientDataSet).PacketRecords := 50;
    end;
  end;
end;

initialization
  if dmConfiguracao = nil then   
    dmConfiguracao := TdmConfiguracao.Create(nil);
finalization
  FreeAndNil(dmConfiguracao);

end.

