unit udmMenus;

interface

uses
  SysUtils, Classes, Forms, Funcoes, SQLExpr, FMTBcd, DB, DBClient, Provider;

type
  TdmMenus = class(TDataModule)
    qryMenu: TSQLQuery;
    dspMenu: TDataSetProvider;
    cdsMenu: TClientDataSet;
    dsMenu: TDataSource;
    qryMenuMENU_ID: TIntegerField;
    qryMenuMENU_GENE_EMPR_ID_TP: TIntegerField;
    qryMenuMENU_GENE_TGEN_ID_TP: TIntegerField;
    qryMenuMENU_GENE_ID_TP: TIntegerField;
    qryMenuMENU_CODIGO: TStringField;
    qryMenuMENU_DESCRICAO: TStringField;
    qryMenuMENU_ATIVO: TIntegerField;
    qryMenuMENU_NOME_BPL: TStringField;
    qryMenuMENU_CLASSE_FORM_BPL: TStringField;
    qryMenuMENU_PARAMETRO_ABERTURA: TStringField;
    qryMenuMENU_MENU_ID: TIntegerField;
    cdsMenuMENU_ID: TIntegerField;
    cdsMenuMENU_GENE_EMPR_ID_TP: TIntegerField;
    cdsMenuMENU_GENE_TGEN_ID_TP: TIntegerField;
    cdsMenuMENU_GENE_ID_TP: TIntegerField;
    cdsMenuMENU_CODIGO: TStringField;
    cdsMenuMENU_DESCRICAO: TStringField;
    cdsMenuMENU_ATIVO: TIntegerField;
    cdsMenuMENU_NOME_BPL: TStringField;
    cdsMenuMENU_CLASSE_FORM_BPL: TStringField;
    cdsMenuMENU_PARAMETRO_ABERTURA: TStringField;
    cdsMenuMENU_MENU_ID: TIntegerField;
    qryPesq_Menu: TSQLQuery;
    dspPesq_Menu: TDataSetProvider;
    cdsPesq_Menu: TClientDataSet;
    dsPesq_Menu: TDataSource;
    cdsPesq_MenuMENU_ID: TIntegerField;
    cdsPesq_MenuMENU_CODIGO: TStringField;
    cdsPesq_MenuMENU_DESCRICAO: TStringField;
    qryMenuMENU_DESCRICAO_1: TStringField;
    cdsMenuMENU_DESCRICAO_1: TStringField;
    qryMenuMENU_IMAGE1: TBlobField;
    cdsMenuMENU_IMAGE1: TBlobField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsMenuReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsMenuNewRecord(DataSet: TDataSet);
    procedure cdsMenuBeforeDelete(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmMenus: TdmMenus;

implementation

{$R *.dfm}

procedure TdmMenus.cdsMenuBeforeDelete(DataSet: TDataSet);
begin
  if funcLocal.DeletaRegistro('MENUS',cdsMenuMENU_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmMenus.cdsMenuNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('MENU_ID').AsString                   := funcLocal.ObterSequencia('MENU','0',False);
  DataSet.FieldByName('MENU_GENE_EMPR_ID_TP').AsInteger     := 0;
  DataSet.FieldByName('MENU_GENE_TGEN_ID_TP').AsInteger     := 1;
  DataSet.FieldByName('MENU_GENE_ID_TP').AsInteger          := 1;
  DataSet.FieldByName('MENU_ATIVO').AsInteger               := 1;
  DataSet.FieldByName('MENU_PARAMETRO_ABERTURA').AsString   := DataSet.FieldByName('MENU_ID').AsString + ';';
end;

procedure TdmMenus.cdsMenuReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmMenus','cdsMenuReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmMenus.DataModuleCreate(Sender: TObject);
var
  formPrinc : TForm;
  intI     : Integer;
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

initialization
  if dmMenus = nil then
    dmMenus := TdmMenus.Create(nil);
finalization
  FreeAndNil(dmMenus);

end.
