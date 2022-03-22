unit ufAlteraOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, SQLExpr,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, uFrPesqIndividual;

type
  TfAlteraOS = class(TfCadastro)
    frPesquisa: TfrPesqIndividual;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FOS: Integer;
    function RealizaAlteracaoOS: Boolean;
    { Private declarations }
  public
    property OS : Integer   read FOS write FOS;
  end;

var
  fAlteraOS: TfAlteraOS;

implementation

{$R *.dfm}

procedure TfAlteraOS.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfAlteraOS.btnOKClick(Sender: TObject);
begin
  if not frPesquisa.TemRegistro then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Você tem que selecionar um registro antes de continuar!',0);
    Exit;
  end;
  if not RealizaAlteracaoOS() then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Alteração não realizada.',0);
    Exit;
  end;
  Self.Close;
end;

function TfAlteraOS.RealizaAlteracaoOS() : Boolean;
var
  qryCons : TSQLQuery;
begin
  Result := true;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('UPDATE ORDEM_SERVICO');
        sql.Add('   SET ORDS_USER_ID = ' + frPesquisa.InGrid);
        sql.Add(' WHERE ORDS_ID      = ' + IntToStr(OS));
        sql.Add('   AND ORDS_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        ExecSQL();
      end;
    except
      Result := False;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfAlteraOS.FormCreate(Sender: TObject);
begin
//  inherited;
end;

procedure TfAlteraOS.FormShow(Sender: TObject);
begin
  frPesquisa.SetFocus;
end;

initialization
  fAlteraOS := TfAlteraOS.Create(nil);
finalization
  FreeAndNil(fAlteraOS);

end.
