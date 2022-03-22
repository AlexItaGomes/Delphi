unit udmOrdemServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmOrdemServico = class(TdmBasico)
    qryPesqClie: TSQLQuery;
    dspPesqClie: TDataSetProvider;
    cdsPesqClie: TClientDataSet;
    cdsPesqClieCLIE_ID: TIntegerField;
    cdsPesqClieCLIE_RAZAO_SOCIAL: TStringField;
    cdsPesqClieCLIE_FANTASIA: TStringField;
    cdsPesqClieCLIE_ENDERECO: TStringField;
    cdsPesqClieCLIE_BAIRRO: TStringField;
    cdsPesqClieCIDADE: TStringField;
    cdsPesqClieUF: TStringField;
    cdsPesqClieCLIE_TELEFONE1: TStringField;
    cdsPesqClieCLIE_TELEFONE2: TStringField;
    cdsPesqClieCLIE_TELEFONE3: TStringField;
    cdsPesqClieCLIE_TELEFONE4: TStringField;
    qryPesqTabPreco: TSQLQuery;
    dspPesqTabPreco: TDataSetProvider;
    cdsPesqTabPreco: TClientDataSet;
    cdsPesqTabPrecoTPRC_ID: TIntegerField;
    cdsPesqTabPrecoTPRC_DESCRICAO: TStringField;
    qryPesqTipoOS: TSQLQuery;
    dspPesqTipoOS: TDataSetProvider;
    cdsPesqTipoOS: TClientDataSet;
    cdsPesqTipoOSGENE_ID: TIntegerField;
    cdsPesqTipoOSGENE_DESCR: TStringField;
    qryPesqTecnico: TSQLQuery;
    dspPesqTecnico: TDataSetProvider;
    cdsPesqTecnico: TClientDataSet;
    cdsPesqTecnicoUSER_ID: TIntegerField;
    cdsPesqTecnicoUSER_LOGIN: TStringField;
    cdsPesqTecnicoUSER_NOME_COMPLETO: TStringField;
    qryPesqEquipamento: TSQLQuery;
    dspPesqEquipamento: TDataSetProvider;
    cdsPesqEquipamento: TClientDataSet;
    cdsPesqEquipamentoPROD_ID: TIntegerField;
    cdsPesqEquipamentoPROD_DESCRICAO: TStringField;
    cdsPesqEquipamentoPROD_UNIDADE: TStringField;
    cdsPesqEquipamentoPROD_GARANTIA: TIntegerField;
    cdsPesqEquipamentoMARCA_PROD: TStringField;
    cdsPesqEquipamentoMODELO_PROD: TStringField;
    qryOrdemServico: TSQLQuery;
    dspOrdemServico: TDataSetProvider;
    cdsOrdemServico: TClientDataSet;
    dsOrdemServico: TDataSource;
    qryOrdemServicoORDS_ID: TIntegerField;
    qryOrdemServicoORDS_EMPR_ID: TIntegerField;
    qryOrdemServicoORDS_CLIE_ID: TIntegerField;
    qryOrdemServicoORDS_CLIE_EMPR_ID: TIntegerField;
    qryOrdemServicoORDS_TPRC_ID: TIntegerField;
    qryOrdemServicoORDS_TPRC_EMPR_ID: TIntegerField;
    qryOrdemServicoORDS_DTA_INSTALACAO: TDateField;
    qryOrdemServicoORDS_GENE_EMPR_ID_TIPO_OS: TIntegerField;
    qryOrdemServicoORDS_GENE_TGEN_ID_TIPO_OS: TIntegerField;
    qryOrdemServicoORDS_GENE_ID_TIPO_OS: TIntegerField;
    qryOrdemServicoORDS_STATUS: TIntegerField;
    qryOrdemServicoORDS_USER_ID_TEC: TIntegerField;
    qryOrdemServicoORDS_PROD_ID_EQUIP: TIntegerField;
    qryOrdemServicoORDS_PROD_EMPR_ID_EQUIP: TIntegerField;
    qryOrdemServicoORDS_NR_PEDIDO_SERIE: TStringField;
    qryOrdemServicoORDS_VLR_TOTAL_OS: TFMTBCDField;
    qryOrdemServicoORDS_OBSERVACAO: TBlobField;
    qryOrdemServicoORDS_INFORMACOES: TBlobField;
    qryOrdemServicoORDS_USER_ID_CANC: TIntegerField;
    qryOrdemServicoORDS_MOTIVO_CANC: TStringField;
    qryOrdemServicoORDS_DTA_CANC: TDateField;
    qryOrdemServicoORDS_DTA_CADASTRO: TDateField;
    qryOrdemServicoORDS_USER_ID: TIntegerField;
    qryOrdemServicoCLIE_RAZAO_SOCIAL: TStringField;
    qryOrdemServicoTPRC_DESCRICAO: TStringField;
    qryOrdemServicoTIPO_OS: TStringField;
    qryOrdemServicoUSER_NOME_COMPLETO: TStringField;
    qryOrdemServicoPROD_DESCRICAO: TStringField;
    qryOrdemServicoPROD_UNIDADE: TStringField;
    qryOrdemServicoMARCA_PROD: TStringField;
    qryOrdemServicoMODELO_PROD: TStringField;
    qryOrdemServicoUSER_CANC: TStringField;
    cdsOrdemServicoORDS_ID: TIntegerField;
    cdsOrdemServicoORDS_EMPR_ID: TIntegerField;
    cdsOrdemServicoORDS_CLIE_ID: TIntegerField;
    cdsOrdemServicoORDS_CLIE_EMPR_ID: TIntegerField;
    cdsOrdemServicoORDS_TPRC_ID: TIntegerField;
    cdsOrdemServicoORDS_TPRC_EMPR_ID: TIntegerField;
    cdsOrdemServicoORDS_DTA_INSTALACAO: TDateField;
    cdsOrdemServicoORDS_GENE_EMPR_ID_TIPO_OS: TIntegerField;
    cdsOrdemServicoORDS_GENE_TGEN_ID_TIPO_OS: TIntegerField;
    cdsOrdemServicoORDS_GENE_ID_TIPO_OS: TIntegerField;
    cdsOrdemServicoORDS_STATUS: TIntegerField;
    cdsOrdemServicoORDS_USER_ID_TEC: TIntegerField;
    cdsOrdemServicoORDS_PROD_ID_EQUIP: TIntegerField;
    cdsOrdemServicoORDS_PROD_EMPR_ID_EQUIP: TIntegerField;
    cdsOrdemServicoORDS_NR_PEDIDO_SERIE: TStringField;
    cdsOrdemServicoORDS_VLR_TOTAL_OS: TFMTBCDField;
    cdsOrdemServicoORDS_OBSERVACAO: TBlobField;
    cdsOrdemServicoORDS_INFORMACOES: TBlobField;
    cdsOrdemServicoORDS_USER_ID_CANC: TIntegerField;
    cdsOrdemServicoORDS_MOTIVO_CANC: TStringField;
    cdsOrdemServicoORDS_DTA_CANC: TDateField;
    cdsOrdemServicoORDS_DTA_CADASTRO: TDateField;
    cdsOrdemServicoORDS_USER_ID: TIntegerField;
    cdsOrdemServicoCLIE_RAZAO_SOCIAL: TStringField;
    cdsOrdemServicoTPRC_DESCRICAO: TStringField;
    cdsOrdemServicoTIPO_OS: TStringField;
    cdsOrdemServicoUSER_NOME_COMPLETO: TStringField;
    cdsOrdemServicoPROD_DESCRICAO: TStringField;
    cdsOrdemServicoPROD_UNIDADE: TStringField;
    cdsOrdemServicoMARCA_PROD: TStringField;
    cdsOrdemServicoMODELO_PROD: TStringField;
    cdsOrdemServicoUSER_CANC: TStringField;
    qryClientes: TSQLQuery;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    dsClientes: TDataSource;
    cdsClientesCLIE_ID: TIntegerField;
    cdsClientesCLIE_DTA_CADASTRO: TDateField;
    cdsClientesCLIE_ATIVO: TIntegerField;
    cdsClientesCLIE_RAZAO_SOCIAL: TStringField;
    cdsClientesCLIE_FANTASIA: TStringField;
    cdsClientesCLIE_CEP: TStringField;
    cdsClientesCLIE_ENDERECO: TStringField;
    cdsClientesCLIE_BAIRRO: TStringField;
    cdsClientesCLIE_TELEFONE1: TStringField;
    cdsClientesCLIE_TELEFONE2: TStringField;
    cdsClientesCLIE_TELEFONE3: TStringField;
    cdsClientesCLIE_TELEFONE4: TStringField;
    cdsClientesGENE_DESCR: TStringField;
    cdsClientesGENE_PAR1: TStringField;
    qryOrdemServicoPROD_GARANTIA: TIntegerField;
    cdsOrdemServicoPROD_GARANTIA: TIntegerField;
    qryListaOS: TSQLQuery;
    dspListaOS: TDataSetProvider;
    cdsListaOS: TClientDataSet;
    dsListaOS: TDataSource;
    cdsListaOSORDS_ID: TIntegerField;
    cdsListaOSORDS_DTA_INSTALACAO: TDateField;
    cdsListaOSORDS_STATUS: TIntegerField;
    cdsListaOSORDS_VLR_TOTAL_OS: TFMTBCDField;
    cdsListaOSTIPO_OS: TStringField;
    cdsListaOSPROD_DESCRICAO: TStringField;
    cdsListaOSMARCA_PROD: TStringField;
    cdsListaOSMODELO_PROD: TStringField;
    qryListaEquip: TSQLQuery;
    dspListaEquip: TDataSetProvider;
    cdsListaEquip: TClientDataSet;
    dsListaEquip: TDataSource;
    cdsListaEquipPROD_DESCRICAO: TStringField;
    cdsListaEquipPROD_GARANTIA: TIntegerField;
    cdsListaEquipMARCA_PROD: TStringField;
    cdsListaEquipMODELO_PROD: TStringField;
    qryListaPecas: TSQLQuery;
    dspListaPecas: TDataSetProvider;
    cdsListaPecas: TClientDataSet;
    dsListaPecas: TDataSource;
    cdsListaPecasODIT_TPIT_PROD_ID: TIntegerField;
    cdsListaPecasODIT_VLR_UNITARIO: TFMTBCDField;
    cdsListaPecasODIT_QTDE: TFMTBCDField;
    cdsListaPecasODIT_VLR_TOTAL: TFMTBCDField;
    cdsListaPecasPROD_DESCRICAO: TStringField;
    cdsListaPecasPROD_UNIDADE: TStringField;
    cdsListaPecasMARCA_PROD: TStringField;
    cdsListaPecasMODELO_PROD: TStringField;
    qryPesqProduto: TSQLQuery;
    dspPesqProduto: TDataSetProvider;
    cdsPesqProduto: TClientDataSet;
    cdsPesqProdutoTPIT_ID: TIntegerField;
    cdsPesqProdutoTPIT_EMPR_ID: TIntegerField;
    cdsPesqProdutoTPIT_TPRC_ID: TIntegerField;
    cdsPesqProdutoTPIT_TPRC_EMPR_ID: TIntegerField;
    cdsPesqProdutoTPIT_PROD_ID: TIntegerField;
    cdsPesqProdutoTPIT_PROD_EMPR_ID: TIntegerField;
    cdsPesqProdutoTPIT_DTA_VIGENCIA: TDateField;
    cdsPesqProdutoTPIT_DTA_VALIDADE: TDateField;
    cdsPesqProdutoTPIT_VLR_GONDOLA: TFMTBCDField;
    cdsPesqProdutoTPIT_VLR_MINIMO: TFMTBCDField;
    cdsPesqProdutoTPIT_VLR_ESPECIAL: TFMTBCDField;
    cdsPesqProdutoPROD_DESCRICAO: TStringField;
    cdsPesqProdutoPROD_UNIDADE: TStringField;
    cdsPesqProdutoMARCA_PROD: TStringField;
    cdsPesqProdutoMODELO_PROD: TStringField;
    qryOrdemServicoItens: TSQLQuery;
    dspOrdemServicoItens: TDataSetProvider;
    cdsOrdemServicoItens: TClientDataSet;
    dsOrdemServicoItens: TDataSource;
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
    cdsOrdemServicoItensODIT_TPIT_PROD_ID: TIntegerField;
    cdsOrdemServicoItensODIT_TPIT_PROD_EMPR_ID: TIntegerField;
    cdsOrdemServicoItensODIT_VLR_UNITARIO: TFMTBCDField;
    cdsOrdemServicoItensODIT_QTDE: TFMTBCDField;
    cdsOrdemServicoItensODIT_VLR_TOTAL: TFMTBCDField;
    cdsOrdemServicoItensODIT_DTA_CADASTRO: TDateField;
    cdsOrdemServicoItensODIT_USER_ID: TIntegerField;
    cdsOrdemServicoItensPROD_DESCRICAO: TStringField;
    cdsOrdemServicoItensPROD_UNIDADE: TStringField;
    cdsOrdemServicoItensMARCA_PROD: TStringField;
    cdsOrdemServicoItensMODELO_PROD: TStringField;
    qryOrdemServicoItensPROD_GARANTIA: TIntegerField;
    cdsOrdemServicoItensPROD_GARANTIA: TIntegerField;
    cdsListaPecasPROD_GARANTIA: TIntegerField;
    cdsPesqProdutoPROD_GARANTIA: TIntegerField;
    cdsOrdemServicoItensTOTALITENS: TAggregateField;
    qryPesqEquipCliente: TSQLQuery;
    dspPesqEquipCliente: TDataSetProvider;
    cdsPesqEquipCliente: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField2: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    qryOrdemServicoORDS_VLR_DESCONTO: TFMTBCDField;
    qryOrdemServicoORDS_VLR_PAGO: TFMTBCDField;
    qryOrdemServicoORDS_BAIXADO_ESTOQUE: TIntegerField;
    cdsOrdemServicoORDS_VLR_DESCONTO: TFMTBCDField;
    cdsOrdemServicoORDS_VLR_PAGO: TFMTBCDField;
    cdsOrdemServicoORDS_BAIXADO_ESTOQUE: TIntegerField;
    cdsOrdemServicoVALOR_PAGAR: TFloatField;
    cdsClientesCLIE_CNPJ_CPF: TStringField;
    cdsClientesCLIE_RG: TStringField;
    cdsListaOSORDS_DTA_CADASTRO: TDateField;
    cdsListaOSSTATUS: TStringField;
    cdsListaOSPROD_UNIDADE: TStringField;
    cdsListaOSUSER_NOME_COMPLETO: TStringField;
    cdsListaOSORDS_NR_PEDIDO_SERIE: TStringField;
    cdsListaOSORDS_OBSERVACAO: TBlobField;
    cdsListaOSORDS_INFORMACOES: TBlobField;
    cdsListaOSORDS_VLR_DESCONTO: TFMTBCDField;
    cdsListaOSORDS_VLR_PAGO: TFMTBCDField;
    cdsListaPecasPROD_ID: TIntegerField;
    qryTipoDoc: TSQLQuery;
    dspTipoDoc: TDataSetProvider;
    cdsTipoDoc: TClientDataSet;
    cdsTipoDocGENE_ID: TIntegerField;
    cdsTipoDocGENE_DESCR: TStringField;
    qryAcertos_OS: TSQLQuery;
    dspAcertos_OS: TDataSetProvider;
    cdsAcertos_OS: TClientDataSet;
    dsAcertos_OS: TDataSource;
    qryAcertos_OSODAC_ID: TIntegerField;
    qryAcertos_OSODAC_EMPR_ID: TIntegerField;
    qryAcertos_OSODAC_ORDS_ID: TIntegerField;
    qryAcertos_OSODAC_ORDS_EMPR_ID: TIntegerField;
    qryAcertos_OSODAC_ORDS_CLIE_ID: TIntegerField;
    qryAcertos_OSODAC_ORDS_CLIE_EMPR_ID: TIntegerField;
    qryAcertos_OSODAC_GENE_EMPR_ID_TIPO_DOC: TIntegerField;
    qryAcertos_OSODAC_GENE_TGEN_ID_TIPO_DOC: TIntegerField;
    qryAcertos_OSODAC_GENE_ID_TIPO_DOC: TIntegerField;
    qryAcertos_OSODAC_GENE_EMPR_ID_BCO: TIntegerField;
    qryAcertos_OSODAC_GENE_TGEN_ID_BCO: TIntegerField;
    qryAcertos_OSODAC_GENE_ID_BCO: TIntegerField;
    qryAcertos_OSODAC_NR_DOC: TStringField;
    qryAcertos_OSODAC_NR_AGENCIA: TStringField;
    qryAcertos_OSODAC_NR_CONTA: TStringField;
    qryAcertos_OSODAC_TITULAR: TStringField;
    qryAcertos_OSODAC_DTA_VCTO: TDateField;
    qryAcertos_OSODAC_VLR_DOC: TFMTBCDField;
    qryAcertos_OSODAC_STATUS: TIntegerField;
    qryAcertos_OSODAC_DTA_CADASTRO: TDateField;
    qryAcertos_OSODAC_USER_ID: TIntegerField;
    qryAcertos_OSTIPO_DOC: TStringField;
    qryAcertos_OSBANCO: TStringField;
    qryAcertos_OSCOD_BANCO: TStringField;
    cdsAcertos_OSODAC_ID: TIntegerField;
    cdsAcertos_OSODAC_EMPR_ID: TIntegerField;
    cdsAcertos_OSODAC_ORDS_ID: TIntegerField;
    cdsAcertos_OSODAC_ORDS_EMPR_ID: TIntegerField;
    cdsAcertos_OSODAC_ORDS_CLIE_ID: TIntegerField;
    cdsAcertos_OSODAC_ORDS_CLIE_EMPR_ID: TIntegerField;
    cdsAcertos_OSODAC_GENE_EMPR_ID_TIPO_DOC: TIntegerField;
    cdsAcertos_OSODAC_GENE_TGEN_ID_TIPO_DOC: TIntegerField;
    cdsAcertos_OSODAC_GENE_ID_TIPO_DOC: TIntegerField;
    cdsAcertos_OSODAC_GENE_EMPR_ID_BCO: TIntegerField;
    cdsAcertos_OSODAC_GENE_TGEN_ID_BCO: TIntegerField;
    cdsAcertos_OSODAC_GENE_ID_BCO: TIntegerField;
    cdsAcertos_OSODAC_NR_DOC: TStringField;
    cdsAcertos_OSODAC_NR_AGENCIA: TStringField;
    cdsAcertos_OSODAC_NR_CONTA: TStringField;
    cdsAcertos_OSODAC_TITULAR: TStringField;
    cdsAcertos_OSODAC_DTA_VCTO: TDateField;
    cdsAcertos_OSODAC_VLR_DOC: TFMTBCDField;
    cdsAcertos_OSODAC_STATUS: TIntegerField;
    cdsAcertos_OSODAC_DTA_CADASTRO: TDateField;
    cdsAcertos_OSODAC_USER_ID: TIntegerField;
    cdsAcertos_OSTIPO_DOC: TStringField;
    cdsAcertos_OSBANCO: TStringField;
    cdsAcertos_OSCOD_BANCO: TStringField;
    qryPesqBanco: TSQLQuery;
    dspPesqBanco: TDataSetProvider;
    cdsPesqBanco: TClientDataSet;
    IntegerField3: TIntegerField;
    StringField5: TStringField;
    cdsPesqBancoGENE_PAR1: TStringField;
    qryOrdemServicoItensODIT_USER_ID_TEC: TIntegerField;
    cdsOrdemServicoItensODIT_USER_ID_TEC: TIntegerField;
    cdsAcertos_OSSOMA: TAggregateField;
    qryOrdemServicoORDS_FORN_ID_EQUIP: TIntegerField;
    qryOrdemServicoFORN_RAZAO_SOCIAL: TStringField;
    cdsOrdemServicoORDS_FORN_ID_EQUIP: TIntegerField;
    cdsOrdemServicoFORN_RAZAO_SOCIAL: TStringField;
    cdsPesqEquipClienteFORN_ID: TIntegerField;
    cdsPesqEquipClienteFORN_RAZAO_SOCIAL: TStringField;
    cdsListaOSFORN_RAZAO_SOCIAL: TStringField;
    cdsListaOSATENDENTE: TStringField;
    qryListaPecasRequisicao: TSQLQuery;
    dspListaPecasRequisicao: TDataSetProvider;
    cdsListaPecasRequisicao: TClientDataSet;
    IntegerField4: TIntegerField;
    StringField6: TStringField;
    StringField7: TStringField;
    FMTBCDField1: TFMTBCDField;
    FMTBCDField2: TFMTBCDField;
    FMTBCDField3: TFMTBCDField;
    StringField8: TStringField;
    StringField9: TStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    dsListaPecasRequisicao: TDataSource;
    dsPesqTipoOS: TDataSource;
    qryPesqFornec: TSQLQuery;
    dspPesqFornec: TDataSetProvider;
    cdsPesqFornec: TClientDataSet;
    cdsPesqFornecFORN_ID: TIntegerField;
    cdsPesqFornecFORN_RAZAO_SOCIAL: TStringField;
    cdsPesqFornecFORN_NOME_FANTASIA: TStringField;
    cdsPesqFornecFORN_CNPJ_CPF: TStringField;
    cdsClientesCLIE_REFERENCIA: TStringField;
    cdsPesqClieCLIE_CNPJ_CPF: TStringField;
    cdsPesqClieCLIE_CEP: TStringField;
    cdsPesqClieCLIE_REFERENCIA: TStringField;
    cdsPesqProdutoESTQ_EST_ATUAL: TFMTBCDField;
    cdsPesqProdutoESTQ_EST_DISP: TFMTBCDField;
    qryOrdemServicoCLIE_GENE_ID_ROTA: TIntegerField;
    cdsOrdemServicoCLIE_GENE_ID_ROTA: TIntegerField;
    cdsListaPecasRequisicaoODIT_ORDS_ID: TIntegerField;
    qryOrdemServicoORDS_GENE_EMPR_ID_STATUS_OS: TIntegerField;
    qryOrdemServicoORDS_GENE_TGEN_ID_STATUS_OS: TIntegerField;
    qryOrdemServicoORDS_GENE_ID_STATUS_OS: TIntegerField;
    cdsOrdemServicoORDS_GENE_EMPR_ID_STATUS_OS: TIntegerField;
    cdsOrdemServicoORDS_GENE_TGEN_ID_STATUS_OS: TIntegerField;
    cdsOrdemServicoORDS_GENE_ID_STATUS_OS: TIntegerField;
    qryOrdemServicoSTATUS_OS: TStringField;
    cdsOrdemServicoSTATUS_OS: TStringField;
    cdsListaOSSTATUS_OS: TStringField;
    cdsListaOSORDS_GENE_EMPR_ID_STATUS_OS: TIntegerField;
    cdsListaOSORDS_GENE_TGEN_ID_STATUS_OS: TIntegerField;
    cdsListaOSORDS_GENE_ID_STATUS_OS: TIntegerField;
    qryOrdemServicoORDS_GENE_EMPR_ID_TP_AGEND: TIntegerField;
    qryOrdemServicoORDS_GENE_TGEN_ID_TP_AGEND: TIntegerField;
    qryOrdemServicoORDS_GENE_ID_TP_AGEND: TIntegerField;
    qryOrdemServicoTIPO_AGENDAMENTO: TStringField;
    cdsOrdemServicoORDS_GENE_EMPR_ID_TP_AGEND: TIntegerField;
    cdsOrdemServicoORDS_GENE_TGEN_ID_TP_AGEND: TIntegerField;
    cdsOrdemServicoORDS_GENE_ID_TP_AGEND: TIntegerField;
    cdsOrdemServicoTIPO_AGENDAMENTO: TStringField;
    cdsListaOSORDS_GENE_EMPR_ID_TP_AGEND: TIntegerField;
    cdsListaOSORDS_GENE_TGEN_ID_TP_AGEND: TIntegerField;
    cdsListaOSORDS_GENE_ID_TP_AGEND: TIntegerField;
    cdsListaOSTIPO_AGENDAMENTO: TStringField;
    cdsPesqEquipClienteORDS_GENE_ID_FILTRO: TIntegerField;
    cdsPesqEquipClienteFILTRO: TStringField;
    qryOrdemServicoORDS_GENE_EMPR_ID_FILTRO: TIntegerField;
    qryOrdemServicoORDS_GENE_TGEN_ID_FILTRO: TIntegerField;
    cdsOrdemServicoORDS_GENE_EMPR_ID_FILTRO: TIntegerField;
    cdsOrdemServicoORDS_GENE_TGEN_ID_FILTRO: TIntegerField;
    cdsListaEquipFILTRO: TStringField;
    cdsListaOSFILTRO: TStringField;
    qryOrdemServicoORDS_GENE_ID_FILTRO: TIntegerField;
    cdsOrdemServicoORDS_GENE_ID_FILTRO: TIntegerField;
    cdsListaPecasGENE_IMAGE: TBlobField;
    cdsPesqProdutoCOD_FORNEC1: TIntegerField;
    cdsPesqProdutoCOD_FORNEC2: TIntegerField;
    cdsPesqProdutoCOD_FORNEC3: TIntegerField;
    cdsPesqProdutoCOD_FORNEC4: TIntegerField;
    qryOrdemServicoORDS_CLIE_ID_GARANTIA: TIntegerField;
    qryOrdemServicoORDS_CLIE_EMPR_ID_GARANTIA: TIntegerField;
    cdsOrdemServicoORDS_CLIE_ID_GARANTIA: TIntegerField;
    cdsOrdemServicoORDS_CLIE_EMPR_ID_GARANTIA: TIntegerField;
    cdsListaOSCLIE_ID: TIntegerField;
    cdsListaOSCLIE_RAZAO_SOCIAL: TStringField;
    cdsListaOSCLIE_CNPJ_CPF: TStringField;
    cdsListaOSCLIE_RG: TStringField;
    cdsListaOSCLIE_ENDERECO: TStringField;
    cdsListaOSCLIE_TELEFONE1: TStringField;
    cdsListaOSCLIE_TELEFONE2: TStringField;
    cdsListaOSCLIE_TELEFONE3: TStringField;
    cdsListaOSCLIE_TELEFONE4: TStringField;
    cdsListaOSCLIE_CEP: TStringField;
    cdsListaOSCLIE_BAIRRO: TStringField;
    cdsListaOSCLIE_REFERENCIA: TStringField;
    cdsListaOSCIDADE: TStringField;
    cdsListaOSUF: TStringField;
    qryOrdemServicoItensESTQ_EST_DISP: TFMTBCDField;
    cdsOrdemServicoItensESTQ_EST_DISP: TFMTBCDField;
    qryOrdemServicoORDS_DTA_ENTREGA: TDateField;
    qryOrdemServicoORDS_USER_ID_ENTREG: TIntegerField;
    qryOrdemServicoORDS_HORARIO: TTimeField;
    cdsOrdemServicoORDS_DTA_ENTREGA: TDateField;
    cdsOrdemServicoORDS_USER_ID_ENTREG: TIntegerField;
    cdsOrdemServicoORDS_HORARIO: TTimeField;
    cdsListaOSORDS_HORARIO: TTimeField;
    cdsListaOSVALOR_PAGAR: TFloatField;
    cdsListaOSTOTALPECAS: TFloatField;
    cdsOrdemServicoTOTALPECAS: TFloatField;
    procedure cdsOrdemServicoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsOrdemServicoNewRecord(DataSet: TDataSet);
    procedure cdsOrdemServicoItensReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsOrdemServicoItensNewRecord(DataSet: TDataSet);
    procedure cdsAcertos_OSNewRecord(DataSet: TDataSet);
    procedure dsListaOSDataChange(Sender: TObject; Field: TField);
    procedure cdsOrdemServicoAfterEdit(DataSet: TDataSet);
    procedure cdsOrdemServicoCalcFields(DataSet: TDataSet);
    procedure cdsListaOSCalcFields(DataSet: TDataSet);
  private

  public

  end;

