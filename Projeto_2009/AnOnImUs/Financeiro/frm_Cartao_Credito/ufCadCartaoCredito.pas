unit ufCadCartaoCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, DB,
  rxToolEdit, RXDBCtrl, Mask, rxCurrEdit, uFrPesqIndividual, SQLExpr, ExtDlgs,
  Jpeg;

type
  TfCadCartaoCredito = class(TfCadastro)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label3: TLabel;
    edtNrCartao: TDBEdit;
    Label4: TLabel;
    edtValidadeCartao: TDBEdit;
    Label5: TLabel;
    edtTitular: TDBEdit;
    edtLimiteSaque: TRxDBCalcEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtLimiteCompra: TRxDBCalcEdit;
    edtVctoCartao: TRxDBCalcEdit;
    edtFechamentoFatura: TRxDBCalcEdit;
    edtEncargosContratuais: TRxDBCalcEdit;
    edtEncargosCash: TRxDBCalcEdit;
    Label12: TLabel;
    edtSaldo: TRxCalcEdit;
    frPesqBanco: TfrPesqIndividual;
    GroupBox2: TGroupBox;
    DBImage1: TDBImage;
    OpenPictureDialog: TOpenPictureDialog;
    rdTipo: TDBRadioGroup;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure DBImage1DblClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
  private
    procedure SetaValoresFrames;
    function ValidaDados: Boolean;
    procedure LimiteCredito;
    function CartaoJaExiste: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadCartaoCredito: TfCadCartaoCredito;

implementation

uses udmCartaoCredito;

{$R *.dfm}

procedure TfCadCartaoCredito.btnOKClick(Sender: TObject);
begin
  if not ValidaDados() then Exit;
  inherited;
  SetaValoresFrames;
end;

function TfCadCartaoCredito.ValidaDados() : Boolean;
var
  Dia, Mes, Ano : Word;
