unit ufCad_Baixa_Contas_Pagar_Parcial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit,
  RXDBCtrl, Mask, DBCtrls, rxCurrEdit, SQLExpr, frxClass, frxDesgn,
  uFrPesqIndividual, frxDBSet;

type
  TfCad_Baixa_Contas_Pagar_Parcial = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label6: TLabel;
    edtCod_Doc: TDBEdit;
    Label7: TLabel;
    edtDocumento: TDBEdit;
    btnPesq_Doc: TSpeedButton;
    edtValor: TRxDBCalcEdit;
    Label8: TLabel;
    Label9: TLabel;
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
    dstRelatorio: TfrxDBDataset;
    frRelatorio: TfrxReport;
    procedure edtCod_DocKeyPress(Sender: TObject; var Key: Char);
    procedure edtCod_DocExit(Sender: TObject);
    procedure btnPesq_DocClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
  private
    function ValidaDados: Boolean;
    procedure OpenClientDataSet;
    function EmiteRecibo(Empresa, CNPJ, IE, Endereco, CEP, NrRecibo, Valor,
      Favorecido, CPFCNPJFavorecido, Referente, ValorExtenso,
      CidadeData: String): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Baixa_Contas_Pagar_Parcial: TfCad_Baixa_Contas_Pagar_Parcial;

implementation

uses udmBaixa_Contas_Pagar_Parcial, ufRecibo;

{$R *.dfm}

procedure TfCad_Baixa_Contas_Pagar_Parcial.btnCancelarClick(Sender: TObject);
begin
  dmBaixa_Contas_Pagar_Parcial.cdsAcertos.Cancel;
  Self.Close;
end;

procedure TfCad_Baixa_Contas_Pagar_Parcial.btnOkClick(Sender: TObject);
var
  floatValor : Real;
begin
  if ValidaDados then begin
    edtValorExit(Sender);
    if funcLocal.Alerta('Confirma o lançamento para o título selecionado?',1,true) = 7 then Exit;
    floatValor := edtValor.Value;
    with dmBaixa_Contas_Pagar_Parcial do begin
      with cdsContas_Pagar do begin
        Edit;
        FieldByName('CPAG_VALOR_PAGO').AsFloat := FieldByName('CPAG_VALOR_PAGO').AsFloat + cdsAcertosACPG_VALOR_DOC.AsFloat;
        cdsAcertosACPG_VALOR_DOC.AsFloat := (cdsAcertosACPG_VALOR_DOC.AsFloat * -1);
        if cdsLocal.FieldByName('CPAG_VIA_BANCO').AsInteger = 0 then begin
          funcLocal.LancamentoLivroCaixa(FieldByName('CPAG_PLCT_ID').AsString,
                                         '2',
                                         FieldByName('CPAG_ID').AsString,
                                         FieldByName('CPAG_EMPR_ID').AsString,
                                         '0',
                                         '0',
                                         '11',
                                         '3',
                                         (cdsAcertosACPG_VALOR_DOC.AsFloat));
        end else begin
          funcLocal.RegistraMovBancario(cdsLocal.FieldByName('CPAG_CBCO_ID').AsString,(floatValor * -1));
          funcLocal.RegistraMovConta(cdsLocal.FieldByName('CPAG_CBCO_ID').AsString,'1001','1',cdsLocal.FieldByName('CPAG_ID').AsString,(floatValor * -1));
        end;
        if FieldByName('CPAG_VALOR_PAGO').AsFloat >= FieldByName('CPAG_VALOR_DOC').AsFloat then begin
          FieldByName('CPAG_DTA_PGTO').AsDateTime     := funcLocal.DataServidor(funcLocal.Conexao);
          FieldByName('CPAG_DTA_EFETIVO').AsDateTime  := funcLocal.DataServidor(funcLocal.Conexao);
          FieldByName('CPAG_STATUS').AsString         := 'F';
        end;
      end;
      cdsContas_Pagar.ApplyUpdates(-1);
      cdsAcertos.ApplyUpdates(-1);
      EmiteRecibo(funcLocal.Empr_Razao,
                  funcLocal.Empr_CNPJ,
                  funcLocal.Empr_IE,
                  funcLocal.TratarNome(funcLocal.Empr_Endereco)+', '+funcLocal.TratarNome(funcLocal.Empr_Bairro),
                  funcLocal.Empr_CEP+', '+funcLocal.TratarNome(funcLocal.Empr_Cidade)+' - '+funcLocal.Empr_UF,
                  FormatFloat('00000000',dmBaixa_Contas_Pagar_Parcial.cdsAcertosACPG_ID.AsInteger),
                  FormatFloat('###,###,##0.00',dmBaixa_Contas_Pagar_Parcial.cdsAcertosACPG_VALOR_DOC.AsFloat*-1),
                  funcLocal.TratarNome(dmBaixa_Contas_Pagar_Parcial.cdsContas_PagarFORN_NOME_FANTASIA.AsString),
                  dmBaixa_Contas_Pagar_Parcial.cdsContas_PagarFORN_CNPJ_CPF.AsString,
                  dmBaixa_Contas_Pagar_Parcial.cdsContas_PagarCPAG_PROVENIENTE.AsString,
                  funcLocal.ValorPorExtenso(dmBaixa_Contas_Pagar_Parcial.cdsAcertosACPG_VALOR_DOC.AsFloat*-1),
                  funcLocal.TratarNome(funcLocal.Empr_Cidade)+', ' +FormatDateTime('dd "de" mmmm "de" yyyy',dmBaixa_Contas_Pagar_Parcial.cdsAcertosACPG_DTA_CADASTRO.AsDateTime)
                  );
    end;
    Self.Close;
  end else IsValidData;
end;