var
  dmOrdemServico: TdmOrdemServico;

implementation

{$R *.dfm}

procedure TdmOrdemServico.cdsAcertos_OSNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('ODAC_ID').AsString := funcLocal.ObterSequencia('ORDEM_SERVICO_ACERTOS',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('ODAC_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('ODAC_ORDS_ID').AsInteger := cdsOrdemServicoORDS_ID.AsInteger;
  DataSet.FieldByName('ODAC_ORDS_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('ODAC_ORDS_CLIE_ID').AsInteger := cdsOrdemServicoORDS_CLIE_ID.AsInteger;
  DataSet.FieldByName('ODAC_ORDS_CLIE_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('ODAC_GENE_EMPR_ID_TIPO_DOC').AsInteger := 0;
  DataSet.FieldByName('ODAC_GENE_TGEN_ID_TIPO_DOC').AsInteger := 5;
  DataSet.FieldByName('ODAC_GENE_EMPR_ID_BCO').AsInteger := 0;
  DataSet.FieldByName('ODAC_GENE_TGEN_ID_BCO').AsInteger := 505;
  DataSet.FieldByName('ODAC_DTA_VCTO').AsDateTime :=
    funcLocal.DataServidor(funcLocal.Conexao);
  try
    DataSet.FieldByName('ODAC_VLR_DOC').AsFloat :=
      cdsOrdemServicoORDS_VLR_TOTAL_OS.AsFloat - DataSet.FieldByName
      ('SOMA').AsFloat;
  except
    DataSet.FieldByName('ODAC_VLR_DOC').AsFloat := 0;
  end;
  DataSet.FieldByName('ODAC_STATUS').AsInteger := 1;
  DataSet.FieldByName('ODAC_DTA_CADASTRO').AsDateTime :=
    funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('ODAC_USER_ID').AsInteger := funcLocal.User_ID;
end;

procedure TdmOrdemServico.cdsListaOSCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsListaOSVALOR_PAGAR.Value := (cdsListaOSORDS_VLR_TOTAL_OS.AsFloat -
                                 (cdsListaOSORDS_VLR_PAGO.AsFloat +
                                  cdsListaOSORDS_VLR_DESCONTO.AsFloat));
  cdsListaOSTOTALPECAS.Value := 0;
  with cdsListaPecas do begin
    Close;
    Params.ParamByName('ORDS_ID').AsInteger := cdsListaOSORDS_ID.AsInteger;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Params.ParamByName('CLIE_ID').AsInteger := cdsClientesCLIE_ID.AsInteger;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Open;
    First;
    DisableControls;
    while not Eof do begin
      cdsListaOSTOTALPECAS.Value := cdsListaOSTOTALPECAS.Value + FieldByName('ODIT_QTDE').Value;
      Next;
    end;
  end;
end;

procedure TdmOrdemServico.cdsOrdemServicoAfterEdit(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('ORDS_GENE_EMPR_ID_FILTRO').AsInteger    := funcLocal.Empr_ID;
  DataSet.FieldByName('ORDS_GENE_TGEN_ID_FILTRO').AsInteger    := 520;
  DataSet.FieldByName('ORDS_GENE_EMPR_ID_STATUS_OS').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('ORDS_GENE_TGEN_ID_STATUS_OS').AsInteger := 517;
  DataSet.FieldByName('ORDS_GENE_EMPR_ID_TP_AGEND').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('ORDS_GENE_TGEN_ID_TP_AGEND').AsInteger  := 518;
end;

procedure TdmOrdemServico.cdsOrdemServicoCalcFields(DataSet: TDataSet);
var
  qryCons : TSQLQuery;
begin
  inherited;
  cdsOrdemServicoVALOR_PAGAR.Value := (cdsOrdemServicoORDS_VLR_TOTAL_OS.AsFloat -
                                            (cdsOrdemServicoORDS_VLR_PAGO.AsFloat +
                                             cdsOrdemServicoORDS_VLR_DESCONTO.AsFloat));
  cdsOrdemServicoTOTALPECAS.Value := 0;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      SUM(ODIT_QTDE)');
        sql.Add('FROM  ORDEM_SERVICO_ITENS');
        sql.Add('WHERE ODIT_EMPR_ID           = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   ODIT_ORDS_ID           = ' + cdsOrdemServicoORDS_ID.AsString);
        sql.Add('AND   ODIT_ORDS_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
        Open;
      end;
      cdsOrdemServicoTOTALPECAS.Value := qryCons.Fields[0].Value;
    except
      cdsOrdemServicoTOTALPECAS.Value := 0;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TdmOrdemServico.cdsOrdemServicoItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('ODIT_ID').AsString                 := funcLocal.ObterSequencia('ORDEM_SERVICO_ITENS',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('ODIT_EMPR_ID').AsInteger           := funcLocal.Empr_ID;
  DataSet.FieldByName('ODIT_ORDS_ID').AsInteger           := cdsOrdemServicoORDS_ID.AsInteger;
  DataSet.FieldByName('ODIT_ORDS_EMPR_ID').AsInteger      := funcLocal.Empr_ID;
  DataSet.FieldByName('ODIT_ORDS_CLIE_ID').AsInteger      := cdsOrdemServicoORDS_CLIE_ID.AsInteger;
  DataSet.FieldByName('ODIT_ORDS_CLIE_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('ODIT_TPIT_EMPR_ID').AsInteger      := funcLocal.Empr_ID;
  DataSet.FieldByName('ODIT_TPIT_TPRC_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('ODIT_TPIT_PROD_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('ODIT_VLR_UNITARIO').AsFloat        := 0;
  DataSet.FieldByName('ODIT_QTDE').AsFloat                := 1;
  DataSet.FieldByName('ODIT_VLR_TOTAL').AsFloat           := 0;
  DataSet.FieldByName('ODIT_USER_ID_TEC').AsInteger       := cdsOrdemServicoORDS_USER_ID_TEC.AsInteger;
  DataSet.FieldByName('ODIT_DTA_CADASTRO').AsDateTime     := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('ODIT_USER_ID').AsInteger           := funcLocal.User_ID;
end;

procedure TdmOrdemServico.cdsOrdemServicoItensReconcileError
  (DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmOrdemServico', 'cdsOrdemServicoItensReconcileError',E.Message);
  funcLocal.Alerta('Erro ao tentar salvar o registro.' + #13 + '[' + E.Message + ']', 1);
end;

procedure TdmOrdemServico.cdsOrdemServicoNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('ORDS_ID').AsString                       := funcLocal.ObterSequencia('ORDEM_SERVICO', IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('ORDS_EMPR_ID').AsInteger                 := funcLocal.Empr_ID;
  DataSet.FieldByName('ORDS_CLIE_ID').AsInteger                 := cdsClientesCLIE_ID.AsInteger;
  DataSet.FieldByName('CLIE_RAZAO_SOCIAL').AsString             := cdsClientesCLIE_RAZAO_SOCIAL.AsString;
  DataSet.FieldByName('ORDS_CLIE_EMPR_ID').AsInteger            := funcLocal.Empr_ID;
  DataSet.FieldByName('ORDS_CLIE_EMPR_ID_GARANTIA').AsInteger   := funcLocal.Empr_ID;
  DataSet.FieldByName('ORDS_TPRC_EMPR_ID').AsInteger            := funcLocal.Empr_ID;
  DataSet.FieldByName('ORDS_DTA_INSTALACAO').AsDateTime         := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('ORDS_GENE_EMPR_ID_TIPO_OS').AsInteger    := 0;
  DataSet.FieldByName('ORDS_GENE_TGEN_ID_TIPO_OS').AsInteger    := 12;
  DataSet.FieldByName('ORDS_GENE_ID_TIPO_OS').AsInteger         := 1;
  DataSet.FieldByName('ORDS_GENE_EMPR_ID_STATUS_OS').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('ORDS_GENE_TGEN_ID_STATUS_OS').AsInteger  := 517;
  DataSet.FieldByName('TIPO_OS').AsString                       := 'ORDEM DE SERVICO';
  DataSet.FieldByName('ORDS_STATUS').AsInteger                  := 0;
  DataSet.FieldByName('ORDS_PROD_EMPR_ID_EQUIP').AsInteger      := funcLocal.Empr_ID;
  DataSet.FieldByName('ORDS_VLR_TOTAL_OS').AsFloat              := 0;
  DataSet.FieldByName('ORDS_VLR_DESCONTO').AsFloat              := 0;
  DataSet.FieldByName('ORDS_VLR_PAGO').AsFloat                  := 0;
  DataSet.FieldByName('ORDS_BAIXADO_ESTOQUE').AsInteger         := 0;
  DataSet.FieldByName('ORDS_GENE_EMPR_ID_TP_AGEND').AsInteger   := funcLocal.Empr_ID;
  DataSet.FieldByName('ORDS_GENE_TGEN_ID_TP_AGEND').AsInteger   := 518;
  DataSet.FieldByName('ORDS_GENE_EMPR_ID_FILTRO').AsInteger     := funcLocal.Empr_ID;
  DataSet.FieldByName('ORDS_GENE_TGEN_ID_FILTRO').AsInteger     := 520;
  DataSet.FieldByName('ORDS_DTA_CADASTRO').AsDateTime           := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('ORDS_USER_ID').AsInteger                 := funcLocal.User_ID;
end;

procedure TdmOrdemServico.cdsOrdemServicoReconcileError
  (DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmOrdemServico', 'cdsOrdemServicoReconcileError',
    E.Message);
  funcLocal.Alerta('Erro ao tentar salvar o registro.' + #13 + '[' +
    E.Message + ']', 1);
end;

procedure TdmOrdemServico.dsListaOSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  with cdsListaPecas do
  begin
    Close;
    Params.ParamByName('ORDS_ID').AsInteger := cdsListaOSORDS_ID.AsInteger;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Params.ParamByName('CLIE_ID').AsInteger := cdsClientesCLIE_ID.AsInteger;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Open;
  end;
  with cdsListaPecasRequisicao do
  begin
    Close;
    Params.ParamByName('ORDS_ID').AsInteger := cdsListaOSORDS_ID.AsInteger;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Params.ParamByName('CLIE_ID').AsInteger := cdsClientesCLIE_ID.AsInteger;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Open;
  end;
end;

initialization

if dmOrdemServico = nil then
  dmOrdemServico := TdmOrdemServico.Create(nil);

finalization

FreeAndNil(dmOrdemServico);

end.
