unit udmRel_Tabela_Preco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmRel_Tabela_Preco = class(TdmBasico)
    qryTabelaPreco: TSQLQuery;
    dspTabelaPreco: TDataSetProvider;
    cdsTabelaPreco: TClientDataSet;
    dsTabelaPreco: TDataSource;
    qryItensTabelaPreco: TSQLQuery;
    dspItensTabelaPreco: TDataSetProvider;
    cdsItensTabelaPreco: TClientDataSet;
    dsItensTabelaPreco: TDataSource;
    cdsItensTabelaPrecoTPIT_ID: TIntegerField;
    cdsItensTabelaPrecoTPIT_EMPR_ID: TIntegerField;
    cdsItensTabelaPrecoTPIT_TPRC_ID: TIntegerField;
    cdsItensTabelaPrecoTPIT_TPRC_EMPR_ID: TIntegerField;
    cdsItensTabelaPrecoTPIT_PROD_ID: TIntegerField;
    cdsItensTabelaPrecoTPIT_PROD_EMPR_ID: TIntegerField;
    cdsItensTabelaPrecoTPIT_DTA_VIGENCIA: TDateField;
    cdsItensTabelaPrecoTPIT_DTA_VALIDADE: TDateField;
    cdsItensTabelaPrecoTPIT_VLR_GONDOLA: TFMTBCDField;
    cdsItensTabelaPrecoTPIT_VLR_MINIMO: TFMTBCDField;
    cdsItensTabelaPrecoTPIT_VLR_ESPECIAL: TFMTBCDField;
    cdsItensTabelaPrecoTPIT_VLR_ATACADO: TFMTBCDField;
    cdsItensTabelaPrecoTPIT_DTA_CADASTRO: TDateField;
    cdsItensTabelaPrecoTPIT_USER_ID: TIntegerField;
    cdsItensTabelaPrecoPROD_DESCRICAO: TStringField;
    cdsItensTabelaPrecoPROD_UNIDADE: TStringField;
    cdsItensTabelaPrecoPROD_COMISSAO_VEND_INTERNA: TFMTBCDField;
    cdsItensTabelaPrecoPROD_COMISSAO_VEND_EXTERNO: TFMTBCDField;
    cdsItensTabelaPrecoPROD_COMISSAO_VEND_BALCAO: TFMTBCDField;
    cdsItensTabelaPrecoTIPO_PROD: TStringField;
    cdsItensTabelaPrecoGRUPO_PROD: TStringField;
    cdsItensTabelaPrecoMARCA_PROD: TStringField;
    cdsItensTabelaPrecoMODELO_PROD: TStringField;
    cdsTabelaPrecoTPRC_ID: TIntegerField;
    cdsTabelaPrecoTPRC_EMPR_ID: TIntegerField;
    cdsTabelaPrecoTPRC_DESCRICAO: TStringField;
    cdsTabelaPrecoTPRC_ATIVO: TStringField;
    cdsTabelaPrecoTPRC_DTA_CADASTRO: TDateField;
    cdsTabelaPrecoTPRC_USER_ID: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRel_Tabela_Preco: TdmRel_Tabela_Preco;

implementation

{$R *.dfm}

initialization
  if dmRel_Tabela_Preco = nil then
    dmRel_Tabela_Preco := TdmRel_Tabela_Preco.Create(nil);
finalization
  FreeAndNil(dmRel_Tabela_Preco);

end.
