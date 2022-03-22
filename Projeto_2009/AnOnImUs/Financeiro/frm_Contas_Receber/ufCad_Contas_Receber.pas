unit ufCad_Contas_Receber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, DB,
  rxToolEdit, RXDBCtrl, Mask, rxCurrEdit, Grids, DBGrids;

type
  TConta = class
    strNr_Doc,
    strProv,
    strCod_Clie,
    strCliente,
    strCod_Plct,
    strPlano,
    strCod_Doc,
    strDoc,
    strPlano_ID,
    strCod_Bco,
    strCCRE_ID,
    strObs      : String;
    dtEmissao,
    dtVecto     : TDate;
    floatVlr,
    floatJuro,
    floatMora   : Real;
    intBanco    : Integer;
    intPrevisao : Integer;
  end;

  TfCad_Contas_Receber = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label3: TLabel;
    edtProveniente: TDBEdit;
    Label4: TLabel;
    edtNr_Doc: TDBEdit;
    Label5: TLabel;
    edtCod_Clie: TDBEdit;
    Label6: TLabel;
    edtCliente: TDBEdit;
    btnPesq_Clie: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    btnPesq_Plano: TSpeedButton;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    btnPesq_Doc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edtDt_Emissao: TDBDateEdit;
    edtDtPagto: TDBDateEdit;
    edtDt_Vecto: TDBDateEdit;
    edtVlr_Doc: TRxDBCalcEdit;
    edtCod_Plano: TDBEdit;
    edtPlano: TDBEdit;
    edtCod_Simplif: TDBEdit;
    edtCod_Doc: TDBEdit;
    edtDocumento: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit12: TDBEdit;
    DBDateEdit7: TDBDateEdit;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    edtDtEfetivo: TDBDateEdit;
    Label11: TLabel;
    DBCheckBox1: TDBCheckBox;
    edtVlr_Pago: TDBEdit;
    Panel2: TPanel;
    lb21: TLabel;
    lb22: TDBImage;
    lb1: TLabel;
    lb4: TDBText;
    lb7: TLabel;
    lb9: TDBText;
    lb11: TLabel;
    lb13: TDBText;
    lb2: TLabel;
    lb5: TDBText;
    lb15: TLabel;
    lb17: TDBText;
    lb23: TLabel;
    lb6: TDBText;
    lb8: TLabel;
    lb10: TDBText;
    lb18: TDBText;
    lb16: TLabel;
    lb14: TDBText;
    lb12: TLabel;
    lb19: TLabel;
    lb20: TLabel;
    GroupBox2: TGroupBox;
    rdBanco: TDBCheckBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    btnPesq_Banco: TSpeedButton;
    Label26: TLabel;
    btnInsertBanco: TSpeedButton;
    edtCod_Banco: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit8: TDBEdit;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCod_ClieKeyPress(Sender: TObject; var Key: Char);
    procedure edtCod_PlanoExit(Sender: TObject);
    procedure edtCod_DocExit(Sender: TObject);
    procedure edtCod_ClieExit(Sender: TObject);
    procedure btnPesq_ClieClick(Sender: TObject);
    procedure btnPesq_PlanoClick(Sender: TObject);
    procedure btnPesq_DocClick(Sender: TObject);
    procedure rdBancoClick(Sender: TObject);
    procedure edtCod_BancoExit(Sender: TObject);
    procedure btnPesq_BancoClick(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure Label22Click(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnInsertBancoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    function  ValidaDados: Boolean;
    procedure CarregaDados;
    procedure LancamentoBancario;
    procedure PanelBanco(boolTMP: Boolean);
    procedure OpenClientDataSet(intPos : Integer = 99);
    function  DocJaLancado: Boolean;
    function JaExistePrevisao: Boolean;
    procedure LancaDadosCartao(strTMP: String);
    procedure OcultaLabel(boolValue: Boolean);
    { Private declarations }
  public
    ContaReceber : TConta;
  end;

var
  fCad_Contas_Receber: TfCad_Contas_Receber;
  dtDtPagto  : TDate;
  strCREC_ID : String;

implementation

uses udmContas_Receber, ufConfirmacao, SQLExpr, ufParcelamentoRecebimento;

{$R *.dfm}

procedure TfCad_Contas_Receber.btnOkClick(Sender: TObject);

{$REGION 'AlteraParcela'}
  procedure AlteraParcela(strCREC_ID, strParc : String; intI : Integer);
  var
    qryCons : TSQLQuery;
    strPar  : String;
  begin
    try
      strPar  := FormatFloat('000',intI) + ' / ' + FormatFloat('000',StrToFloat(strParc));
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          try
            funcLocal.StartCommit
          except
          end;
          sql.Add('UPDATE CONTAS_RECEBER');
          sql.Add('SET    CREC_PROVENIENTE = CREC_PROVENIENTE || ' + Trim(QuotedStr(' ') + '|| ' + QuotedStr(strPar)));
          sql.Add('WHERE  CREC_ID          = ' + strCREC_ID);
          sql.Add('AND    CREC_EMPR_ID     = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL();
          try
            funcLocal.Commit
          except
          end;
        end;
      except on e: exception do begin
        funcLocal.RollBack;
        funcLocal.Alerta('Erro no processo de parcelamento da dívida.'+#13+'['+e.Message+']',1);
        funcLocal.ReportaErro('TfCad_Contas_Receber','AlteraParcela',e.Message);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

var
  boolInsert : Boolean;
  strParc    : String;
  intI       : Integer;
  boolBanco  : Boolean;
begin
  intI       := 0;
  strParc    := '1';
  boolInsert := false;
  strCREC_ID := cdsLocal.FieldByName('CREC_ID').AsString;
  if ValidaDados then begin
    if cdsLocal.State = dsInsert then begin
      boolInsert := true;
      CarregaDados;
    end;
    boolBanco  := (cdsLocal.FieldByName('CREC_VIA_BANCO').AsInteger = 1);

    inherited;
    if boolInsert then begin
      try
        if cdsLocal.FieldByName('CREC_PREVISAO').AsInteger = 0 then
          funcLocal.BaixarContaReceberPrevisto(ContaReceber.dtVecto,
                                              (ContaReceber.floatVlr*-1),
                                               ContaReceber.strCod_Plct,
                                               'CR');
        if fConfirmacao = nil then
          fConfirmacao := TfConfirmacao.Create(nil);
        with fConfirmacao do begin
          lbProveniente.Caption := ContaReceber.strProv;
          lbFornecedor.Caption  := ContaReceber.strCod_Clie + ' - ' + ContaReceber.strCliente;
          lbPlano.Caption       := funcLocal.Buscar_Coluna(ContaReceber.strPlano,1) + ' - ' + funcLocal.Buscar_Coluna(ContaReceber.strPlano,2);
          lbTipo_doc.Caption    := ContaReceber.strCod_Doc  + ' - ' + ContaReceber.strDoc;
          lbVlr.Caption         := 'R$ ' + FormatFloat('0.00',ContaReceber.floatVlr);
          ShowModal;
          fParcelaRecebimento.boolConf := false;
          if boolConfirm then begin
            while not fParcelaRecebimento.boolConf do begin
              if InputQuery('Parcelamento do recebimento: ( ' + ContaReceber.strProv + ' )','Informe a quantidade de parcelas!',strParc) then begin
                try
                  StrToInt(strParc);
                  if StrToInt(strParc) > 0 then begin
                    inc(intI);
                    fParcelaRecebimento.intI      := intI;
                    fParcelaRecebimento.strParc   := strParc;
                    fParcelaRecebimento.cdsLocal  := dmContas_Receber.cdsParcelamento;
                    fParcelaRecebimento.funcLocal := Self.funcLocal;
                    fParcelaRecebimento.ShowModal;
                    if fParcelaRecebimento.boolConf then begin
                      AlteraParcela(strCREC_ID,strParc,1);
                    end else begin
                      intI := 0;
                    end;
                  end;
                except
                end;
              end else begin
                intI    := 0;
                strParc := '-1';
                fParcelaRecebimento.boolConf := true;
              end;
            end;
          end;
        end;
      finally
        edtCod_Banco.ReadOnly        := false;
        fParcelaRecebimento.boolConf := true;
        FreeAndNil(fConfirmacao);
      end;
    end;
    try
      if cdsLocal.State = dsInsert then
        cdsLocal.FieldByName('CREC_NR_DOC').AsString := FormatDateTime('ddmmyyyyhhmmss',Now);
      cdsLocal.FieldByName('CREC_VIA_BANCO').AsInteger := funcLocal.Se(boolBanco,1,0);
      rdBancoClick(Sender);
      if edtVlr_Doc.CanFocus then
        edtVlr_Doc.SetFocus;
    except
    end;
  end else IsValidData;
end;

procedure TfCad_Contas_Receber.Label16Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(167);
end;

procedure TfCad_Contas_Receber.Label22Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(205);
end;

procedure TfCad_Contas_Receber.Label5Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(152);
end;

procedure TfCad_Contas_Receber.OpenClientDataSet(intPos: Integer = 99);
begin
  with dmContas_Receber do begin
    case intPos of
      1 : begin
        with cdsPesq_Cliente do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      2 : begin
        with cdsPesq_Plano_Contas do begin
          Close;
          Open;
        end;
      end;
      3 : begin
        with cdsPesq_Conta do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      4 : begin
        with cdsPesq_Tipo_Doc do begin
          Close;
          Open;
        end;
      end;
      5 : begin
        with cdsContas_Receber_Mov do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('CREC_ID').AsInteger := cdsContas_ReceberCREC_ID.AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end
      else begin
        OpenClientDataSet(1);
        OpenClientDataSet(2);
        OpenClientDataSet(3);
        OpenClientDataSet(4);
        OpenClientDataSet(5);
      end;
    end;
  end;
end;

procedure TfCad_Contas_Receber.rdBancoClick(Sender: TObject);
begin
  inherited;
  try
    case rdBanco.Checked of
      true : panelBanco(true);
      false : begin
        edtCod_Banco.Clear;
        edtCod_Banco.Modified := true;
        edtCod_BancoExit(Sender);
        panelBanco(false);
      end;
    end;
  except
  end;
end;

procedure TfCad_Contas_Receber.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Label5Click(Sender);
  edtCod_Clie.SetFocus;
end;

procedure TfCad_Contas_Receber.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Label16Click(Sender);
  edtCod_Plano.SetFocus;
end;

procedure TfCad_Contas_Receber.btnInsertBancoClick(Sender: TObject);
begin
  inherited;
  Label22Click(Sender);
  edtCod_Banco.SetFocus;
end;

procedure TfCad_Contas_Receber.PanelBanco(boolTMP : Boolean);
begin
  edtCod_Banco.Enabled  := boolTMP;
  btnPesq_Banco.Enabled := boolTMP;
  DBEdit3.Enabled       := boolTMP;
  DBEdit4.Enabled       := boolTMP;
  DBEdit8.Enabled       := boolTMP;
end;

procedure TfCad_Contas_Receber.btnPesq_BancoClick(Sender: TObject);
var
  strTMP,
  strTMPI : String;
  edtAtual,
  edtLim  : TRxDBCalcEdit;
begin
  OpenClientDataSet(3);
  strTMP := funcLocal.Busca_Registro(dmContas_Receber.cdsPesq_Conta,'BANCO','CBCO_ID;BANCO;COD_BANCO;SALDO_ATUAL;CBCO_LIMITE','');
  if strTMP <> '' then begin
    try
      cdsLocal.FieldByName('CREC_CBCO_ID').AsString     := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('BANCO').AsString            := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('COD_BANCO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
        edtAtual       := TRxDBCalcEdit.Create(nil);
        edtLim         := TRxDBCalcEdit.Create(nil);
        strTMPI        := funcLocal.Buscar_Coluna(strTMP,4);
        strTMPI        := StringReplace(strTMPI,'.','',[]);
        edtAtual.Value := StrToFloat(strTMPI);
        strTMPI        := funcLocal.Buscar_Coluna(strTMP,5);
        strTMPI        := StringReplace(strTMPI,'.','',[]);
        edtLim.Value   := StrToFloat(strTMPI);
      cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := edtAtual.Value;
      cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := edtLim.Value;
      edtCod_Banco.Modified := true;
    finally
      FreeAndNil(edtAtual);
      FreeAndNil(edtLim);
    end;
  end else begin
    cdsLocal.FieldByName('CREC_CBCO_ID').AsString     := '';
    cdsLocal.FieldByName('BANCO').AsString            := '';
    cdsLocal.FieldByName('COD_BANCO').AsString        := '';
    cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := 0;
    cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := 0;
  end;
  edtCod_Banco.SetFocus;
end;

procedure TfCad_Contas_Receber.btnPesq_ClieClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmContas_Receber do begin
    OpenClientDataSet(1);
    strTMP := funcLocal.Busca_Registro(cdsPesq_Cliente,'CLIE_FANTASIA','CLIE_ID;CLIE_FANTASIA','');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CREC_CLIE_ID').AsString      := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('CLIE_FANTASIA').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      edtCod_Clie.Modified := true;
    end else begin
      cdsLocal.FieldByName('CREC_CLIE_ID').AsString       := '';
      cdsLocal.FieldByName('CLIE_FANTASIA').AsString  := '';
    end;
  end;
  edtCod_Clie.SetFocus;
end;

procedure TfCad_Contas_Receber.btnPesq_DocClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmContas_Receber do begin
    OpenClientDataSet(4);
    strTMP := funcLocal.Busca_Registro(cdsPesq_Tipo_Doc,'GENE_DESCR','GENE_ID;GENE_DESCR','');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CREC_GENE_ID_TIPO_DOC').AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('TIPO_DOC').AsString              := funcLocal.Buscar_Coluna(strTMP,2);
      edtCod_Doc.Modified := true;
    end else begin
      cdsLocal.FieldByName('CREC_GENE_ID_TIPO_DOC').AsString := '';
      cdsLocal.FieldByName('TIPO_DOC').AsString              := '';
    end;
  end;
  edtCod_Doc.SetFocus;
end;

procedure TfCad_Contas_Receber.btnPesq_PlanoClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmContas_Receber do begin
    OpenClientDataSet(2);
    strTMP := funcLocal.Busca_Registro(cdsPesq_Plano_Contas,'PLCT_DESCRICAO','PLCT_ID;PLCT_COD_SIMPLIFICADO;PLCT_DESCRICAO','');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CREC_PLCT_ID').AsString          := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
      edtCod_Plano.Modified := true;
    end else begin
      cdsLocal.FieldByName('CREC_PLCT_ID').AsString          := '';
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := '';
      cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := '';
    end;
  end;
  edtCod_Plano.SetFocus;
end;

procedure TfCad_Contas_Receber.CarregaDados;
begin
  ContaReceber.strNr_Doc    := edtNr_Doc.Text;
  ContaReceber.strProv      := edtProveniente.Text;
  ContaReceber.strCod_Clie  := edtCod_Clie.Text;
  ContaReceber.strCliente   := edtCliente.Text;
  ContaReceber.strCod_Plct  := edtCod_Plano.Text;
  ContaReceber.strPlano     := edtCod_Simplif.Text+';'+edtPlano.Text;
  ContaReceber.strCod_Doc   := edtCod_Doc.Text;
  ContaReceber.strDoc       := edtDocumento.Text;
  ContaReceber.strObs       := DBMemo1.Text;
  ContaReceber.strCCRE_ID   := cdsLocal.FieldByName('CREC_CCRE_ID').AsString;
  ContaReceber.dtEmissao    := edtDt_Emissao.Date;
  ContaReceber.dtVecto      := edtDt_Vecto.Date;
  ContaReceber.strCod_Bco   := edtCod_Banco.Text;
  ContaReceber.floatVlr     := edtVlr_Doc.Value;
  ContaReceber.intBanco     := cdsLocal.FieldByName('CREC_VIA_BANCO').AsInteger;
  ContaReceber.intPrevisao  := cdsLocal.FieldByName('CREC_PREVISAO').AsInteger;
end;

procedure TfCad_Contas_Receber.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  try
    If odd(DBGrid1.DataSource.DataSet.RecNo) then begin
      DBGrid1.Canvas.Font.Color  := clBlack;
      DBGrid1.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      DBGrid1.Canvas.Font.Color  := clBlack;
      DBGrid1.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      DBGrid1.Canvas.Brush.Color := clSilver;
      DBGrid1.Canvas.Font.Style  := [fsBold];
    end;
     DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
end;

procedure TfCad_Contas_Receber.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  KeyPreview := false;
end;

procedure TfCad_Contas_Receber.DBMemo1Exit(Sender: TObject);
begin
  inherited;
  KeyPreview := true;
end;

procedure TfCad_Contas_Receber.edtCod_BancoExit(Sender: TObject);
var
  strTMP,
  strTMPI : String;
  edtAtual,
  edtLim  : TRxDBCalcEdit;
begin
  if not edtCod_Banco.Modified then Exit;
  if edtCod_Banco.Text <> '' then begin
    OpenClientDataSet(3);
    strTMP := funcLocal.Busca_Registro(dmContas_Receber.cdsPesq_Conta,'BANCO','CBCO_ID;BANCO;COD_BANCO;SALDO_ATUAL;CBCO_LIMITE','CBCO_ID = ' + edtCod_Banco.Text);
    if strTMP <> '' then begin
      try
        cdsLocal.FieldByName('CREC_CBCO_ID').AsString     := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('BANCO').AsString            := funcLocal.Buscar_Coluna(strTMP,2);
        cdsLocal.FieldByName('COD_BANCO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
          edtAtual       := TRxDBCalcEdit.Create(nil);
          edtLim         := TRxDBCalcEdit.Create(nil);
          strTMPI        := funcLocal.Buscar_Coluna(strTMP,4);
          strTMPI        := StringReplace(strTMPI,'.','',[]);
          edtAtual.Value := StrToFloat(strTMPI);
          strTMPI        := funcLocal.Buscar_Coluna(strTMP,5);
          strTMPI        := StringReplace(strTMPI,'.','',[]);
          edtLim.Value   := StrToFloat(strTMPI);
        cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := edtAtual.Value;
        cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := edtLim.Value;
        edtCod_Banco.Modified := true;
      finally
        FreeAndNil(edtAtual);
        FreeAndNil(edtLim);
      end;
    end else begin
      cdsLocal.FieldByName('CREC_CBCO_ID').AsString     := '';
      cdsLocal.FieldByName('BANCO').AsString            := '';
      cdsLocal.FieldByName('COD_BANCO').AsString        := '';
      cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := 0;
      cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := 0;
    end;
  end else begin
    cdsLocal.FieldByName('CREC_CBCO_ID').AsString     := '';
    cdsLocal.FieldByName('BANCO').AsString            := '';
    cdsLocal.FieldByName('COD_BANCO').AsString        := '';
    cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := 0;
    cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := 0;
  end;
end;

procedure TfCad_Contas_Receber.edtCod_ClieExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Clie.Modified then Exit;
  with dmContas_Receber do begin
    if edtCod_Clie.Text <> '' then begin
      OpenClientDataSet(1);
      strTMP := funcLocal.Busca_Registro(cdsPesq_Cliente,'CLIE_FANTASIA','CLIE_ID;CLIE_FANTASIA','CLIE_ID = ' + edtCod_Clie.Text);
      if strTMP <> '' then begin
        cdsLocal.FieldByName('CREC_CLIE_ID').AsString      := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('CLIE_FANTASIA').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      end else begin
        cdsLocal.FieldByName('CREC_CLIE_ID').AsString       := '';
        cdsLocal.FieldByName('CLIE_FANTASIA').AsString  := '';
      end;
    end else begin
      cdsLocal.FieldByName('CREC_CLIE_ID').AsString       := '';
      cdsLocal.FieldByName('CLIE_FANTASIA').AsString  := '';
    end;
  end;
end;

procedure TfCad_Contas_Receber.edtCod_ClieKeyPress(Sender: TObject;
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

procedure TfCad_Contas_Receber.edtCod_DocExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Doc.Modified then Exit;
  with dmContas_Receber do begin
    if edtCod_Doc.Text <> '' then begin
      OpenClientDataSet(4);
      strTMP := funcLocal.Busca_Registro(cdsPesq_Tipo_Doc,'GENE_DESCR','GENE_ID;GENE_DESCR','GENE_ID = ' + edtCod_Doc.Text);
      if strTMP <> '' then begin
        cdsLocal.FieldByName('CREC_GENE_ID_TIPO_DOC').AsString := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('TIPO_DOC').AsString              := funcLocal.Buscar_Coluna(strTMP,2);
        if (StrToInt(edtCod_Doc.Text) in [4,5]) then begin
          cdsLocal.FieldByName('CREC_VIA_BANCO').AsInteger     := 1;
          rdBancoClick(Sender);
          if edtCod_Banco.CanFocus then
            edtCod_Banco.SetFocus;
        end;
        edtCod_Doc.Modified := false;
      end else begin
        cdsLocal.FieldByName('CREC_GENE_ID_TIPO_DOC').AsString := '';
        cdsLocal.FieldByName('TIPO_DOC').AsString              := '';
        cdsLocal.FieldByName('CREC_CCRE_ID').AsString          := '';
        cdsLocal.FieldByName('CREC_CCRE_EMPR_ID').AsString     := '';
      end;
    end else begin
      cdsLocal.FieldByName('CREC_GENE_ID_TIPO_DOC').AsString := '';
      cdsLocal.FieldByName('TIPO_DOC').AsString              := '';
      cdsLocal.FieldByName('CREC_CCRE_ID').AsString          := '';
      cdsLocal.FieldByName('CREC_CCRE_EMPR_ID').AsString     := '';
    end;
    {try
      if funcLocal.VinculaCartaoCredito then begin
        strTMP := funcLocal.RetornaCartaoCredito(cdsLocal.FieldByName('CREC_GENE_ID_TIPO_DOC').AsInteger,edtVlr_Doc.Value,'C');
        LancaDadosCartao(strTMP);
      end;
    except
    end};
  end;
end;

procedure TfCad_Contas_Receber.LancaDadosCartao(strTMP : String);

function RetornaImagem(strCCRE_ID : String) : TStream;
var
  qryCons : TSQLQuery;
begin
  Result := nil;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT CCRE_IMAGE FROM CARTAO_CREDITO WHERE CCRE_ID = ' + strCCRE_ID);
      Open;
      cdsLocal.FieldByName('CCRE_IMAGE').Value := qryCons.FieldByName('CCRE_IMAGE').Value;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

var
  strSaque,
  strCompras : String;
begin
  try
    OcultaLabel(false);
    if (StrToInt(edtCod_Doc.Text) in [4,5]) then begin
      cdsLocal.FieldByName('CREC_CCRE_ID').AsString                := '';
      cdsLocal.FieldByName('CREC_CCRE_EMPR_ID').AsString           := '';
      cdsLocal.FieldByName('CCRE_ATIVO').AsString                  := '';
      cdsLocal.FieldByName('CCRE_TIPO_CARTAO').AsString            := '';
      cdsLocal.FieldByName('CCRE_NUMERO_CARTAO').AsString          := '';
      cdsLocal.FieldByName('CCRE_TITULAR').AsString                := '';
      cdsLocal.FieldByName('CCRE_LIMITE_SAQUE').AsString           := '';
      cdsLocal.FieldByName('CCRE_LIMITE_COMPRAS').AsString         := '';
      cdsLocal.FieldByName('CCRE_DIA_VCTO_FATURA').AsString        := '';
      cdsLocal.FieldByName('CCRE_DIA_FECHAMENTO_FATURA').AsString  := '';
      cdsLocal.FieldByName('CCRE_VENCIMENTO').AsString             := '';
      cdsLocal.FieldByName('CREC_DTA_VCTO').AsString               := '';
      cdsLocal.FieldByName('CREC_CBCO_ID').AsString                := '';
      cdsLocal.FieldByName('CREC_CBCO_EMPR_ID').AsString           := '';
    end;
    if Trim(strTMP) <> '' then begin
      cdsLocal.FieldByName('CREC_CCRE_ID').AsString                := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('CREC_CCRE_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
      cdsLocal.FieldByName('CCRE_ATIVO').AsString                  := 'Sim';
      cdsLocal.FieldByName('CCRE_TIPO_CARTAO').AsString            := funcLocal.Buscar_Coluna(strTMP,9);
      cdsLocal.FieldByName('CCRE_NUMERO_CARTAO').AsString          := funcLocal.Buscar_Coluna(strTMP,11);
      cdsLocal.FieldByName('CCRE_TITULAR').AsString                := funcLocal.Buscar_Coluna(strTMP,12);

      strSaque   := StringReplace(funcLocal.Buscar_Coluna(strTMP,4),'.','',[rfReplaceAll]);
      strCompras := StringReplace(funcLocal.Buscar_Coluna(strTMP,5),'.','',[rfReplaceAll]);

      cdsLocal.FieldByName('CCRE_LIMITE_SAQUE').AsFloat            := StrToFloat(strSaque);
      cdsLocal.FieldByName('CCRE_LIMITE_COMPRAS').AsFloat          := StrToFloat(strCompras);
      cdsLocal.FieldByName('CCRE_DIA_VCTO_FATURA').AsString        := funcLocal.Buscar_Coluna(strTMP,6);
      cdsLocal.FieldByName('CCRE_DIA_FECHAMENTO_FATURA').AsString  := funcLocal.Buscar_Coluna(strTMP,7);
      cdsLocal.FieldByName('CCRE_VENCIMENTO').AsString             := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('CREC_DTA_VCTO').AsString               := funcLocal.Buscar_Coluna(strTMP,8);
      cdsLocal.FieldByName('CREC_CBCO_ID').AsString                := funcLocal.Buscar_Coluna(strTMP,3);
      cdsLocal.FieldByName('CREC_CBCO_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
      edtCod_Banco.Text                                            := funcLocal.Buscar_Coluna(strTMP,3);
      edtCod_Banco.Modified                                        := true;
      edtCod_BancoExit(Self);
      RetornaImagem(funcLocal.Buscar_Coluna(strTMP,1));
      if funcLocal.TemPermissao('319') then begin
        lb20.Caption := funcLocal.Buscar_Coluna(strTMP,10);
      end else begin
        lb20.Caption := '0,00';
      end;
      OcultaLabel(true);
    end else begin
      if (StrToInt(edtCod_Doc.Text) in [4,5]) then begin
        cdsLocal.FieldByName('CREC_GENE_ID_TIPO_DOC').AsString       := '';
        cdsLocal.FieldByName('TIPO_DOC').AsString                    := '';
        edtCod_Doc.SetFocus;
      end;
      cdsLocal.FieldByName('CREC_VIA_BANCO').AsInteger             := 0;
      rdBancoClick(Self);
    end;
  finally
  end;
end;

procedure TfCad_Contas_Receber.OcultaLabel(boolValue : Boolean);
var
  intI   : Integer;
  objTMP : TObject;
begin
  for intI := 1 to 23 do begin
    objTMP := TObject(FindComponent('lb'+IntToStr(intI)));
    if (objTMP is TLabel) then
      TLabel(objTMP).Visible := boolValue;
    if (objTMP is TDBText) then
      TDBText(objTMP).Visible := boolValue;
    if (objTMP is TDBImage) then
      TDBImage(objTMP).Visible := boolValue;
  end;
  edtCod_Banco.Enabled   := not boolValue;
  btnPesq_Banco.Enabled  := not boolValue;
  btnInsertBanco.Enabled := not boolValue;
  rdBanco.Enabled        := not boolValue;
end;

procedure TfCad_Contas_Receber.edtCod_PlanoExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Plano.Modified then Exit;
  with dmContas_Receber do begin
    if edtCod_Plano.Text <> '' then begin
      OpenClientDataSet(2);
      strTMP := funcLocal.Busca_Registro(cdsPesq_Plano_Contas,'PLCT_DESCRICAO','PLCT_ID;PLCT_COD_SIMPLIFICADO;PLCT_DESCRICAO','PLCT_ID = ' + edtCod_Plano.Text);
      if strTMP <> '' then begin
        cdsLocal.FieldByName('CREC_PLCT_ID').AsString          := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := funcLocal.Buscar_Coluna(strTMP,2);
        cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
      end else begin
        cdsLocal.FieldByName('CREC_PLCT_ID').AsString          := '';
        cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := '';
        cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := '';
      end;
    end else begin
      cdsLocal.FieldByName('CREC_PLCT_ID').AsString          := '';
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := '';
      cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := '';
    end;
  end;
end;

procedure TfCad_Contas_Receber.FormCreate(Sender: TObject);
begin
  inherited;
  if ContaReceber = nil then
    ContaReceber := TConta.Create;
end;

procedure TfCad_Contas_Receber.FormShow(Sender: TObject);
begin
  inherited;
  if ContaReceber = nil then
    ContaReceber := TConta.Create;
  pageCadastro.Pages[0].Enabled := true;
  edtDtEfetivo.Enabled          := true;
  rdBanco.Enabled               := true;
  edtCod_Banco.Enabled          := true;
  btnPesq_Banco.Enabled         := true;
  edtDt_Emissao.Enabled         := true;
  edtDt_Vecto.Enabled           := true;
  edtVlr_Doc.Enabled            := true;
  edtVlr_Pago.Enabled           := true;
  edtCod_Doc.Enabled            := true;
  if (cdsLocal.FieldByName('CREC_STATUS').AsString = 'F') or
     (cdsLocal.FieldByName('CREC_STATUS').AsString = 'C') then begin
    pageCadastro.Pages[0].Enabled := false;
    if (cdsLocal.FieldByName('CREC_STATUS').AsString = 'F') and funcLocal.TemPermissao('539') then begin
      pageCadastro.Pages[0].Enabled := true;
      edtDtEfetivo.Enabled          := true;
      rdBanco.Enabled               := false;
      edtCod_Banco.Enabled          := false;
      btnPesq_Banco.Enabled         := false;
      edtDt_Emissao.Enabled         := false;
      edtDt_Vecto.Enabled           := false;
      edtVlr_Doc.Enabled            := false;
      edtVlr_Pago.Enabled           := false;
      edtCod_Doc.Enabled            := false;
      if edtDtEfetivo.Date = 0 then
        cdsLocal.FieldByName('CREC_DTA_EFETIVO').AsDateTime := edtDtPagto.Date;
    end;
  end else begin
    pageCadastro.Pages[0].Enabled := true;
    case rdBanco.Checked of
      true : panelBanco(true);
      false : begin
        edtCod_Banco.Clear;
        edtCod_Banco.Modified := true;
        edtCod_BancoExit(Sender);
        panelBanco(false);
      end;
    end;
  end;
  if cdsLocal.State = dsInsert then
    cdsLocal.FieldByName('CREC_NR_DOC').AsString := FormatDateTime('ddmmyyyyhhmmss',Now);
  LancamentoBancario;
  OpenClientDataSet(5);
  OcultaLabel(true);
  if (cdsLocal.FieldByName('CREC_CCRE_ID').AsString = '') or (not funcLocal.VinculaCartaoCredito) then begin
    OcultaLabel(false);
  end;
  if edtVlr_Doc.CanFocus then
    edtVlr_Doc.SetFocus
end;

procedure TfCad_Contas_Receber.LancamentoBancario;
begin
  if (cdsLocal.FieldByName('CREC_VIA_BANCO').AsInteger = 1) and (cdsLocal.FieldByName('CREC_VALOR_PAGO').AsFloat > 0) then begin
    rdBanco.ReadOnly      := true;
    edtCod_Banco.ReadOnly := true;
  end else begin
    rdBanco.ReadOnly      := false;
    edtCod_Banco.ReadOnly := false;
  end;
end;

function TfCad_Contas_Receber.ValidaDados : Boolean;
begin
  Result := true;
  if edtProveniente.Text = '' then begin
    funcLocal.Alerta('Informe a proveniência do documento antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtProveniente.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCod_Clie.Text = '' then begin
    funcLocal.Alerta('Informe o cliente antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtCod_Clie.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDt_Emissao.Date <= 0 then begin
    funcLocal.Alerta('Informe a data de emissão do título antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtDt_Emissao.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDt_Vecto.Date <= 0 then begin
    funcLocal.Alerta('Informe a data de vencimento do título antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtDt_Vecto.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDt_Vecto.Date < edtDt_Emissao.Date then begin
    funcLocal.Alerta('A data de vencimento do título não pode ser inferior a data de emissão.',1);
    pageCadastro.Pages[0].Show;
    edtDt_Emissao.SetFocus;
    Result := false;
    Exit;
  end;
  if (edtDtPagto.Date > 0) and (cdsLocal.FieldByName('CREC_STATUS').AsString = 'A') then begin
    if edtDtPagto.Date < edtDt_Vecto.Date then begin
      funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                       'A data de pagamento não pode ser inferior a data de vencimento do título!',0);
      pageCadastro.Pages[0].Show;
      edtDt_Vecto.SetFocus;
      Result := false;
      Exit;
    end;
  end;
  if edtVlr_Doc.Value <= 0 then begin
    funcLocal.Alerta('Informe o valor do documento antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtVlr_Doc.SetFocus;
    Result := false;
    Exit;
  end;
  if (edtVlr_Doc.Value < cdsLocal.FieldByName('CREC_VALOR_PAGO').AsFloat) and (cdsLocal.FieldByName('CREC_STATUS').AsString = 'A') then begin
    funcLocal.Alerta('Título já com movimentação financeira, não e permitido alterar o valor do título abaixo do valor já recebido.',1);
    pageCadastro.Pages[0].Show;
    edtVlr_Doc.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCod_Plano.Text = '' then begin
    funcLocal.Alerta('Informe o plano de contas antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtCod_Plano.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCod_Doc.Text = '' then begin
    funcLocal.Alerta('Informe o tipo do documento antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtCod_Doc.SetFocus;
    Result := false;
    Exit;
  end;
  if (cdsLocal.State = dsInsert) then begin
    if DocJaLancado then begin
      if funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                          'Já consta no sistema um título '+
                          'com o mesmo número de documento, se você continuar estará '+
                          'provavelmente duplicando o título.'+#13+#13+
                          'Deseja continuar?',1,true) = 7 then begin
        pageCadastro.Pages[0].Show;
        edtNr_Doc.SetFocus;
        Result := false;
        Exit;
      end;
    end;
    if cdsLocal.FieldByName('CREC_PREVISAO').AsInteger = 1 then begin
      if JaExistePrevisao() then begin
        funcLocal.Alerta('ATENÇÃO!!!'+#13+#13+
                         'Já consta no sistema uma previsão para o Plano de Contas Informado!'+#13+#13+
                         cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString + ' - ' +
                         cdsLocal.FieldByName('PLCT_DESCRICAO').AsString,0);
        Result := false;
        Exit;
      end;
    end;
  end;
  if rdBanco.Checked then begin
    if edtCod_Banco.Text = '' then begin
      funcLocal.Alerta('Informe a conta bancaria que será efetuado o recebimento antes de continuar.',1);
      pageCadastro.Pages[0].Show;
      try
        edtCod_Banco.SetFocus;
      except
      end;
      Result := false;
      Exit;
    end;
  end;
  if (StrToInt(edtCod_Doc.Text) in [4,5]) and (not rdBanco.Checked) then begin
    funcLocal.Alerta('Movimentações em cartão necessitam estar vinculados a uma conta bancária!',0);
    pageCadastro.Pages[0].Show;
    edtCod_Doc.SetFocus;
    Result := false;
    Exit;
  end;
end;

function TfCad_Contas_Receber.JaExistePrevisao() : Boolean;
var
  qryCons : TSQLQuery;
  Dia, Mes, Ano : Word;
begin
  try
    Result  := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    DecodeDate(cdsLocal.FieldByName('CREC_DTA_VCTO').AsDateTime,Ano,Mes,Dia);
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT COUNT(*)');
        sql.Add('  FROM CONTAS_RECEBER');
        sql.Add(' WHERE CREC_ID                          <> ' + cdsLocal.FieldByName('CREC_ID').AsString);
        sql.Add('   AND CREC_EMPR_ID                      = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('   AND CREC_PLCT_ID                      = ' + cdsLocal.FieldByName('CREC_PLCT_ID').AsString);
        sql.Add('   AND CREC_PREVISAO                     = 1 ');
        sql.Add('   AND EXTRACT(MONTH FROM CREC_DTA_VCTO) = ' + IntToStr(Mes));
        sql.Add('   AND EXTRACT(YEAR  FROM CREC_DTA_VCTO) = ' + IntToStr(Ano));
        Open;
        Result := qryCons.Fields[0].AsInteger > 0;
      end;
    except
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfCad_Contas_Receber.DocJaLancado : Boolean;
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
        sql.Add('FROM  CONTAS_RECEBER');
        sql.Add('WHERE CREC_ID     <> ' + cdsLocal.FieldByName('CREC_ID').AsString);
        sql.Add('AND   CREC_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   CREC_NR_DOC  = ' + QuotedStr(cdsLocal.FieldByName('CREC_NR_DOC').AsString));
        Open;
        if qryCons.Fields[0].AsInteger > 0 then begin
          Result := true;
          Exit;
        end;
      end;
    except
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

initialization
  if fCad_Contas_Receber = nil then
    fCad_Contas_Receber := TfCad_Contas_Receber.Create(nil);
finalization
  FreeAndNil(fCad_Contas_Receber);

end.
