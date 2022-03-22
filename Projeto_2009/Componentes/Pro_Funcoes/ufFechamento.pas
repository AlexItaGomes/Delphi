unit ufFechamento;

interface

uses
  Vcl.Forms, RxToolEdit, Vcl.StdCtrls, Vcl.Mask, RxCurrEdit, Vcl.Graphics,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Controls, System.Classes, Funcoes, SQLExpr,
  Vcl.Imaging.jpeg;

type
  TfFechamento = class(TForm)
    Panel1: TPanel;
    btnHelp: TSpeedButton;
    btnSetFocus: TBitBtn;
    Panel2: TPanel;
    Shape2: TShape;
    Label1: TLabel;
    lbValorDebito: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Shape3: TShape;
    lbResultado: TLabel;
    lbValorResultado: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    edtDinheiro: TRxCalcEdit;
    edtCartaoCred: TRxCalcEdit;
    edtCartaoDeb: TRxCalcEdit;
    edtCheque: TRxCalcEdit;
    edtTotal: TRxCalcEdit;
    lbOrigem: TLabel;
    lbNumero: TLabel;
    Label11: TLabel;
    edtCarteira: TRxCalcEdit;
    edtDtCarteira: TDateEdit;
    lbCarteira: TLabel;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure edtDinheiroExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    funcLocal   : TFuncoes;
    fltTotal    : Real;
    FValorDebito: Real;
    FCodigo: String;
    FOrigem: String;
    FCliente: String;
    FDtaCadastro: TDateTime;
    FDtaVcto: TDateTime;
    NrParcelas   : Integer;
    NrNSUCredito : Integer;
    NrNSUDebito  : Integer;
    function ValidaDados: Boolean;
    procedure LancamentosFinanceiro;
    procedure RecebimentoCheque;
    procedure RecebimentoCredito;
    procedure RecebimentoDebito;
    procedure RecebimentoDinheiro;
    procedure RecebimentoCarteira;
    function  ConsultaLancamento(strID, Lancto: String): Boolean;
    { Private declarations }
  public
    property ValorDebito : Real      read FValorDebito write FValorDebito;
    property Origem      : String    read FOrigem      write FOrigem;
    property Codigo      : String    read FCodigo      write FCodigo;
    property Cliente     : String    read FCliente     write FCliente;
    property DtaCadastro : TDateTime read FDtaCadastro write FDtaCadastro;
    property DtaVcto     : TDateTime read FDtaVcto     write FDtaVcto;
  end;

var
  fFechamento: TfFechamento;

implementation

uses
  System.SysUtils, Winapi.Messages, ufCartao;

{$R *.dfm}

procedure TfFechamento.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Self.Close;
end;

