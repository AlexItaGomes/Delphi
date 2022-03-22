unit ufRel_Patrimonio;

interface

uses
  System.SysUtils, System.Classes, ufBasico, frxClass, frxDBSet, frxDesgn,
  Vcl.Menus, Funcoes, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Graphics, Vcl.Controls, Vcl.Buttons;

type
  TfRelPatrimonio = class(TfBasico)
    Panel1: TPanel;
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelPatrimonio: TfRelPatrimonio;

implementation

uses
  Data.SqlExpr;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TfRelPatrimonio.btnNovoClick(Sender: TObject);
var
  qryCons : TSQLQuery;
begin
  try
    funcBasico.MSGAguarde();
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('');
      Open;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    funcBasico.MSGAguarde(false);
  end;
end;

initialization
  RegisterClass(TfRelPatrimonio);
finalization
  UnRegisterClass(TfRelPatrimonio);

end.
