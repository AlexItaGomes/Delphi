unit dmRel_Entrada_Avulsa_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmRel_Entr_Avulsa_Produtos = class(TdmBasico)
    qryRelEntradaAvulsa: TSQLQuery;
    dspRelEntradaAvulsa: TDataSetProvider;
    cdsRelEntradaAvulsa: TClientDataSet;
    dsRelEntradaAvulsa: TDataSource;
    qryItensEntradaAvulsa: TSQLQuery;
    dspItensEntradaAvulsa: TDataSetProvider;
    cdsItensEntradaAvulsa: TClientDataSet;
    dsItensEntradaAvulsa: TDataSource;
    cdsRelEntradaAvulsaENAV_ID: TIntegerField;
    cdsRelEntradaAvulsaENAV_EMPR_ID: TIntegerField;
    cdsRelEntradaAvulsaENAV_NR_DOCUMENTO: TStringField;
    cdsRelEntradaAvulsaENAV_CONCILIADO: TStringField;
    cdsRelEntradaAvulsaENAV_OBS: TBlobField;
    cdsRelEntradaAvulsaENAV_DTA_CADASTRO: TDateField;
    cdsRelEntradaAvulsaENAV_USER_ID: TIntegerField;
    cdsItensEntradaAvulsaENIT_ID: TIntegerField;
    cdsItensEntradaAvulsaENIT_EMPR_ID: TIntegerField;
    cdsItensEntradaAvulsaENIT_ENAV_ID: TIntegerField;
    cdsItensEntradaAvulsaENIT_ENAV_EMPR_ID: TIntegerField;
    cdsItensEntradaAvulsaENIT_PROD_ID: TIntegerField;
    cdsItensEntradaAvulsaENIT_PROD_EMPR_ID: TIntegerField;
    cdsItensEntradaAvulsaENIT_QTDE: TFMTBCDField;
    cdsItensEntradaAvulsaENIT_DTA_CADASTRO: TDateField;
    cdsItensEntradaAvulsaENIT_USER_ID: TIntegerField;
    cdsItensEntradaAvulsaPROD_DESCRICAO: TStringField;
    cdsItensEntradaAvulsaPROD_UNIDADE: TStringField;
    cdsItensEntradaAvulsaGRUPO_PROD: TStringField;
    cdsItensEntradaAvulsaMARCA_PROD: TStringField;
    cdsItensEntradaAvulsaMODELO_PROD: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRel_Entr_Avulsa_Produtos: TdmRel_Entr_Avulsa_Produtos;

implementation

{$R *.dfm}

initialization
  dmRel_Entr_Avulsa_Produtos := TdmRel_Entr_Avulsa_Produtos.Create(nil);
finalization
  FreeAndNil(dmRel_Entr_Avulsa_Produtos);

end.
