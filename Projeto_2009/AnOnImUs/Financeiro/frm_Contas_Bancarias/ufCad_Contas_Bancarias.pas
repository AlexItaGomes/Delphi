unit ufCad_Contas_Bancarias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, SQLExpr,
  rxToolEdit, RXDBCtrl, Mask, rxCurrEdit, DB, DBClient;

type
  TfCad_Contas_Bancarias = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label3: TLabel;
    edtCodigo: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    btnPesq: TSpeedButton;
    Label6: TLabel;
    edtAgencia: TDBEdit;
    Label7: TLabel;
    edtConta: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtGerente: TDBEdit;
    edtVlr_Inicial: TRxDBCalcEdit;
    RxDBCalcEdit2: TRxDBCalcEdit;
    edtVlr_Limite: TRxDBCalcEdit;
    Label11: TLabel;
    Label12: TLabel;
    edtDescricao: TDBEdit;
    edtDtBase: TRxDBCalcEdit;
    Label13: TLabel;
    SpeedButton2: TSpeedButton;
    Label14: TLabel;
    DBDateEdit2: TDBDateEdit;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    DBRadioGroup5: TDBRadioGroup;
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoExit(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    function ValidaDados: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Contas_Bancarias: TfCad_Contas_Bancarias;

implementation

uses udmContas_Bancarias;

{$R *.dfm}

procedure TfCad_Contas_Bancarias.btnOkClick(Sender: TObject);
var
  floatValor : Real;
  boolInsert : Boolean;
  strCBCO_ID : String;
begin
  boolInsert := false;
  floatValor := 0;
  if ValidaDados then begin
    if cdsLocal.State = dsInsert then begin
      boolInsert := true;
      strCBCO_ID := cdsLocal.FieldByName('CBCO_ID').AsString;
      cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat := cdsLocal.FieldByName('CBCO_VALOR_INICIAL').AsFloat;
      floatValor := cdsLocal.FieldByName('CBCO_VALOR_INICIAL').AsFloat;
    end;
    inherited;
    if boolInsert then
      funcLocal.RegistraMovConta(strCBCO_ID,'1000','3',strCBCO_ID,floatValor);
//      RegistraMov(floatValor, strCBCO_ID);
    try
      edtDescricao.SetFocus;
    except
    end;
  end else IsValidData;
end;

function TfCad_Contas_Bancarias.ValidaDados : Boolean;

{$REGION 'JaExiste'}
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
          sql.Add('FROM  CONTAS_BANCARIAS');
          sql.Add('WHERE CBCO_EMPR_ID     = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND   CBCO_GENE_ID_BCO = ' + cdsLocal.FieldByName('CBCO_GENE_ID_BCO').AsString);
          sql.Add('AND   CBCO_AGENCIA     = ' + QuotedStr(cdsLocal.FieldByName('CBCO_AGENCIA').AsString));
          sql.Add('AND   CBCO_CONTA       = ' + QuotedStr(cdsLocal.FieldByName('CBCO_CONTA').AsString));
          sql.Add('AND   CBCO_TIPO        = ' + QuotedStr(cdsLocal.FieldByName('CBCO_TIPO').AsString));
          sql.Add('AND   CBCO_DESCRICAO   = ' + QuotedStr(cdsLocal.FieldByName('CBCO_DESCRICAO').AsString));
          SQL.Add('AND   CBCO_ID         <> ' + cdsLocal.FieldByName('CBCO_ID').AsString);
          Open;
          Result := (qryCons.Fields[0].AsInteger > 0);
        end;
      except on e: exception do
        funcLocal.Alerta('Erro ao tentar salvar o registro.'+#13+'['+e.Message+']',1);
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

begin
  Result := true;
  if edtDescricao.Text = '' then begin
    funcLocal.Alerta('Informe uma descrição para a conta antes de continuar.',1);
    edtDescricao.SetFocus;
    Result := false;
    Exit;
  end;
  if (edtDtBase.Value < 1) and (edtDtBase.Value > 31) then begin
    funcLocal.Alerta('Informe a data base da conta antes de continuar.',1);
    edtDtBase.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCodigo.Text = '' then begin
    funcLocal.Alerta('Informe o banco antes de continuar.',1);
    edtCodigo.SetFocus;
    Result := false;
    Exit;
  end;
  if edtAgencia.Text = '' then begin
    funcLocal.Alerta('Informe a agência antes de continuar.',1);
    edtAgencia.SetFocus;
    Result := false;
    Exit;
  end;
  if edtConta.Text = '' then begin
    funcLocal.Alerta('Informe a conta antes de continuar.',1);
    edtConta.SetFocus;
    Result := false;
    Exit;
  end;
  if edtVlr_Limite.Value < 0 then begin
    funcLocal.Alerta('Limite de crédito não pode ser um valor negativo.',1);
    edtVlr_Limite.SetFocus;
    Result := false;
    Exit;
  end;
  if JaExiste then begin
    funcLocal.Alerta('Já consta um conta cadastrada com as informações lançadas',1);
    edtCodigo.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfCad_Contas_Bancarias.btnPesqClick(Sender: TObject);
var
  strTMP : String;
begin
  strTMP := funcLocal.Busca_Registro(dmContas_Bancarias.cdsPesq_Bancos,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('CBCO_GENE_ID_BCO').AsString := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('BANCO_DESCR').AsString      := funcLocal.Buscar_Coluna(strTMP,2);
    cdsLocal.FieldByName('COD_BANCO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
    edtCodigo.Modified := true;
  end else begin
    cdsLocal.FieldByName('CBCO_GENE_ID_BCO').AsString := '';
    cdsLocal.FieldByName('BANCO_DESCR').AsString      := '';
    cdsLocal.FieldByName('COD_BANCO').AsString        := '';
  end;
  edtCodigo.SetFocus;
end;

procedure TfCad_Contas_Bancarias.edtCodigoExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCodigo.Modified then Exit;
  if edtCodigo.Text <> '' then begin
    strTMP := funcLocal.Busca_Registro(dmContas_Bancarias.cdsPesq_Bancos,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1','GENE_ID = ' + edtCodigo.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CBCO_GENE_ID_BCO').AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('BANCO_DESCR').AsString      := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('COD_BANCO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
    end else begin
      cdsLocal.FieldByName('CBCO_GENE_ID_BCO').AsString := '';
      cdsLocal.FieldByName('BANCO_DESCR').AsString      := '';
      cdsLocal.FieldByName('COD_BANCO').AsString        := '';
    end;
  end else begin
    cdsLocal.FieldByName('CBCO_GENE_ID_BCO').AsString := '';
    cdsLocal.FieldByName('BANCO_DESCR').AsString      := '';
    cdsLocal.FieldByName('COD_BANCO').AsString        := '';
  end;
end;

procedure TfCad_Contas_Bancarias.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
end;

procedure TfCad_Contas_Bancarias.FormShow(Sender: TObject);
begin
  inherited;
  if not (cdsLocal.State = dsInsert) then begin
    edtCodigo.Enabled      := false;
    edtVlr_Inicial.Enabled := false;
    btnPesq.Enabled        := false;
  end else begin
    edtCodigo.Enabled      := true;
    edtVlr_Inicial.Enabled := true;
    btnPesq.Enabled        := true;
  end;
  try
    edtDescricao.SetFocus
  except
  end;
end;

procedure TfCad_Contas_Bancarias.Label3Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(204);
end;

procedure TfCad_Contas_Bancarias.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Label3Click(Sender);
  edtCodigo.SetFocus;
end;

initialization
  if fCad_Contas_Bancarias = nil then
    fCad_Contas_Bancarias := TfCad_Contas_Bancarias.Create(nil);
finalization
  FreeAndNil(fCad_Contas_Bancarias);

end.
