unit udmTeleAtendimentoOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmTeleAtendimentoOS = class(TdmBasico)
    qryClientes: TSQLQuery;
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
    qryClientesROTA: TStringField;
    qryClientesKM_FINAL: TStringField;
    qryClientesVLR_FRETE: TFMTBCDField;
    qryClientesREGIAO_ID: TIntegerField;
    qryClientesREGIAO: TStringField;
    qryClientesAREA_TOTAL: TStringField;
    qryClientesCLIE_BLOQUEAR_ATENDIMENTO: TIntegerField;
    qryClientesCLIE_DTA_ATENDIMENTO: TDateField;
    qryClientesCLIE_USER_ID_ATENDENTE: TIntegerField;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
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
    cdsClientesCLIE_OBS: TBlobField;
    cdsClientesCLIE_LIMITE_CREDITO: TFMTBCDField;
    cdsClientesCLIE_ACEITA_ULT_LIMITE_CRED: TIntegerField;
    cdsClientesCLIE_TIPO_VENDA: TIntegerField;
    cdsClientesCLIE_TIPO_CLIENTE: TIntegerField;
    cdsClientesCLIE_REFERENCIA: TStringField;
    cdsClientesCLIE_DTA_CADASTRO: TDateField;
    cdsClientesCIDADE: TStringField;
    cdsClientesUF: TStringField;
    cdsClientesVENDEDOR: TStringField;
    cdsClientesROTA: TStringField;
    cdsClientesKM_FINAL: TStringField;
    cdsClientesVLR_FRETE: TFMTBCDField;
    cdsClientesREGIAO_ID: TIntegerField;
    cdsClientesREGIAO: TStringField;
    cdsClientesAREA_TOTAL: TStringField;
    cdsClientesCLIE_USER_ID: TIntegerField;
    cdsClientesCLIE_BLOQUEAR_ATENDIMENTO: TIntegerField;
    cdsClientesCLIE_DTA_ATENDIMENTO: TDateField;
    cdsClientesCLIE_USER_ID_ATENDENTE: TIntegerField;
    dsClientes: TDataSource;
    qryHistorico: TSQLQuery;
    dspHistorico: TDataSetProvider;
    cdsHistorico: TClientDataSet;
    dsHistorico: TDataSource;
    qryHistoricoHTAT_ID: TIntegerField;
    qryHistoricoHTAT_EMPR_ID: TIntegerField;
    qryHistoricoHTAT_CLIE_ID: TIntegerField;
    qryHistoricoHTAT_CLIE_EMPR_ID: TIntegerField;
    qryHistoricoHTAT_GENE_EMPR_ID_STATUS: TIntegerField;
    qryHistoricoHTAT_GENE_TGEN_ID_STATUS: TIntegerField;
    qryHistoricoHTAT_GENE_ID_STATUS: TIntegerField;
    qryHistoricoHTAT_HISTORICO: TBlobField;
    qryHistoricoHTAT_USER_ID_ATENDENTE: TIntegerField;
    qryHistoricoHTAT_DTA_ATENDIMENTO: TDateField;
    qryHistoricoHTAT_DTA_PROX_ATENDIMENTO: TDateField;
    qryHistoricoHTAT_DTA_CADASTRO: TDateField;
    qryHistoricoHTAT_USER_ID: TIntegerField;
    cdsHistoricoHTAT_ID: TIntegerField;
    cdsHistoricoHTAT_EMPR_ID: TIntegerField;
    cdsHistoricoHTAT_CLIE_ID: TIntegerField;
    cdsHistoricoHTAT_CLIE_EMPR_ID: TIntegerField;
    cdsHistoricoHTAT_GENE_EMPR_ID_STATUS: TIntegerField;
    cdsHistoricoHTAT_GENE_TGEN_ID_STATUS: TIntegerField;
    cdsHistoricoHTAT_GENE_ID_STATUS: TIntegerField;
    cdsHistoricoHTAT_HISTORICO: TBlobField;
    cdsHistoricoHTAT_USER_ID_ATENDENTE: TIntegerField;
    cdsHistoricoHTAT_DTA_ATENDIMENTO: TDateField;
    cdsHistoricoHTAT_DTA_PROX_ATENDIMENTO: TDateField;
    cdsHistoricoHTAT_DTA_CADASTRO: TDateField;
    cdsHistoricoHTAT_USER_ID: TIntegerField;
    qryListaAtendimento: TSQLQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    BlobField1: TBlobField;
    IntegerField8: TIntegerField;
    DateField1: TDateField;
    DateField2: TDateField;
    DateField3: TDateField;
    IntegerField9: TIntegerField;
    dspListaAtendimento: TDataSetProvider;
    cdsListaAtendimento: TClientDataSet;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    BlobField2: TBlobField;
    IntegerField17: TIntegerField;
    DateField4: TDateField;
    DateField5: TDateField;
    DateField6: TDateField;
    IntegerField18: TIntegerField;
    dsListaAtendimento: TDataSource;
    qryListaAtendimentoUSER_LOGIN: TStringField;
    qryListaAtendimentoGENE_DESCR: TStringField;
    qryListaAtendimentoGENE_NUMBER1: TIntegerField;
    cdsListaAtendimentoUSER_LOGIN: TStringField;
    cdsListaAtendimentoGENE_DESCR: TStringField;
    cdsListaAtendimentoGENE_NUMBER1: TIntegerField;
    qryHistoricoUSER_LOGIN: TStringField;
    qryHistoricoGENE_DESCR: TStringField;
    qryHistoricoGENE_NUMBER1: TIntegerField;
    cdsHistoricoUSER_LOGIN: TStringField;
    cdsHistoricoGENE_DESCR: TStringField;
    cdsHistoricoGENE_NUMBER1: TIntegerField;
    qryListaEquipamentos: TSQLQuery;
    dspListaEquipamentos: TDataSetProvider;
    cdsListaEquipamentos: TClientDataSet;
    dsListaEquipamentos: TDataSource;
    cdsListaEquipamentosPROD_ID: TIntegerField;
    cdsListaEquipamentosPROD_DESCRICAO: TStringField;
    cdsListaEquipamentosMARCA: TStringField;
    cdsListaEquipamentosMODELO: TStringField;
    qryClientesCLIE_HORA_ATEND: TTimeField;
    cdsClientesCLIE_HORA_ATEND: TTimeField;
    qryClientesCLIE_TELEFONE1: TStringField;
    qryClientesCLIE_TELEFONE2: TStringField;
    qryClientesCLIE_TELEFONE3: TStringField;
    qryClientesCLIE_TELEFONE4: TStringField;
    cdsClientesCLIE_TELEFONE1: TStringField;
    cdsClientesCLIE_TELEFONE2: TStringField;
    cdsClientesCLIE_TELEFONE3: TStringField;
    cdsClientesCLIE_TELEFONE4: TStringField;
    procedure cdsHistoricoNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
  end;

var
  dmTeleAtendimentoOS: TdmTeleAtendimentoOS;

implementation

{$R *.dfm}

procedure TdmTeleAtendimentoOS.cdsHistoricoNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('HTAT_ID').AsString := funcLocal.ObterSequencia('HISTORICO_ATENDIMENTO',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('HTAT_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('HTAT_CLIE_ID').AsInteger := cdsClientesCLIE_ID.AsInteger;
  DataSet.FieldByName('HTAT_CLIE_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('HTAT_GENE_EMPR_ID_STATUS').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('HTAT_GENE_TGEN_ID_STATUS').AsInteger := 516;
  DataSet.FieldByName('HTAT_USER_ID_ATENDENTE').AsInteger := funcLocal.User_ID;
  DataSet.FieldByName('HTAT_DTA_ATENDIMENTO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('HTAT_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('HTAT_USER_ID').AsInteger := funcLocal.User_ID;
end;

initialization
  if dmTeleAtendimentoOS = nil then
    dmTeleAtendimentoOS := TdmTeleAtendimentoOS.Create(nil);

finalization
  FreeAndNil(dmTeleAtendimentoOS);

end.
