unit ufListCartaoCredito;

interface

uses Vcl.Controls, Vcl.Forms, System.Classes, Vcl.Buttons, Vcl.ExtCtrls,
  Funcoes, Data.SqlExpr;

Const
  intColum1   = 5;
  intColum2   = 170;
  intColum3   = 335;
  intColum4   = 495;
  intBandeira = 580;

type
  TCartao  = class
  private
    FCartaoID: Integer;
    FLimiteSaque: Real;
    FLimiteCompra: Real;
    FDiaVctoFatura: Integer;
    FTipoCartao: String;
    FValidadeCartao: String;
    FDiaFechaFatura: Integer;
    FContaBancaria: Integer;
    FSaldoDisp: Real;
    FDtVencimento: TDate;
    FTitular: String;
    FNrCartao: String;
    FImage: TImage;
  public
    property  CartaoID        : Integer     read FCartaoID          write FCartaoID;
    property  ValidadeCartao  : String      read FValidadeCartao    write FValidadeCartao;
    property  ContaBancaria   : Integer     read FContaBancaria     write FContaBancaria;
    property  LimiteSaque     : Real        read FLimiteSaque       write FLimiteSaque;
    property  LimiteCompra    : Real        read FLimiteCompra      write FLimiteCompra;
    property  DiaVctoFatura   : Integer     read FDiaVctoFatura     write FDiaVctoFatura;
    property  DiaFechaFatura  : Integer     read FDiaFechaFatura    write FDiaFechaFatura;
    property  DtVencimento    : TDate       read FDtVencimento      write FDtVencimento;
    property  TipoCartao      : String      read FTipoCartao        write FTipoCartao;
    property  SaldoDisp       : Real        read FSaldoDisp         write FSaldoDisp;
    property  NrCartao        : String      read FNrCartao          write FNrCartao;
    property  Titular         : String      read FTitular           write FTitular;
    property  Bandeira        : TImage      read FImage             write FImage;
    procedure LimparDados();
  end;

  TfListCartoesCredito = class(TForm)
    btnOK: TSpeedButton;
    btnCancelar: TSpeedButton;
    scCartoes: TScrollBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    funcLocal : TFuncoes;
    FCartao   : TCartao;
    FValorCompra: Real;
    FTipoTransacao: String;
    FTipoCartao: Integer;
    FDadosCartao: String;
    FCont: Integer;
    procedure ListCartaoCredito;
    procedure CriaPainel(out pnTMP: TPanel);
    procedure CriaCheckBox(out pnTMP: TPanel; qryCons : TSQLQuery);
    procedure CriaLabelBandeira(out pnTMP: TPanel; qryCons : TSQLQuery);
    procedure CriaLabelAgencia(out pnTMP: TPanel; qryCons: TSQLQuery);
    procedure CriaLabelBanco(out pnTMP: TPanel; qryCons: TSQLQuery);
    procedure CriaLabelConta(out pnTMP: TPanel; qryCons: TSQLQuery);
    procedure CriaLabelDiaFechamentoFatura(out pnTMP: TPanel;
      qryCons: TSQLQuery);
    procedure CriaLabelDiaVctoFatura(out pnTMP: TPanel; qryCons: TSQLQuery);
    procedure CriaLabelLimite(out pnTMP: TPanel; qryCons: TSQLQuery);
    procedure CriaLabelSaldo(out pnTMP: TPanel; qryCons: TSQLQuery);
    procedure CriaLabelSaldoConta(out pnTMP: TPanel; qryCons: TSQLQuery);
    procedure CriaLabelTitular(out pnTMP: TPanel; qryCons: TSQLQuery);
    procedure CheckBoxClick(Sender : TObject);
    procedure CarregaDadosCartao(intCCRE_ID: Integer);
    function  ValidaDados: Boolean;
    procedure OnClickPainel(Sender: TObject);
  public
    property  Cartao        : TCartao     read FCartao        write FCartao;
    property  ValorCompra   : Real        read FValorCompra   write FValorCompra;
    property  TipoTransacao : String      read FTipoTransacao write FTipoTransacao;
    property  TipoCartao    : Integer     read FTipoCartao    write FTipoCartao;
    property  DadosCartao   : String      read FDadosCartao   write FDadosCartao;
    property  Cont          : Integer     read FCont          write FCont;
  end;

