unit udmRel_Saida_Avulsa_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DBClient, Provider, DB, SqlExpr;

type
  TdmRel_Saida_Avulsa_Produtos = class(TdmBasico)
    qryRelSaidaAvulsa: TSQLQuery;
    dspRelSaidaAvulsa: TDataSetProvider;
    cdsRelSaidaAvulsa: TClientDataSet;
    dsRelSaidaAvulsa: TDataSource;
    qryItensSaidaAvulsa: TSQLQuery;
    dspItensSaidaAvulsa: TDataSetProvider;
    cdsItensSaidaAvulsa: TClientDataSet;
    dsItensSaidaAvulsa: TDataSource;
    cdsRelSaidaAvulsaSAAV_ID: TIntegerField;
    cdsRelSaidaAvulsaSAAV_EMPR_ID: TIntegerField;
    cdsRelSaidaAvulsaSAAV_NR_DOCUMENTO: TStringField;
    cdsRelSaidaAvulsaSAAV_CONCILIADO: TStringField;
    cdsRelSaidaAvulsaSAAV_OBS: TBlobField;
    cdsRelSaidaAvulsaSAAV_DTA_CADASTRO: TDateField;
    cdsRelSaidaAvulsaSAAV_USER_ID: TIntegerField;
    cdsItensSaidaAvulsaSAIT_ID: TIntegerField;
    cdsItensSaidaAvulsaSAIT_EMPR_ID: TIntegerField;
    cdsItensSaidaAvulsaSAIT_SAAV_ID: TIntegerField;
    cdsItensSaidaAvulsaSAIT_SAAV_EMPR_ID: TIntegerField;
    cdsItensSaidaAvulsaSAIT_PROD_ID: TIntegerField;
    cdsItensSaidaAvulsaSAIT_PROD_EMPR_ID: TIntegerField;
    cdsItensSaidaAvulsaSAIT_QTDE: TFMTBCDField;
    cdsItensSaidaAvulsaSAIT_DTA_CADASTRO: TDateField;
    cdsItensSaidaAvulsaSAIT_USER_ID: TIntegerField;
    cdsItensSaidaAvulsaPROD_DESCRICAO: TStringField;
    cdsItensSaidaAvulsaPROD_UNIDADE: TStringField;
    cdsItensSaidaAvulsaGRUPO_PROD: TStringField;
    cdsItensSaidaAvulsaMARCA_PROD: TStringField;
    cdsItensSaidaAvulsaMODELO_PROD: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRel_Saida_Avulsa_Produtos: TdmRel_Saida_Avulsa_Produtos;

implementation

{$R *.dfm}

initialization
  dmRel_Saida_Avulsa_Produtos := TdmRel_Saida_Avulsa_Produtos.Create(nil);
finalization
  FreeAndNil(dmRel_Saida_Avulsa_Produtos);

end.
