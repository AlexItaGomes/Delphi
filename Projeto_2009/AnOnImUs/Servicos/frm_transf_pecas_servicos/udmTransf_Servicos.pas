unit udmTransf_Servicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr, Funcoes;

type
  TdmTranf_Servicos = class(TdmBasico)
    qryTransf: TSQLQuery;
    dspTransf: TDataSetProvider;
    cdsTransf: TClientDataSet;
    dsTransf: TDataSource;
    qryTransfOSTF_ID: TIntegerField;
    qryTransfOSTF_EMPR_ID: TIntegerField;
    qryTransfOSTF_ORDS_ID: TIntegerField;
    qryTransfOSTF_ORDS_EMPR_ID: TIntegerField;
    qryTransfOSTF_ORDS_CLIE_ID: TIntegerField;
    qryTransfOSTF_ORDS_CLIE_EMPR_ID: TIntegerField;
    qryTransfOSTF_USER_ID_TEC_ORIG: TIntegerField;
    qryTransfOSTF_USER_ID_TEC_DEST: TIntegerField;
    qryTransfOSTF_DTA_CADASTRO: TDateField;
    qryTransfOSTF_USER_ID: TIntegerField;
    qryTransfCLIE_RAZAO_SOCIAL: TStringField;
    qryTransfUSER_NOME_COMPLETO_ORIG: TStringField;
    qryTransfUSER_NOME_COMPLETO_DEST: TStringField;
    cdsTransfOSTF_ID: TIntegerField;
    cdsTransfOSTF_EMPR_ID: TIntegerField;
    cdsTransfOSTF_ORDS_ID: TIntegerField;
    cdsTransfOSTF_ORDS_EMPR_ID: TIntegerField;
    cdsTransfOSTF_ORDS_CLIE_ID: TIntegerField;
    cdsTransfOSTF_ORDS_CLIE_EMPR_ID: TIntegerField;
    cdsTransfOSTF_USER_ID_TEC_ORIG: TIntegerField;
    cdsTransfOSTF_USER_ID_TEC_DEST: TIntegerField;
    cdsTransfOSTF_DTA_CADASTRO: TDateField;
    cdsTransfOSTF_USER_ID: TIntegerField;
    cdsTransfCLIE_RAZAO_SOCIAL: TStringField;
    cdsTransfUSER_NOME_COMPLETO_ORIG: TStringField;
    cdsTransfUSER_NOME_COMPLETO_DEST: TStringField;
    qryTransfORDS_DTA_INSTALACAO: TDateField;
    qryTransfORDS_PROD_ID_EQUIP: TIntegerField;
    qryTransfORDS_VLR_TOTAL_OS: TFMTBCDField;
    qryTransfORDS_VLR_DESCONTO: TFMTBCDField;
    qryTransfORDS_VLR_PAGO: TFMTBCDField;
    qryTransfORDS_DTA_CADASTRO: TDateField;
    qryTransfPROD_DESCRICAO: TStringField;
    qryTransfPROD_UNIDADE: TStringField;
    qryTransfMARCA_PROD: TStringField;
    qryTransfMODELO_PROD: TStringField;
    cdsTransfORDS_DTA_INSTALACAO: TDateField;
    cdsTransfORDS_PROD_ID_EQUIP: TIntegerField;
    cdsTransfORDS_VLR_TOTAL_OS: TFMTBCDField;
    cdsTransfORDS_VLR_DESCONTO: TFMTBCDField;
    cdsTransfORDS_VLR_PAGO: TFMTBCDField;
    cdsTransfORDS_DTA_CADASTRO: TDateField;
    cdsTransfPROD_DESCRICAO: TStringField;
    cdsTransfPROD_UNIDADE: TStringField;
    cdsTransfMARCA_PROD: TStringField;
    cdsTransfMODELO_PROD: TStringField;
    qryPesqTecnico: TSQLQuery;
    dspPesqTecnico: TDataSetProvider;
    cdsPesqTecnico: TClientDataSet;
    cdsPesqTecnicoUSER_ID: TIntegerField;
    cdsPesqTecnicoUSER_LOGIN: TStringField;
    cdsPesqTecnicoUSER_NOME_COMPLETO: TStringField;
    qryPesqCliente: TSQLQuery;
    dspPesqCliente: TDataSetProvider;
    cdsPesqCliente: TClientDataSet;
    cdsPesqClienteCLIE_ID: TIntegerField;
    cdsPesqClienteCLIE_RAZAO_SOCIAL: TStringField;
    cdsPesqClienteCLIE_FANTASIA: TStringField;
    cdsPesqClienteCLIE_CNPJ_CPF: TStringField;
    qryPesqOS: TSQLQuery;
    dspPesqOS: TDataSetProvider;
    cdsPesqOS: TClientDataSet;
    cdsPesqOSORDS_ID: TIntegerField;
    cdsPesqOSORDS_CLIE_ID: TIntegerField;
    cdsPesqOSCLIE_RAZAO_SOCIAL: TStringField;
    cdsPesqOSORDS_DTA_INSTALACAO: TDateField;
    cdsPesqOSORDS_USER_ID_TEC: TIntegerField;
    cdsPesqOSUSER_NOME_COMPLETO: TStringField;
    cdsPesqOSORDS_PROD_ID_EQUIP: TIntegerField;
    cdsPesqOSPROD_DESCRICAO: TStringField;
    cdsPesqOSPROD_UNIDADE: TStringField;
    cdsPesqOSMARCA_PROD: TStringField;
    cdsPesqOSMODELO_PROD: TStringField;
    cdsPesqOSORDS_VLR_TOTAL_OS: TFMTBCDField;
    cdsPesqOSORDS_VLR_DESCONTO: TFMTBCDField;
    cdsPesqOSORDS_VLR_PAGO: TFMTBCDField;
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
    qryOrdemServicoItensODIT_USER_ID_TEC: TIntegerField;
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
    cdsOrdemServicoItensODIT_USER_ID_TEC: TIntegerField;
    dsOrdemServicoItens: TDataSource;
    qryOrdemServicoItensTIPO_COMISSAO: TStringField;
    qryOrdemServicoItensPROD_COMISSAO_VEND_INTERNA: TFMTBCDField;
    qryOrdemServicoItensPROD_COMISSAO_VEND_EXTERNO: TFMTBCDField;
    qryOrdemServicoItensPROD_COMISSAO_VEND_BALCAO: TFMTBCDField;
    cdsOrdemServicoItensTIPO_COMISSAO: TStringField;
    cdsOrdemServicoItensPROD_COMISSAO_VEND_INTERNA: TFMTBCDField;
    cdsOrdemServicoItensPROD_COMISSAO_VEND_EXTERNO: TFMTBCDField;
    cdsOrdemServicoItensPROD_COMISSAO_VEND_BALCAO: TFMTBCDField;
    cdsOrdemServicoItensSELEC: TIntegerField;
    qryItensTransf: TSQLQuery;
    dspItensTransf: TDataSetProvider;
    cdsItensTransf: TClientDataSet;
    dsItensTransf: TDataSource;
    qryItensTransfOSTI_ID: TIntegerField;
    qryItensTransfOSTI_EMPR_ID: TIntegerField;
    qryItensTransfOSTI_OSTF_ID: TIntegerField;
    qryItensTransfOSTI_OSTF_EMPR_ID: TIntegerField;
    qryItensTransfOSTI_OSTF_ORDS_ID: TIntegerField;
    qryItensTransfOSTI_OSTF_ORDS_EMPR_ID: TIntegerField;
    qryItensTransfOSTI_OSTF_ORDS_CLIE_ID: TIntegerField;
    qryItensTransfOSTI_OSTF_ORDS_CLIE_EMPR_ID: TIntegerField;
    qryItensTransfOSTI_ODIT_TPIT_ID: TIntegerField;
    qryItensTransfOSTI_ODIT_TPIT_EMPR_ID: TIntegerField;
    qryItensTransfOSTI_ODIT_TPIT_TPRC_ID: TIntegerField;
    qryItensTransfOSTI_ODIT_TPIT_TPRC_EMPR_ID: TIntegerField;
    qryItensTransfOSTI_ODIT_TPIT_PROD_ID: TIntegerField;
    qryItensTransfOSTI_ODIT_TPIT_PROD_EMPR_ID: TIntegerField;
    qryItensTransfOSTI_ODIT_VLR_UNITARIO: TFMTBCDField;
    qryItensTransfOSTI_ODIT_QTDE: TFMTBCDField;
    qryItensTransfOSTI_ODIT_VLR_TOTAL: TFMTBCDField;
    qryItensTransfOSTI_COMISSAO_VENDA_INTERNA: TFMTBCDField;
    qryItensTransfOSTI_COMISSAO_VENDA_EXTERNA: TFMTBCDField;
    qryItensTransfOSTI_COMISSAO_VENDA_BALCAO: TFMTBCDField;
    qryItensTransfOSTI_DTA_CADASTRO: TDateField;
    qryItensTransfOSTI_USER_ID: TIntegerField;
    qryItensTransfPROD_DESCRICAO: TStringField;
    qryItensTransfPROD_UNIDADE: TStringField;
    qryItensTransfPROD_GARANTIA: TIntegerField;
    qryItensTransfMARCA_PROD: TStringField;
    qryItensTransfMODELO_PROD: TStringField;
    cdsItensTransfOSTI_ID: TIntegerField;
    cdsItensTransfOSTI_EMPR_ID: TIntegerField;
    cdsItensTransfOSTI_OSTF_ID: TIntegerField;
    cdsItensTransfOSTI_OSTF_EMPR_ID: TIntegerField;
    cdsItensTransfOSTI_OSTF_ORDS_ID: TIntegerField;
    cdsItensTransfOSTI_OSTF_ORDS_EMPR_ID: TIntegerField;
    cdsItensTransfOSTI_OSTF_ORDS_CLIE_ID: TIntegerField;
    cdsItensTransfOSTI_OSTF_ORDS_CLIE_EMPR_ID: TIntegerField;
    cdsItensTransfOSTI_ODIT_TPIT_ID: TIntegerField;
    cdsItensTransfOSTI_ODIT_TPIT_EMPR_ID: TIntegerField;
    cdsItensTransfOSTI_ODIT_TPIT_TPRC_ID: TIntegerField;
    cdsItensTransfOSTI_ODIT_TPIT_TPRC_EMPR_ID: TIntegerField;
    cdsItensTransfOSTI_ODIT_TPIT_PROD_ID: TIntegerField;
    cdsItensTransfOSTI_ODIT_TPIT_PROD_EMPR_ID: TIntegerField;
    cdsItensTransfOSTI_ODIT_VLR_UNITARIO: TFMTBCDField;
    cdsItensTransfOSTI_ODIT_QTDE: TFMTBCDField;
    cdsItensTransfOSTI_ODIT_VLR_TOTAL: TFMTBCDField;
    cdsItensTransfOSTI_COMISSAO_VENDA_INTERNA: TFMTBCDField;
    cdsItensTransfOSTI_COMISSAO_VENDA_EXTERNA: TFMTBCDField;
    cdsItensTransfOSTI_COMISSAO_VENDA_BALCAO: TFMTBCDField;
    cdsItensTransfOSTI_DTA_CADASTRO: TDateField;
    cdsItensTransfOSTI_USER_ID: TIntegerField;
    cdsItensTransfPROD_DESCRICAO: TStringField;
    cdsItensTransfPROD_UNIDADE: TStringField;
    cdsItensTransfPROD_GARANTIA: TIntegerField;
    cdsItensTransfMARCA_PROD: TStringField;
    cdsItensTransfMODELO_PROD: TStringField;
    procedure cdsTransfNewRecord(DataSet: TDataSet);
    procedure cdsItensTransfNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTranf_Servicos: TdmTranf_Servicos;