var
  fListCartoesCredito: TfListCartoesCredito;

implementation

uses
  Winapi.Messages, System.SysUtils, Vcl.StdCtrls, Vcl.Graphics, Data.DB;

{$R *.dfm}

procedure TfListCartoesCredito.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfListCartoesCredito.FormCreate(Sender: TObject);
var
  formPrinc : TForm;
begin
  formPrinc    := Application.MainForm;
  funcLocal    := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
  Cartao       := TCartao.Create;
end;

procedure TfListCartoesCredito.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then btnCancelar.Click;
end;

procedure TfListCartoesCredito.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfListCartoesCredito.FormShow(Sender: TObject);
begin
  Cartao.LimparDados();
  ListCartaoCredito();
end;

procedure TfListCartoesCredito.ListCartaoCredito();
var
  qryCons  : TsqlQuery;
  pnTMP    : TPanel;
  Dia,Mes,Ano : Word;
begin
  try
    DecodeDate(funcLocal.DataServidor(),Ano,Mes,Dia);
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT CCRE.CCRE_ID,');
      sql.Add('       CCRE.CCRE_NUMERO_CARTAO,');
      sql.Add('       CCRE.CCRE_TITULAR,');
      sql.Add('       CCRE.CCRE_LIMITE_COMPRAS,');
      sql.Add('       (SELECT COALESCE(CCRE_LIMITE_COMPRAS,0) -');
      sql.Add('               (SELECT COALESCE(SUM(CPAG_VALOR_DOC-CPAG_VALOR_PAGO),0)');
      sql.Add('                  FROM CONTAS_PAGAR');
      sql.Add('                 WHERE CPAG_EMPR_ID      = CCRE_EMPR_ID');
      sql.Add('                   AND CPAG_CCRE_ID      = CCRE_ID');
      sql.Add('                   AND CPAG_CCRE_EMPR_ID = CCRE_EMPR_ID');
      sql.Add('                   AND CPAG_STATUS       = ''A''');
      sql.Add('                   AND CPAG_PREVISAO     = 0) +');
      sql.Add('               (SELECT COALESCE(SUM(CREC_VALOR_DOC-CREC_VALOR_PAGO),0)');
      sql.Add('                  FROM CONTAS_RECEBER');
      sql.Add('                 WHERE CREC_EMPR_ID      = CCRE_EMPR_ID');
      sql.Add('                   AND CREC_CCRE_ID      = CCRE_ID');
      sql.Add('                   AND CREC_CCRE_EMPR_ID = CCRE_EMPR_ID');
      sql.Add('                   AND CREC_STATUS       = ''A''');
      sql.Add('                   AND CREC_PREVISAO     = 0)');
      sql.Add('          FROM CARTAO_CREDITO');
      sql.Add('         WHERE CCRE_ID                   = CCRE.CCRE_ID');
      sql.Add('           AND CCRE_EMPR_ID              = CCRE.CCRE_EMPR_ID) AS SALDO,');
      sql.Add('       CCRE.CCRE_DIA_VCTO_FATURA,');
      sql.Add('       CCRE.CCRE_DIA_FECHAMENTO_FATURA,');
      sql.Add('       BCO.GENE_DESCR                  AS BANCO,');
      sql.Add('       CBCO.CBCO_AGENCIA,');
      sql.Add('       CBCO.CBCO_CONTA,');
      sql.Add('       CBCO.CBCO_SALDO_ATUAL,');
      sql.Add('       CCRE.CCRE_IMAGE');
      sql.Add('  FROM CARTAO_CREDITO                  CCRE');
      sql.Add('  LEFT OUTER JOIN CONTAS_BANCARIAS     CBCO');
      sql.Add('    ON (CBCO.CBCO_ID                   = CCRE.CCRE_CBCO_ID');
      sql.Add('   AND CBCO.CBCO_EMPR_ID               = CCRE.CCRE_CBCO_EMPR_ID)');
      sql.Add('  LEFT OUTER JOIN GENERICA             BCO');
      sql.Add('    ON (BCO.GENE_EMPR_ID               = CBCO.CBCO_GENE_EMPR_ID_BCO');
      sql.Add('   AND BCO.GENE_TGEN_ID                = CBCO.CBCO_GENE_TGEN_ID_BCO');
      sql.Add('   AND BCO.GENE_ID                     = CBCO.CBCO_GENE_ID_BCO)');
      sql.Add(' WHERE CCRE.CCRE_ATIVO                 = 1');
      sql.Add('   AND CCRE.CCRE_EMPR_ID               = ' + IntToStr(funcLocal.Empr_ID));
      sql.Add('   AND (SUBSTRING(CCRE.CCRE_VENCIMENTO FROM 1 FOR 2) >= ' + QuotedStr(IntToStr(Mes)));
      sql.Add('    OR  SUBSTRING(CCRE.CCRE_VENCIMENTO FROM 4 FOR 2) >= ' + QuotedStr(Copy(IntToStr(Ano),3,2))+ ')');
      sql.Add('   AND CCRE.CCRE_TIPO_CARTAO          IN (''A'','+QuotedStr(funcLocal.Se(TipoCartao=4,'D','C'))+')');
      Open;
      First; Cont := 0;
      if not IsEmpty then begin
        while not Eof do begin
          Cont := Cont + 1;
          CriaPainel(pnTMP);
          CriaCheckBox(pnTMP,qryCons);
          CriaLabelBandeira(pnTMP,qryCons);
          CriaLabelTitular(pnTMP,qryCons);
          CriaLabelLimite(pnTMP,qryCons);
          CriaLabelSaldo(pnTMP,qryCons);
          CriaLabelDiaFechamentoFatura(pnTMP,qryCons);
          CriaLabelDiaVctoFatura(pnTMP,qryCons);
          CriaLabelBanco(pnTMP,qryCons);
          CriaLabelAgencia(pnTMP,qryCons);
          CriaLabelConta(pnTMP,qryCons);
          CriaLabelSaldoConta(pnTMP,qryCons);
          Next;
        end;
      end else begin
        funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Não foi encontrado nenhum cartão, verifique o cadastro de cartões de crédito antes de continuar!',0);
        Self.Close();
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfListCartoesCredito.OnClickPainel(Sender: TObject);
var
  intI : Integer;
  pnTMP : TPanel;
