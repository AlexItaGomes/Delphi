unit ufCad_ModelosProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit,
  RXDBCtrl, Mask, DBCtrls, SQLExpr;

type
  TfCad_ModelosProdutos = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtModelo: TDBEdit;
    Label3: TLabel;
    DBDateEdit1: TDBDateEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    function JaExiste: Boolean;
    function ValidaDados: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_ModelosProdutos: TfCad_ModelosProdutos;

implementation

uses udmModelos;

{$R *.dfm}

procedure TfCad_ModelosProdutos.btnOkClick(Sender: TObject);
begin
  if ValidaDados then begin
    inherited;
    edtModelo.SetFocus;
  end else IsValidData;
end;

function TfCad_ModelosProdutos.ValidaDados : Boolean;
begin
  Result := true;
  if edtModelo.Text = '' then begin
    funcLocal.Alerta('Informe a descrição para a modelo do produto antes de continuar.',1);
    edtModelo.SetFocus;
    Result := false;
    Exit;
  end;
  if JaExiste then begin
    funcLocal.Alerta('já consta outro registro para esta descrição.',1);
    edtModelo.SetFocus;
    Result := false;
    Exit;
  end;
end;

function TfCad_ModelosProdutos.JaExiste : Boolean;
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
        sql.Add('AND   GENE_TGEN_ID = 507');
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

procedure TfCad_ModelosProdutos.FormShow(Sender: TObject);
begin
  inherited;
  edtModelo.SetFocus;
end;

initialization
  if fCad_ModelosProdutos = nil then
    fCad_ModelosProdutos := TfCad_ModelosProdutos.Create(nil);
finalization
  FreeAndNil(fCad_ModelosProdutos);

end.
