unit ufCad_MarcasProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit,
  RXDBCtrl, Mask, DBCtrls, SQLExpr;

type
  TfCad_MarcasProdutos = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    edtMarca: TDBEdit;
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
  fCad_MarcasProdutos: TfCad_MarcasProdutos;

implementation

uses udmMarcas;

{$R *.dfm}

procedure TfCad_MarcasProdutos.btnOkClick(Sender: TObject);
begin
  if ValidaDados then begin
    inherited;
    edtMarca.SetFocus;
  end else IsValidData;
end;

function TfCad_MarcasProdutos.ValidaDados : Boolean;
begin
  Result := true;
  if edtMarca.Text = '' then begin
    funcLocal.Alerta('Informe a descrição para a marca do produto antes de continuar.',1);
    edtMarca.SetFocus;
    Result := false;
    Exit;
  end;
  if JaExiste then begin
    funcLocal.Alerta('já consta outro registro para esta descrição.',1);
    edtMarca.SetFocus;
    Result := false;
    Exit;
  end;
end;

function TfCad_MarcasProdutos.JaExiste : Boolean;
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
        sql.Add('AND   GENE_TGEN_ID = 504');
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

procedure TfCad_MarcasProdutos.FormShow(Sender: TObject);
begin
  inherited;
  edtMarca.SetFocus;
end;

initialization
  if fCad_MarcasProdutos = nil then
    fCad_MarcasProdutos := TfCad_MarcasProdutos.Create(nil);
finalization
  FreeAndNil(fCad_MarcasProdutos);

end.