begin
  pnTMP := TPanel(Sender);
  for intI := 0 to pnTMP.ComponentCount-1 do begin
    if (pnTMP.Components[intI] is TCheckBox) then begin
      TCheckBox(pnTMP.Components[intI] as TCheckBox).Checked := true;
    end;
  end;
end;

procedure TfListCartoesCredito.CriaLabelTitular(out pnTMP : TPanel; qryCons : TSQLQuery);
var
  lbTitularTMP : TLabel;
begin
  lbTitularTMP  := TLabel.Create(nil);
  with lbTitularTMP do begin
    Parent      := pnTMP;
    AutoSize    := true;
    Caption     := 'Titular: ' + qryCons.FieldByName('CCRE_TITULAR').AsString;
    Font.Style  := [fsBold];
    Left        := 22;
    Top         := 25;
  end;
end;

procedure TfListCartoesCredito.CriaLabelLimite(out pnTMP : TPanel; qryCons : TSQLQuery);
var
  lbLimiteTMP : TLabel;
begin
  lbLimiteTMP := TLabel.Create(nil);
  with lbLimiteTMP do begin
    Parent    := pnTMP;
    AutoSize  := true;
    Caption   := 'Limite de Crédito R$: ' + FormatFloat('###,###,##0.00',qryCons.FieldByName('CCRE_LIMITE_COMPRAS').AsFloat);
    Left      := intColum1;
    Top       := 41;
  end;
