unit udmVendaOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmVendaOrcamento = class(TdmBasico)
    qryPedido: TSQLQuery;
    dspPedido: TDataSetProvider;
    cdsPedido: TClientDataSet;
    dsPedido: TDataSource;
    cdsPedidoPEDV_ID: TIntegerField;
    cdsPedidoPEDV_EMPR_ID: TIntegerField;
    cdsPedidoPEDV_CLIE_ID: TIntegerField;
    cdsPedidoPEDV_CLIE_EMPR_ID: TIntegerField;
    cdsPedidoPEDV_TIPO_PEDIDO: TStringField;
    cdsPedidoPEDV_TPRC_ID: TIntegerField;
    cdsPedidoPEDV_TPRC_EMPR_ID: TIntegerField;
    cdsPedidoPEDV_VLR_PEDIDO: TFMTBCDField;
    cdsPedidoPEDV_VLR_DESCONTO: TFMTBCDField;
    cdsPedidoPEDV_VLR_FRETE: TFMTBCDField;
    cdsPedidoPEDV_VLR_LIQUIDO: TFMTBCDField;
    cdsPedidoPEDV_DTA_ENTREGA: TDateField;
    cdsPedidoPEDV_STATUS: TIntegerField;
    cdsPedidoPEDV_OBSERVACAO: TBlobField;
    cdsPedidoPEDV_INFORMACOES: TBlobField;
    cdsPedidoPEDV_USER_ID_ABERTURA: TIntegerField;
    cdsPedidoPEDV_USER_ID_VENDEDOR_INTERNO: TIntegerField;
    cdsPedidoPEDV_USER_ID_VENDEDOR_EXTERNO: TIntegerField;
    cdsPedidoPEDV_USER_ID_CANCELAMENTO: TIntegerField;
    cdsPedidoPEDV_DTA_CANCELAMENTO: TDateField;
    cdsPedidoPEDV_MOTIVO_CANCELAMENTO: TBlobField;
    cdsPedidoPEDV_ENTREGA_FUTURA: TIntegerField;
    cdsPedidoPEDV_NOME_REFERENCIA: TStringField;
    cdsPedidoPEDV_DTA_PAGTO: TDateField;
    cdsPedidoPEDV_DTA_CADASTRO: TDateField;
    cdsPedidoPEDV_USER_ID: TIntegerField;
    cdsPedidoCLIE_RAZAO_SOCIAL: TStringField;
    cdsPedidoCLIE_FANTASIA: TStringField;
    cdsPedidoCLIE_CNPJ_CPF: TStringField;
    cdsPedidoTPRC_DESCRICAO: TStringField;
    qryPedidoPEDV_ID: TIntegerField;
    qryPedidoPEDV_EMPR_ID: TIntegerField;
    qryPedidoPEDV_CLIE_ID: TIntegerField;
    qryPedidoPEDV_CLIE_EMPR_ID: TIntegerField;
    qryPedidoPEDV_TIPO_PEDIDO: TStringField;
    qryPedidoPEDV_TPRC_ID: TIntegerField;
    qryPedidoPEDV_TPRC_EMPR_ID: TIntegerField;
    qryPedidoPEDV_VLR_PEDIDO: TFMTBCDField;
    qryPedidoPEDV_VLR_DESCONTO: TFMTBCDField;
    qryPedidoPEDV_VLR_FRETE: TFMTBCDField;
    qryPedidoPEDV_VLR_LIQUIDO: TFMTBCDField;
    qryPedidoPEDV_DTA_ENTREGA: TDateField;
    qryPedidoPEDV_STATUS: TIntegerField;
    qryPedidoPEDV_OBSERVACAO: TBlobField;
    qryPedidoPEDV_INFORMACOES: TBlobField;
    qryPedidoPEDV_USER_ID_ABERTURA: TIntegerField;
    qryPedidoPEDV_USER_ID_VENDEDOR_INTERNO: TIntegerField;
    qryPedidoPEDV_USER_ID_VENDEDOR_EXTERNO: TIntegerField;
    qryPedidoPEDV_USER_ID_CANCELAMENTO: TIntegerField;
    qryPedidoPEDV_DTA_CANCELAMENTO: TDateField;
    qryPedidoPEDV_MOTIVO_CANCELAMENTO: TBlobField;
    qryPedidoPEDV_ENTREGA_FUTURA: TIntegerField;
    qryPedidoPEDV_NOME_REFERENCIA: TStringField;
    qryPedidoPEDV_DTA_PAGTO: TDateField;
    qryPedidoPEDV_DTA_CADASTRO: TDateField;
    qryPedidoPEDV_USER_ID: TIntegerField;
    qryPedidoCLIE_RAZAO_SOCIAL: TStringField;
    qryPedidoCLIE_FANTASIA: TStringField;
    qryPedidoCLIE_CNPJ_CPF: TStringField;
    qryPedidoTPRC_DESCRICAO: TStringField;
    qryPedidoTIPO_PEDIDO: TStringField;
    qryPedidoSTATUS: TStringField;
    cdsPedidoTIPO_PEDIDO: TStringField;
    cdsPedidoSTATUS: TStringField;
  private
    function getSQLPedido: String;
    { Private declarations }
  public
    property SQLPedido : String  read getSQLPedido;
  end;

