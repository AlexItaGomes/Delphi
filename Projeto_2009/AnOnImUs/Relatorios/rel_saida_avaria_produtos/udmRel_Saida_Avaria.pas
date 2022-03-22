unit udmRel_Saida_Avaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmRel_Saida_Avaria = class(TdmBasico)
    qryRelSaidaAvaria: TSQLQuery;
    dspRelSaidaAvaria: TDataSetProvider;
    cdsRelSaidaAvaria: TClientDataSet;
    dsRelEntradaAvulsa: TDataSource;
    qryItensSaidaAvaria: TSQLQuery;
    dspItensSaidaAvaria: TDataSetProvider;
    cdsItensSaidaAvaria: TClientDataSet;
    dsItensSaidaAvaria: TDataSource;
    cdsRelSaidaAvariaSIAV_ID: TIntegerField;
    cdsRelSaidaAvariaSIAV_EMPR_ID: TIntegerField;
    cdsRelSaidaAvariaSIAV_NR_DOCUMENTO: TStringField;
    cdsRelSaidaAvariaSIAV_CONCILIADO: TStringField;
    cdsRelSaidaAvariaSIAV_OBS: TBlobField;
    cdsRelSaidaAvariaSIAV_DTA_CADASTRO: TDateField;
    cdsRelSaidaAvariaSIAV_USER_ID: TIntegerField;
    cdsItensSaidaAvariaSIIT_ID: TIntegerField;
    cdsItensSaidaAvariaSIIT_EMPR_ID: TIntegerField;
    cdsItensSaidaAvariaSIIT_SIAV_ID: TIntegerField;
    cdsItensSaidaAvariaSIIT_SIAV_EMPR_ID: TIntegerField;
    cdsItensSaidaAvariaSIIT_PROD_ID: TIntegerField;
    cdsItensSaidaAvariaSIIT_PROD_EMPR_ID: TIntegerField;
    cdsItensSaidaAvariaSIIT_QTDE: TFMTBCDField;
    cdsItensSaidaAvariaSIIT_DTA_CADASTRO: TDateField;
    cdsItensSaidaAvariaSIIT_USER_ID: TIntegerField;
    cdsItensSaidaAvariaPROD_DESCRICAO: TStringField;
    cdsItensSaidaAvariaPROD_UNIDADE: TStringField;
    cdsItensSaidaAvariaGRUPO_PROD: TStringField;
    cdsItensSaidaAvariaMARCA_PROD: TStringField;
    cdsItensSaidaAvariaMODELO_PROD: TStringField;
    cdsRelSaidaAvariaSIAV_VLR_TOTAL: TFMTBCDField;
    cdsItensSaidaAvariaSIIT_VLR_CUSTO: TFMTBCDField;
    cdsItensSaidaAvariaSIIT_VLR_TOTAL: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRel_Saida_Avaria: TdmRel_Saida_Avaria;

implementation

{$R *.dfm}

initialization
  dmRel_Saida_Avaria := TdmRel_Saida_Avaria.Create(nil);
finalization
  FreeAndNil(dmRel_Saida_Avaria);

end.
