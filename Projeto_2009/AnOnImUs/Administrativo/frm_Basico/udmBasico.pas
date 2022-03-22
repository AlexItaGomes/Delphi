unit udmBasico;

interface

uses
  System.Classes, Funcoes, Data.SqlExpr, Datasnap.DBClient;

type
  TdmBasico = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
  public
    funcLocal : TFuncoes;
  end;

var
  dmBasico: TdmBasico;

implementation

uses
  Vcl.Forms;

{$R *.dfm}

procedure TdmBasico.DataModuleCreate(Sender: TObject);
var
  formPrinc : TForm;
  intI      : Integer;
begin
  formPrinc := Application.MainForm; //Mais comentário.
  funcLocal := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
  for intI  := 0 to Self.ComponentCount - 1 do begin
    if (Components[intI] is TSQLQuery) then begin
      (Components[intI] as TSQLQuery).SQLConnection := funcLocal.Conexao;
    end;
    if (Components[intI] is TClientDataSet) then begin
      (Components[intI] as TClientDataSet).PacketRecords := 50;
    end;
  end;
end;

end.