implementation

{$R *.dfm}

procedure TdmTranf_Servicos.cdsItensTransfNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('OSTI_ID').AsString                       := funcLocal.ObterSequencia('OS_TRANSF_ITENS',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('OSTI_EMPR_ID').AsInteger                 := funcLocal.Empr_ID;
  DataSet.FieldByName('OSTI_OSTF_ID').AsInteger                 := cdsTransfOSTF_ID.AsInteger;
  DataSet.FieldByName('OSTI_OSTF_EMPR_ID').AsInteger            := funcLocal.Empr_ID;
  DataSet.FieldByName('OSTI_OSTF_ORDS_ID').AsInteger            := cdsTransfOSTF_ORDS_ID.AsInteger;
  DataSet.FieldByName('OSTI_OSTF_ORDS_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('OSTI_OSTF_ORDS_CLIE_ID').AsInteger       := cdsTransfOSTF_ORDS_CLIE_ID.AsInteger;
  DataSet.FieldByName('OSTI_OSTF_ORDS_CLIE_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('OSTI_ODIT_TPIT_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('OSTI_ODIT_TPIT_TPRC_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('OSTI_ODIT_TPIT_PROD_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('OSTI_COMISSAO_VENDA_INTERNA').AsFloat    := 0;
  DataSet.FieldByName('OSTI_COMISSAO_VENDA_EXTERNA').AsFloat    := 0;
  DataSet.FieldByName('OSTI_COMISSAO_VENDA_BALCAO').AsFloat     := 0;
  DataSet.FieldByName('OSTI_DTA_CADASTRO').AsDateTime           := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('OSTI_USER_ID').AsInteger                 := funcLocal.User_ID;
end;

procedure TdmTranf_Servicos.cdsTransfNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('OSTF_ID').AsString                 := funcLocal.ObterSequencia('ORDEM_SERVICO_TRANSF',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('OSTF_EMPR_ID').AsInteger           := funcLocal.Empr_ID;
  DataSet.FieldByName('OSTF_ORDS_EMPR_ID').AsInteger      := funcLocal.Empr_ID;
  DataSet.FieldByName('OSTF_ORDS_CLIE_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('OSTF_DTA_CADASTRO').AsDateTime     := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('OSTF_USER_ID').AsInteger           := funcLocal.User_ID;
end;

initialization
  if dmTranf_Servicos = nil then
    dmTranf_Servicos := TdmTranf_Servicos.Create(nil);
finalization
  FreeAndNil(dmTranf_Servicos);

end.
