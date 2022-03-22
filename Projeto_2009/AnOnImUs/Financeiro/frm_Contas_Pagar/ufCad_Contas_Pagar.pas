unit ufCad_Contas_Pagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit, DB,
  RXDBCtrl, Mask, DBCtrls, rxCurrEdit, SQLExpr, Grids, DBGrids;

type
  TConta = class
    strNr_Doc,
    strProv,
    strCod_Forn,
    strFornec,
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
    intPrevisao,
    intBanco    : Integer;
  end;

  TfCad_Contas_Pagar = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtNr_Doc: TDBEdit;
    Label4: TLabel;
    edtProveniente: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtCod_Fornec: TDBEdit;
    Label9: TLabel;
    edtFornecedor: TDBEdit;
    btnPesq_Forn: TSpeedButton;
    edtDt_Emissao: TDBDateEdit;
    edtDtPagto: TDBDateEdit;
    edtDt_Vecto: TDBDateEdit;
    Label10: TLabel;
    Label13: TLabel;
    edtVlr_Doc: TRxDBCalcEdit;
    Label14: TLabel;
    edtCod_Plano: TDBEdit;
    Label15: TLabel;
    edtPlano: TDBEdit;
    btnPesq_Plano: TSpeedButton;
    Label16: TLabel;
    edtCod_Simplif: TDBEdit;
    Label17: TLabel;
    edtCod_Doc: TDBEdit;
    Label18: TLabel;
    edtDocumento: TDBEdit;
    btnPesq_Doc: TSpeedButton;
    DBMemo1: TDBMemo;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit12: TDBEdit;
    DBDateEdit7: TDBDateEdit;
    rdStatus: TDBRadioGroup;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    edtVlrPlanejado: TRxCalcEdit;
    edtVlrComprometido: TRxCalcEdit;
    Label25: TLabel;
    edtDtEfetivo: TDBDateEdit;
    DBCheckBox1: TDBCheckBox;
    Panel2: TPanel;
    lb21: TLabel;
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
    lb22: TDBImage;
    edtVlr_Pago: TDBEdit;
    GroupBox2: TGroupBox;
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
    rdBanco: TDBCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCod_FornecKeyPress(Sender: TObject; var Key: Char);
    procedure edtCod_FornecExit(Sender: TObject);
    procedure btnPesq_FornClick(Sender: TObject);
    procedure btnPesq_PlanoClick(Sender: TObject);
    procedure edtCod_PlanoExit(Sender: TObject);
    procedure edtCod_DocExit(Sender: TObject);
    procedure btnPesq_DocClick(Sender: TObject);
    procedure edtCod_BancoExit(Sender: TObject);
    procedure btnPesq_BancoClick(Sender: TObject);
    procedure rdBancoClick(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label22Click(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnInsertBancoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Label8Click(Sender: TObject);
  private
    function  ValidaDados: Boolean;
    procedure CarregaDados;
    function  TemLimitenoPlano(strCod_ID : String; floatValor : Real; out boolConciliado : Boolean;
      out fltValor : Real; out fltSoma : Real) : Boolean;
    procedure LancamentoBancario;
    procedure PanelBanco(boolTMP: Boolean);
    procedure OpenClientDataSet(intPos: Integer = 99);
    function  DocJaLancado: Boolean;
    function JaExistePrevisao: Boolean;
    procedure LancaDadosCartao(strTMP: String);
    procedure OcultaLabel(boolValue: Boolean);
    { Private declarations }
  public
    ContaPagar : TConta;
  end;

var
  fCad_Contas_Pagar: TfCad_Contas_Pagar;
  dtDtPagto : TDate;
  strCPAG_ID : String;

implementation

uses udmContas_Pagar, ufMensagem, ufParcelasContasPagar;

{$R *.dfm}

procedure TfCad_Contas_Pagar.btnOkClick(Sender: TObject);

{$REGION 'AlteraParcela'}
  procedure AlteraParcela(strCPAG_ID, strParc : String; intI : Integer);
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
          sql.Add('UPDATE CONTAS_PAGAR');
          sql.Add('SET    CPAG_PROVENIENTE = CPAG_PROVENIENTE || ' + Trim(QuotedStr(' ') + '|| ' + QuotedStr(strPar)));
          sql.Add('WHERE  CPAG_ID          = ' + strCPAG_ID);
          sql.Add('AND    CPAG_EMPR_ID     = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL();
          try
            funcLocal.Commit
          except
          end;
        end;
      except on e: exception do begin
        funcLocal.RollBack;
        funcLocal.Alerta('Erro no processo de parcelamento da dívida.'+#13+'['+e.Message+']',1);
        funcLocal.ReportaErro('TfCad_Contas_Pagar','AlteraParcela',e.Message);
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
  strCPAG_ID := cdsLocal.FieldByName('CPAG_ID').AsString;
  if ValidaDados then begin
    if cdsLocal.State = dsInsert then begin
      boolInsert := true;
      CarregaDados;
    end;
    boolBanco := (cdsLocal.FieldByName('CPAG_VIA_BANCO').AsInteger = 1);
    inherited;
    edtVlrPlanejado.Clear;
    edtVlrComprometido.Clear;
    if boolInsert then begin
      try
        if cdsLocal.FieldByName('CPAG_PREVISAO').AsInteger = 0 then
          funcLocal.BaixarContaReceberPrevisto(ContaPagar.dtVecto,
                                              (ContaPagar.floatVlr*-1),
                                               ContaPagar.strCod_Plct);
        if fMensagem = nil then
          fMensagem := TfMensagem.Create(nil);
        with fMensagem do begin
          lbProveniente.Caption := ContaPagar.strProv;
          lbFornecedor.Caption  := ContaPagar.strCod_Forn + ' - ' + ContaPagar.strFornec;
          lbPlano.Caption       := funcLocal.Buscar_Coluna(ContaPagar.strPlano,1) + ' - ' + funcLocal.Buscar_Coluna(ContaPagar.strPlano,2);
          lbTipo_doc.Caption    := ContaPagar.strCod_Doc  + ' - ' + ContaPagar.strDoc;
          lbVlr.Caption         := 'R$ ' + FormatFloat('0.00',ContaPagar.floatVlr);
          ShowModal;
          fParcelamento.boolConf := false;
          if boolConfirm then begin
            while not fParcelamento.boolConf do begin
              if InputQuery('Parcelamento da dívida: ( ' + ContaPagar.strProv + ' )','Informe a quantidade de parcelas!',strParc) then begin
                try
                  StrToInt(strParc);
                  if StrToInt(strParc) > 0 then begin
                    inc(intI);
                    fParcelamento.intI      := intI;
                    fParcelamento.strParc   := strParc;
                    fParcelamento.cdsLocal  := dmContas_Pagar.cdsContasPagarParcela;
                    fParcelamento.funcLocal := Self.funcLocal;
                    fParcelamento.ShowModal;
                    if fParcelamento.boolConf then begin
                      AlteraParcela(strCPAG_ID,strParc,1);
                    end else begin
                      intI := 0;
                    end;
                  end;
                except
                end;
              end else begin
                intI    := 0;
                strParc := '-1';
                fParcelamento.boolConf := true;
              end;
            end;
          end;
        end;
      finally
        FreeAndNil(fMensagem);
        fParcelamento.boolConf := false;
      end;
    end;
    try
      if cdsLocal.State = dsInsert then
        cdsLocal.FieldByName('CPAG_NR_DOC').AsString   := FormatDateTime('ddmmyyyyhhmmss',Now);
      cdsLocal.FieldByName('CPAG_VIA_BANCO').AsInteger := funcLocal.Se(boolBanco,1,0);
      rdBancoClick(Sender);
      if edtVlr_Doc.CanFocus then
        edtVlr_Doc.SetFocus;
    except
    end;
  end else IsValidData;
end;

procedure TfCad_Contas_Pagar.Label14Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(167);
end;

procedure TfCad_Contas_Pagar.Label22Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(205);
end;

procedure TfCad_Contas_Pagar.Label8Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(144);
end;

procedure TfCad_Contas_Pagar.CarregaDados;
begin
  if ContaPagar = nil then
    ContaPagar := TConta.Create;
  ContaPagar.strNr_Doc    := edtNr_Doc.Text;
  ContaPagar.strProv      := edtProveniente.Text;
  ContaPagar.strCod_Forn  := edtCod_Fornec.Text;
  ContaPagar.strFornec    := edtFornecedor.Text;
  ContaPagar.strCod_Plct  := edtCod_Plano.Text;
  ContaPagar.strPlano     := edtCod_Simplif.Text+';'+edtPlano.Text;
  ContaPagar.strCod_Doc   := edtCod_Doc.Text;
  ContaPagar.strDoc       := edtDocumento.Text;
  ContaPagar.strObs       := DBMemo1.Text;
  ContaPagar.dtEmissao    := edtDt_Emissao.Date;
  ContaPagar.dtVecto      := edtDt_Vecto.Date;
  ContaPagar.strCod_Bco   := edtCod_Banco.Text;
  ContaPagar.floatVlr     := edtVlr_Doc.Value;
  ContaPagar.intBanco     := cdsLocal.FieldByName('CPAG_VIA_BANCO').AsInteger;
  ContaPagar.intPrevisao  := cdsLocal.FieldByName('CPAG_PREVISAO').AsInteger;
  ContaPagar.strCCRE_ID   := cdsLocal.FieldByName('CPAG_CCRE_ID').AsString;
end;

procedure TfCad_Contas_Pagar.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfCad_Contas_Pagar.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  KeyPreview := false;
end;

procedure TfCad_Contas_Pagar.DBMemo1Exit(Sender: TObject);
begin
  inherited;
  KeyPreview := true;
end;

procedure TfCad_Contas_Pagar.rdBancoClick(Sender: TObject);
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

procedure TfCad_Contas_Pagar.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Label8Click(Sender);
  edtCod_Fornec.SetFocus;
end;

procedure TfCad_Contas_Pagar.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Label14Click(Sender);
  edtCod_Plano.SetFocus;
end;

procedure TfCad_Contas_Pagar.btnInsertBancoClick(Sender: TObject);
begin
  inherited;
  Label22Click(Sender);
  edtCod_Banco.SetFocus;
end;

procedure TfCad_Contas_Pagar.PanelBanco(boolTMP : Boolean);
begin
  edtCod_Banco.Enabled  := boolTMP;
  btnPesq_Banco.Enabled := boolTMP;
  DBEdit3.Enabled       := boolTMP;
  DBEdit4.Enabled       := boolTMP;
  DBEdit8.Enabled       := boolTMP;
end;

procedure TfCad_Contas_Pagar.btnPesq_BancoClick(Sender: TObject);
var
  strTMP,
  strTMPI : String;
  edtAtual,
  edtLim : TRxDBCalcEdit;
begin
  with dmContas_Pagar do begin
    OpenClientDataSet(3);
    strTMP := funcLocal.Busca_Registro(cdsPesq_Conta,'BANCO','CBCO_ID;BANCO;COD_BANCO;SALDO_ATUAL;CBCO_LIMITE','');
    if strTMP <> '' then begin
      try
        cdsLocal.FieldByName('CPAG_CBCO_ID').AsString     := funcLocal.Buscar_Coluna(strTMP,1);
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
      cdsLocal.FieldByName('CPAG_CBCO_ID').AsString     := '';
      cdsLocal.FieldByName('BANCO').AsString            := '';
      cdsLocal.FieldByName('COD_BANCO').AsString        := '';
      cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := 0;
      cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := 0;
    end;
  end;
  edtCod_Banco.SetFocus;
end;

procedure TfCad_Contas_Pagar.btnPesq_DocClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmContas_Pagar do begin
    OpenClientDataSet(4);
    strTMP := funcLocal.Busca_Registro(cdsPesq_Tipo_Doc,'GENE_DESCR','GENE_ID;GENE_DESCR','');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CPAG_GENE_ID_TIPO_DOC').AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('TIPO_DOC').AsString              := funcLocal.Buscar_Coluna(strTMP,2);
      edtCod_Doc.Modified := true;
    end else begin
      cdsLocal.FieldByName('CPAG_GENE_ID_TIPO_DOC').AsString := '';
      cdsLocal.FieldByName('TIPO_DOC').AsString              := '';
    end;
  end;
  edtCod_Doc.SetFocus;
end;

procedure TfCad_Contas_Pagar.btnPesq_FornClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmContas_Pagar do begin
    OpenClientDataSet(1);
    strTMP := funcLocal.Busca_Registro(cdsPesq_Fornecedor,'FORN_NOME_FANTASIA','FORN_ID;FORN_NOME_FANTASIA','');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CPAG_FORN_ID').AsString       := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      edtCod_Fornec.Modified := true;
    end else begin
      cdsLocal.FieldByName('CPAG_FORN_ID').AsString       := '';
      cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := '';
    end;
  end;
  edtCod_Fornec.SetFocus;
end;

procedure TfCad_Contas_Pagar.btnPesq_PlanoClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmContas_Pagar do begin
    OpenClientDataSet(2);
    strTMP := funcLocal.Busca_Registro(cdsPesq_Plano_Contas,'PLCT_DESCRICAO','PLCT_ID;PLCT_COD_SIMPLIFICADO;PLCT_DESCRICAO','');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CPAG_PLCT_ID').AsString          := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
      edtCod_Plano.Modified := true;
    end else begin
      cdsLocal.FieldByName('CPAG_PLCT_ID').AsString          := '';
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := '';
      cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := '';
    end;
  end;
  edtCod_Plano.SetFocus;
end;

procedure TfCad_Contas_Pagar.edtCod_BancoExit(Sender: TObject);
var
  strTMP,
  strTMPI : String;
  edtAtual,
  edtLim  : TRxDBCalcEdit;
begin
  if not edtCod_Banco.Modified then Exit;
  if edtCod_Banco.Text <> '' then begin
    OpenClientDataSet(3);
    strTMP := funcLocal.Busca_Registro(dmContas_Pagar.cdsPesq_Conta,'BANCO','CBCO_ID;BANCO;COD_BANCO;SALDO_ATUAL;CBCO_LIMITE','CBCO_ID = ' + edtCod_Banco.Text);
    if strTMP <> '' then begin
      try
        cdsLocal.FieldByName('CPAG_CBCO_ID').AsString     := funcLocal.Buscar_Coluna(strTMP,1);
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
      finally
        FreeAndNil(edtAtual);
        FreeAndNil(edtLim);
      end;
    end else begin
      cdsLocal.FieldByName('CPAG_CBCO_ID').AsString     := '';
      cdsLocal.FieldByName('BANCO').AsString            := '';
      cdsLocal.FieldByName('COD_BANCO').AsString        := '';
      cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := 0;
      cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := 0;
    end;
  end else begin
    cdsLocal.FieldByName('CPAG_CBCO_ID').AsString     := '';
    cdsLocal.FieldByName('BANCO').AsString            := '';
    cdsLocal.FieldByName('COD_BANCO').AsString        := '';
    cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := 0;
    cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := 0;
  end;
end;

procedure TfCad_Contas_Pagar.edtCod_DocExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Doc.Modified then Exit;
  with dmContas_Pagar do begin
    if edtCod_Doc.Text <> '' then begin
      OpenClientDataSet(4);
      strTMP := funcLocal.Busca_Registro(cdsPesq_Tipo_Doc,'GENE_DESCR','GENE_ID;GENE_DESCR','GENE_ID = ' + edtCod_Doc.Text);
      if strTMP <> '' then begin
        cdsLocal.FieldByName('CPAG_GENE_ID_TIPO_DOC').AsString := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('TIPO_DOC').AsString              := funcLocal.Buscar_Coluna(strTMP,2);
        if (StrToInt(edtCod_Doc.Text) in [4,5]) then begin
          cdsLocal.FieldByName('CPAG_VIA_BANCO').AsInteger     := 1;
          rdBancoClick(Sender);
          try
            edtCod_Banco.SetFocus;
          except
          end;
        end;
        edtCod_Doc.Modified := false;
      end else begin
        cdsLocal.FieldByName('CPAG_GENE_ID_TIPO_DOC').AsString := '';
        cdsLocal.FieldByName('TIPO_DOC').AsString              := '';
        cdsLocal.FieldByName('CPAG_CCRE_ID').AsString          := '';
        cdsLocal.FieldByName('CPAG_CCRE_EMPR_ID').AsString     := '';
      end;
    end else begin
      cdsLocal.FieldByName('CPAG_GENE_ID_TIPO_DOC').AsString := '';
      cdsLocal.FieldByName('TIPO_DOC').AsString              := '';
      cdsLocal.FieldByName('CPAG_CCRE_ID').AsString          := '';
      cdsLocal.FieldByName('CPAG_CCRE_EMPR_ID').AsString     := '';
    end;
    try
      if funcLocal.VinculaCartaoCredito then begin
        strTMP := funcLocal.RetornaCartaoCredito(cdsLocal.FieldByName('CPAG_GENE_ID_TIPO_DOC').AsInteger,edtVlr_Doc.Value,'D');
        LancaDadosCartao(strTMP);
      end;
    except
    end;
  end;
end;

procedure TfCad_Contas_Pagar.OcultaLabel(boolValue : Boolean);
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

procedure TfCad_Contas_Pagar.LancaDadosCartao(strTMP : String);

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
      cdsLocal.FieldByName('CPAG_CCRE_ID').AsString                := '';
      cdsLocal.FieldByName('CPAG_CCRE_EMPR_ID').AsString           := '';
      cdsLocal.FieldByName('CCRE_ATIVO').AsString                  := '';
      cdsLocal.FieldByName('CCRE_TIPO_CARTAO').AsString            := '';
      cdsLocal.FieldByName('CCRE_NUMERO_CARTAO').AsString          := '';
      cdsLocal.FieldByName('CCRE_TITULAR').AsString                := '';
      cdsLocal.FieldByName('CCRE_LIMITE_SAQUE').AsString           := '';
      cdsLocal.FieldByName('CCRE_LIMITE_COMPRAS').AsString         := '';
      cdsLocal.FieldByName('CCRE_DIA_VCTO_FATURA').AsString        := '';
      cdsLocal.FieldByName('CCRE_DIA_FECHAMENTO_FATURA').AsString  := '';
      cdsLocal.FieldByName('CCRE_VENCIMENTO').AsString             := '';
      cdsLocal.FieldByName('CPAG_DTA_VCTO').AsString               := '';
      cdsLocal.FieldByName('CPAG_CBCO_ID').AsString                := '';
      cdsLocal.FieldByName('CPAG_CBCO_EMPR_ID').AsString           := '';
    end;
    if Trim(strTMP) <> '' then begin
      cdsLocal.FieldByName('CPAG_CCRE_ID').AsString                := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('CPAG_CCRE_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
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
      cdsLocal.FieldByName('CPAG_DTA_VCTO').AsString               := funcLocal.Buscar_Coluna(strTMP,8);
      cdsLocal.FieldByName('CPAG_CBCO_ID').AsString                := funcLocal.Buscar_Coluna(strTMP,3);
      cdsLocal.FieldByName('CPAG_CBCO_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
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
        cdsLocal.FieldByName('CPAG_GENE_ID_TIPO_DOC').AsString       := '';
        cdsLocal.FieldByName('TIPO_DOC').AsString                    := '';
        edtCod_Doc.SetFocus;
      end;
      cdsLocal.FieldByName('CPAG_VIA_BANCO').AsInteger             := 0;
      rdBancoClick(Self);
    end;
  finally
  end;
end;

procedure TfCad_Contas_Pagar.edtCod_FornecExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Fornec.Modified then Exit;
  with dmContas_Pagar do begin
    if edtCod_Fornec.Text <> '' then begin
      OpenClientDataSet(1);
      strTMP := funcLocal.Busca_Registro(cdsPesq_Fornecedor,'FORN_NOME_FANTASIA','FORN_ID;FORN_NOME_FANTASIA','FORN_ID = ' + edtCod_Fornec.Text);
      if strTMP <> '' then begin
        cdsLocal.FieldByName('CPAG_FORN_ID').AsString       := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      end else begin
        cdsLocal.FieldByName('CPAG_FORN_ID').AsString       := '';
        cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := '';
      end;
    end else begin
      cdsLocal.FieldByName('CPAG_FORN_ID').AsString       := '';
      cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := '';
    end;
  end;
end;

procedure TfCad_Contas_Pagar.edtCod_FornecKeyPress(Sender: TObject;
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

procedure TfCad_Contas_Pagar.edtCod_PlanoExit(Sender: TObject);
var
  strTMP : String;
begin
  if (not edtCod_Plano.Modified) then Exit;
  with dmContas_Pagar do begin
    if edtCod_Plano.Text <> '' then begin
      OpenClientDataSet(2);
      strTMP := funcLocal.Busca_Registro(cdsPesq_Plano_Contas,'PLCT_DESCRICAO','PLCT_ID;PLCT_COD_SIMPLIFICADO;PLCT_DESCRICAO','PLCT_ID = ' + edtCod_Plano.Text);
      if strTMP <> '' then begin
        cdsLocal.FieldByName('CPAG_PLCT_ID').AsString          := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := funcLocal.Buscar_Coluna(strTMP,2);
        cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
        funcLocal.ValorPlanejado(cdsLocal.FieldByName('CPAG_PLCT_ID').AsString,edtVlrPlanejado,edtVlrComprometido,edtDt_Vecto.Date);
      end else begin
        cdsLocal.FieldByName('CPAG_PLCT_ID').AsString          := '';
        cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := '';
        cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := '';
      end;
    end else begin
      cdsLocal.FieldByName('CPAG_PLCT_ID').AsString          := '';
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := '';
      cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := '';
    end;
  end;
end;

procedure TfCad_Contas_Pagar.FormCreate(Sender: TObject);
begin
  inherited;
  if ContaPagar = nil then
    ContaPagar := TConta.Create;
end;

procedure TfCad_Contas_Pagar.FormShow(Sender: TObject);
begin
  inherited;
  if ContaPagar = nil then
    ContaPagar := TConta.Create;
  pageCadastro.Pages[0].Enabled := True;
  edtDtEfetivo.Enabled          := True;
  rdBanco.Enabled               := True;
  edtCod_Banco.Enabled          := True;
  btnPesq_Banco.Enabled         := True;
  edtDt_Emissao.Enabled         := True;
  edtDt_Vecto.Enabled           := True;
  edtVlr_Doc.Enabled            := True;
  edtVlr_Pago.Enabled           := True;
  edtCod_Doc.Enabled            := True;
  if (cdsLocal.FieldByName('CPAG_STATUS').AsString = 'F') or
     (cdsLocal.FieldByName('CPAG_STATUS').AsString = 'C') then begin
    pageCadastro.Pages[0].Enabled := false;
    if (cdsLocal.FieldByName('CPAG_STATUS').AsString = 'F') and funcLocal.TemPermissao('539') then begin
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
        cdsLocal.FieldByName('CPAG_DTA_EFETIVO').AsDateTime := edtDtPagto.Date;
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
    cdsLocal.FieldByName('CPAG_NR_DOC').AsString := FormatDateTime('ddmmyyyyhhmmss',Now);
  ContaPagar.strPlano_ID := cdsLocal.FieldByName('CPAG_PLCT_ID').AsString;
  OpenClientDataSet(4);
  OpenClientDataSet(5);
  LancamentoBancario;
  funcLocal.ValorPlanejado(cdsLocal.FieldByName('CPAG_PLCT_ID').AsString,edtVlrPlanejado,edtVlrComprometido,edtDt_Vecto.Date);
  OcultaLabel(true);
  if (cdsLocal.FieldByName('CPAG_CCRE_ID').AsString = '') or (not funcLocal.VinculaCartaoCredito) then begin
    OcultaLabel(false);
  end;
  if edtVlr_Doc.CanFocus then
    edtVlr_Doc.SetFocus
end;

procedure TfCad_Contas_Pagar.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmContas_Pagar do begin
    case intPos of
      1 : begin
        with cdsPesq_Fornecedor do begin
          Close;
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
        with cdsContas_Pagar_Mov do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('CPAG_ID').AsInteger := cdsContas_PagarCPAG_ID.AsInteger;
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

procedure TfCad_Contas_Pagar.LancamentoBancario;
begin
  if (cdsLocal.FieldByName('CPAG_VIA_BANCO').AsInteger = 1) and (cdsLocal.FieldByName('CPAG_VALOR_PAGO').AsFloat > 0) then begin
    rdBanco.ReadOnly      := true;
    edtCod_Banco.ReadOnly := true;
  end else begin
    rdBanco.ReadOnly      := false;
    edtCod_Banco.ReadOnly := false;
  end;
end;

function TfCad_Contas_Pagar.ValidaDados : Boolean;
var
  boolConciliado : Boolean;
  fltSoma,
  fltValor       : Real;
begin
  Result := true;
  if edtProveniente.Text = '' then begin
    funcLocal.Alerta('Informe a proveniência do título antes de continuar.',1);
    edtProveniente.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCod_Fornec.Text = '' then begin
    funcLocal.Alerta('Informe o fornecedor antes de continuar.',1);
    edtCod_Fornec.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDt_Emissao.Date <= 0 then begin
    funcLocal.Alerta('Informe a data de emissão do título antes de continuar.',1);
    edtDt_Emissao.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDt_Vecto.Date <= 0 then begin
    funcLocal.Alerta('Informe a data de vencimento do título antes de continuar.',1);
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
  if (edtDtPagto.Date > 0) and (cdsLocal.FieldByName('CPAG_STATUS').AsString = 'A') then begin
    if edtDtPagto.Date < edtDt_Vecto.Date then begin
      funcLocal.Alerta('A data de recebimento não pode ser inferior a data de vencimento do título!',0);
      pageCadastro.Pages[0].Show;
      edtDt_Vecto.SetFocus;
      Result := false;
      Exit;
    end;
  end;
  if edtVlr_Doc.Value <= 0 then begin
    funcLocal.Alerta('Informe o valor do título antes de continuar.',1);
    edtVlr_Doc.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCod_Plano.Text = '' then begin
    funcLocal.Alerta('Informe o plano de contas antes de continuar.',1);
    edtCod_Plano.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCod_Doc.Text = '' then begin
    funcLocal.Alerta('Informe o tipo do documento antes de continuar.',1);
    edtCod_Doc.SetFocus;
    Result := false;
    Exit;
  end;
  if rdBanco.Checked then begin
    if edtCod_Banco.Text = '' then begin
      funcLocal.Alerta('Informe a conta bancaria que será efetuado o pagamento antes de continuar.',1);
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
    edtCod_Doc.SetFocus;
    Result := false;
    Exit;
  end;
  if cdsLocal.State = dsInsert then begin
    if DocJaLancado then begin
      if funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                          'Já consta no sistema um título '+
                          'com o mesmo número de documento, se você continuar estará '+
                          'provavelmente duplicando o título.'+#13+#13+
                          'Deseja continuar?',1,true) = 7 then begin
        edtNr_Doc.SetFocus;
        Result := false;
        Exit;
      end;
    end;
    if cdsLocal.FieldByName('CPAG_PREVISAO').AsInteger = 1 then begin
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
  if (cdsLocal.FieldByName('CPAG_STATUS').AsString = 'A') then begin
    if (cdsLocal.State = dsInsert) or (edtCod_Plano.Text <> ContaPagar.strPlano_ID) then begin
      if not TemLimitenoPlano(edtCod_Plano.Text,edtVlr_Doc.Value, boolConciliado, fltValor,fltSoma) then begin
        if boolConciliado then begin
          funcLocal.Alerta('Limite de crédito para o plano de contas [ '+edtCod_Simplif.Text + ' - ' +edtPlano.Text+' ] no mês informado já foi atingido.'+#13+#13+
                           'Valor Planejado R$ ' + FormatFloat('###,###,##0.00',fltValor)+#13+
                           'Valor lançado    R$ ' + FormatFloat('###,###,##0.00',fltSoma)+#13+#13+
                           'Verifique o seu replanejamento para o plano de contas [ '+edtCod_Simplif.Text + ' - ' +edtPlano.Text+' ] no mês informado antes de continuar.',1);
          edtCod_Plano.SetFocus;
          Result := false;
          Exit;
        end else begin
          if funcLocal.Alerta('Limite de crédito para o plano de contas [ '+edtCod_Simplif.Text + ' - ' +edtPlano.Text+' ] no mês informado já foi atingido.'+#13+#13+
                              'Valor Planejado R$ ' + FormatFloat('###,###,##0.00',fltValor)+#13+
                              'Valor lançado    R$ ' + FormatFloat('###,###,##0.00',fltSoma)+#13+#13+
                              'Se continuar o seu limite de crédito para o plano de contas [ '+edtCod_Simplif.Text + ' - ' +edtPlano.Text+' ] no mês informado será ultrapassado.'+#13+#13+'Deseja continuar?',1,true) = 7 then begin
            edtCod_Plano.SetFocus;
            Result := false;
            Exit;
          end;
        end;
      end;
    end;
  end;
end;

function TfCad_Contas_Pagar.JaExistePrevisao() : Boolean;
var
  qryCons : TSQLQuery;
  Dia, Mes, Ano : Word;
begin
  try
    Result  := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    DecodeDate(cdsLocal.FieldByName('CPAG_DTA_VCTO').AsDateTime,Ano,Mes,Dia);
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT COUNT(*)');
        sql.Add('  FROM CONTAS_PAGAR');
        sql.Add(' WHERE CPAG_ID                          <> ' + cdsLocal.FieldByName('CPAG_ID').AsString);
        sql.Add('   AND CPAG_EMPR_ID                      = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('   AND CPAG_PLCT_ID                      = ' + cdsLocal.FieldByName('CPAG_PLCT_ID').AsString);
        sql.Add('   AND CPAG_PREVISAO                     = 1 ');
        sql.Add('   AND EXTRACT(MONTH FROM CPAG_DTA_VCTO) = ' + IntToStr(Mes));
        sql.Add('   AND EXTRACT(YEAR  FROM CPAG_DTA_VCTO) = ' + IntToStr(Ano));
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

function TfCad_Contas_Pagar.DocJaLancado : Boolean;
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
        sql.Add('FROM  CONTAS_PAGAR');
        sql.Add('WHERE CPAG_ID     <> ' + cdsLocal.FieldByName('CPAG_ID').AsString);
        sql.Add('AND   CPAG_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   CPAG_NR_DOC  = ' + QuotedStr(cdsLocal.FieldByName('CPAG_NR_DOC').AsString));
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

function TfCad_Contas_Pagar.TemLimitenoPlano(strCod_ID : String; floatValor : Real; out BoolConciliado : Boolean;
  out fltValor : Real; out fltSoma : Real) : Boolean;
var
  qryCons       : TSQLQuery;
  Dia, Mes, Ano : Word;
begin
  try
    Result  := true;
    DecodeDate(edtDt_Vecto.Date,Ano,Mes,Dia);
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      SUM(CPAG_VALOR_DOC)');
        sql.Add('FROM  CONTAS_PAGAR');
        sql.Add('WHERE CPAG_EMPR_ID                      = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   CPAG_STATUS                      <> ' + QuotedStr('C'));
        sql.Add('AND   CPAG_PLCT_ID                      = ' + strCod_ID);
        sql.Add('AND   CPAG_PLCT_EMPR_ID                 = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   EXTRACT(MONTH FROM CPAG_DTA_VCTO) = ' + IntToStr(Mes));
        sql.Add('AND   EXTRACT(YEAR FROM CPAG_DTA_VCTO)  = ' + IntToStr(Ano));
        sql.Add('AND   COALESCE(CPAG_PREVISAO,0)         = 0');
//        ShowMessage(qryCons.Text);
        Open;
        floatValor := floatValor + qryCons.Fields[0].AsFloat;
        fltSoma    := floatValor;
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      PCPJ_ANO,');
        sql.Add('      PCPJ_MES_01,');
        sql.Add('      PCPJ_MES_02,');
        sql.Add('      PCPJ_MES_03,');
        sql.Add('      PCPJ_MES_04,');
        sql.Add('      PCPJ_MES_05,');
        sql.Add('      PCPJ_MES_06,');
        sql.Add('      PCPJ_MES_07,');
        sql.Add('      PCPJ_MES_08,');
        sql.Add('      PCPJ_MES_09,');
        sql.Add('      PCPJ_MES_10,');
        sql.Add('      PCPJ_MES_11,');
        sql.Add('      PCPJ_MES_12,');
        sql.Add('      PCPJ_CONCILIADO');
        sql.Add('FROM  PLANO_CONTAS_PLANEJAMENTO');
        sql.Add('WHERE PCPJ_EMPR_ID       = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   PCPJ_ANO           = ' + IntToStr(Ano));
        sql.Add('AND   PCPJ_PLCT_ID       = ' + strCod_ID);
        sql.Add('AND   PCPJ_PLCT_EMPR_ID  = ' + IntToStr(funcLocal.Empr_ID));
//        ShowMessage(qryCons.Text);
        Open;
        if not IsEmpty then begin
          boolConciliado := (qryCons.Fields[13].AsInteger = 1);
          fltValor       := qryCons.Fields[Mes].AsFloat;
          Result         := (qryCons.Fields[Mes].AsFloat >= floatValor);
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'TemLimitenoPlano',funcLocal.User_Login,e.Message);
      funcLocal.Alerta('Erro ao verificar limite de crédito para o plano informado.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

initialization
  if fCad_Contas_Pagar = nil then  
    fCad_Contas_Pagar := TfCad_Contas_Pagar.Create(nil);
finalization
  FreeAndNil(fCad_Contas_Pagar);

end.

