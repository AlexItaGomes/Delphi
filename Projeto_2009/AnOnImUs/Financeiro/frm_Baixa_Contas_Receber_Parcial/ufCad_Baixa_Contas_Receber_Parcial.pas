unit ufCad_Baixa_Contas_Receber_Parcial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxCurrEdit,
  RXDBCtrl, rxToolEdit, Mask, DBCtrls, SQLExpr;

type
  TfCad_Baixa_Contas_Receber_Parcial = class(TfCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btnPesq_Doc: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    edtCod_Doc: TDBEdit;
    DBEdit6: TDBEdit;
    edtValor: TRxDBCalcEdit;
    DBEdit3: TDBEdit;
    rdBanco: TDBRadioGroup;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edtCod_Banco: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    procedure edtCod_DocExit(Sender: TObject);
    procedure btnPesq_DocClick(Sender: TObject);
    procedure edtCod_DocKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
  private
    function ValidaDados: Boolean;
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Baixa_Contas_Receber_Parcial: TfCad_Baixa_Contas_Receber_Parcial;

implementation

uses udmBaixa_Contas_Receber_Parcial;

{$R *.dfm}

procedure TfCad_Baixa_Contas_Receber_Parcial.btnOkClick(Sender: TObject);
begin
  if funcLocal.EmpresasBloqueada() then Exit;
  if ValidaDados then begin
    edtValorExit(Sender);
    with dmBaixa_Contas_Receber_Parcial do begin
      with cdsContas_Receber do begin
        Edit;
        FieldByName('CREC_VALOR_PAGO').AsFloat := FieldByName('CREC_VALOR_PAGO').AsFloat + cdsAcertosACRE_VALOR_DOC.AsFloat;
        if cdsLocal.FieldByName('CREC_VIA_BANCO').AsInteger = 0 then begin
          funcLocal.LancamentoLivroCaixa(FieldByName('CREC_PLCT_ID').AsString,
                                         '1',
                                         FieldByName('CREC_ID').AsString,
                                         FieldByName('CREC_EMPR_ID').AsString,
                                         '0',
                                         '0',
                                         '11',
                                         '2',
                                         (cdsAcertosACRE_VALOR_DOC.AsFloat));
        end else begin
          if FieldByName('CREC_CBCO_ID').AsInteger <= 0 then begin
            funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                             'O título selecionado informa que sua baixa e via banco, mas não há um banco vinculado a este título!',0);
            Exit;
          end;
          funcLocal.RegistraMovBancario(FieldByName('CREC_CBCO_ID').AsString,edtValor.Value);
          funcLocal.RegistraMovConta(FieldByName('CREC_CBCO_ID').AsString,'1002','2',FieldByName('CREC_ID').AsString,edtValor.Value);
        end;
        if FieldByName('CREC_VALOR_PAGO').AsFloat >= FieldByName('CREC_VALOR_DOC').AsFloat then begin
          FieldByName('CREC_DTA_PGTO').AsDateTime     := funcLocal.DataServidor(funcLocal.Conexao);
          FieldByName('CREC_DTA_EFETIVO').AsDateTime  := funcLocal.DataServidor();
          FieldByName('CREC_STATUS').AsString         := 'F';
        end;
      end;
      cdsContas_Receber.ApplyUpdates(-1);
      cdsAcertos.ApplyUpdates(-1);
    end;
    Self.Close;
  end else IsValidData;
end;

