unit ufCad_EntradaNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit,
  RXDBCtrl, Mask, DBCtrls, Grids, DBGrids, DB, rxCurrEdit, DBClient, SQLExpr;

type
  TfCad_EntradaNotaFiscal = class(TfCadastro)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    GroupBox3: TGroupBox;
    grdItens: TDBGrid;
    Label12: TLabel;
    edtCodProd: TDBEdit;
    btnPesqProd: TSpeedButton;
    Label13: TLabel;
    DBEdit4: TDBEdit;
    Label14: TLabel;
    DBEdit6: TDBEdit;
    Label15: TLabel;
    edtQtde: TDBEdit;
    Label16: TLabel;
    edtVlrUnit: TDBEdit;
    btnAdic: TBitBtn;
    btnRet: TBitBtn;
    Label17: TLabel;
    DBEdit9: TDBEdit;
    DBEdit2: TDBEdit;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    grdTitulos: TDBGrid;
    Label21: TLabel;
    edtDescricao: TDBEdit;
    Label23: TLabel;
    edtDtVcto: TDBDateEdit;
    Label24: TLabel;
    DBDateEdit4: TDBDateEdit;
    Label25: TLabel;
    edtCodDoc: TDBEdit;
    Label26: TLabel;
    DBEdit8: TDBEdit;
    btnPesqTipo: TSpeedButton;
    edtVlrDoc: TRxDBCalcEdit;
    Label22: TLabel;
    btnAdicDoc: TBitBtn;
    btnRetDoc: TBitBtn;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label27: TLabel;
    DBEdit5: TDBEdit;
    Label28: TLabel;
    DBEdit7: TDBEdit;
    Label29: TLabel;
    DBEdit12: TDBEdit;
    SpeedButton3: TSpeedButton;
    GroupBox7: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnPesqFornec: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    edtCodFornec: TDBEdit;
    DBEdit3: TDBEdit;
    Label31: TLabel;
    DBEdit14: TDBEdit;
    Label32: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Label33: TLabel;
    DBEdit17: TDBEdit;
    Label34: TLabel;
    Label35: TLabel;
    DBEdit18: TDBEdit;
    Label36: TLabel;
    DBEdit19: TDBEdit;
    Label37: TLabel;
    DBEdit20: TDBEdit;
    Label38: TLabel;
    DBEdit21: TDBEdit;
    GroupBox8: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtNrNota: TDBEdit;
    edtNrSerie: TDBEdit;
    edtDtEmissao: TDBDateEdit;
    edtDtEntrada: TDBDateEdit;
    GroupBox9: TGroupBox;
    RxDBCalcEdit1: TRxDBCalcEdit;
    RxDBCalcEdit2: TRxDBCalcEdit;
    edtVlrNota: TRxDBCalcEdit;
    RxDBCalcEdit4: TRxDBCalcEdit;
    edtVlrProd: TRxDBCalcEdit;
    RxDBCalcEdit6: TRxDBCalcEdit;
    edtVlrDesc: TRxDBCalcEdit;
    RxDBCalcEdit8: TRxDBCalcEdit;
    RxDBCalcEdit9: TRxDBCalcEdit;
    RxDBCalcEdit10: TRxDBCalcEdit;
    RxDBCalcEdit11: TRxDBCalcEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label18: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    edtModeloNF: TDBEdit;
    procedure pageCadastroChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodFornecKeyPress(Sender: TObject; var Key: Char);
    procedure edtVlrProdKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodFornecExit(Sender: TObject);
    procedure btnPesqFornecClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure edtCodProdKeyPress(Sender: TObject; var Key: Char);
    procedure Label12Click(Sender: TObject);
    procedure edtCodProdExit(Sender: TObject);
    procedure btnPesqProdClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure edtVlrUnitKeyPress(Sender: TObject; var Key: Char);
    procedure btnAdicEnter(Sender: TObject);
    procedure btnRetClick(Sender: TObject);
    procedure grdItensEnter(Sender: TObject);
    procedure btnAdicClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnPesqTipoClick(Sender: TObject);
    procedure edtCodDocKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodDocExit(Sender: TObject);
    procedure btnAdicDocEnter(Sender: TObject);
    procedure btnRetDocClick(Sender: TObject);
    procedure btnAdicDocClick(Sender: TObject);
    procedure grdTitulosEnter(Sender: TObject);
    procedure grdTitulosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdTitulosCellClick(Column: TColumn);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure strGrid1Click(Sender: TObject);
  private
    procedure OpenClientDataSet(intPos: Integer = 99);
    function ValidaDados(intPos: Integer = 99): Boolean;
    procedure HabilitaControls(boolValue: Boolean; intTipo : Integer = 1);
    function ValidaTitulos: Boolean;
    function ConciliaNotaFiscal(strNFEN_ID : String) : Boolean;
    procedure RegistraCustoProduto(strPROD_ID: String; floatValor: Real);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_EntradaNotaFiscal: TfCad_EntradaNotaFiscal;

implementation

uses udmEntradaNotaFiscal, Funcoes;

{$R *.dfm}

procedure TfCad_EntradaNotaFiscal.btnAdicClick(Sender: TObject);
begin
  inherited;
  with dmEntradaNotaFiscal.cdsItensNotaFiscal do begin
    if (edtCodProd.Text <> '') and (StrToFloat(edtQtde.Text) > 0) then begin
      if not (State in [dsEdit, dsInsert]) then
        Edit;
      try
        FieldByName('NFIT_VLR_TOTAL_ITEM').AsFloat := (FieldByName('NFIT_QTDE').AsFloat * FieldByName('NFIT_VLR_UNITARIO').AsFloat);
      except
      end;
      Post;
      Append;
      try
        edtCodProd.SetFocus;
      except
      end;
    end;
  end;
end;

