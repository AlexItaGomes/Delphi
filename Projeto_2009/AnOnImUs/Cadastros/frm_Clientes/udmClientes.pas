unit udmClientes;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, Forms, Funcoes;

type
  TdmClientes = class(TDataModule)
    qryClientes: TSQLQuery;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    dsClientes: TDataSource;
    qryClientesCLIE_ID: TIntegerField;
    qryClientesCLIE_EMPR_ID: TIntegerField;
    qryClientesCLIE_RAZAO_SOCIAL: TStringField;
    qryClientesCLIE_FANTASIA: TStringField;
    qryClientesCLIE_CEP: TStringField;
    qryClientesCLIE_ENDERECO: TStringField;
    qryClientesCLIE_BAIRRO: TStringField;
    qryClientesCLIE_GENE_EMPR_ID_PRACA: TIntegerField;
    qryClientesCLIE_GENE_TGEN_ID_PRACA: TIntegerField;
    qryClientesCLIE_GENE_ID_PRACA: TIntegerField;
    qryClientesCLIE_GENE_EMPR_ID_ROTA: TIntegerField;
    qryClientesCLIE_GENE_TGEN_ID_ROTA: TIntegerField;
    qryClientesCLIE_GENE_ID_ROTA: TIntegerField;
    qryClientesCLIE_RG: TStringField;
    qryClientesCLIE_TIPO: TStringField;
    qryClientesCLIE_CNPJ_CPF: TStringField;
    qryClientesCLIE_USER_ID_VENDEDOR: TIntegerField;
    qryClientesCLIE_SITE: TStringField;
    qryClientesCLIE_EMAIL: TStringField;
    qryClientesCLIE_ATIVO: TIntegerField;
    qryClientesCLIE_TELEFONE1: TStringField;
    qryClientesCLIE_TELEFONE2: TStringField;
    qryClientesCLIE_TELEFONE3: TStringField;
    qryClientesCLIE_TELEFONE4: TStringField;
    qryClientesCLIE_OBS: TBlobField;
    qryClientesCLIE_LIMITE_CREDITO: TFMTBCDField;
    qryClientesCLIE_ACEITA_ULT_LIMITE_CRED: TIntegerField;
    qryClientesCLIE_TIPO_VENDA: TIntegerField;
    qryClientesCLIE_TIPO_CLIENTE: TIntegerField;
    qryClientesCLIE_REFERENCIA: TStringField;
    qryClientesCLIE_DTA_CADASTRO: TDateField;
    qryClientesCLIE_USER_ID: TIntegerField;
    qryClientesCIDADE: TStringField;
    qryClientesUF: TStringField;
    qryClientesVENDEDOR: TStringField;
    cdsClientesCLIE_ID: TIntegerField;
    cdsClientesCLIE_EMPR_ID: TIntegerField;
    cdsClientesCLIE_RAZAO_SOCIAL: TStringField;
    cdsClientesCLIE_FANTASIA: TStringField;
    cdsClientesCLIE_CEP: TStringField;
    cdsClientesCLIE_ENDERECO: TStringField;
    cdsClientesCLIE_BAIRRO: TStringField;
    cdsClientesCLIE_GENE_EMPR_ID_PRACA: TIntegerField;
    cdsClientesCLIE_GENE_TGEN_ID_PRACA: TIntegerField;
    cdsClientesCLIE_GENE_ID_PRACA: TIntegerField;
    cdsClientesCLIE_GENE_EMPR_ID_ROTA: TIntegerField;
    cdsClientesCLIE_GENE_TGEN_ID_ROTA: TIntegerField;
    cdsClientesCLIE_GENE_ID_ROTA: TIntegerField;
    cdsClientesCLIE_RG: TStringField;
    cdsClientesCLIE_TIPO: TStringField;
    cdsClientesCLIE_CNPJ_CPF: TStringField;
    cdsClientesCLIE_USER_ID_VENDEDOR: TIntegerField;
    cdsClientesCLIE_SITE: TStringField;
    cdsClientesCLIE_EMAIL: TStringField;
    cdsClientesCLIE_ATIVO: TIntegerField;
    cdsClientesCLIE_TELEFONE1: TStringField;
    cdsClientesCLIE_TELEFONE2: TStringField;
    cdsClientesCLIE_TELEFONE3: TStringField;
    cdsClientesCLIE_TELEFONE4: TStringField;
    cdsClientesCLIE_OBS: TBlobField;
    cdsClientesCLIE_LIMITE_CREDITO: TFMTBCDField;
    cdsClientesCLIE_ACEITA_ULT_LIMITE_CRED: TIntegerField;
    cdsClientesCLIE_TIPO_VENDA: TIntegerField;
    cdsClientesCLIE_TIPO_CLIENTE: TIntegerField;
    cdsClientesCLIE_REFERENCIA: TStringField;
    cdsClientesCLIE_DTA_CADASTRO: TDateField;
    cdsClientesCLIE_USER_ID: TIntegerField;
    qryClientesROTA: TStringField;
    qryClientesKM_FINAL: TStringField;
    qryClientesVLR_FRETE: TFMTBCDField;
    qryClientesREGIAO_ID: TIntegerField;
    qryClientesREGIAO: TStringField;
    qryClientesAREA_TOTAL: TStringField;
    cdsClientesCIDADE: TStringField;
    cdsClientesUF: TStringField;
    cdsClientesVENDEDOR: TStringField;
    cdsClientesROTA: TStringField;
    cdsClientesKM_FINAL: TStringField;
    cdsClientesVLR_FRETE: TFMTBCDField;
    cdsClientesREGIAO_ID: TIntegerField;
    cdsClientesREGIAO: TStringField;
    cdsClientesAREA_TOTAL: TStringField;
    qryClientesCLIE_BLOQUEAR_ATENDIMENTO: TIntegerField;
    qryClientesCLIE_DTA_ATENDIMENTO: TDateField;
    qryClientesCLIE_USER_ID_ATENDENTE: TIntegerField;
    cdsClientesCLIE_BLOQUEAR_ATENDIMENTO: TIntegerField;
    cdsClientesCLIE_DTA_ATENDIMENTO: TDateField;
    cdsClientesCLIE_USER_ID_ATENDENTE: TIntegerField;
    qryClientesCLIE_DT_NASCIMENTO: TDateField;
    cdsClientesCLIE_DT_NASCIMENTO: TDateField;
    qryHistorico: TSQLQuery;
    dspHistorico: TDataSetProvider;
    cdsHistorico: TClientDataSet;
    dsHistorico: TDataSource;
    cdsHistoricoORIGEM: TStringField;
    cdsHistoricoCODIGO: TIntegerField;
    cdsHistoricoDATA: TDateField;
    cdsHistoricoHORA: TStringField;
    cdsHistoricoPROFISSIONAL: TStringField;
    cdsHistoricoTABELA: TStringField;
    cdsHistoricoPRODUTO: TStringField;
    cdsHistoricoTOTAL: TFMTBCDField;
    qryFinanceiro: TSQLQuery;
    dspFinanceiro: TDataSetProvider;
    cdsFinanceiro: TClientDataSet;
    dsFinanceiro: TDataSource;
    cdsFinanceiroCREC_NR_DOC: TStringField;
    cdsFinanceiroCREC_PROVENIENTE: TStringField;
    cdsFinanceiroPLCT_DESCRICAO: TStringField;
    cdsFinanceiroCREC_DTA_EMISSAO: TDateField;
    cdsFinanceiroCREC_DTA_VCTO: TDateField;
    cdsFinanceiroCREC_DTA_PGTO: TDateField;
    cdsFinanceiroCREC_VALOR_DOC: TFMTBCDField;
    cdsFinanceiroCLIE_FANTASIA: TStringField;
    cdsFinanceiroCREC_STATUS: TStringField;
    cdsFinanceiroSTATUS: TStringField;
    cdsHistoricoAGEN_STATUS: TStringField;
    qryOrdemServico: TSQLQuery;
    dspOrdemServico: TDataSetProvider;
    cdsOrdemServico: TClientDataSet;
    dsOrdemServico: TDataSource;
    cdsOrdemServicoSTATUS: TStringField;
    cdsOrdemServicoORDS_ID: TIntegerField;
    cdsOrdemServicoORDS_DTA_INSTALACAO: TDateField;
    cdsOrdemServicoORDS_STATUS: TIntegerField;
    cdsOrdemServicoORDS_VLR_TOTAL_OS: TFMTBCDField;
    cdsOrdemServicoTPRC_DESCRICAO: TStringField;
    cdsOrdemServicoTIPO_OS: TStringField;
    cdsOrdemServicoUSER_NOME_COMPLETO: TStringField;
    cdsOrdemServicoPROD_DESCRICAO: TStringField;
    cdsOrdemServicoPROD_UNIDADE: TStringField;
    cdsOrdemServicoPROD_GARANTIA: TIntegerField;
    cdsOrdemServicoMARCA_PROD: TStringField;
    cdsOrdemServicoMODELO_PROD: TStringField;
    cdsOrdemServicoFORN_RAZAO_SOCIAL: TStringField;
    cdsOrdemServicoUSER_NOME_COMPLETO_1: TStringField;
    cdsOrdemServicoSTATUS_OS: TStringField;
    cdsOrdemServicoTIPO_AGENDAMENTO: TStringField;
    qryClientesCLIE_GLAUCOMA: TIntegerField;
    qryClientesCLIE_DEPRESSAO: TIntegerField;
    qryClientesCLIE_EPILEPSIA: TIntegerField;
    qryClientesCLIE_MARCA_PASSO: TIntegerField;
    qryClientesCLIE_HIPERTENSAO: TIntegerField;
    qryClientesCLIE_HEPATITE: TIntegerField;
    qryClientesCLIE_HEPATITE_TIPO: TStringField;
    qryClientesCLIE_DIABETES: TIntegerField;
    qryClientesCLIE_DIABETES_TIPO: TStringField;
    qryClientesCLIE_CANCER: TIntegerField;
    qryClientesCLIE_HIV: TIntegerField;
    qryClientesCLIE_ALCOOLIZADO: TIntegerField;
    qryClientesCLIE_GRAVIDA: TIntegerField;
    qryClientesCLIE_ALERGICO_METAIS_PIGMETO: TIntegerField;
    qryClientesCLIE_PROBLEMAS_PELE: TIntegerField;
    qryClientesCLIE_UTILIZOU_ANESTESIA: TIntegerField;
    qryClientesCLIE_TEMPO_ANESTESIA: TTimeField;
    qryClientesCLIE_NIVEL_ANESTESIA: TIntegerField;
    cdsClientesCLIE_GLAUCOMA: TIntegerField;
    cdsClientesCLIE_DEPRESSAO: TIntegerField;
    cdsClientesCLIE_EPILEPSIA: TIntegerField;
    cdsClientesCLIE_MARCA_PASSO: TIntegerField;
    cdsClientesCLIE_HIPERTENSAO: TIntegerField;
    cdsClientesCLIE_HEPATITE: TIntegerField;
    cdsClientesCLIE_HEPATITE_TIPO: TStringField;
    cdsClientesCLIE_DIABETES: TIntegerField;
    cdsClientesCLIE_DIABETES_TIPO: TStringField;
    cdsClientesCLIE_CANCER: TIntegerField;
    cdsClientesCLIE_HIV: TIntegerField;
    cdsClientesCLIE_ALCOOLIZADO: TIntegerField;
    cdsClientesCLIE_GRAVIDA: TIntegerField;
    cdsClientesCLIE_ALERGICO_METAIS_PIGMETO: TIntegerField;
    cdsClientesCLIE_PROBLEMAS_PELE: TIntegerField;
    cdsClientesCLIE_UTILIZOU_ANESTESIA: TIntegerField;
    cdsClientesCLIE_TEMPO_ANESTESIA: TTimeField;
    cdsClientesCLIE_NIVEL_ANESTESIA: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsClientesReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsClientesNewRecord(DataSet: TDataSet);
    procedure cdsClientesBeforeDelete(DataSet: TDataSet);
    procedure cdsClientesBeforePost(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
  public
  end;

var
  dmClientes: TdmClientes;

implementation

{$R *.dfm}

procedure TdmClientes.cdsClientesBeforeDelete(DataSet: TDataSet);
begin
  if funcLocal.DeletaRegistro('CLIENTES',cdsClientesCLIE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmClientes.cdsClientesBeforePost(DataSet: TDataSet);
begin
  try
    DataSet.FieldByName('CLIE_GENE_EMPR_ID_ROTA').AsInteger       := funcLocal.Empr_ID;
    DataSet.FieldByName('CLIE_GENE_TGEN_ID_ROTA').AsInteger       := 515;
  except
  end;
end;

procedure TdmClientes.cdsClientesNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('CLIE_ID').AsString                       := funcLocal.ObterSequencia('CLIENTES',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('CLIE_EMPR_ID').AsInteger                 := funcLocal.Empr_ID;
  DataSet.FieldByName('CLIE_ATIVO').AsInteger                   := 1;
  DataSet.FieldByName('CLIE_TIPO').AsString                     := 'F';
  DataSet.FieldByName('CLIE_GENE_EMPR_ID_PRACA').AsInteger      := 0;
  DataSet.FieldByName('CLIE_GENE_TGEN_ID_PRACA').AsInteger      := 501;
  DataSet.FieldByName('CLIE_GENE_EMPR_ID_ROTA').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('CLIE_GENE_TGEN_ID_ROTA').AsInteger       := 515;
  DataSet.FieldByName('CLIE_LIMITE_CREDITO').AsFloat            := 0;
  DataSet.FieldByName('CLIE_ACEITA_ULT_LIMITE_CRED').AsInteger  := 0;
  DataSet.FieldByName('CLIE_BLOQUEAR_ATENDIMENTO').AsInteger    := 0;
  DataSet.FieldByName('CLIE_USER_ID_ATENDENTE').AsInteger       := funcLocal.User_ID;
  DataSet.FieldByName('CLIE_GLAUCOMA').AsInteger := 0;
  DataSet.FieldByName('CLIE_DEPRESSAO').AsInteger := 0;
  DataSet.FieldByName('CLIE_EPILEPSIA').AsInteger := 0;
  DataSet.FieldByName('CLIE_MARCA_PASSO').AsInteger := 0;
  DataSet.FieldByName('CLIE_HIPERTENSAO').AsInteger := 0;
  DataSet.FieldByName('CLIE_HEPATITE').AsInteger := 0;
  DataSet.FieldByName('CLIE_DIABETES').AsInteger := 0;
  DataSet.FieldByName('CLIE_CANCER').AsInteger := 0;
  DataSet.FieldByName('CLIE_HIV').AsInteger := 0;
  DataSet.FieldByName('CLIE_ALCOOLIZADO').AsInteger := 0;
  DataSet.FieldByName('CLIE_GRAVIDA').AsInteger := 0;
  DataSet.FieldByName('CLIE_ALERGICO_METAIS_PIGMETO').AsInteger := 0;
  DataSet.FieldByName('CLIE_PROBLEMAS_PELE').AsInteger := 0;
  DataSet.FieldByName('CLIE_UTILIZOU_ANESTESIA').AsInteger := 0;
  DataSet.FieldByName('CLIE_NIVEL_ANESTESIA').AsInteger := 0;
  DataSet.FieldByName('CLIE_DTA_CADASTRO').AsDateTime           := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('CLIE_USER_ID').AsInteger                 := funcLocal.User_ID;
end;

procedure TdmClientes.cdsClientesReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmClientes','cdsClientesReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmClientes.DataModuleCreate(Sender: TObject);
var
  formPrinc : TForm;
  intI      : Integer;
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
  if dmClientes = nil then
    dmClientes := TdmClientes.Create(nil);
finalization
  FreeAndNil(dmClientes);

end.
