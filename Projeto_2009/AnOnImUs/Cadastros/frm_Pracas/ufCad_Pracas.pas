unit ufCad_Pracas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, SQLExpr,
  rxToolEdit, RXDBCtrl, DB, Mask;

type
  TfCad_Pracas = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtCidade: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label4: TLabel;
    cmbUF: TDBComboBox;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    function ValidaDados: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Pracas: TfCad_Pracas;

implementation

uses udmPracas;

{$R *.dfm}

procedure TfCad_Pracas.btnOkClick(Sender: TObject);
begin
  if ValidaDados then begin
    inherited;
    edtCidade.SetFocus;
  end else IsValidData;
end;

function TfCad_Pracas.ValidaDados : Boolean;

function JaExiste : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(*)');
        sql.Add('FROM  GENERICA');
        sql.Add('WHERE GENE_EMPR_ID = 0');
        sql.Add('AND   GENE_TGEN_ID = 501');
        sql.Add('AND   GENE_DESCR   = ' + QuotedStr(edtCidade.Text));
        sql.Add('AND   GENE_PAR1    = ' + QuotedStr(cmbUF.Text));
        sql.Add('AND   GENE_ID     <> ' + cdsLocal.FieldByName('GENE_ID').AsString);
        Open;
        Result := (qryCons.Fields[0].AsInteger > 0)
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'JaExiste',funcLocal.User_Login,e.Message);
      funcLocal.Alerta('Erro no processo de validação do registro.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

begin
  Result := true;
  if edtCidade.Text = '' then begin
    funcLocal.Alerta('Informe o nome da cidade antes de continuar.',1);
    edtCidade.SetFocus;
    Result := false;
    Exit;
  end;
  if cmbUF.Text = '' then begin
    funcLocal.Alerta('Informe a UF antes de continuar.',1);
    cmbUF.SetFocus;
    Result := false;
    Exit;
  end;
  if JaExiste then begin
    funcLocal.Alerta('Já consta cadastrado uma praça com a descrição utilizada.',1);
    edtCidade.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfCad_Pracas.FormShow(Sender: TObject);
begin
  inherited;
  edtCidade.SetFocus;
end;

initialization
  if fCad_Pracas = nil then
    fCad_Pracas := TfCad_Pracas.Create(nil);
finalization
  FreeAndNil(fCad_Pracas);

end.