function TfFechamento.ValidaDados() : Boolean;
begin
  Result := false;

  if (edtCartaoCred.Value > ValorDebito) then begin
    funcLocal.Alerta('Recebimento em Cartão não pode ultrapassar o valor devido!',0);
    Exit;
  end;

  if edtCartaoDeb.Value > ValorDebito then begin
    funcLocal.Alerta('Recebimento em Cartão não pode ultrapassar o valor devido!',0);
    Exit;
  end;

  if (edtCartaoCred.Value+edtCartaoDeb.Value) > ValorDebito then begin
    funcLocal.Alerta('Recebimento em Cartão não pode ultrapassar o valor devido!',0);
    Exit;
  end;

  if (edtCartaoCred.Value+edtCartaoDeb.Value+edtCheque.Value) > ValorDebito then begin
    funcLocal.Alerta('Recebimento em Cartão/Cheque não pode ultrapassar o valor devido!',0);
    Exit;
  end;

  if edtTotal.Value<ValorDebito then begin
    funcLocal.Alerta('Valor recebido não pode ser inferior ao valor devido!',0);
    Exit;
  end;

  if ((edtTotal.Value-ValorDebito)-edtDinheiro.Value)>0 then begin
    funcLocal.Alerta('Valores lançado(s) superior(es) ao valor devido!',0);
    Exit;
  end;

  if (edtCarteira.Value > 0) and (edtDtCarteira.Date<=0) then begin
    funcLocal.Alerta('Recebimento na modalidade CARTEIRA necessitam de uma data de vencimento!',0);
    Exit;
  end;
  if (edtCarteira.Value > 0) and (edtDtCarteira.Date>0) then begin
    if edtDtCarteira.Date<funcLocal.DataServidor() then begin
      funcLocal.Alerta('A data de Vencimento do título na modalidade Carteira não pode ser inferior a data atual!',0);
      Exit;
    end;
  end;

  if edtTotal.Value = 0 then begin
    funcLocal.Alerta('Necessário que seja informado o valor recebido antes de continuar!',0);
    Exit;
  end;

  if (edtCartaoCred.Value+edtCartaoDeb.Value > 0) and funcLocal.SolicitaNrTransCartao then begin

    try
      fCartao := TfCartao.Create(nil);
      fCartao.lbOrigem.Caption := Self.lbOrigem.Caption;
      fCartao.lbNumero.Caption := Self.lbNumero.Caption;
      fCartao.lbValorDebito.Caption := FormatFloat('0.00',edtCartaoCred.Value+edtCartaoDeb.Value);
      fCartao.Habilita(edtCartaoDeb.Value,edtCartaoCred.Value);
      fCartao.ShowModal;
      Self.NrNSUCredito := fCartao.NrNSUCredito;
      Self.NrNSUDebito  := fCartao.NrNSUDebito;
      Self.NrParcelas   := fCartao.NrParcelas;
    finally
      FreeAndNil(fCartao);
    end;
  end;

  Result := true;
end;

procedure TfFechamento.btnOKClick(Sender: TObject);
begin
  if not ValidaDados() then Exit;

  LancamentosFinanceiro();

  ModalResult := mrOk;
//  Self.Close;
end;

procedure TfFechamento.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then Key := #0;
end;

procedure TfFechamento.RecebimentoDinheiro();
label
  Voltar;
begin
  try
    Voltar:
    if not ConsultaLancamento(funcLocal.LancamentoLivroCaixa('71',
                                                             '1',
                                                             Codigo,
                                                             IntToStr(funcLocal.Empr_ID),
                                                             '0',
                                                             '0',
                                                             '11',
                                                             '8',
                                                             edtDinheiro.Value-fltTotal),'L') then goto Voltar;
    funcLocal.RegistraAcerto(Origem,
                             StrToInt(Codigo),
                             StrToInt(Cliente),
                             IntToStr(funcLocal.Empr_ID),
                             1,
                             DtaVcto,
                             edtDinheiro.Value-fltTotal);
  except on e : exception do begin
    funcLocal.Alerta('ERROR '+e.message);
    funcLocal.ReportaErro('Fechamento-Agenda','RecebimentoDinheiro()',e.Message);
  end; end;
end;

