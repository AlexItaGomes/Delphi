unit ufCad_Aliquotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit,
  RXDBCtrl, Mask, DBCtrls, SQLExpr;

type
  TfCad_Aliquotas = class(TfCadastro)
    Label1      : TLabel;
    DBEdit1     : TDBEdit;
    Label2      : TLabel;
    edtAliquotas: TDBEdit;
    Label3      : TLabel;
    edtICMS     : TDBEdit;
    Label4      : TLabel;
    DBDateEdit1 : TDBDateEdit;
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
  fCad_Aliquotas: TfCad_Aliquotas;

implementation

uses udmAliquotas;

{$R *.dfm}

procedure TfCad_Aliquotas.btnOkClick(Sender: TObject);
begin
  if ValidaDados then begin
    inherited;
    edtAliquotas.SetFocus;
  end else IsValidData;
end;

function TfCad_Aliquotas.ValidaDados : Boolean;
begin
  Result := true;
  if edtAliquotas.Text = '' then begin
    funcLocal.Alerta('Informe a descrição para aliquota antes de continuar.',1);
    edtAliquotas.SetFocus;
    Result := false;
    Exit;
  end;
  if edtICMS.Text = '' then begin
    funcLocal.Alerta('Informe o valor da aliquota antes de continuar.',1);
    edtICMS.SetFocus;
    Result := false;
    Exit;
  end;
  if JaExiste then begin
    funcLocal.Alerta('já consta outro registro para esta descrição.',1);
    edtAliquotas.SetFocus;
    Result := false;
    Exit;
  end;
end;

function TfCad_Aliquotas.JaExiste : Boolean;
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
        sql.Add('WHERE GENE_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   GENE_TGEN_ID = 508');
        sql.Add('AND   GENE_ID     <> ' + cdsLocal.FieldByName('GENE_ID').AsString);
        sql.Add('AND   GENE_DESCR   = ' + QuotedStr(cdsLocal.FieldByName('GENE_DESCR').AsString));
        sql.Add('AND   GENE_PAR1    = ' + QuotedStr(cdsLocal.FieldByName('GENE_PAR1').AsString));
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

procedure TfCad_Aliquotas.FormShow(Sender: TObject);
begin
  inherited;
  edtAliquotas.SetFocus;
end;

initialization
  if fCad_Aliquotas = nil then
    fCad_Aliquotas := TfCad_Aliquotas.Create(nil);
finalization
  FreeAndNil(fCad_Aliquotas);

end.
