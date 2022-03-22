unit udmRel_Plano_Contas;

interface

uses
  SysUtils, Classes, Forms, Funcoes, SQLExpr, FMTBcd, DB, DBClient, Provider;

type
  TdmRel_Plano_Contas = class(TDataModule)
    qryListaPlano: TSQLQuery;
    dspListaPlano: TDataSetProvider;
    cdsListaPlano: TClientDataSet;
    dsListaPlano: TDataSource;
    cdsListaPlanoPLCT_ID: TIntegerField;
    cdsListaPlanoPLCT_COD_SIMPLIFICADO: TStringField;
    cdsListaPlanoPLCT_DESCRICAO: TStringField;
    cdsListaPlanoPLCT_TIPO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmRel_Plano_Contas: TdmRel_Plano_Contas;

implementation

{$R *.dfm}

procedure TdmRel_Plano_Contas.DataModuleCreate(Sender: TObject);
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