function TfFechamento.ConsultaLancamento(strID, Lancto : String) : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT COUNT(*) FROM');
      case Lancto[1] of
        'L':sql.Add(' LIVRO_CAIXA WHERE LCAX_ID    = :ID');
        'R':sql.Add(' CONTAS_RECEBER WHERE CREC_ID = :ID');
        'P':sql.Add(' CONTAS_PAGAR WHERE CPAG_ID   = :ID');
      end;
      Params.ParamByName('ID').AsString := strID;
      Open;
      Result := qryCons.Fields[0].AsInteger > 0;
      if not Result then begin
        if funcLocal.Alerta('Oh! Oh! Oh!'+#13+#13+
                            'Houve um ERRO desconhecido no registro do pagamento.'+#13+#13+
                            'Gostaria que eu tentasse registra-lo para você novamente?',1,true) <> 6 then begin
          Result := true;
          funcLocal.Alerta('A V I S O !'+#13+#13+'Você optou por não realizar uma nova tentativa, verifique a possibilidade de registra-lo manualmente!',0);
        end;
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfFechamento.RecebimentoCarteira();
Label
  Voltar;
begin
  try
    DtaVcto := edtDtCarteira.Date;

    Voltar:

    if not ConsultaLancamento(funcLocal.RegistraContasReceber(FormatFloat('000000',StrToInt(Codigo)),
                                                              'ACERTO REF. AGENDA Nrº ' + FormatFloat('000000',StrToInt(Codigo)),
                                                              Cliente,
                                                              '71',
                                                              '6',
                                                              DtaCadastro,
                                                              DtaVcto,
                                                              edtCarteira.Value,
                                                              0,
                                                              0,
                                                              0,
                                                              'A',
                                                              'Null',
                                                              '0',
                                                              'Null',
                                                              'Null',
                                                              Codigo,
                                                              Origem),'R') then goto Voltar;
    funcLocal.RegistraAcerto(Origem,
                             StrToInt(Codigo),
                             StrToInt(Cliente),
                             IntToStr(funcLocal.Empr_ID),
                             6,
                             DtaVcto,
                             edtCarteira.Value);
  except on e: exception do begin
    funcLocal.ReportaErro('Fechamento-Agenda','RecebimentoCarteira()',e.Message);
  end; end;
end;

procedure TfFechamento.RecebimentoCredito();
Label
  Voltar;
var
  vlrParcela : Real;
  vlrCentavo : Real;
begin
  try
    if funcLocal.DiasDepositoCredito>0 then begin
      DtaVcto := DtaCadastro+funcLocal.DiasDepositoCredito;
    end else DtaVcto := DtaCadastro;
    DtaVcto := IncMonth(DtaVcto,-1);

    vlrParcela := edtCartaoCred.Value; vlrCentavo := 0;
    if NrParcelas > 1 then begin
      if (NrParcelas mod 2) <> 0 then
        vlrCentavo := 0.01;
      vlrParcela := StrToFloat(FormatFloat('0.00',edtCartaoCred.Value/NrParcelas));
    end;

    while NrParcelas>0 do begin
      DtaVcto := IncMonth(DtaVcto,1);
      //Registrando Título no Contas a Receber
      Voltar:
      if not ConsultaLancamento(funcLocal.RegistraContasReceber(IntToStr(NrNSUCredito),
                                      'NSU: '+IntToStr(NrNSUCredito)+' - ACERTO REF. AGENDA Nrº ' + FormatFloat('000000',StrToInt(Codigo)),
                                      Cliente,
                                      '71',
                                      '5',
                                      DtaCadastro,
                                      DtaVcto,
                                      vlrParcela+vlrCentavo,
                                      0,
                                      0,
                                      0,
                                      'A',
                                      'Null',
                                      funcLocal.Se(funcLocal.ContaBcoCredito>0,'1','0'),
                                      funcLocal.Se(funcLocal.ContaBcoCredito>0,IntToStr(funcLocal.ContaBcoCredito),'Null'),
                                      'Null',
                                      Codigo,
                                      Origem),'R') then goto Voltar;
      //Registrando na tabela Acertos
      funcLocal.RegistraAcerto(Origem,
                               StrToInt(Codigo),
                               StrToInt(Cliente),
                               IntToStr(funcLocal.Empr_ID),
                               5,
                               DtaVcto,
                               vlrParcela);
      //Registrando no Contas a Pagar
      if (funcLocal.TaxaCredito>0) and (funcLocal.FornecCartaoCred>0) then begin
        funcLocal.RegistraContasPagar(IntToStr(NrNSUCredito),
                                      'NSU: '+IntToStr(NrNSUDebito)+' - TX. CARTAO CRED. ACERTO REF. AGENDA Nrº ' + FormatFloat('000000',StrToInt(Codigo)),
                                      IntToStr(funcLocal.FornecCartaoCred),
                                      '83',
                                      '5',
                                      DtaCadastro,
                                      DtaVcto,
                                      ((vlrParcela*funcLocal.TaxaCredito)/100),
                                      0,0,
                                      'Null','Null',
                                      funcLocal.Se(funcLocal.ContaBcoCredito>0,'1','0'),
                                      funcLocal.Se(funcLocal.ContaBcoCredito>0,IntToStr(funcLocal.ContaBcoCredito),'Null'),
                                      Codigo,
                                      Origem);
      end;
      vlrCentavo := 0;
      NrParcelas:=NrParcelas-1;
    end;
  except on e: exception do begin
    funcLocal.ReportaErro('Fechamento-Agenda','RecebimentoCredito()',e.Message);
  end; end;
end;

procedure TfFechamento.RecebimentoDebito();
Label
  Voltar;
begin
  try
    if funcLocal.DiasDepositoDebito>0 then begin
      DtaVcto := DtaCadastro+funcLocal.DiasDepositoDebito;
    end else DtaVcto := DtaCadastro;

    Voltar:
    //Registrando título no Contas a Receber
    if not ConsultaLancamento(funcLocal.RegistraContasReceber(IntToStr(NrNSUDebito),
                                                              'NSU: '+IntToStr(NrNSUDebito)+' - ACERTO REF. AGENDA Nrº ' + FormatFloat('000000',StrToInt(Codigo)),
                                                              Cliente,
                                                              '71',
                                                              '4',
                                                              DtaCadastro,
                                                              DtaVcto,
                                                              edtCartaoDeb.Value,
                                                              0,
                                                              0,
                                                              0,
                                                              'A',
                                                              'Null',
                                                              funcLocal.Se(funcLocal.ContaBcoDebito>0,'1','0'),
                                                              funcLocal.Se(funcLocal.ContaBcoDebito>0,IntToStr(funcLocal.ContaBcoDebito),'Null'),
                                                              'Null',
                                                              Codigo,
                                                              Origem),'R') then goto Voltar;
    //Registrando na Tabela Acertos
    funcLocal.RegistraAcerto(Origem,
                             StrToInt(Codigo),
                             StrToInt(Cliente),
                             IntToStr(funcLocal.Empr_ID),
                             4,
                             DtaVcto,
                             edtCartaoDeb.Value);

    //Registrando no Contas a Pagar
    if (funcLocal.TaxaDebito>0) and (funcLocal.FornecCartaoDeb>0) then begin
      funcLocal.RegistraContasPagar(IntToStr(NrNSUDebito),
                                    ' NSU: '+IntToStr(NrNSUDebito)+' - TX. CARTAO DEB. ACERTO REF. AGENDA Nrº ' + FormatFloat('000000',StrToInt(Codigo)),
                                    IntToStr(funcLocal.FornecCartaoDeb),
                                    '83',
                                    '4',
                                    DtaCadastro,
                                    DtaVcto,
                                    ((edtCartaoDeb.Value*funcLocal.TaxaDebito)/100),
                                    0,0,
                                    'Null','Null',
                                    funcLocal.Se(funcLocal.ContaBcoDebito>0,'1','0'),
                                    funcLocal.Se(funcLocal.ContaBcoDebito>0,IntToStr(funcLocal.ContaBcoDebito),'Null'),
                                    Codigo,
                                    Origem);
    end;
  except on e: exception do begin
    funcLocal.ReportaErro('Fechamento-Agenda','RecebimentoDebito()',e.Message);
  end; end;
end;

procedure TfFechamento.RecebimentoCheque();
Label
  Voltar;
begin
  try
    Voltar:
    //Registrando título no Contas a Receber
    if not ConsultaLancamento(funcLocal.RegistraContasReceber(FormatFloat('000000',StrToInt(Codigo)),
                                                              'ACERTO REF. AGENDA Nrº ' + FormatFloat('000000',StrToInt(Codigo)),
                                                              Cliente,
                                                              '71',
                                                              funcLocal.Se(DtaCadastro=DtaVcto,'2','3'),
                                                              DtaCadastro,
                                                              DtaVcto,
                                                              edtCheque.Value,
                                                              0,
                                                              0,
                                                              0,
                                                              'A',
                                                              'Null',
                                                              funcLocal.Se(funcLocal.ContaBcoCredito>0,'1','0'),
                                                              funcLocal.Se(funcLocal.ContaBcoCredito>0,IntToStr(funcLocal.ContaBcoCredito),'Null'),
                                                              'Null',
                                                              Codigo,
                                                              Origem),'R') then goto Voltar;
    //Registrando na Tabela Acertos
    funcLocal.RegistraAcerto(Origem,
                             StrToInt(Codigo),
                             StrToInt(Cliente),
                             IntToStr(funcLocal.Empr_ID),
                             funcLocal.Se(DtaCadastro=DtaVcto,2,3),
                             DtaVcto,
                             edtCheque.Value);
  except on e: exception do begin
    funcLocal.ReportaErro('Fechamento-Agenda','RecebimentoCheque()',e.Message);
  end; end;
end;

procedure TfFechamento.LancamentosFinanceiro();
begin

  //Lançando Recebimento Dinheiro
  if edtDinheiro.Value   > 0 then RecebimentoDinheiro();

  //Lançando Recebimento e Taxa Cartão de Crédito
  if edtCartaoCred.Value > 0 then RecebimentoCredito();

  //Lançando Recebimento e Taxa Cartão de Débito
  if edtCartaoDeb.Value  > 0 then RecebimentoDebito();

  //Lançando Recebimento Cheque
  if edtCheque.Value     > 0 then RecebimentoCheque();

  //Lançando recebimento Carteira
  if edtCarteira.Value   > 0 then RecebimentoCarteira();

end;

procedure TfFechamento.edtDinheiroExit(Sender: TObject);
begin

  if edtDinheiro.Value<0   then edtDinheiro.Value:=0;
  if edtCartaoCred.Value<0 then edtCartaoCred.Value:=0;
  if edtCartaoDeb.Value<0  then edtCartaoDeb.Value:=0;
  if edtCheque.Value<0     then edtCheque.Value:=0;
  if edtCarteira.Value<0   then edtCarteira.Value:=0;

  edtTotal.Value := (edtDinheiro.Value   +
                     edtCartaoCred.Value +
                     edtCartaoDeb.Value  +
                     edtCheque.Value+
                     edtCarteira.Value);

  fltTotal := ValorDebito - edtTotal.Value;
  lbResultado.Visible       := true;
  lbValorResultado.Visible  := true;
  if fltTotal > 0 then begin
    lbResultado.Caption     := 'FALTA';
  end else if fltTotal < 0 then begin
    lbResultado.Caption     := 'TROCO';
    fltTotal := (fltTotal*-1);
  end else begin
  lbResultado.Visible       := false;
  lbValorResultado.Visible  := false;
  end;
  lbValorResultado.Caption  := FormatFloat('###,###,##0.00',fltTotal);
  lbCarteira.Visible    := false;
  edtDtCarteira.Visible := false;
  if edtCarteira.Value > 0 then begin
    lbCarteira.Visible    := true;
    edtDtCarteira.Visible := true;
    edtDtCarteira.Date    := DtaCadastro;
    edtDtCarteira.SetFocus;
  end;
end;

procedure TfFechamento.FormCreate(Sender: TObject);
var
  formPrinc : TForm;
begin
  formPrinc    := Application.MainForm;
  funcLocal    := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
end;

procedure TfFechamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    key := #0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;
  if key = #27 then begin
    btnCancelar.Click;
    key := #0;
  end;
end;

procedure TfFechamento.FormShow(Sender: TObject);
begin
  lbValorDebito.Caption    := FormatFloat('###,###,##0.00',ValorDebito);
  lbResultado.Visible      := false;
  lbValorResultado.Visible := false;
  case Origem[1] of
    'A' : lbOrigem.Caption := 'Agenda Nrº:'; //Agenda
    'O' : lbOrigem.Caption := 'OS Nrº:';     //Ordem de Serviço
    'P' : lbOrigem.Caption := 'Pedido Nrº:'; //Pedido
  end;
  lbNumero.Caption := FormatFloat('000000',StrToInt(Codigo));
  edtDinheiro.SetFocus;
end;

end.
