unit udmRel_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmRel_Produtos = class(TdmBasico)
    qryRel_Produtos: TSQLQuery;
    dspRel_Produtos: TDataSetProvider;
    cdsRel_Produtos: TClientDataSet;
    dsRel_Produtos: TDataSource;
    cdsRel_ProdutosPROD_ID: TIntegerField;
    cdsRel_ProdutosPROD_DESCRICAO: TStringField;
    cdsRel_ProdutosPROD_UNIDADE: TStringField;
    cdsRel_ProdutosPROD_ATIVO: TStringField;
    cdsRel_ProdutosPROD_DTA_ULT_COMPRA: TDateField;
    cdsRel_ProdutosPROD_VLR_CUSTO: TFMTBCDField;
    cdsRel_ProdutosPROD_ESTQ_INICIAL: TFMTBCDField;
    cdsRel_ProdutosPROD_ESTQ_MINIMO: TFMTBCDField;
    cdsRel_ProdutosPROD_GARANTIA: TIntegerField;
    cdsRel_ProdutosPROD_FLG_FRACIONADO: TStringField;
    cdsRel_ProdutosPROD_DTA_CADASTRO: TDateField;
    cdsRel_ProdutosFORN_NOME_FANTASIA: TStringField;
    cdsRel_ProdutosTIPO_PROD: TStringField;
    cdsRel_ProdutosGRUPO_PROD: TStringField;
    cdsRel_ProdutosMARCA_PROD: TStringField;
    cdsRel_ProdutosMODELO_PROD: TStringField;
    cdsRel_ProdutosALIQUOTA_ECF: TStringField;
    cdsRel_ProdutosVLR_ALIQUOTA: TStringField;
    qryRelCompProdutos: TSQLQuery;
    dspRelCompProdutos: TDataSetProvider;
    cdsRelCompProdutos: TClientDataSet;
    dsRelCompProdutos: TDataSource;
    cdsRelCompProdutosPRCP_PROD_ID_COMP: TIntegerField;
    cdsRelCompProdutosPRCP_QTDE: TFMTBCDField;
    cdsRelCompProdutosPROD_DESCRICAO: TStringField;
    cdsRelCompProdutosPROD_UNIDADE: TStringField;
    cdsRelCompProdutosGRUPO_PROD: TStringField;
    cdsRelCompProdutosMARCA_PROD: TStringField;
    cdsRelCompProdutosMODELO_PROD: TStringField;
    cdsRel_ProdutosESTQ_EST_ATUAL: TFMTBCDField;
    cdsRel_ProdutosESTQ_EST_DISP: TFMTBCDField;
    cdsRel_ProdutosVLR_VENDA: TFMTBCDField;
    procedure dsRel_ProdutosDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRel_Produtos: TdmRel_Produtos;

implementation

{$R *.dfm}

procedure TdmRel_Produtos.dsRel_ProdutosDataChange(Sender: TObject;
  Field: TField);
begin
  try
    inherited;
    with cdsRelCompProdutos do begin
      Close;
      Params.ParamByName('PROD_ID').AsInteger := cdsRel_ProdutosPROD_ID.AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
  except
  end;
end;

initialization
  dmRel_Produtos := TdmRel_Produtos.Create(nil);
finalization
  FreeAndNil(dmRel_Produtos);

end.
