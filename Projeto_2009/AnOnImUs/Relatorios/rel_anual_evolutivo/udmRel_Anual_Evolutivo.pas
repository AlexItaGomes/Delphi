unit udmRel_Anual_Evolutivo;

interface

uses
  SysUtils, Classes, Funcoes, Forms, SQLExpr, FMTBcd, DB, DBClient, Provider;

type
  TdmRel_Anual_Evolutivo = class(TDataModule)
    qryContas_Receber: TSQLQuery;
    dspContas_Receber: TDataSetProvider;
    cdsContas_Receber: TClientDataSet;
    dsContas_Receber: TDataSource;
    qryContas_Pagar: TSQLQuery;
    dspContas_Pagar: TDataSetProvider;
    cdsContas_Pagar: TClientDataSet;
    cdsContas_ReceberPLCT_COD_SIMPLIFICADO: TStringField;
    cdsContas_ReceberPLCT_DESCRICAO: TStringField;
    cdsContas_ReceberVALOR: TFMTBCDField;
    cdsContas_PagarPLCT_COD_SIMPLIFICADO: TStringField;
    cdsContas_PagarPLCT_DESCRICAO: TStringField;
    cdsContas_PagarVALOR: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmRel_Anual_Evolutivo: TdmRel_Anual_Evolutivo;

implementation

{$R *.dfm}

procedure TdmRel_Anual_Evolutivo.DataModuleCreate(Sender: TObject);
var
  formPrinc : TForm;
  intI      : Integer;
begin
  formPrinc := Application.MainForm;
  funcLocal := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
  for intI  := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TSQLQuery) then
      (Components[intI]  as TSQLQuery).SQLConnection := funcLocal.Conexao
  end;
end;

end.
