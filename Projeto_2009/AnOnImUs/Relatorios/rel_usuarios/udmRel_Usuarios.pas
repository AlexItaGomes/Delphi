unit udmRel_Usuarios;

interface

uses
  SysUtils, Classes, Funcoes, SQLExpr, Forms, FMTBcd, DB, DBClient, Provider;

type
  TdmRel_Usuarios = class(TDataModule)
    qryRel_Usuarios: TSQLQuery;
    dspRel_Usuarios: TDataSetProvider;
    cdsRel_Usuarios: TClientDataSet;
    dsRel_Usuarios: TDataSource;
    qryRel_Empresas_Usuarios: TSQLQuery;
    dspRel_Empresas_Usuarios: TDataSetProvider;
    cdsRel_Empresas_Usuarios: TClientDataSet;
    dsRel_Empresas_Usuarios: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmRel_Usuarios: TdmRel_Usuarios;

implementation

{$R *.dfm}

procedure TdmRel_Usuarios.DataModuleCreate(Sender: TObject);
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
