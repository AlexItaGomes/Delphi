unit udmRel_Entrada_Nota_Fiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DBClient, Provider, DB, SqlExpr;

type
  TdmRel_Entrada_Nota_Fiscal = class(TdmBasico)
    qryRelNotaFiscal: TSQLQuery;
    dspRelNotaFiscal: TDataSetProvider;
    cdsRelNotaFiscal: TClientDataSet;
    dsRelNotaFiscal: TDataSource;
    cdsRelNotaFiscalNFEN_ID: TIntegerField;
    cdsRelNotaFiscalNFEN_EMPR_ID: TIntegerField;
    cdsRelNotaFiscalNFEN_FORN_ID: TIntegerField;
    cdsRelNotaFiscalNFEN_DTA_EMISSAO: TDateField;
    cdsRelNotaFiscalNFEN_DTA_ENTRADA: TDateField;
    cdsRelNotaFiscalNFEN_NR_NOTA: TIntegerField;
    cdsRelNotaFiscalNFEN_NR_SERIE: TIntegerField;
    cdsRelNotaFiscalNFEN_VLR_TOTAL_PROD: TFMTBCDField;
    cdsRelNotaFiscalNFEN_VLR_TOTAL_NOTA: TFMTBCDField;
    cdsRelNotaFiscalNFEN_CONCILIADO: TStringField;
    cdsRelNotaFiscalNFEN_DTA_CONCILIADO: TDateField;
    cdsRelNotaFiscalNFEN_DTA_CANCELADO: TDateField;
    cdsRelNotaFiscalNFEN_USER_ID_CANC: TIntegerField;
    cdsRelNotaFiscalNFEN_MOTIVO_CANC: TBlobField;
    cdsRelNotaFiscalNFEN_DTA_CADASTRO: TDateField;
    cdsRelNotaFiscalNFEN_USER_ID: TIntegerField;
    cdsRelNotaFiscalNFEN_VLR_TOTAL_DESC: TFMTBCDField;
    cdsRelNotaFiscalFORN_NOME_FANTASIA: TStringField;
    qryItensNotaFiscal: TSQLQuery;
    dspItensNotaFiscal: TDataSetProvider;
    cdsItensNotaFiscal: TClientDataSet;
    dsItensNotaFiscal: TDataSource;
    cdsItensNotaFiscalNFIT_ID: TIntegerField;
    cdsItensNotaFiscalNFIT_EMPR_ID: TIntegerField;
    cdsItensNotaFiscalNFIT_NFEN_ID: TIntegerField;
    cdsItensNotaFiscalNFIT_NFEN_EMPR_ID: TIntegerField;
    cdsItensNotaFiscalNFIT_PROD_ID: TIntegerField;
    cdsItensNotaFiscalNFIT_PROD_EMPR_ID: TIntegerField;
    cdsItensNotaFiscalNFIT_QTDE: TFMTBCDField;
    cdsItensNotaFiscalNFIT_VLR_UNITARIO: TFMTBCDField;
    cdsItensNotaFiscalNFIT_VLR_TOTAL_ITEM: TFMTBCDField;
    cdsItensNotaFiscalNFIT_DTA_CADASTRO: TDateField;
    cdsItensNotaFiscalNFIT_USER_ID: TIntegerField;
    cdsItensNotaFiscalPROD_DESCRICAO: TStringField;
    cdsItensNotaFiscalPROD_UNIDADE: TStringField;
    cdsItensNotaFiscalGRUPO_PROD: TStringField;
    cdsItensNotaFiscalMARCA_PROD: TStringField;
    cdsItensNotaFiscalMODELO_PROD: TStringField;
    qryAcertosNotaFiscal: TSQLQuery;
    dspAcertosNotaFiscal: TDataSetProvider;
    cdsAcertosNotaFiscal: TClientDataSet;
    dsAcertosNotaFiscal: TDataSource;
    cdsAcertosNotaFiscalNFAC_ID: TIntegerField;
    cdsAcertosNotaFiscalNFAC_EMPR_ID: TIntegerField;
    cdsAcertosNotaFiscalNFAC_NFEN_ID: TIntegerField;
    cdsAcertosNotaFiscalNFAC_NFEN_EMPR_ID: TIntegerField;
    cdsAcertosNotaFiscalNFAC_DESCRICAO: TStringField;
    cdsAcertosNotaFiscalNFAC_NR_DOCUMENTO: TStringField;
    cdsAcertosNotaFiscalNFAC_GENE_EMPR_ID_TP_DOC: TIntegerField;
    cdsAcertosNotaFiscalNFAC_GENE_TGEN_ID_TP_DOC: TIntegerField;
    cdsAcertosNotaFiscalNFAC_GENE_ID_TP_DOC: TIntegerField;
    cdsAcertosNotaFiscalNFAC_DTA_LANC: TDateField;
    cdsAcertosNotaFiscalNFAC_DTA_VCTO: TDateField;
    cdsAcertosNotaFiscalNFAC_VALOR_DOC: TFMTBCDField;
    cdsAcertosNotaFiscalNFAC_VALOR_JUROS: TFMTBCDField;
    cdsAcertosNotaFiscalNFAC_VALOR_MORA: TFMTBCDField;
    cdsAcertosNotaFiscalNFAC_CONCILIADO: TIntegerField;
    cdsAcertosNotaFiscalNFAC_DTA_CADASTRO: TDateField;
    cdsAcertosNotaFiscalNFAC_USER_ID: TIntegerField;
    cdsAcertosNotaFiscalTIPO_DOC: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRel_Entrada_Nota_Fiscal: TdmRel_Entrada_Nota_Fiscal;

implementation

{$R *.dfm}

initialization
  dmRel_Entrada_Nota_Fiscal := TdmRel_Entrada_Nota_Fiscal.Create(nil);
finalization
  FreeAndNil(dmRel_Entrada_Nota_Fiscal);

end.