function TfCad_Baixa_Contas_Receber_Parcial.ValidaDados : Boolean;
begin
  Result := true;
  if edtCod_Doc.Text = '' then begin
    funcLocal.Alerta('Informe o tipo de documento antes de continuar.',1);
    edtCod_Doc.SetFocus;
    Result := false;
    Exit;
  end;
  if edtValor.Value <= 0 then begin
    funcLocal.Alerta('Informe o valor de lançamento antes de continuar.',1);
    edtValor.SetFocus;
    Result := false;
    Exit;
  end;
  if edtValor.Value > cdsLocal.FieldByName('VALOR_APAGAR').AsFloat then begin
    if funcLocal.Alerta('O valor lançado e superior ao valor a ser pago pelo título, deseja continuar?',1,true) = 7 then begin
      edtValor.SetFocus;
      Result := false;
      Exit;
    end;
  end;
  if (StrToInt(edtCod_Doc.Text) in [4,5]) and (rdBanco.ItemIndex = 1) then begin
    funcLocal.Alerta('Movimentações em cartão necessitam estar vinculados a uma conta bancária!',0);
    edtCod_Doc.SetFocus;
    Result := false;
    Exit;
  end;
  if cdsLocal.FieldByName('CREC_VIA_BANCO').AsInteger = 1 then begin
    if not funcLocal.ContaBancariaAtiva(cdsLocal.FieldByName('CREC_CBCO_ID').AsString) then begin
      funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                        'Conta bancária informada no título encontra-se inativa, verifique sua(s) conta(s) bancária(s) antes de continuar!',1);
      edtCod_Doc.SetFocus;
      Result := false;
      Exit;
    end;
  end;
end;

procedure TfCad_Baixa_Contas_Receber_Parcial.btnPesq_DocClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmBaixa_Contas_Receber_Parcial do begin
    strTMP := funcLocal.Busca_Registro(cdsPesq_Tipo_Doc,'GENE_DESCR','GENE_ID;GENE_DESCR','');
    if strTMP <> '' then begin
      cdsAcertosACRE_GENE_ID_TIPO_PGTO.AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsAcertosTIPO_DOC.AsString               := funcLocal.Buscar_Coluna(strTMP,2);
      edtCod_Doc.Modified := true;
    end else begin
      cdsAcertosACRE_GENE_ID_TIPO_PGTO.AsString := '';
      cdsAcertosTIPO_DOC.AsString               := '';
    end;
  end;
  edtCod_Doc.SetFocus;
end;

procedure TfCad_Baixa_Contas_Receber_Parcial.edtCod_DocExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Doc.Modified then Exit;
  with dmBaixa_Contas_Receber_Parcial do begin
    if edtCod_Doc.Text <> '' then begin
      strTMP := funcLocal.Busca_Registro(cdsPesq_Tipo_Doc,'GENE_DESCR','GENE_ID;GENE_DESCR','GENE_ID = ' + edtCod_Doc.Text);
      if strTMP <> '' then begin
        cdsAcertosACRE_GENE_ID_TIPO_PGTO.AsString := funcLocal.Buscar_Coluna(strTMP,1);
        cdsAcertosTIPO_DOC.AsString               := funcLocal.Buscar_Coluna(strTMP,2);
      end else begin
        cdsAcertosACRE_GENE_ID_TIPO_PGTO.AsString := '';
        cdsAcertosTIPO_DOC.AsString               := '';
      end;
    end else begin
      cdsAcertosACRE_GENE_ID_TIPO_PGTO.AsString := '';
      cdsAcertosTIPO_DOC.AsString               := '';
    end;
  end;
end;

procedure TfCad_Baixa_Contas_Receber_Parcial.edtCod_DocKeyPress(Sender: TObject;
  var Key: Char);
var
  btnTMP : TSpeedButton;
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then begin
    if Trim(TDBEdit(Sender).Text) = '' then begin
      if Key = #27 then Exit;
      funcLocal.VlrPesq := Key;
      Key := #0;
      btnTMP := TSpeedButton(Self.FindComponent(funcLocal.Buscar_Coluna(TDBEdit(Sender).ImeName,1)));
      btnTMP.Click;
    end else Key := #0;
  end;
end;

procedure TfCad_Baixa_Contas_Receber_Parcial.edtValorExit(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfCad_Baixa_Contas_Receber_Parcial.FormShow(Sender: TObject);
begin
  inherited;
  edtCod_Doc.SetFocus;
  OpenClientDataSet;
end;

procedure TfCad_Baixa_Contas_Receber_Parcial.OpenClientDataSet;
begin
  with dmBaixa_Contas_Receber_Parcial do begin
    with cdsPesq_Tipo_Doc do begin
      Close;
      Open;
    end;
  end;
end;

initialization
  if fCad_Baixa_Contas_Receber_Parcial = nil then
    fCad_Baixa_Contas_Receber_Parcial := TfCad_Baixa_Contas_Receber_Parcial.Create(nil);
finalization
  FreeAndNil(fCad_Baixa_Contas_Receber_Parcial);

end.
