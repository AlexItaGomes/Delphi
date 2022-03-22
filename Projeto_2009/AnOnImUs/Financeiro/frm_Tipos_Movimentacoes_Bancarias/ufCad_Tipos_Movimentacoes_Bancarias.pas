unit ufCad_Tipos_Movimentacoes_Bancarias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, SQLExpr,
  rxToolEdit, RXDBCtrl, Mask, DB;

type
  TfCad_Tipos_Movimentacoes_Bancarias = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtTipo: TDBEdit;
    Label3: TLabel;
    DBDateEdit1: TDBDateEdit;
    rdTipo: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    function ValidaDados: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Tipos_Movimentacoes_Bancarias: TfCad_Tipos_Movimentacoes_Bancarias;

implementation

uses udmTipo_Movimentacoes_Bancarias;

{$R *.dfm}

procedure TfCad_Tipos_Movimentacoes_Bancarias.btnOkClick(Sender: TObject);
begin
  if ValidaDados then begin
    inherited;
    edtTipo.SetFocus;
  end else IsValidData;
end;

function TfCad_Tipos_Movimentacoes_Bancarias.ValidaDados : Boolean;

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
          sql.Add('AND   GENE_TGEN_ID = 506');
          sql.Add('AND   GENE_ID     <> ' + cdsLocal.FieldByName('GENE_ID').AsString);
          sql.Add('AND   GENE_DESCR   = ' + QuotedStr(cdsLocal.FieldByName('GENE_DESCR').AsString));
          sql.Add('AND   GENE_PAR1    = ' + QuotedStr(cdsLocal.FieldByName('GENE_PAR1').AsString));
          SQL.Add('AND   GENE_PAR2    = ' + QuotedStr(cdsLocal.FieldByName('GENE_PAR2').AsString));
          Open;
        end;
        Result := (qryCons.Fields[0].AsInteger > 0)
      except on e: exception do
        funcLocal.Alerta('Erro no processo de validação do registro.'+#13+'['+e.Message+']',1);
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

begin
  Result := true;
  if edtTipo.Text = '' then begin
    funcLocal.Alerta('Informe a descrição do tipo de movimento antes de continuar.',1);
    edtTipo.SetFocus;
    Result := false;
    Exit;
  end;
  if JaExiste then begin
    funcLocal.Alerta('Já consta um movimento para a descrição informada.',1);
    edtTipo.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfCad_Tipos_Movimentacoes_Bancarias.FormShow(Sender: TObject);
begin
  inherited;
  edtTipo.SetFocus;
end;

initialization
  if fCad_Tipos_Movimentacoes_Bancarias = nil then
    fCad_Tipos_Movimentacoes_Bancarias := TfCad_Tipos_Movimentacoes_Bancarias.Create(nil);
finalization
  FreeAndNil(fCad_Tipos_Movimentacoes_Bancarias);

end.
