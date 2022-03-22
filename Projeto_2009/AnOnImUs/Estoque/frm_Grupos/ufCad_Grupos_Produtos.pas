unit ufCad_Grupos_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit, SQLExpr,
  RXDBCtrl, Mask, DBCtrls;

type
  TfCad_Grupos_Produtos = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtGrupo: TDBEdit;
    Label3: TLabel;
    DBDateEdit1: TDBDateEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    function ValidaDados: Boolean;
    function JaExiste: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Grupos_Produtos: TfCad_Grupos_Produtos;

implementation

uses udmGrupos;

{$R *.dfm}

procedure TfCad_Grupos_Produtos.btnOkClick(Sender: TObject);
begin
  if ValidaDados then begin
    inherited;
    edtGrupo.SetFocus;
  end else IsValidData;
end;

function TfCad_Grupos_Produtos.ValidaDados : Boolean;
begin
  Result := true;
  if edtGrupo.Text = '' then begin
    funcLocal.Alerta('Informe uma descrição para o grupo antes de continuar.',1);
    edtGrupo.SetFocus;
    Result := false;
    Exit;
  end;
  if JaExiste then begin
    funcLocal.Alerta('já consta outro registro para esta descrição.',1);
    edtGrupo.SetFocus;
    Result := false;
    Exit;
  end;
end;

function TfCad_Grupos_Produtos.JaExiste : Boolean;
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
        sql.Add('SELECT');
        sql.Add('      COUNT(*)');
        sql.Add('FROM  GENERICA');
        sql.Add('WHERE GENE_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   GENE_TGEN_ID = 503');
        sql.Add('AND   GENE_ID     <> ' + cdsLocal.FieldByName('GENE_ID').AsString);
        sql.Add('AND   GENE_DESCR   = ' + QuotedStr(cdsLocal.FieldByName('GENE_DESCR').AsString));
        Open;
      end;
      Result := (qryCons.Fields[0].AsInteger > 0)
    except on e: exception do begin
      funcLocal.Alerta('Erro no processo de validação do registro.'+#13+'['+e.Message+']',1);
      funcLocal.ReportaErro(Caption,'JaExiste',e.Message);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Grupos_Produtos.FormShow(Sender: TObject);
begin
  inherited;
  edtGrupo.SetFocus;
end;

initialization
  if fCad_Grupos_Produtos = nil then  
    fCad_Grupos_Produtos := TfCad_Grupos_Produtos.Create(nil);
finalization
  FreeAndNil(fCad_Grupos_Produtos);

end.