end;

procedure TfListCartoesCredito.CriaLabelSaldo(out pnTMP : TPanel; qryCons : TSQLQuery);
var
  lbSaldoTMP : TLabel;
begin
  lbSaldoTMP  := TLabel.Create(nil);
  with lbSaldoTMP do begin
    Parent    := pnTMP;
    AutoSize  := true;
    Caption   := 'Saldo Disponível R$: ' + FormatFloat('###,###,##0.00',qryCons.FieldByName('SALDO').AsFloat);
    Left      := intColum2;
    Top       := 41;
  end;
end;

procedure TfListCartoesCredito.CriaLabelDiaFechamentoFatura(out pnTMP : TPanel; qryCons : TSQLQuery);
var
  lbFechamentoFaturaTMP : TLabel;
begin
  lbFechamentoFaturaTMP := TLabel.Create(nil);
  with lbFechamentoFaturaTMP do begin
    Parent    := pnTMP;
    AutoSize  := true;
    Caption   := 'Dia Fechamento Fatura: ' + FormatFloat('00',qryCons.FieldByName('CCRE_DIA_FECHAMENTO_FATURA').AsInteger);
    Left      := intColum3;
    Top       := 41;
  end;
end;

procedure TfListCartoesCredito.CriaLabelDiaVctoFatura(out pnTMP : TPanel; qryCons : TSQLQuery);
var
  lbVctoFaturaTMP : TLabel;
begin
  lbVctoFaturaTMP := TLabel.Create(nil);
  with lbVctoFaturaTMP do begin
    Parent    := pnTMP;
    AutoSize  := true;
    Caption   := 'Dia de Vecto da Fatura: ' + FormatFloat('00',qryCons.FieldByName('CCRE_DIA_VCTO_FATURA').AsInteger);
    Left      := intColum4;
    Top       := 41;
  end;
end;

procedure TfListCartoesCredito.CriaLabelBanco(out pnTMP : TPanel; qryCons : TSQLQuery);
var
  lbBancoTMP : TLabel;
begin
  lbBancoTMP  := TLabel.Create(nil);
  with lbBancoTMP do begin
    Parent    := pnTMP;
    AutoSize  := true;
    Caption   := 'Banco: ' + qryCons.FieldByName('BANCO').AsString;
    Left      := intColum1;
    Top       := 57;
  end;
end;

procedure TfListCartoesCredito.CriaLabelAgencia(out pnTMP : TPanel; qryCons : TSQLQuery);
var
  lbAgencia : TLabel;
begin
  lbAgencia   := TLabel.Create(nil);
  with lbAgencia do begin
    Parent    := pnTMP;
    AutoSize  := true;
    Caption   := 'Agência: ' + qryCons.FieldByName('CBCO_AGENCIA').AsString;
    Left      := intColum2;
    Top       := 57;
  end;
end;

procedure TfListCartoesCredito.CriaLabelConta(out pnTMP : TPanel; qryCons : TSQLQuery);
var
  lbConta : TLabel;
begin
  lbConta   := TLabel.Create(nil);
  with lbConta do begin
    Parent    := pnTMP;
    AutoSize  := true;
    Caption   := 'Conta: ' + qryCons.FieldByName('CBCO_CONTA').AsString;
    Left      := intColum3;
    Top       := 57;
  end;
end;

procedure TfListCartoesCredito.CriaLabelSaldoConta(out pnTMP : TPanel; qryCons : TSQLQuery);
var
  lbSaldoConta : TLabel;
