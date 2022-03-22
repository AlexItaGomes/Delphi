unit ufCad_Bancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit,
  RXDBCtrl, Mask, DBCtrls, SQLExpr;

type
  TfCad_Bancos = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtBanco: TDBEdit;
    Label3: TLabel;
    edtCodigo: TDBEdit;
    Label4: TLabel;
    DBDateEdit1: TDBDateEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    function ValidaDados: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Bancos: TfCad_Bancos;

implementation

uses udmBancos;

{$R *.dfm}

procedure TfCad_Bancos.btnOkClick(Sender: TObject);
begin
  if ValidaDados then begin
    inherited;
    edtCodigo.SetFocus;
  end else IsValidData;
end;

function TfCad_Bancos.ValidaDados : Boolean;

{$REGION 'JaExiste'}
  function JaExiste : Boolean;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := true;
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
          sql.Add('AND   GENE_TGEN_ID = 505');
          sql.Add('AND   GENE_ID     <> ' + cdsLocal.FieldByName('GENE_ID').AsString);
          sql.Add('AND   GENE_PAR1    = ' + QuotedStr(cdsLocal.FieldByName('GENE_PAR1').AsString));
          sql.Add('AND   GENE_DESCR   = ' + QuotedStr(cdsLocal.FieldByName('GENE_DESCR').AsString));
          Open;
        end;
        Result := (qryCons.Fields[0].AsInteger > 0);
      except on e: exception do begin
        funcLocal.ReportaErro(Caption,'JaExiste',funcLocal.User_Login,e.Message);
        funcLocal.Alerta('Erro no processo de validação do registro.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

begin
  Result := true;
  if edtCodigo.Text = '' then begin
    funcLocal.Alerta('Informe o código do banco/financeira antes de continuar.',1);
    edtCodigo.SetFocus;
    Result := false;
    Exit;
  end;
  if edtBanco.Text = '' then begin
    funcLocal.Alerta('Informe a descrição do banco/financeira antes de continuar.',1);
    edtBanco.SetFocus;
    Result := false;
    Exit;
  end;
  if JaExiste then begin
    funcLocal.Alerta('Já consta cadastrado um banco/financeira para o código informado.',1);
    edtCodigo.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfCad_Bancos.FormShow(Sender: TObject);
begin
  inherited;
  edtCodigo.SetFocus;
end;

initialization
  if fCad_Bancos = nil then
    fCad_Bancos := TfCad_Bancos.Create(nil);
finalization
  FreeAndNil(fCad_Bancos);
  

end.