begin
  Result := true;
  DecodeDate(funcLocal.DataServidor(),Ano,Mes,Dia);
  if cdsLocal.FieldByName('CCRE_TIPO_CARTAO').AsString = '' then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! ! '+#13+#13+'Informe o tipo do Cartão antes de continuar!',0);
    rdTipo.SetFocus;
    Result := false;
    Exit;
  end;
  if Length(Trim(cdsLocal.FieldByName('CCRE_NUMERO_CARTAO').AsString)) < 10 then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! ! '+#13+#13+'Necessário informar o Nrº do Cartão antes de continuar!',0);
    edtNrCartao.SetFocus;
    Result := false;
    Exit;
  end;
  if Length(Trim(cdsLocal.FieldByName('CCRE_VENCIMENTO').AsString)) < 5 then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! ! '+#13+#13+'Necessário informar a válidade do cartão antes de continuar!',0);
    edtValidadeCartao.SetFocus;
    Result := false;
    Exit;
  end;
  if Trim(cdsLocal.FieldByName('CCRE_TITULAR').AsString) = '' then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! ! '+#13+#13+'Informe o títular do cartão antes de continuar!',0);
    edtTitular.SetFocus;
    Result := false;
    Exit;
  end;
  if edtLimiteSaque.Value < 0 then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! ! '+#13+#13+'Valor de limite para saque inválido!',0);
    edtLimiteSaque.SetFocus;
    Result := false;
    Exit;
  end;
  if CharInSet(cdsLocal.FieldByName('CCRE_TIPO_CARTAO').AsString[1],['C','A']) then begin
    if edtLimiteCompra.Value <= 0 then begin
      funcLocal.Alerta('A T E N Ç Ã O ! ! ! '+#13+#13+'Informe um valor válido compras!',0);
      edtLimiteCompra.SetFocus;
      Result := false;
      Exit;
    end;
  end;
  if not (edtVctoCartao.AsInteger in [1..31]) then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! ! '+#13+#13+'Informe um dia válido para o vencimento da fatura!',0);
    edtVctoCartao.SetFocus;
    Result := false;
    Exit;
  end;
  if not (edtFechamentoFatura.AsInteger in [1..31]) then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! ! '+#13+#13+'Informe um dia válido para o fechamento da fatura!',0);
    edtFechamentoFatura.SetFocus;
    Result := false;
    Exit;
  end;
  if not frPesqBanco.TemRegistro() then begin
    if CharInSet(cdsLocal.FieldByName('CCRE_TIPO_CARTAO').AsString[1],['D','A']) then begin
      funcLocal.Alerta('A T E N Ç Ã O ! ! ! '+#13+#13+'Cartão de débito é obrigatório informar uma conta bancária!',0);
      frPesqBanco.SetFocus;
      Result := false;
      Exit;
    end else begin
      funcLocal.Alerta('I N F O R M A Ç Ã O ! ! ! '+#13+#13+'Você não vinculou um banco a este cartão, o vinculo a uma conta bancária torna o sistema mais automatizado!',0);
    end;
  end;
  if (cdsLocal.State in [dsInsert]) then begin
    if CartaoJaExiste() then begin
      funcLocal.Alerta('A T E N Ç Ã O ! ! ! '+#13+#13+'Já consta no sistema um registro para este cartão!',0);
      edtNrCartao.SetFocus;
      Result := false;
      Exit;
    end;
  end;
end;

function TfCadCartaoCredito.CartaoJaExiste() : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      SQL.Add('SELECT COUNT(*) AS QTDE');
      SQL.Add('  FROM CARTAO_CREDITO');
      SQL.Add(' WHERE CCRE_EMPR_ID       = ' + IntToStr(funcLocal.Empr_ID));
      SQL.Add('   AND CCRE_NUMERO_CARTAO = ' + QuotedStr(cdsLocal.FieldByName('CCRE_NUMERO_CARTAO').AsString));
      Open;
      Result := FieldByName('QTDE').AsInteger > 0;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadCartaoCredito.DBImage1DblClick(Sender: TObject);
var
  imgLogo : TBitmap;
begin
  try
    imgLogo := TBitmap.Create;
    if OpenPictureDialog.Execute then begin
      imgLogo.LoadFromFile(OpenPictureDialog.FileName);
      cdsLocal.FieldByName('CCRE_IMAGE').Assign(imgLogo);
    end;
  except on e: exception do begin
    funcLocal.ReportaErro(Caption,(Sender as TComponent).Name,funcLocal.User_Login,e.Message);
    funcLocal.Alerta(e.Message,1);
  end; end;
end;

procedure TfCadCartaoCredito.FormShow(Sender: TObject);
begin
  inherited;
  SetaValoresFrames;
  LimiteCredito();
  if edtNrCartao.CanFocus then
    edtNrCartao.SetFocus
end;

procedure TfCadCartaoCredito.Image1DblClick(Sender: TObject);
var
  imgLogo : TBitmap;
begin
  imgLogo := TBitmap.Create;
  imgLogo.Assign( TImage(Sender).Picture.Bitmap );
  cdsLocal.FieldByName('CCRE_IMAGE').Assign(imgLogo);
end;

procedure TfCadCartaoCredito.LimiteCredito();
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT COALESCE(CCRE_LIMITE_COMPRAS,0) -');
      sql.Add('       (SELECT COALESCE(SUM(CPAG_VALOR_DOC-CPAG_VALOR_PAGO),0)');
      sql.Add('          FROM CONTAS_PAGAR');
      sql.Add('         WHERE CPAG_EMPR_ID      = CCRE_EMPR_ID');
      sql.Add('           AND CPAG_CCRE_ID      = CCRE_ID');
      sql.Add('           AND CPAG_CCRE_EMPR_ID = CCRE_EMPR_ID');
      sql.Add('           AND CPAG_STATUS       = ''A''');
      sql.Add('           AND CPAG_PREVISAO     = 0) +');
      sql.Add('       (SELECT COALESCE(SUM(CREC_VALOR_DOC-CREC_VALOR_PAGO),0)');
      sql.Add('          FROM CONTAS_RECEBER');
      sql.Add('         WHERE CREC_EMPR_ID      = CCRE_EMPR_ID');
      sql.Add('           AND CREC_CCRE_ID      = CCRE_ID');
      sql.Add('           AND CREC_CCRE_EMPR_ID = CCRE_EMPR_ID');
      sql.Add('           AND CREC_STATUS       = ''A''');
      sql.Add('           AND CREC_PREVISAO     = 0)                            AS SALDO');
      sql.Add('  FROM CARTAO_CREDITO');
      sql.Add(' WHERE CCRE_ID                   = ' + cdsLocal.FieldByName('CCRE_ID').AsString);
      sql.Add('   AND CCRE_EMPR_ID              = ' + cdsLocal.FieldByName('CCRE_EMPR_ID').AsString);
//      sql.SaveToFile('C:\Cartao.txt');
      Open;
      edtSaldo.Value := FieldByName('SALDO').AsFloat;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadCartaoCredito.SetaValoresFrames;
var
  intI  : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TfrPesqIndividual) then begin
      (Components[intI] as TfrPesqIndividual).Limpar;
    end;
  end;

  frPesqBanco.cdsLocal  := Self.cdsLocal;
  frPesqBanco.cdsField1 := 'CCRE_CBCO_ID';
  try
    if not (cdsLocal.State = dsInsert) then begin
      frPesqBanco.BuscarRegistro(cdsLocal.FieldByName('CCRE_CBCO_ID').AsString);
    end;
  except
  end;
end;

initialization
  fCadCartaoCredito := TfCadCartaoCredito.Create(nil);
finalization
  FreeAndNil(fCadCartaoCredito);

end.
