unit udmRel_ABC_Financas;

interface

uses
  SysUtils, Classes, Forms, Funcoes, SQLExpr, FMTBcd, DB, DBClient, Provider;

type
  TdmRel_Abc_Financas = class(TDataModule)
    qryRel_ABC_Financas: TSQLQuery;
    dspRel_ABC_Financas: TDataSetProvider;
    cdsRel_ABC_Financas: TClientDataSet;
    dsRel_ABC_Financas: TDataSource;
    cdsRel_ABC_FinancasPLCT_COD_SIMPLIFICADO: TStringField;
    cdsRel_ABC_FinancasPLCT_DESCRICAO: TStringField;
    cdsRel_ABC_FinancasVALOR: TFMTBCDField;
    qryRel_ABC_Receitas: TSQLQuery;
    dspRel_ABC_Receitas: TDataSetProvider;
    cdsRel_ABC_Receitas: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    FMTBCDField1: TFMTBCDField;
    dsRel_ABC_Receitas: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmRel_Abc_Financas: TdmRel_Abc_Financas;

implementation

{$R *.dfm}

procedure TdmRel_Abc_Financas.DataModuleCreate(Sender: TObject);
var
  formPrinc : TForm;
  intI      : Integer;
begin
  formPrinc := Application.MainForm;
  funcLocal := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
  for intI := 0 to Self.ComponentCount - 1 do begin
    if (Components[intI] is TSQLQuery) then begin
      (Components[intI] as TSQLQuery).SQLConnection := funcLocal.Conexao;
    end;
    if (Components[intI] is TClientDataSet) then begin
      (Components[intI] as TClientDataSet).PacketRecords := 50;
    end;
  end;
end;

end.
