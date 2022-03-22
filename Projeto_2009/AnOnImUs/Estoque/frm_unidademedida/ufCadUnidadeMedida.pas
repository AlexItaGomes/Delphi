unit ufCadUnidadeMedida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit,
  RXDBCtrl, Mask, DBCtrls;

type
  TfCadUnidadeMedida = class(TfCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    edtDescricao: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    edtSigla: TDBEdit;
    Label4: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function ValidaDados: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadUnidadeMedida: TfCadUnidadeMedida;

implementation

uses udmUnidadeMedida, DB, SqlExpr;

{$R *.dfm}


procedure TfCadUnidadeMedida.btnOKClick(Sender: TObject);
begin
  if not ValidaDados then Exit;
  inherited;
  edtSigla.SetFocus;
end;

procedure TfCadUnidadeMedida.FormShow(Sender: TObject);
begin
  inherited;
  edtSigla.SetFocus;
end;

function TfCadUnidadeMedida.ValidaDados : Boolean;

function JáExiste : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT SUM(QTDE) AS QTDE');
      sql.Add('  FROM (');
      sql.Add('        SELECT COUNT(*) AS QTDE');
      sql.Add('          FROM GENERICA');
      sql.Add('         WHERE GENE_EMPR_ID = 0');
      sql.Add('           AND GENE_TGEN_ID = 519');
      sql.Add('           AND GENE_DESCR   = ' + QuotedStr(Trim(edtDescricao.Text)));
      sql.Add('');
      sql.Add('         UNION ALL');
      sql.Add('');
      sql.Add('        SELECT COUNT(*) AS QTDE');
      sql.Add('          FROM GENERICA');
      sql.Add('         WHERE GENE_EMPR_ID = 0');
      sql.Add('           AND GENE_TGEN_ID = 519');
      sql.Add('           AND GENE_PAR1    = ' + QuotedStr(Trim(edtSigla.Text)));
      sql.Add('       )');
      Open;
      Result := (qryCons.FieldByName('QTDE').AsInteger > 0)
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

begin
  Result := true; IsValidData;
  if Trim(edtSigla.Text) = '' then begin
    funcLocal.Alerta('Informe uma sigla para a unidade de medida antes de continuar!',0);
    edtSigla.SetFocus;
    Result := false;
    Exit;
  end;
  if Trim(edtDescricao.Text) = '' then begin
    funcLocal.Alerta('Informe uma descrição antes de continar!',0);
    edtDescricao.SetFocus;
    Result := false;
    Exit;
  end;
  if (cdsLocal.State = dsInsert) then begin
    if JáExiste then begin
      funcLocal.Alerta('Já consta um registro para as mesmas informações!',0);
      Result := false;
      Exit;
    end;
  end;
end;

initialization
  if fCadUnidadeMedida = nil then
    fCadUnidadeMedida := TfCadUnidadeMedida.Create(nil);
finalization
  FreeAndNil(fCadUnidadeMedida);

end.
