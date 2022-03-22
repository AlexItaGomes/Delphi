unit udmLivro_Caixa;

interface

uses
  SysUtils, Classes, SQLExpr, Funcoes, Forms, FMTBcd, DB, DBClient, Provider;

type
  TdmLivro_Caixa = class(TDataModule)
    qryRel_Livro_Caixa: TSQLQuery;
    dspRel_Livro_Caixa: TDataSetProvider;
    cdsRel_Livro_Caixa: TClientDataSet;
    cdsRel_Livro_CaixaLCAX_ID: TIntegerField;
    cdsRel_Livro_CaixaLCAX_DTA_LANCAMENTO: TDateField;
    cdsRel_Livro_CaixaPLCT_COD_SIMPLIFICADO: TStringField;
    cdsRel_Livro_CaixaPLCT_DESCRICAO: TStringField;
    cdsRel_Livro_CaixaSALDO_ANT: TFMTBCDField;
    cdsRel_Livro_CaixaLCAX_VLR_LANCAMENTO: TFMTBCDField;
    cdsRel_Livro_CaixaLCAX_VLR_SALDO: TFMTBCDField;
    cdsRel_Livro_CaixaPLCT_TIPO: TStringField;
    cdsRel_Livro_CaixaPROVENIENTE: TStringField;
    dsRel_Livro_Caixa: TDataSource;
    cdsRel_Livro_CaixaLCAX_EMPR_ID: TIntegerField;
    cdsRel_Livro_CaixaID: TIntegerField;
    cdsRel_Livro_CaixaCLIENTE_FORNECEDOR: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmLivro_Caixa: TdmLivro_Caixa;

implementation

{$R *.dfm}

procedure TdmLivro_Caixa.DataModuleCreate(Sender: TObject);
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

initialization
  if dmLivro_Caixa = nil then
    dmLivro_Caixa := TdmLivro_Caixa.Create(nil);

finalization
  FreeAndNil(dmLivro_Caixa);

end.
