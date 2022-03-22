unit udmPatrimonio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmPatrimonio = class(TdmBasico)
    qryPatrimonio: TSQLQuery;
    dspPatrimonio: TDataSetProvider;
    cdsPatrimonio: TClientDataSet;
    dsPatrimonio: TDataSource;
    qryPatrimonioPATR_ID: TIntegerField;
    qryPatrimonioPATR_EMPR_ID: TIntegerField;
    qryPatrimonioPATR_DESCRICAO: TStringField;
    qryPatrimonioPATR_VLR_COMPRA: TFMTBCDField;
    qryPatrimonioPATR_PATR_ID: TIntegerField;
    qryPatrimonioPATR_PATR_EMPR_ID: TIntegerField;
    qryPatrimonioPATR_DTA_CADASTRO: TDateField;
    qryPatrimonioPATR_USER_ID: TIntegerField;
    cdsPatrimonioPATR_ID: TIntegerField;
    cdsPatrimonioPATR_EMPR_ID: TIntegerField;
    cdsPatrimonioPATR_DESCRICAO: TStringField;
    cdsPatrimonioPATR_VLR_COMPRA: TFMTBCDField;
    cdsPatrimonioPATR_PATR_ID: TIntegerField;
    cdsPatrimonioPATR_PATR_EMPR_ID: TIntegerField;
    cdsPatrimonioPATR_DTA_CADASTRO: TDateField;
    cdsPatrimonioPATR_USER_ID: TIntegerField;
    qryPatrimonioPATR_OBS: TStringField;
    cdsPatrimonioPATR_OBS: TStringField;
    qryPatrimonioPATR_FORN_ID: TIntegerField;
    qryPatrimonioPATR_MARCA: TStringField;
    qryPatrimonioPATR_MODELO: TStringField;
    qryPatrimonioPATR_DTA_COMPRA: TDateField;
    qryPatrimonioPATR_DTA_VENDA: TDateField;
    qryPatrimonioPATR_VLR_VENDA: TFMTBCDField;
    cdsPatrimonioPATR_FORN_ID: TIntegerField;
    cdsPatrimonioPATR_MARCA: TStringField;
    cdsPatrimonioPATR_MODELO: TStringField;
    cdsPatrimonioPATR_DTA_COMPRA: TDateField;
    cdsPatrimonioPATR_DTA_VENDA: TDateField;
    cdsPatrimonioPATR_VLR_VENDA: TFMTBCDField;
    qryPatrimonioPATR_CLIE_ID: TIntegerField;
    qryPatrimonioPATR_CLIE_EMPR_ID: TIntegerField;
    cdsPatrimonioPATR_CLIE_ID: TIntegerField;
    cdsPatrimonioPATR_CLIE_EMPR_ID: TIntegerField;
    qryPatrimonioPATR_NR_SERIE: TStringField;
    cdsPatrimonioPATR_NR_SERIE: TStringField;
    qryPatrimonioPATR_NR_NOTAFISCAL: TIntegerField;
    cdsPatrimonioPATR_NR_NOTAFISCAL: TIntegerField;
    qryPatrimonioPATR_NR_DANFE: TStringField;
    cdsPatrimonioPATR_NR_DANFE: TStringField;
    qryPatrimonioPATR_FOTO_NF: TBlobField;
    cdsPatrimonioPATR_FOTO_NF: TBlobField;
    procedure cdsPatrimonioNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPatrimonio: TdmPatrimonio;

implementation

{$R *.dfm}

procedure TdmPatrimonio.cdsPatrimonioNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('PATR_ID').AsString             := funcLocal.ObterSequencia('PATRIMONIO',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('PATR_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('PATR_PATR_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('PATR_VLR_COMPRA').AsFloat      := 0;
  DataSet.FieldByName('PATR_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('PATR_USER_ID').AsInteger       := funcLocal.User_ID;
end;

initialization
  if dmPatrimonio = nil then
    dmPatrimonio := TdmPatrimonio.Create(nil);
finalization
  FreeAndNil(dmPatrimonio);

end.