begin
  lbSaldoConta := TLabel.Create(nil);
  with lbSaldoConta do begin
    Parent    := pnTMP;
    AutoSize  := true;
    if funcLocal.TemPermissao('319') then begin
      Caption   := 'Saldo Atual R$: ' + FormatFloat('###,###,##0.00',qryCons.FieldByName('CBCO_SALDO_ATUAL').AsFloat);
    end else begin
      Caption   := 'Saldo Atual R$: ' + FormatFloat('###,###,##0.00',0);
    end;
    Left      := intColum4;
    Top       := 57;
  end;
end;

procedure TfListCartoesCredito.CriaLabelBandeira(out pnTMP : TPanel; qryCons : TSQLQuery);
var
  imgBandeira : TImage;
  bmpIMG      : TBitmap;
  BS          : TStream;
begin
  imgBandeira := TImage.Create(pnTMP);
  bmpIMG      := TBitmap.Create;
  BS := qryCons.CreateBlobStream(qryCons.FieldByName('CCRE_IMAGE'),bmRead);
  if BS.Size > 0 then begin
    with imgBandeira do begin
      Parent    := pnTMP;
      AutoSize  := false;
      Center    := true;
      Height    := 30;
      Left      := intBandeira;
      Stretch   := true;
      Top       := 5;
      Width     := 45;
      bmpIMG.LoadFromStream(BS);
      imgBandeira.Picture.Assign(bmpIMG);
    end;
  end;
end;

procedure TfListCartoesCredito.btnOKClick(Sender: TObject);
var
  intI,intII : Integer;
  panelTMP   : TPanel;
begin
  Cartao.LimparDados();
  for intI := 0 to scCartoes.ComponentCount-1 do begin
    if (scCartoes.Components[intI] is TPanel) then begin
      panelTMP := TPanel(scCartoes.Components[intI]);
      for intII := 0 to panelTMP.ComponentCount-1 do begin
        if (panelTMP.Components[intII] is TCheckBox) then begin
          if (panelTMP.Components[intII] as TCheckBox).Checked then begin
            CarregaDadosCartao((panelTMP.Components[intII] as TCheckBox).Tag);
            if not ValidaDados then Exit;
            DadosCartao := IntToStr(Cartao.CartaoID)                          +';'+ //1
                           Cartao.ValidadeCartao                              +';'+ //2
                           IntToStr(Cartao.ContaBancaria)                     +';'+ //3
                           FormatFloat('###,###,##0.00,',Cartao.LimiteSaque)  +';'+ //4
                           FormatFloat('###,###,##0.00,',Cartao.LimiteCompra) +';'+ //5
                           IntToStr(Cartao.DiaVctoFatura)                     +';'+ //6
                           IntToStr(Cartao.DiaFechaFatura)                    +';'+ //7
                           DateToStr(Cartao.DtVencimento)                     +';'+ //8
                           Cartao.TipoCartao                                  +';'+ //9
                           FormatFloat('###,###,##0.00,',Cartao.SaldoDisp)    +';'+ //10
                           Cartao.NrCartao                                    +';'+ //11
                           Cartao.Titular                                     +';'; //12
          end;
        end;
      end;
    end;
  end;
  Self.Close;
end;

function TfListCartoesCredito.ValidaDados() : Boolean;
var
  Dia, Mes, Ano : Word;
begin
  Result := true;
  DecodeDate(funcLocal.DataServidor(),Ano,Mes,Dia);
  if Copy(Cartao.ValidadeCartao,1,2) < IntToStr(Mes) then begin
    if Copy(Cartao.ValidadeCartao,4,2) < Copy(IntToStr(Ano),3,2) then begin
      funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Cartão selecionado já encontra-se vencido!',0);
      Result := false;
      Exit;
    end;
  end;
  if TipoTransacao[1] = 'D' then begin
    if (Cartao.SaldoDisp <= 0) or (Cartao.SaldoDisp < ValorCompra) then begin
      if not funcLocal.Alerta('Saldo insuficiente para esta compra, Você confirma esta compra para este cartão?',1,true) = 6 then begin
        Result :=  false;
        Exit;
      end;
    end;
  end;
  if TipoCartao = 5 then begin
    Cartao.DtVencimento := StrToDate( IntToStr(Cartao.DiaVctoFatura) +'/'+ IntToStr(Mes) +'/'+ IntToStr(Ano));
    if Cartao.DiaFechaFatura > Dia then begin
      Cartao.DtVencimento := IncMonth(Cartao.DtVencimento);
    end else begin
      Cartao.DtVencimento := IncMonth(Cartao.DtVencimento,2);
    end;
  end;