var
  dmVendaOrcamento: TdmVendaOrcamento;

implementation

{$R *.dfm}

{ TdmVendaOrcamento }

function TdmVendaOrcamento.getSQLPedido: String;
var
  stlTMP : TStringList;
begin
  try
    Result := '';
    stlTMP := TStringList.Create;
    with stlTMP do begin
      Clear;
      Add('SELECT PV.PEDV_ID,');
      Add('       PV.PEDV_EMPR_ID,');
      Add('       PV.PEDV_CLIE_ID,');
      Add('       PV.PEDV_CLIE_EMPR_ID,');
      Add('       PV.PEDV_TIPO_PEDIDO,');
      Add('       CASE PV.PEDV_TIPO_PEDIDO');
      Add('            WHEN ''OV'' THEN ''Orçamento''');
      Add('            WHEN ''PV'' THEN ''Pedido Venda''');
      Add('       END AS TIPO_PEDIDO,');
      Add('       PV.PEDV_TPRC_ID,');
      Add('       PV.PEDV_TPRC_EMPR_ID,');
      Add('       PV.PEDV_VLR_PEDIDO,');
      Add('       PV.PEDV_VLR_DESCONTO,');
      Add('       PV.PEDV_VLR_FRETE,');
      Add('       PV.PEDV_VLR_LIQUIDO,');
      Add('       PV.PEDV_DTA_ENTREGA,');
      Add('       PV.PEDV_STATUS,');
      Add('       CASE PV.PEDV_STATUS');
      Add('            WHEN 0 THEN ''Aberto''');
      Add('            WHEN 1 THEN ''Fechado''');
      Add('            WHEN 2 THEN ''Cancelado''');
      Add('       END AS STATUS,');
      Add('       PV.PEDV_OBSERVACAO,');
      Add('       PV.PEDV_INFORMACOES,');
      Add('       PV.PEDV_USER_ID_ABERTURA,');
      Add('       PV.PEDV_USER_ID_VENDEDOR_INTERNO,');
      Add('       PV.PEDV_USER_ID_VENDEDOR_EXTERNO,');
      Add('       PV.PEDV_USER_ID_CANCELAMENTO,');
      Add('       PV.PEDV_DTA_CANCELAMENTO,');
      Add('       PV.PEDV_MOTIVO_CANCELAMENTO,');
      Add('       PV.PEDV_ENTREGA_FUTURA,');
      Add('       PV.PEDV_NOME_REFERENCIA,');
      Add('       PV.PEDV_DTA_PAGTO,');
      Add('       PV.PEDV_DTA_CADASTRO,');
      Add('       PV.PEDV_USER_ID,');
      Add('       CL.CLIE_RAZAO_SOCIAL,');
      Add('       CL.CLIE_FANTASIA,');
      Add('       CL.CLIE_CNPJ_CPF,');
      Add('       TP.TPRC_DESCRICAO');
      Add('  FROM PEDIDO_VENDA PV');
      Add(' INNER JOIN CLIENTES CL');
      Add('    ON (CL.CLIE_ID     = PV.PEDV_CLIE_ID');
      Add('   AND CL.CLIE_EMPR_ID = PV.PEDV_CLIE_EMPR_ID)');
      Add(' INNER JOIN TABELA_PRECO TP');
      Add('    ON (TP.TPRC_ID     = PV.PEDV_TPRC_ID');
      Add('   AND TP.TPRC_EMPR_ID = PV.PEDV_TPRC_EMPR_ID)');
      Add(' WHERE PV.PEDV_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
    end;
    Result := stlTMP.Text;
  finally
    FreeAndNil(stlTMP);
  end;
end;

initialization
  if dmVendaOrcamento = nil then
    dmVendaOrcamento := TdmVendaOrcamento.Create(nil);
finalization
  FreeAndNil(dmVendaOrcamento);

end.