procedure TfCad_EntradaNotaFiscal.btnAdicDocClick(Sender: TObject);
begin
  if (edtCodDoc.Text <> '') and (edtDtVcto.Date > 0) and (edtVlrDoc.Value > 0) then begin
    if ValidaDados(3) then begin
      with dmEntradaNotaFiscal do begin
        cdsAcertosNotaFiscal.Append;
        try
          edtCodDoc.SetFocus;
        except
        end;
      end;
    end else IsValidData;
  end;
end;

procedure TfCad_EntradaNotaFiscal.btnAdicDocEnter(Sender: TObject);
begin
  inherited;
  if (edtCodDoc.Text <> '') and (edtDtVcto.Date > 0) and (edtVlrDoc.Value > 0) then begin
    btnAdicDoc.Click;
  end else begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfCad_EntradaNotaFiscal.btnAdicEnter(Sender: TObject);
begin
  inherited;
  if (edtCodProd.Text <> '') and (StrToFloat(edtQtde.Text) > 0) then begin
    btnAdic.Click;
  end else begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfCad_EntradaNotaFiscal.btnOkClick(Sender: TObject);

procedure MensagemNaoConciliacao;
begin
  funcLocal.Alerta('I N F O R M A Ç Ã O ! ! !'+#13+#13+
                   'Você optou por não realizar a conciliação da nota fiscal, optando '+
                   'por esta ação você apenas salvará no sistema as informações referentes a nota '+
                   'fiscal em questão é não alimentará o seu Estoque/Financeiro, caso '+
                   'você queira alimentar o seu Estoque/Financeiro com os dados lançados '+
                   'opte pela conciliação da nota fiscal.'+#13+#13+
                   'Para isso basta selecionar o registro e manda-lo salvar novamente.',1);
end;

var
  boolConcilia : Boolean;
  strNFEN_ID   : String;
begin
  boolConcilia := false;
  strNFEN_ID   := cdsLocal.FieldByName('NFEN_ID').AsString;
  with dmEntradaNotaFiscal do begin
    cdsItensNotaFiscal.Cancel;
    cdsAcertosNotaFiscal.Cancel;
  end;
  if (ValidaDados) and (ValidaTitulos) then begin
    try
      if (cdsLocal.State in [dsInsert,dsEdit]) and (cdsLocal.FieldByName('NFEN_CONCILIADO').AsInteger = 0) then begin
        if funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                            'Dados da nota fical ainda não conciliados, este processo e '+
                            'necessário para que o seu Estoque/Financeiro seja alimentado '+
                            'com as informações constantes no registro.'+#13+#13+
                            'Deseja realizar esta operação agora?',1,true) = 6 then begin
          if funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                              'Você optou em realizar a conciliação da nota fiscal em edição ao realizar está opção o sistema '+
                              'fará a sincronização do Estoque/Financeiro das informações lançadas.'+#13+#13+
                              'Tem certeza de que deseja realizar esta operação (SIM = Recomendado)?'+#13+
                              'Após esta operação você não terá mais acesso a alterar os dados da nota fiscal lançada.',1,true) = 6 then begin
            boolConcilia := true;
          end else begin
            MensagemNaoConciliacao;
          end;
        end else begin
          MensagemNaoConciliacao;
        end;
      end;
    except
    end;
    try
      pageCadastro.Pages[0].Show;
      edtNrNota.SetFocus;
    except
    end;
    ////Salvando as informações
    inherited;
    dmEntradaNotaFiscal.cdsItensNotaFiscal.ApplyUpdates(-1);
    dmEntradaNotaFiscal.cdsAcertosNotaFiscal.ApplyUpdates(-1);
    if boolConcilia then begin
      ///Realiza tratamento de conciliação da nota fiscal;
      if ConciliaNotaFiscal(strNFEN_ID) then begin
        funcLocal.Alerta('Nota fiscal conciliada com sucesso! Verifique o estoque/financeiro do sistema antes de continuar.',1);
      end else begin
        funcLocal.Alerta('Não foi possível a conciliação da nota fiscal, provavelmente ocorreu um erro no processo de sincronização das informações no sistema.',1);
      end;
    end;
    OpenClientDataSet(3);
    OpenClientDataSet(4);
  end else IsValidData;
end;

{*******************************************************************************
Data:       30/03/2010
Autor:      Alex Itamar Gomes
Descrição:  Procedimento para registrar o custo do produto, na inserção da nota
            fiscal

Parametros:
  strPROD_ID  = ID do produto a ser modificado
  floatValor  = Valor do custo do produto

Historico
Data
30/03/2010    Alex I. Gomes     Inclusão do Cabeçalho
*******************************************************************************}
procedure TfCad_EntradaNotaFiscal.RegistraCustoProduto(strPROD_ID : String; floatValor : Real);
var
  qryCons : TSQLQuery;