end;

procedure TfListCartoesCredito.CarregaDadosCartao(intCCRE_ID : Integer);
var
  qryCons  : TsqlQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT CCRE.CCRE_ID,');
      sql.Add('       CCRE.CCRE_VENCIMENTO,');
      sql.Add('       CCRE.CCRE_CBCO_ID,');
      sql.Add('       CCRE.CCRE_LIMITE_SAQUE,');
      sql.Add('       CCRE.CCRE_LIMITE_COMPRAS,');
      sql.Add('       CCRE.CCRE_DIA_VCTO_FATURA,');
      sql.Add('       CCRE.CCRE_DIA_FECHAMENTO_FATURA,');
      sql.Add('       CASE CCRE.CCRE_TIPO_CARTAO');
      sql.Add('           WHEN ''C'' THEN ''Crédito''');
      sql.Add('           WHEN ''D'' THEN ''Débito''');
      sql.Add('           WHEN ''A'' THEN ''Crédito/Débito''');
      sql.Add('       END AS CCRE_TIPO_CARTAO,');
      sql.Add('       CASE CCRE.CCRE_TIPO_CARTAO');
      sql.Add('            WHEN ''C'' THEN (SELECT COALESCE(CCRE_LIMITE_COMPRAS,0) -');
      sql.Add('                                 (SELECT COALESCE(SUM(CPAG_VALOR_DOC-CPAG_VALOR_PAGO),0)');
      sql.Add('                                    FROM CONTAS_PAGAR');
      sql.Add('                                   WHERE CPAG_EMPR_ID      = CCRE_EMPR_ID');
      sql.Add('                                     AND CPAG_CCRE_ID      = CCRE_ID');
      sql.Add('                                     AND CPAG_CCRE_EMPR_ID = CCRE_EMPR_ID');
      sql.Add('                                     AND CPAG_STATUS       = ''A''');
      sql.Add('                                     AND CPAG_PREVISAO     = 0) +');
      sql.Add('                                 (SELECT COALESCE(SUM(CREC_VALOR_DOC-CREC_VALOR_PAGO),0)');
      sql.Add('                                    FROM CONTAS_RECEBER');
      sql.Add('                                   WHERE CREC_EMPR_ID      = CCRE_EMPR_ID');
      sql.Add('                                     AND CREC_CCRE_ID      = CCRE_ID');
      sql.Add('                                     AND CREC_CCRE_EMPR_ID = CCRE_EMPR_ID');
      sql.Add('                                     AND CREC_STATUS       = ''A''');
      sql.Add('                                     AND CREC_PREVISAO     = 0)');
      sql.Add('                             FROM CARTAO_CREDITO');
      sql.Add('                            WHERE CCRE_ID                   = CCRE.CCRE_ID');
      sql.Add('                              AND CCRE_EMPR_ID              = CCRE.CCRE_EMPR_ID)');
      sql.Add('            WHEN ''D'' THEN (SELECT CBCO_SALDO_ATUAL');
      sql.Add('                             FROM CONTAS_BANCARIAS');
      sql.Add('                            WHERE CBCO_ID                   = CCRE.CCRE_CBCO_ID');
      sql.Add('                              AND CBCO_EMPR_ID              = CCRE.CCRE_CBCO_EMPR_ID)');
      sql.Add('       END AS SALDO,');
      sql.Add('       CCRE.CCRE_NUMERO_CARTAO,');
      sql.Add('       CCRE.CCRE_TITULAR,');
      sql.Add('       CCRE.CCRE_IMAGE');
      sql.Add('  FROM CARTAO_CREDITO  CCRE');
      sql.Add(' WHERE CCRE.CCRE_ID         = ' + IntToStr(intCCRE_ID));
      sql.Add('   AND CCRE.CCRE_EMPR_ID    = ' + IntToStr(funcLocal.Empr_ID));
      //SQL.SaveToFile('C:\SQL.txt');
      Open;
      Cartao.CartaoID       := FieldByName('CCRE_ID').AsInteger;
      Cartao.ValidadeCartao := FieldByName('CCRE_VENCIMENTO').AsString;
      Cartao.ContaBancaria  := FieldByName('CCRE_CBCO_ID').AsInteger;
      Cartao.LimiteSaque    := FieldByName('CCRE_LIMITE_SAQUE').AsFloat;
      Cartao.LimiteCompra   := FieldByName('CCRE_LIMITE_COMPRAS').AsFloat;
      Cartao.DiaVctoFatura  := FieldByName('CCRE_DIA_VCTO_FATURA').AsInteger;
      Cartao.DiaFechaFatura := FieldByName('CCRE_DIA_FECHAMENTO_FATURA').AsInteger;
      Cartao.TipoCartao     := FieldByName('CCRE_TIPO_CARTAO').AsString;
      Cartao.SaldoDisp      := FieldByName('SALDO').AsFloat;
      Cartao.NrCartao       := FieldByName('CCRE_NUMERO_CARTAO').AsString;
      Cartao.Titular        := FieldByName('CCRE_TITULAR').AsString;
      Cartao.DtVencimento   := funcLocal.DataServidor();
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfListCartoesCredito.CheckBoxClick(Sender: TObject);
var
  intI,intII : Integer;
  panelTMP   : TPanel;