function TfCad_Baixa_Contas_Pagar_Parcial.EmiteRecibo(Empresa,
                                                      CNPJ,
                                                      IE,
                                                      Endereco,
                                                      CEP,
                                                      NrRecibo,
                                                      Valor,
                                                      Favorecido,
                                                      CPFCNPJFavorecido,
                                                      Referente,
                                                      ValorExtenso,
                                                      CidadeData : String) : Boolean;
begin
  Result := true;
  if not funcLocal.EmiteReciboPagtoParc then Exit;
  if funcLocal.Alerta('Deseja emitir um recibo para este lançamento?',1,true) <> 6 then Exit;
  try
    fRecibo := TfRecibo.Create(nil);
    fRecibo.Empresa           := Empresa;
    fRecibo.CNPJ              := CNPJ;
    fRecibo.IE                := IE;
    fRecibo.Endereco          := Endereco;
    fRecibo.CEP               := CEP;
    fRecibo.NrRecibo          := NrRecibo;
    fRecibo.Valor             := Valor;
    fRecibo.Favorecido        := Favorecido;
    fRecibo.CPFCNPJFavorecido := CPFCNPJFavorecido;
    fRecibo.Referente         := Referente;
    fRecibo.ValorExtenso      := ValorExtenso;
    fRecibo.CidadeData        := CidadeData;
    fRecibo.QrRecibo.PreviewModal;
  finally
    FreeAndNil(fRecibo);
  end;
end;

function TfCad_Baixa_Contas_Pagar_Parcial.ValidaDados : Boolean;
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
  if cdsLocal.FieldByName('CPAG_VIA_BANCO').AsInteger = 1 then begin
    if cdsLocal.FieldByName('CPAG_CBCO_ID').AsInteger <= 0 then begin
      funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                      'O título selecionado informa que sua baixa e via banco, mas não há um banco vinculado a este título!',0);
      Exit;
    end;
    if not funcLocal.ContaBancariaAtiva(cdsLocal.FieldByName('CPAG_CBCO_ID').AsString) then begin
      funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                        'Conta bancária informada no título encontra-se inativa, verifique sua(s) conta(s) bancária(s) antes de continuar!',1);
      edtCod_Doc.SetFocus;
      Result := false;
      Exit;
    end;
    if not funcLocal.TemSaldoEmConta(cdsLocal.FieldByName('CPAG_CBCO_ID').AsString,edtValor.Value) then begin
      funcLocal.Alerta('Não consta saldo suficiente em conta para esta movimentação.',1);
      edtCod_Doc.SetFocus;
      Result := false;
      Exit;
    end;
  end else if not funcLocal.TemSaldoLivroCaixa(edtValor.Value) then begin
    funcLocal.Alerta('Não consta saldo em caixa suficiente para esta movimentação.',1);
    edtValor.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfCad_Baixa_Contas_Pagar_Parcial.btnPesq_DocClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmBaixa_Contas_Pagar_Parcial do begin
    strTMP := funcLocal.Busca_Registro(cdsPesq_Tipo_Doc,'GENE_DESCR','GENE_ID;GENE_DESCR','');
    if strTMP <> '' then begin
      cdsAcertosACPG_GENE_ID_TIPO_PGTO.AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsAcertosTIPO_DOC.AsString               := funcLocal.Buscar_Coluna(strTMP,2);
      edtCod_Doc.Modified := true;
    end else begin
      cdsAcertosACPG_GENE_ID_TIPO_PGTO.AsString := '';
      cdsAcertosTIPO_DOC.AsString               := '';
    end;
  end;
  edtCod_Doc.SetFocus;
end;

procedure TfCad_Baixa_Contas_Pagar_Parcial.edtCod_DocExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Doc.Modified then Exit;
  with dmBaixa_Contas_Pagar_Parcial do begin
    if edtCod_Doc.Text <> '' then begin
      strTMP := funcLocal.Busca_Registro(cdsPesq_Tipo_Doc,'GENE_DESCR','GENE_ID;GENE_DESCR','GENE_ID = ' + edtCod_Doc.Text);
      if strTMP <> '' then begin
        cdsAcertosACPG_GENE_ID_TIPO_PGTO.AsString := funcLocal.Buscar_Coluna(strTMP,1);
        cdsAcertosTIPO_DOC.AsString               := funcLocal.Buscar_Coluna(strTMP,2);
      end else begin
        cdsAcertosACPG_GENE_ID_TIPO_PGTO.AsString := '';
        cdsAcertosTIPO_DOC.AsString               := '';
      end;
    end else begin
      cdsAcertosACPG_GENE_ID_TIPO_PGTO.AsString := '';
      cdsAcertosTIPO_DOC.AsString               := '';
    end;
  end;
end;

procedure TfCad_Baixa_Contas_Pagar_Parcial.edtCod_DocKeyPress(Sender: TObject;
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

procedure TfCad_Baixa_Contas_Pagar_Parcial.edtValorExit(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfCad_Baixa_Contas_Pagar_Parcial.FormShow(Sender: TObject);
begin
  inherited;
  edtCod_Doc.SetFocus;
  OpenClientDataSet;
end;

procedure TfCad_Baixa_Contas_Pagar_Parcial.OpenClientDataSet;
begin
  with dmBaixa_Contas_Pagar_Parcial do begin
    with cdsPesq_Tipo_Doc do begin
      Close;
      Open;
    end;
  end;
end;

initialization
  if fCad_Baixa_Contas_Pagar_Parcial = nil then  
    fCad_Baixa_Contas_Pagar_Parcial := TfCad_Baixa_Contas_Pagar_Parcial.Create(nil);
finalization
  FreeAndNil(fCad_Baixa_Contas_Pagar_Parcial);

end.