begin
  try
    FormatSettings.DecimalSeparator := '.';
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          funcLocal.StartCommit;
        except
        end;
        sql.Add('UPDATE PRODUTOS');
        sql.Add('SET    PROD_VLR_CUSTO      = ' + FormatFloat('0.0000',floatValor));
        sql.Add('      ,PROD_DTA_ULT_COMPRA = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcLocal.DataServidor(funcLocal.Conexao))));
        sql.Add('WHERE  PROD_ID             = ' + strPROD_ID);
        sql.Add('AND    PROD_EMPR_ID        = ' + IntToStr(funcLocal.Empr_ID));
        ExecSQL;
        try
          funcLocal.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcLocal.RollBack;
      funcLocal.ReportaErro(Caption,'RegistraCustoProduto',e.Message);
      funcLocal.Alerta('Erro no processo de registro do custo do produto.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TfCad_EntradaNotaFiscal.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Label3Click(Sender);
  try
    edtCodFornec.SetFocus;
  except
  end;
end;

procedure TfCad_EntradaNotaFiscal.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Label12Click(Sender);
  dmEntradaNotaFiscal.cdsItensNotaFiscal.Cancel;
  try
    edtCodProd.SetFocus;
  except
  end;
end;

procedure TfCad_EntradaNotaFiscal.strGrid1Click(Sender: TObject);
begin
  inherited;
end;

{*******************************************************************************
Data:       --/--/----
Autor:      Alex Itamar Gomes
Descrição:  Procedimento para a conciliação das informações da nota fiscal com
            estoque de produtos e contas a pagar.

Parametros:
  strNFEN_ID = ID do registro da nota fiscal

Retorno:    Verdadeiro / Falso

Historico
Data
--/--/----    Alex I. Gomes     Inclusão do Cabeçalho
*******************************************************************************}
function TfCad_EntradaNotaFiscal.ConciliaNotaFiscal(strNFEN_ID : String) : Boolean;
var
  qryCons : TSQLQuery;
  boolInco: Boolean;
begin
  Result           := true;
  boolInco         := false;
  try
    FormatSettings.DecimalSeparator := '.';
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      ///Realizando a conciliação do estoque do produto
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      NFIT_PROD_ID,');
        sql.Add('      NFIT_QTDE,');
        SQL.Add('      NFIT_VLR_UNITARIO');
        sql.Add('FROM  NOTA_FISCAL_ITENS');
        sql.Add('WHERE NFIT_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   NFIT_NFEN_ID      = ' + strNFEN_ID);
        sql.Add('AND   NFIT_NFEN_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        Open;
        First;
        while not eof do begin
          if (qryCons.Fields[0].AsString <> '') and (qryCons.Fields[1].AsFloat > 0) then begin
            funcLocal.MovimentaEstoque(qryCons.Fields[0].AsString,qryCons.Fields[1].AsFloat,1,'2');
            RegistraCustoProduto(qryCons.Fields[0].AsString,qryCons.Fields[2].AsFloat);
          end else boolInco := true;
          Next;
        end;
        ///Realizando a conciliação do Contas a Pagar;
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      NFAC_ID,');                  //0
        sql.Add('      NFAC_NFEN_ID,');             //1
        sql.Add('      NFAC_DESCRICAO,');           //2
        sql.Add('      NFAC_NR_DOCUMENTO,');        //3
        sql.Add('      NFEN_FORN_ID,');             //4
        sql.Add('      NFAC_GENE_EMPR_ID_TP_DOc,'); //5
        sql.Add('      NFAC_GENE_TGEN_ID_TP_DOC,'); //6
        sql.Add('      NFAC_GENE_ID_TP_DOC,');      //7
        sql.Add('      NFAC_DTA_LANC,');            //8
        sql.Add('      NFAC_DTA_VCTO,');            //9
        sql.Add('      NFAC_VALOR_DOC,');           //10
        sql.Add('      NFAC_VALOR_JUROS,');         //11
        sql.Add('      NFAC_VALOR_MORA');           //12
        sql.Add('FROM  NOTA_FISCAL_ACERTOS');
        sql.Add('INNER JOIN NOTA_FISCAL');
        sql.Add('ON (NFEN_ID      = NFAC_NFEN_ID');
        sql.Add('AND NFEN_EMPR_ID = NFAC_NFEN_EMPR_ID)');
        sql.Add('WHERE NFAC_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   NFAC_NFEN_ID      = ' + strNFEN_ID);
        sql.Add('AND   NFAC_NFEN_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        Open;
        if not IsEmpty then begin
          First;
          while not Eof do begin
            if (qryCons.Fields[7].AsString <> '') and (qryCons.Fields[10].AsFloat > 0) then begin
              funcLocal.RegistraContasPagar(qryCons.Fields[3].AsString,
                                            qryCons.Fields[2].AsString,
                                            qryCons.Fields[4].AsString,
                                            '79',
                                            qryCons.Fields[7].AsString,
                                            qryCons.Fields[8].AsDateTime,
                                            qryCons.Fields[9].AsDateTime,
                                            qryCons.Fields[10].AsFloat,
                                            qryCons.Fields[11].AsFloat,
                                            qryCons.Fields[12].AsFloat,
                                            qryCons.Fields[0].AsString,
                                            qryCons.Fields[1].AsString);
            end else boolInco := true;
            Next;
          end;
        end;
        ///Alterando o Status da Nota Fiscal
        Close;
        sql.Clear;
        try
          funcLocal.StartCommit;
        except
        end;
        sql.Add('UPDATE NOTA_FISCAL');
        sql.Add('SET    NFEN_CONCILIADO = 1');
        sql.Add('WHERE  NFEN_ID         = ' + strNFEN_ID);
        sql.Add('AND    NFEN_EMPR_ID    = ' + IntToStr(funcLocal.Empr_ID));
        ExecSQL;
        try
          funcLocal.Commit;
        except
        end;
      end;
    except on e: exception do begin
      Result := false;
      funcLocal.RollBack;
      funcLocal.ReportaErro(Caption,'ConciliaNotaFiscal',e.Message);
      funcLocal.Alerta('Erro no processo de conciliação da nota fiscal.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
    if boolInco then begin
      funcLocal.Alerta('Foi(ram) encontrado(s) inconsistência(s) no lançamento de algum(ns) produto(s), por favor! Verifique.',0);
    end;
  end;
end;

function TfCad_EntradaNotaFiscal.ValidaTitulos : Boolean;
begin
  Result := true;
  with dmEntradaNotaFiscal do begin
    cdsAcertosNotaFiscal.Cancel;
    if not cdsAcertosNotaFiscal.IsEmpty then begin
      if cdsEntradaNotaFiscalNFEN_VLR_TOTAL_NOTA.AsFloat <> cdsAcertosNotaFiscalTOTAL_TITULO.Value then begin
        funcLocal.Alerta('A soma dos títulos lançados não coincidem com o valor total da nota fiscal.'+#13+#13+
                         'Vlr. Total Nota F. R$ ' + FormatFloat('###,###,##0.0000',cdsEntradaNotaFiscalNFEN_VLR_TOTAL_NOTA.AsFloat) +#13+
                         'Vlr. Total Títulos  R$ ' + FormatFloat('###,###,##0.0000',cdsAcertosNotaFiscalTOTAL_TITULO.Value) +#13+
                         '---------------------------------------' +#13+
                         'Diferença de Vlr.  R$ ' + FormatFloat('###,###,##0.0000',(cdsEntradaNotaFiscalNFEN_VLR_TOTAL_NOTA.AsFloat - cdsAcertosNotaFiscalTOTAL_TITULO.Value)) +#13+#13+
                         'Verifique os lançamentos realizados antes de continuar.',1);
        try
          pageCadastro.Pages[2].Show;
          edtCodDoc.SetFocus;
        except
        end;
        Result := false;
        Exit;
      end;
    end;
  end;
end;

procedure TfCad_EntradaNotaFiscal.btnPesqFornecClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet(1);
  strTMP := funcLocal.Busca_Registro(dmEntradaNotaFiscal.cdsPesqFornec,'FORN_NOME_FANTASIA','FORN_ID;FORN_NOME_FANTASIA;FORN_CNPJ_CPF;FORN_IE;FORN_ENDERECO;FORN_BAIRRO;FORN_CEP;GENE_DESCR;GENE_PAR1;FORN_TELEFONE','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('NFEN_FORN_ID').AsString       := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := funcLocal.Buscar_Coluna(strTMP,2);
    cdsLocal.FieldByName('FORN_CNPJ_CPF').AsString      := funcLocal.Buscar_Coluna(strTMP,3);
    cdsLocal.FieldByName('FORN_IE').AsString            := funcLocal.Buscar_Coluna(strTMP,4);
    cdsLocal.FieldByName('FORN_ENDERECO').AsString      := funcLocal.Buscar_Coluna(strTMP,5);
    cdsLocal.FieldByName('FORN_BAIRRO').AsString        := funcLocal.Buscar_Coluna(strTMP,6);
    cdsLocal.FieldByName('FORN_CEP').AsString           := funcLocal.Buscar_Coluna(strTMP,7);
    cdsLocal.FieldByName('GENE_DESCR').AsString         := funcLocal.Buscar_Coluna(strTMP,8);
    cdsLocal.FieldByName('GENE_PAR1').AsString          := funcLocal.Buscar_Coluna(strTMP,9);
    cdsLocal.FieldByName('FORN_TELEFONE').AsString      := funcLocal.Buscar_Coluna(strTMP,10);
    edtCodFornec.Modified := true;
  end else begin
    cdsLocal.FieldByName('NFEN_FORN_ID').AsString       := '';
    cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := '';
    cdsLocal.FieldByName('FORN_CNPJ_CPF').AsString      := '';
    cdsLocal.FieldByName('FORN_IE').AsString            := '';
    cdsLocal.FieldByName('FORN_ENDERECO').AsString      := '';
    cdsLocal.FieldByName('FORN_BAIRRO').AsString        := '';
    cdsLocal.FieldByName('FORN_CEP').AsString           := '';
    cdsLocal.FieldByName('GENE_DESCR').AsString         := '';
    cdsLocal.FieldByName('GENE_PAR1').AsString          := '';
    cdsLocal.FieldByName('FORN_TELEFONE').AsString      := '';
  end;
  try
    edtCodFornec.SetFocus;
  except
  end;
end;

procedure TfCad_EntradaNotaFiscal.btnPesqProdClick(Sender: TObject);
var
  strTMP     : String;
begin
  with dmEntradaNotaFiscal do begin
    OpenClientDataSet(2);
    strTMP := funcLocal.Busca_Registro(dmEntradaNotaFiscal.cdsPesqProdutos,'PROD_DESCRICAO','PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;GRUPO_PROD;MARCA_PROD;MODELO_PROD','');
    cdsItensNotaFiscal.Edit;
    if strTMP <> '' then begin
      cdsItensNotaFiscal.FieldByName('NFIT_PROD_ID').AsString   := funcLocal.Buscar_Coluna(strTMP,1);
      cdsItensNotaFiscal.FieldByName('PROD_DESCRICAO').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      cdsItensNotaFiscal.FieldByName('PROD_UNIDADE').AsString   := funcLocal.Buscar_Coluna(strTMP,3);
      cdsItensNotaFiscal.FieldByName('GRUPO_PROD').AsString     := funcLocal.Buscar_Coluna(strTMP,4);
      cdsItensNotaFiscal.FieldByName('MARCA_PROD').AsString     := funcLocal.Buscar_Coluna(strTMP,5);
      cdsItensNotaFiscal.FieldByName('MODELO_PROD').AsString    := funcLocal.Buscar_Coluna(strTMP,6);
      edtCodProd.Modified := true;
    end else begin
      cdsItensNotaFiscal.FieldByName('NFIT_PROD_ID').AsString   := '';
      cdsItensNotaFiscal.FieldByName('PROD_DESCRICAO').AsString := '';
      cdsItensNotaFiscal.FieldByName('PROD_UNIDADE').AsString   := '';
      cdsItensNotaFiscal.FieldByName('GRUPO_PROD').AsString     := '';
      cdsItensNotaFiscal.FieldByName('MARCA_PROD').AsString     := '';
      cdsItensNotaFiscal.FieldByName('MODELO_PROD').AsString    := '';
    end;
  end;
  try
    edtCodProd.SetFocus;
  except
  end;
end;

procedure TfCad_EntradaNotaFiscal.btnPesqTipoClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet(5);
  with dmEntradaNotaFiscal do begin
    strTMP := funcLocal.Busca_Registro(dmEntradaNotaFiscal.cdsPesqDoc,'GENE_DESCR','GENE_ID;GENE_DESCR','');
    cdsAcertosNotaFiscal.Edit;
    if strTMP <> '' then begin
      cdsAcertosNotaFiscalNFAC_GENE_ID_TP_DOC.AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsAcertosNotaFiscalTIPO_DOC.AsString            := funcLocal.Buscar_Coluna(strTMP,2);
      edtCodDoc.Modified := true;
      HabilitaControls(True);
    end else begin
      cdsAcertosNotaFiscalNFAC_GENE_ID_TP_DOC.AsString := '';
      cdsAcertosNotaFiscalTIPO_DOC.AsString            := '';
      HabilitaControls(False);
    end;
  end;
  try
    edtCodDoc.SetFocus;
  except
  end;
end;

procedure TfCad_EntradaNotaFiscal.HabilitaControls(boolValue : Boolean; intTipo : Integer = 1);
begin
  case intTipo of
    1,2 : begin
      edtDtVcto.Date    := funcLocal.DataServidor(funcLocal.Conexao);
      edtDtVcto.Enabled := false;
      edtVlrDoc.Enabled := boolValue;
    end
    else begin
      edtDtVcto.Date    := (funcLocal.DataServidor(funcLocal.Conexao) + 30);
      edtDtVcto.Enabled := boolValue;
      edtVlrDoc.Enabled := boolValue;
    end;
  end;
end;

procedure TfCad_EntradaNotaFiscal.btnRetClick(Sender: TObject);
begin
  inherited;
  if not dmEntradaNotaFiscal.cdsItensNotaFiscal.IsEmpty then begin
    dmEntradaNotaFiscal.cdsItensNotaFiscal.Delete;
    try
      edtCodProd.SetFocus;
    except
    end;
  end;
end;

procedure TfCad_EntradaNotaFiscal.btnRetDocClick(Sender: TObject);
begin
  inherited;
  if not dmEntradaNotaFiscal.cdsAcertosNotaFiscal.IsEmpty then
    dmEntradaNotaFiscal.cdsAcertosNotaFiscal.Delete;
end;

procedure TfCad_EntradaNotaFiscal.grdItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(grdItens.DataSource.DataSet.RecNo) then begin
      grdItens.Canvas.Font.Color  := clBlack;
      grdItens.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      grdItens.Canvas.Font.Color  := clBlack;
      grdItens.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      grdItens.Canvas.Brush.Color := clSilver;
      grdItens.Canvas.Font.Style  := [fsBold];
    end;
     grdItens.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
end;

procedure TfCad_EntradaNotaFiscal.grdItensEnter(Sender: TObject);
begin
  inherited;
  dmEntradaNotaFiscal.cdsItensNotaFiscal.Cancel;
end;

procedure TfCad_EntradaNotaFiscal.grdTitulosCellClick(Column: TColumn);
begin
  inherited;
  if not dmEntradaNotaFiscal.cdsAcertosNotaFiscal.IsEmpty then begin
    if not (dmEntradaNotaFiscal.cdsAcertosNotaFiscalNFAC_GENE_ID_TP_DOC.AsInteger in [1,2]) then begin
      edtDtVcto.Enabled := true;
    end else begin
      edtDtVcto.Enabled := false;
    end;
    edtVlrDoc.Enabled := true;
  end;
end;

procedure TfCad_EntradaNotaFiscal.grdTitulosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(grdTitulos.DataSource.DataSet.RecNo) then begin
      grdTitulos.Canvas.Font.Color  := clBlack;
      grdTitulos.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      grdTitulos.Canvas.Font.Color  := clBlack;
      grdTitulos.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      grdTitulos.Canvas.Brush.Color := clSilver;
      grdTitulos.Canvas.Font.Style  := [fsBold];
    end;
     grdTitulos.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
end;

procedure TfCad_EntradaNotaFiscal.grdTitulosEnter(Sender: TObject);
begin
  inherited;
  dmEntradaNotaFiscal.cdsAcertosNotaFiscal.Cancel;
end;

procedure TfCad_EntradaNotaFiscal.edtCodDocExit(Sender: TObject);
var
  strTMP : String;
begin
  inherited;
  if not edtCodDoc.Modified then Exit;
  OpenClientDataSet(5);
  with dmEntradaNotaFiscal do begin
    if edtCodDoc.Text <> '' then begin
      strTMP := funcLocal.Busca_Registro(dmEntradaNotaFiscal.cdsPesqDoc,'GENE_DESCR','GENE_ID;GENE_DESCR','GENE_ID = ' + edtCodDoc.Text);
      if strTMP <> '' then begin
        cdsAcertosNotaFiscalNFAC_GENE_ID_TP_DOC.AsString := funcLocal.Buscar_Coluna(strTMP,1);
        cdsAcertosNotaFiscalTIPO_DOC.AsString            := funcLocal.Buscar_Coluna(strTMP,2);
        HabilitaControls(True,cdsAcertosNotaFiscalNFAC_GENE_ID_TP_DOC.AsInteger);
        if (cdsAcertosNotaFiscalNFAC_GENE_ID_TP_DOC.AsInteger in [1,2]) then begin
          try
            edtVlrDoc.SetFocus;
          except
          end;
        end else begin
          try
            edtDtVcto.SetFocus;
          except
          end;
        end;
      end else begin
        cdsAcertosNotaFiscalNFAC_GENE_ID_TP_DOC.AsString := '';
        cdsAcertosNotaFiscalTIPO_DOC.AsString            := '';
        HabilitaControls(False);
      end;
    end else begin
      cdsAcertosNotaFiscalNFAC_GENE_ID_TP_DOC.AsString := '';
      cdsAcertosNotaFiscalTIPO_DOC.AsString            := '';
      HabilitaControls(False);
    end;
  end;
end;

procedure TfCad_EntradaNotaFiscal.edtCodDocKeyPress(Sender: TObject;
  var Key: Char);
var
  formPric : TForm;
begin
  if funcLocal = nil then begin
    formPric := Application.MainForm;
    funcLocal := TFuncoes(formPric.FindComponent('funcPrincipal'));
  end;
  if not (CharInSet(key,['0'..'9',#8])) then begin
    try
      if Trim(edtCodDoc.Text) = '' then begin
        if Key = #27 then Exit;
        funcLocal.VlrPesq := Key;
        Key := #0;
        btnPesqTipo.Click;
      end else Key := #0;
    except
    end;
  end;
end;

procedure TfCad_EntradaNotaFiscal.edtCodFornecExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCodFornec.Modified then Exit;
  if edtCodFornec.Text <> '' then begin
    OpenClientDataSet(1);
    strTMP := funcLocal.Busca_Registro(dmEntradaNotaFiscal.cdsPesqFornec,'FORN_NOME_FANTASIA','FORN_ID;FORN_NOME_FANTASIA;FORN_CNPJ_CPF;FORN_IE;FORN_ENDERECO;FORN_BAIRRO;FORN_CEP;GENE_DESCR;GENE_PAR1;FORN_TELEFONE','FORN_ID = ' + edtCodFornec.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('NFEN_FORN_ID').AsString       := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('FORN_CNPJ_CPF').AsString      := funcLocal.Buscar_Coluna(strTMP,3);
      cdsLocal.FieldByName('FORN_IE').AsString            := funcLocal.Buscar_Coluna(strTMP,4);
      cdsLocal.FieldByName('FORN_ENDERECO').AsString      := funcLocal.Buscar_Coluna(strTMP,5);
      cdsLocal.FieldByName('FORN_BAIRRO').AsString        := funcLocal.Buscar_Coluna(strTMP,6);
      cdsLocal.FieldByName('FORN_CEP').AsString           := funcLocal.Buscar_Coluna(strTMP,7);
      cdsLocal.FieldByName('GENE_DESCR').AsString         := funcLocal.Buscar_Coluna(strTMP,8);
      cdsLocal.FieldByName('GENE_PAR1').AsString          := funcLocal.Buscar_Coluna(strTMP,9);
      cdsLocal.FieldByName('FORN_TELEFONE').AsString      := funcLocal.Buscar_Coluna(strTMP,10);
    end else begin
      cdsLocal.FieldByName('NFEN_FORN_ID').AsString       := '';
      cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := '';
      cdsLocal.FieldByName('FORN_CNPJ_CPF').AsString      := '';
      cdsLocal.FieldByName('FORN_IE').AsString            := '';
      cdsLocal.FieldByName('FORN_ENDERECO').AsString      := '';
      cdsLocal.FieldByName('FORN_BAIRRO').AsString        := '';
      cdsLocal.FieldByName('FORN_CEP').AsString           := '';
      cdsLocal.FieldByName('GENE_DESCR').AsString         := '';
      cdsLocal.FieldByName('GENE_PAR1').AsString          := '';
      cdsLocal.FieldByName('FORN_TELEFONE').AsString      := '';
    end;
  end else begin
    cdsLocal.FieldByName('NFEN_FORN_ID').AsString       := '';
    cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := '';
    cdsLocal.FieldByName('FORN_CNPJ_CPF').AsString      := '';
    cdsLocal.FieldByName('FORN_IE').AsString            := '';
    cdsLocal.FieldByName('FORN_ENDERECO').AsString      := '';
    cdsLocal.FieldByName('FORN_BAIRRO').AsString        := '';
    cdsLocal.FieldByName('FORN_CEP').AsString           := '';
    cdsLocal.FieldByName('GENE_DESCR').AsString         := '';
    cdsLocal.FieldByName('GENE_PAR1').AsString          := '';
    cdsLocal.FieldByName('FORN_TELEFONE').AsString      := '';
  end;
end;

procedure TfCad_EntradaNotaFiscal.edtCodFornecKeyPress(Sender: TObject;
  var Key: Char);
var
  formPric : TForm;
begin
  if funcLocal = nil then begin
    formPric := Application.MainForm;
    funcLocal := TFuncoes(formPric.FindComponent('funcPrincipal'));
  end;
  if not (CharInSet(key,['0'..'9',#8])) then begin
    try
      if Trim(edtCodFornec.Text) = '' then begin
        if Key = #27 then Exit;
        funcLocal.VlrPesq := Key;
        Key := #0;
        btnPesqFornec.Click;
      end else Key := #0;
    except
    end;
  end;
end;

procedure TfCad_EntradaNotaFiscal.edtCodProdExit(Sender: TObject);
var
  strTMP     : String;
  strPROD_ID : String;
begin
  if not edtCodProd.Modified then Exit;
  with dmEntradaNotaFiscal do begin
    try
      cdsItensNotaFiscal.DisableControls;
      cdsItensNotaFiscal.Edit;
      if edtCodProd.Text <> '' then begin
        strPROD_ID := edtCodProd.Text;
        OpenClientDataSet(2);
        cdsItensNotaFiscal.Cancel;
        if not cdsItensNotaFiscal.Locate('NFIT_PROD_ID',strPROD_ID,[]) then begin
          cdsItensNotaFiscal.Append;
          strTMP := funcLocal.Busca_Registro(dmEntradaNotaFiscal.cdsPesqProdutos,'PROD_DESCRICAO',
                                             'PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;GRUPO_PROD;MARCA_PROD;MODELO_PROD;PROD_FLG_FRACIONADO',
                                             'PROD_ID = ' + strProd_ID);
          if strTMP <> '' then begin
            cdsItensNotaFiscal.FieldByName('NFIT_PROD_ID').AsString         := funcLocal.Buscar_Coluna(strTMP,1);
            cdsItensNotaFiscal.FieldByName('PROD_DESCRICAO').AsString       := funcLocal.Buscar_Coluna(strTMP,2);
            cdsItensNotaFiscal.FieldByName('PROD_UNIDADE').AsString         := funcLocal.Buscar_Coluna(strTMP,3);
            cdsItensNotaFiscal.FieldByName('PROD_FLG_FRACIONADO').AsString  := funcLocal.Buscar_Coluna(strTMP,7);
            cdsItensNotaFiscal.FieldByName('GRUPO_PROD').AsString           := funcLocal.Buscar_Coluna(strTMP,4);
            cdsItensNotaFiscal.FieldByName('MARCA_PROD').AsString           := funcLocal.Buscar_Coluna(strTMP,5);
            cdsItensNotaFiscal.FieldByName('MODELO_PROD').AsString          := funcLocal.Buscar_Coluna(strTMP,6);
          end else begin
            cdsItensNotaFiscal.FieldByName('NFIT_PROD_ID').AsString         := '';
            cdsItensNotaFiscal.FieldByName('PROD_DESCRICAO').AsString       := '';
            cdsItensNotaFiscal.FieldByName('PROD_UNIDADE').AsString         := '';
            cdsItensNotaFiscal.FieldByName('PROD_FLG_FRACIONADO').AsString  := '';
            cdsItensNotaFiscal.FieldByName('GRUPO_PROD').AsString           := '';
            cdsItensNotaFiscal.FieldByName('MARCA_PROD').AsString           := '';
            cdsItensNotaFiscal.FieldByName('MODELO_PROD').AsString          := '';
          end;
        end else begin
          cdsItensNotaFiscal.Edit;
        end;
      end else begin
        cdsItensNotaFiscal.FieldByName('NFIT_PROD_ID').AsString         := '';
        cdsItensNotaFiscal.FieldByName('PROD_DESCRICAO').AsString       := '';
        cdsItensNotaFiscal.FieldByName('PROD_UNIDADE').AsString         := '';
        cdsItensNotaFiscal.FieldByName('PROD_FLG_FRACIONADO').AsString  := '';
        cdsItensNotaFiscal.FieldByName('GRUPO_PROD').AsString           := '';
        cdsItensNotaFiscal.FieldByName('MARCA_PROD').AsString           := '';
        cdsItensNotaFiscal.FieldByName('MODELO_PROD').AsString          := '';
      end;
    finally
      cdsItensNotaFiscal.EnableControls;
      grdItens.Refresh;
    end;
  end;
end;

procedure TfCad_EntradaNotaFiscal.edtCodProdKeyPress(Sender: TObject;
  var Key: Char);
var
  formPric : TForm;
begin
  if funcLocal = nil then begin
    formPric := Application.MainForm;
    funcLocal := TFuncoes(formPric.FindComponent('funcPrincipal'));
  end;
  if not (CharInSet(key,['0'..'9',#8])) then begin
    try
      if Trim(edtCodProd.Text) = '' then begin
        if Key = #27 then Exit;
        funcLocal.VlrPesq := Key;
        Key := #0;
        btnPesqProd.Click;
      end else Key := #0;
    except
    end;
  end;
end;

procedure TfCad_EntradaNotaFiscal.edtQtdeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (dmEntradaNotaFiscal.cdsItensNotaFiscalPROD_FLG_FRACIONADO.AsInteger = 1) then begin
    if not (CharInSet(key,['0'..'9',',',#8])) then key := #0;
  end else begin
    if not (CharInSet(key,['0'..'9',#8])) then key := #0;
  end
end;

procedure TfCad_EntradaNotaFiscal.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmEntradaNotaFiscal do begin
    case intPos of
      1 : begin
        with cdsPesqFornec do begin
          Close;
          Open;
        end;
      end;
      2 : begin
        with cdsPesqProdutos do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      3 : begin
        with cdsItensNotaFiscal do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('NFEN_ID').AsInteger := cdsLocal.FieldByName('NFEN_ID').AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
          Edit;
        end;
      end;
      4 : begin
        with cdsAcertosNotaFiscal do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('NFEN_ID').AsInteger := cdsLocal.FieldByName('NFEN_ID').AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      5 : begin
        with cdsPesqDoc do begin
          Close;
          Open;
        end;
      end else begin
        OpenClientDataSet(1);
        OpenClientDataSet(2);
        OpenClientDataSet(3);
        OpenClientDataSet(4);
        OpenClientDataSet(5);
      end;
    end;
  end;
end;

procedure TfCad_EntradaNotaFiscal.edtVlrProdKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
end;

procedure TfCad_EntradaNotaFiscal.edtVlrUnitKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',',',#8])) then key := #0;
end;

procedure TfCad_EntradaNotaFiscal.FormShow(Sender: TObject);
begin
  inherited;
  OpenClientDataSet(3);
  OpenClientDataSet(4);
  try
    edtCodFornec.SetFocus;
  except
  end;
  if cdsLocal.FieldByName('NFEN_CONCILIADO').AsInteger <> 0 then begin
    pageCadastro.Pages[0].Enabled := false;
    pageCadastro.Pages[1].Enabled := false;
    pageCadastro.Pages[2].Enabled := false;
  end else begin
    pageCadastro.Pages[0].Enabled := true;
    pageCadastro.Pages[1].Enabled := true;
    pageCadastro.Pages[2].Enabled := true;
  end;
end;

procedure TfCad_EntradaNotaFiscal.Label12Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(356);
end;

procedure TfCad_EntradaNotaFiscal.Label3Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(144);
end;

procedure TfCad_EntradaNotaFiscal.pageCadastroChange(Sender: TObject);
begin
  inherited;
  if (pageCadastro.TabIndex = 1) then begin
    if not ValidaDados(1) then begin
      Abort;
    end;
  end else if (pageCadastro.TabIndex = 2) then begin
    if not ValidaDados(2) then begin
      Abort;
    end;
  end;
end;

function TfCad_EntradaNotaFiscal.ValidaDados(intPos : Integer = 99) : Boolean;
var
  fltProd,
  fltDesc,
  fltItens,
  fltNota : Real;
begin
  Result  := true;
  fltProd := StrToFloat( FormatFloat('0.00',edtVlrProd.Value) );
  fltDesc := StrToFloat( FormatFloat('0.00',edtVlrDesc.Value) );
  fltNota := StrToFloat( FormatFloat('0.00',edtVlrNota.Value) );
  try
    fltItens:= StrToFloat( FormatFloat('0.00',dmEntradaNotaFiscal.cdsItensNotaFiscalTOTAL_ITENS.Value) );
  except
    fltItens:= 0;
  end;
  try
    with dmEntradaNotaFiscal do begin
      Result := true;
      case intPos of
        1 : begin
          if (edtCodFornec.Text = '') or (edtNrNota.Text = '') or (edtNrSerie.Text = '') or
             (edtDtEmissao.Date = 0)  or (edtDtEmissao.Date = 0) then begin
            funcLocal.Alerta('Informe os dados de cabeçalho da nota fiscal antes de continuar.',1);
            try
              pageCadastro.Pages[0].Show;
              edtNrNota.SetFocus;
            except
            end;
            Result := false;
            Exit;
          end;
          if edtDtEntrada.Date < edtDtEmissao.Date then begin
            funcLocal.Alerta('A data de entrada da nota fiscal não pode ser inferior a sua data de emissão.',1);
            try
              pageCadastro.Pages[0].Show;
              edtCodFornec.SetFocus;
            except
            end;
            Result := false;
            Exit;
          end;
          if (edtVlrProd.Value < 0) or (edtVlrDesc.Value < 0) or (edtVlrNota.Value < 0) then begin
            funcLocal.Alerta('O(s) valor(es) da nota fiscal não pode(m) ser um valor negativo.',1);
            try
              pageCadastro.Pages[0].Show;
              edtVlrProd.SetFocus;
            except
            end;
            Result := false;
            Exit;
          end;
          if ((fltProd - fltDesc) > fltNota) then begin
            funcLocal.Alerta('Verifique a soma dos valores lançados antes de continuar.'+#13+#13+
                             'Vlr. Total Prod.: R$ ' + FormatFloat('###,###,##0.0000',fltProd) +#13+
                             'Vlr. Total Desc.: R$ ' + FormatFloat('###,###,##0.0000',fltDesc) +#13+
                             '---------------------------------------' +#13+
                             'Vlr. Total Nota.: R$ ' + FormatFloat('###,###,##0.0000',(fltProd - fltDesc)) +#13+#13+
                             'Não confere com o valor lançado Vlr. Total Nota: ( ' + FormatFloat('###,###,##0.0000',fltNota) + ' )',1);
            try
              pageCadastro.Pages[0].Show;
              edtVlrProd.SetFocus;
            except
            end;
            Result := false;
            Exit;
          end;
          if (fltProd > 0) and (fltDesc = 0) and (fltNota = 0) then begin
            funcLocal.Alerta('Verifique a soma dos valores lançados antes de continuar.'+#13+#13+
                             'Vlr. Total Prod.: R$ ' + FormatFloat('###,###,##0.0000',fltProd) +#13+
                             'Vlr. Total Desc.: R$ ' + FormatFloat('###,###,##0.0000',fltDesc) +#13+
                             '---------------------------------------' +#13+
                             'Vlr. Total Nota.: R$ ' + FormatFloat('###,###,##0.0000',(fltProd - fltDesc)) +#13+#13+
                             'Não confere com o valor lançado Vlr. Total Nota: ( ' + FormatFloat('###,###,##0.0000',fltNota) + ' )',1);
            try
              pageCadastro.Pages[0].Show;
              edtVlrProd.SetFocus;
            except
            end;
            Result := false;
            Exit;
          end;
        end;
        2 : begin
          if not ValidaDados(1) then begin
            Result := false;
            Exit;
          end;
          cdsItensNotaFiscal.Cancel;
          if cdsItensNotaFiscal.IsEmpty then begin
            funcLocal.Alerta('Nota fiscal sem itens lançados, verifique o lançamento dos itens antes de continuar.',1);
            try
              pageCadastro.Pages[1].Show;
              edtCodProd.SetFocus;
            except
            end;
            Result := false;
            Exit;
          end;
          if (fltItens <> fltProd) then begin
            funcLocal.Alerta('Divergência nos valores informados no sistema:'+#13+#13+
                             'Vlr. Total Prod.:  R$ ' + FormatFloat('###,###,##0.0000',fltProd) +#13+
                             'Vlr. Total Itens:  R$ ' + FormatFloat('###,###,##0.0000',fltItens) +#13+
                             '---------------------------------------' +#13+
                             'Diferença:           R$ ' + FormatFloat('###,###,##0.0000',(fltProd-fltItens)) +#13+#13+
                             'Verifique os valores lançados antes de continuar.',1);
            try
              pageCadastro.Pages[1].Show;
              edtCodProd.SetFocus;
            except
            end;
            Result := false;
            Exit;
          end;
          cdsAcertosNotaFiscal.Edit;
          try
            edtCodDoc.SetFocus;
          except
          end;
        end;
        3 : begin
          if not ValidaDados(2) then begin
            Result := false;
            Exit;
          end;
          if edtDtVcto.Date < funcLocal.DataServidor(funcLocal.Conexao) then begin
            funcLocal.Alerta('A data de vencimento do título não pode ser inferior a data atual.',1);
            try
              pageCadastro.Pages[2].Show;
              edtDtVcto.SetFocus;
            except
              edtCodDoc.SetFocus;
            end;
            Result := false;
            Exit;
          end;
          if (edtCodDoc.Text <> '') and (edtVlrDoc.Value <= 0) then begin
            funcLocal.Alerta('O valor do documento não pode ser inferior a Zero.',1);
            try
              pageCadastro.Pages[2].Show;
              edtVlrDoc.SetFocus;
            except
            end;
            Result := false;
            Exit;
          end;
        end;
        else begin
          Result := ValidaDados(3);
        end;
      end;
    end;
  except on e: exception do begin
    funcLocal.ReportaErro('TfCad_EntradaNotaFiscal','ValidaDados',e.Message);
    funcLocal.Alerta('Erro no processo de validação dos dados lançados.'+#13+'['+e.Message+']',1);
  end; end;
end;

procedure TfCad_EntradaNotaFiscal.TabSheet1Show(Sender: TObject);
begin
  inherited;
  try
    edtCodProd.SetFocus;
  except
  end;
end;

initialization
  if fCad_EntradaNotaFiscal = nil then
    fCad_EntradaNotaFiscal := TfCad_EntradaNotaFiscal.Create(nil);
finalization
  FreeAndNil(fCad_EntradaNotaFiscal);

end.