begin
  if not TCheckBox(Sender).Checked then Exit;
  for intI := 0 to scCartoes.ComponentCount-1 do begin
    if (scCartoes.Components[intI] is TPanel) then begin
      panelTMP := TPanel(scCartoes.Components[intI]);
      for intII := 0 to panelTMP.ComponentCount-1 do begin
        if (panelTMP.Components[intII] is TCheckBox) then begin
          if (panelTMP.Components[intII] as TCheckBox).Tag <> TCheckBox(Sender).Tag then begin
            (panelTMP.Components[intII] as TCheckBox).Checked := false;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfListCartoesCredito.CriaCheckBox(out pnTMP : TPanel; qryCons : TSQLQuery);
var
  ckTMP : TCheckBox;
begin
  ckTMP := TCheckBox.Create(pnTMP);
  with ckTMP do begin
    Parent      := pnTMP;
    Caption     := '&'+IntToStr(Cont) + ' - Cartão Nrº ' + qryCons.FieldByName('CCRE_NUMERO_CARTAO').AsString;
    Font.Style  := [fsBold];
    Left        := intColum1;
    Top         := 5;
    Width       := 250;
    Tag         := qryCons.FieldByName('CCRE_ID').AsInteger;
    OnClick     := CheckBoxClick;
  end;
end;

procedure TfListCartoesCredito.CriaPainel(out pnTMP : TPanel);
begin
  pnTMP     := TPanel.Create(scCartoes);
  with pnTMP do begin
    Parent  := scCartoes;
    Align   := alTop;
    Color   := clWindow;
    Height  := 75;
    Width   := 645;
    OnClick := OnClickPainel;
  end;
end;

{ TCartao }

procedure TCartao.LimparDados;
begin
  CartaoID        := 0;
  ValidadeCartao  := '';
  ContaBancaria   := 0;
  LimiteSaque     := 0;
  LimiteCompra    := 0;
  DiaVctoFatura   := 0;
  DiaFechaFatura  := 0;
  TipoCartao      := '';
end;

end.

