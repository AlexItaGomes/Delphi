unit ufCadAgenda;

interface

uses
  Vcl.Forms, frxClass, frxDBSet, frxDesgn, Vcl.Menus, Funcoes, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Graphics, Vcl.Controls,
  Vcl.Buttons, System.Classes, System.Types, DataSnap.DBClient, Data.SqlExpr,
  System.IniFiles, UrlMon, Dialogs, ufBasico, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Variants, sysutils, ufCadastro, Vcl.ExtDlgs, Vcl.DBCtrls, RxCurrEdit,
  RxDBCtrl, uFrPesqIndividual, RxToolEdit, Vcl.Mask, Messages, JPEG;

type
  TfCadAgenda = class(TfCadastro)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    rdStatus: TDBRadioGroup;
    group1: TGroupBox;
    edtHorario: TDBEdit;
    edtDtaAgenda: TDBDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    frPesqCliente: TfrPesqIndividual;
    TabSheet1: TTabSheet;
    frPesqAtendente: TfrPesqIndividual;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    OpenPictureDialog: TOpenPictureDialog;
    frPesqTabPrecos: TfrPesqIndividual;
    group2: TGroupBox;
    GroupBox6: TGroupBox;
    Label26: TLabel;
    btnPesqProd: TSpeedButton;
    Label27: TLabel;
    Label15: TLabel;
    Label28: TLabel;
    Label33: TLabel;
    SpeedButton5: TSpeedButton;
    edtCodProd: TDBEdit;
    DBEdit16: TDBEdit;
    btnAdic: TBitBtn;
    btnRet: TBitBtn;
    edtVlrUnit: TRxDBCalcEdit;
    edtQtde: TRxDBCalcEdit;
    DBGrid1: TDBGrid;
    edtReserva: TDBEdit;
    Label6: TLabel;
    Panel2: TPanel;
    RxDBCalcEdit1: TRxDBCalcEdit;
    Label7: TLabel;
    edtTelefone: TDBEdit;
    Label8: TLabel;
    TabSheet2: TTabSheet;
    btnInserir: TSpeedButton;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox3: TGroupBox;
    imgAntes: TDBImage;
    GroupBox4: TGroupBox;
    imgDepois: TDBImage;
    GroupBox2: TGroupBox;
    frPesqIndicacao: TfrPesqIndividual;
    dstRelatorio: TfrxDBDataset;
    frRelatorio: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    ckGlaucoma: TCheckBox;
    ckDepressao: TCheckBox;
    ckEpilepsia: TCheckBox;
    ckMarcaPasso: TCheckBox;
    ckHipertensao: TCheckBox;
    ckHepatite: TCheckBox;
    ckDiabetes: TCheckBox;
    ckCancer: TCheckBox;
    ckHIV: TCheckBox;
    ckAlcoolizado: TCheckBox;
    ckGravida: TCheckBox;
    ckAlergia: TCheckBox;
    ckProblemaPele: TCheckBox;
    edtTipoHepatite: TEdit;
    edtTipoDiabetes: TEdit;
    GroupBox5: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lbTempoAnestesia: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    ckUtilizouAnestesia: TCheckBox;
    rdNivelAnestesia: TRadioGroup;
    edtTempoAnestesia: TMaskEdit;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    lblAgendas: TLabel;
    lblAbertos: TLabel;
    lblConfirmados: TLabel;
    lblFechados: TLabel;
    lblCancelados: TLabel;
    lblListaNegra: TLabel;
    Label14: TLabel;
    edtDesconto: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit7: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label22: TLabel;
    mmObsCliente: TMemo;
    GroupBox13: TGroupBox;
    grdAcertos: TDBGrid;
    SpeedButton1: TSpeedButton;
    frxDBDataset2: TfrxDBDataset;
    frRelSintetico: TfrxReport;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure imgAntesDblClick(Sender: TObject);
    procedure imgDepoisDblClick(Sender: TObject);
    procedure edtCodProdExit(Sender: TObject);
    procedure edtCodProdKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesqProdClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Label26Click(Sender: TObject);
    procedure Label26MouseLeave(Sender: TObject);
    procedure Label26MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtQtdeEnter(Sender: TObject);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure edtVlrUnitEnter(Sender: TObject);
    procedure btnAdicClick(Sender: TObject);
    procedure btnRetClick(Sender: TObject);
    procedure btnAdicEnter(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1Enter(Sender: TObject);
    procedure edtTelefoneExit(Sender: TObject);
    procedure ckUtilizouAnestesiaClick(Sender: TObject);
    procedure rdNivelAnestesiaChange(Sender: TObject);
    procedure ckHepatiteClick(Sender: TObject);
    procedure ckDiabetesClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure frRelatorioProgress(Sender: TfrxReport;
      ProgressType: TfrxProgressType; Progress: Integer);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure frPesqClienteedtCodigoExit(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet1Hide(Sender: TObject);
    procedure frPesqClientebtnPesquisarClick(Sender: TObject);
    procedure grdAcertosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    strHrIni : String;
    strHrFim : String;
    intHrInt : Integer;
    boolFrac : Boolean;
    FModoGrafico: Boolean;
    FStatusOld: Integer;
    procedure TratandoFrames;
    procedure TratarOrdemServico(intCod: Integer);
    procedure OpenClientDataSet(intPos: Integer = 99);
    function  ValidaProduto: Boolean;
    function  ValidaDados: Boolean;
    procedure SetarFocus;
    function  JaExisteAgenda: Boolean;
    procedure PreencheFrames;
    procedure SomaPedido;
    procedure ReservarHorarios(strAGEN_ID, intStatus : Integer);
    function  TemHorarioDisponivel: Boolean;
    function  JaFechou(intAGEN_ID : Integer; intPos : Integer = 1): Boolean;
    procedure MovimentaEstoque(intAGEN_ID: Integer);
    procedure EstornaEstoque(intAGEN_ID: Integer);
    function  EstornaFinanceiro(intAGEN_ID: Integer) : Boolean;
    procedure Fechar(intAGEN_ID : Integer; intPos : Integer = 1; intTipo : Integer = 1);
    function  TitulosJaBaixados(intAGEN_ID: Integer): Boolean;
    procedure ExibirFichaCliente(strTipo : String = 'A');
    procedure SalvarHistoricoMedico;
    procedure PreencheHistoricoMedico;
    procedure ListaHistorico;
    procedure RetornaTelefoneCliente;
    function  Reagendou(intAgen_ID : Integer): Boolean;
    procedure Reagendar(intAgen_ID, intClie_ID: Integer; strHr : String);
    procedure Reagenda(intAgen_ID: Integer; dtData: TDateTime);
    function  RetornaData(intAgen_ID : Integer): TDateTime;
    function  RetornaPeriodoServico(intAgen_ID: Integer): Integer;
  public
    Profissional : String;
    strHr        : String;
    procedure IniciarForm;
    property  ModoGrafico   : Boolean   read FModoGrafico write FModoGrafico default true;
    property  StatusOld     : Integer   read FStatusOld   write FStatusOld;
  end;

var
  fCadAgenda: TfCadAgenda;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses udmAgenda, ufData;

{$R *.dfm}

function TfCadAgenda.ValidaProduto: Boolean;
begin
  Result := true;
  if edtCodProd.Text = '' then begin
    funcLocal.Alerta('Informe o código do produto/serviço antes de continuar.', 1);
    edtCodProd.SetFocus;
    Result := false;
    Exit;
  end;
  if edtQtde.Value <= 0 then begin
    funcLocal.Alerta('Informe a quantidade antes de continuar.', 1);
    edtQtde.SetFocus;
    Result := false;
    Exit;
  end;
  if not funcLocal.PermitePrecoVenda(frPesqTabPrecos.edtCodigo.Text, edtCodProd.Text,
    edtVlrUnit.Value, 454, 455, 457) then begin
    edtCodProd.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfCadAgenda.btnAdicClick(Sender: TObject);
begin
  inherited;
  if ValidaProduto then begin
    dmAgenda.cdsOrdemServicoItens.Edit;
    dmAgenda.cdsOrdemServicoItens.FieldByName('ODIT_VLR_TOTAL').AsFloat := (dmAgenda.cdsOrdemServicoItens.FieldByName('ODIT_VLR_UNITARIO').AsFloat *
                                                                            dmAgenda.cdsOrdemServicoItens.FieldByName('ODIT_QTDE').AsFloat);
    dmAgenda.cdsOrdemServicoItens.Append;
    dmAgenda.cdsAgenda.Edit;
    dmAgenda.cdsAgendaAGEN_VLR_TOTAL.AsFloat := dmAgenda.cdsAgendaAGEN_VLR_TOTAL.AsFloat+
                                      (dmAgenda.cdsOrdemServicoItens.FieldByName('ODIT_VLR_UNITARIO').AsFloat *
                                       dmAgenda.cdsOrdemServicoItens.FieldByName('ODIT_QTDE').AsFloat);
    SomaPedido;
    edtCodProd.SetFocus;
  end;
end;

procedure TfCadAgenda.SomaPedido;
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('UPDATE AGENDA');
        sql.Add('   SET AGEN_VLR_TOTAL = '+StringReplace( StringReplace(FormatFloat('###,###,##0.00',dmAgenda.cdsOrdemServicoItensTOTALITENS.Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]));
        SQL.Add(' WHERE AGEN_EMPR_ID   = '+IntToStr(funcLocal.Empr_ID));
        sql.Add('   AND AGEN_ID        = '+dmAgenda.cdsAgendaAGEN_ID.AsString);
        ExecSQL();
      end;
      try
        dmAgenda.cdsAgenda.Edit;
        dmAgenda.cdsAgendaAGEN_VLR_TOTAL.AsFloat := dmAgenda.cdsOrdemServicoItensTOTALITENS.Value;
      except
        dmAgenda.cdsAgendaAGEN_VLR_TOTAL.AsFloat := 0;
      end;
    except
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadAgenda.btnAdicEnter(Sender: TObject);
begin
  inherited;
  if (edtCodProd.Text <> '') and (edtQtde.Value > 0) then begin
    btnAdic.Click;
  end else
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfCadAgenda.btnInserirClick(Sender: TObject);
begin
  inherited;
  ExibirFichaCliente();
end;

procedure TfCadAgenda.ExibirFichaCliente(strTipo : String = 'A');
begin
  if not frPesqCliente.TemRegistro then Exit;
  if StrToInt(frPesqCliente.InGrid)=funcLocal.ClientePadrao then Exit;
  with dmAgenda.cdsListaAtendimentos do begin
    Close;
    Params.ParamByName('CLIE_ID').AsInteger := StrToInt(frPesqCliente.InGrid());
    Params.ParamByName('AGEN_ID').AsInteger := cdsLocal.FieldByName('AGEN_ID').AsInteger;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Open;
    if IsEmpty or (dmAgenda.cdsListaItensAtendimentos.IsEmpty) then begin
      funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Ainda não há um histórico de atendimento para este cliente!',0);
      Exit;
    end;
  end;
  case strTipo[1] of
    'A' : begin
      with frRelatorio do begin
        TfrxMemoView(FindComponent('lbTit01')).Text    := '';
        TfrxMemoView(FindComponent('lbFild01')).Text   := '';
        TfrxMemoView(FindComponent('lbTit02')).Text    := '';
        TfrxMemoView(FindComponent('lbFild02')).Text   := '';
        TfrxMemoView(FindComponent('lbTit03')).Text    := '';
        TfrxMemoView(FindComponent('lbFild03')).Text   := '';
        frRelatorio.ShowReport();
      end;
    end;
    'S' : begin
      with dmAgenda.cdsItensSintetico do begin
        Close;
        Params.ParamByName('CLIE_ID').AsInteger := StrToInt(frPesqCliente.InGrid());
        Params.ParamByName('AGEN_ID').AsInteger := cdsLocal.FieldByName('AGEN_ID').AsInteger;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
      with frRelSintetico do begin
        TfrxMemoView(FindComponent('lbTit01')).Text    := '';
        TfrxMemoView(FindComponent('lbFild01')).Text   := '';
        TfrxMemoView(FindComponent('lbTit02')).Text    := '';
        TfrxMemoView(FindComponent('lbFild02')).Text   := '';
        TfrxMemoView(FindComponent('lbTit03')).Text    := '';
        TfrxMemoView(FindComponent('lbFild03')).Text   := '';
        frRelSintetico.ShowReport();
      end;
    end;
  end;
end;

procedure TfCadAgenda.btnOKClick(Sender: TObject);
label
  Inicio;

var
  Nr          : Integer;
  intStatus   : Integer;
  intCliente  : Integer;
  fltValor    : Real;
  fltDesconto : Real;
begin

  Inicio:

  //Validando Informações
  if not ValidaDados() then Exit;

  //Carregando informações
  TratandoFrames;
  Nr          := cdsLocal.FieldByName('AGEN_ID').AsInteger;
  intStatus   := rdStatus.ItemIndex; // 0 - Aberto; 1 - Confirmado; 2 - Fechado; 3 - Cancelado; 4 - Bloqueado;
  intCliente  := cdsLocal.FieldByName('AGEN_CLIE_ID').AsInteger;
  fltValor    := dmAgenda.cdsAgendaAGEN_VLR_TOTAL.AsFloat;
  fltDesconto := dmAgenda.cdsAgendaAGEN_VLR_DESCONTO.AsFloat;
  strHr       := dmAgenda.cdsAgendaAGEN_HORA.AsString;
  Profissional:= dmAgenda.cdsAgendaAGEN_USER_ID_ATENDENTE.AsString;

  //Pré-Salvando a Agenda
  dmAgenda.cdsAgenda.ApplyUpdates(-1);
  dmAgenda.cdsAgenda.Edit;
  SomaPedido;

  //Extendendo horário do atendimento
  ReservarHorarios(Nr,intStatus);

  //Tratamento após salvar
  if intStatus <> 4 then begin
    //Se for Confirmação é ainda não tiver fechado

    TratarOrdemServico(Nr);     //Gerar OS para a geração de comissão

    case intStatus of
      2 : begin //Fechamento
        if (StrToInt(frPesqCliente.InGrid)=funcLocal.ClientePadrao) then begin
          if funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Agendamento sem um cliente informado, você realmente deseja continuar com este fechamento?',1,true)<>6 then begin
            rdStatus.ItemIndex := StatusOld;
            dmAgenda.cdsAgenda.ApplyUpdates(-1);
            dmAgenda.cdsAgenda.Edit;
            Exit;
          end;
        end;
        if not JaFechou(Nr) then begin
          if not funcLocal.FechamentoVenda(fltValor-fltDesconto,
                                           'A',
                                           IntToStr(Nr),
                                           intCliente) then begin
            dmAgenda.cdsAgenda.Edit;
            SomaPedido;
            rdStatus.ItemIndex := StatusOld;
            goto Inicio;
            Exit;
          end;
          Fechar(Nr);
        end;
        if not JaFechou(Nr,2) then begin
          MovimentaEstoque(Nr);
          Fechar(Nr,1,2);
        end;
        if not Reagendou(Nr) then begin
          Reagendar(Nr, intCliente, strHr);
        end;
      end;
      0,1,3,4,5 : begin //Estornos
        if JaFechou(Nr) or JaFechou(Nr,2) then begin

          if funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                              'Já houve movimentação Financeira/Estoque para este agendamento, este procedimento irá estornar estes lançamentos.'+#13+#13+
                              'Deseja realmente executar está operação?',1,true) <> 6 then begin

            dmAgenda.cdsAgenda.Edit;
            rdStatus.ItemIndex := StatusOld;
            goto Inicio;
            Exit;
          end;
        end;
        if not EstornaFinanceiro(Nr) then begin
          dmAgenda.cdsAgenda.Edit;
          rdStatus.ItemIndex := StatusOld;
          goto Inicio;
          Exit;
        end;
        EstornaEstoque(Nr);
        Fechar(Nr,0,1);
        Fechar(Nr,0,2);
        funcLocal.EstornaAcertos(IntToStr(Nr),'A');
      end;
    end;
  end;
  //Salvando
  inherited;

  Self.Close;
end;

procedure TfCadAgenda.Reagendar(intAgen_ID,intClie_ID : Integer; strHr : String);
var
  dtData : TDateTime;
begin
  if not funcLocal.ReagendaOS then Exit;
  if intClie_ID=funcLocal.ClientePadrao then Exit;

  dtData := 0;
  while dtData<=0 do begin
    if funcLocal.ForcaReagendaOS then begin

      funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Reagendamento obrigatório, verifique é selecione a melhor data para retorno do cliente!',0);

      dtData := RetornaData(intAgen_ID);

      if dtData>0 then Reagenda(intAgen_ID,dtData);

    end else begin

      if funcLocal.Alerta('C O N F I R M A Ç Ã O ! ! !'+#13+#13+'Gostaria de realizar o reagendamento para este cliente?',1,true)=6 then begin

        dtData := RetornaData(intAgen_ID);

        if dtData>0 then Reagenda(intAgen_ID,dtData);

      end else DtData:=1;

    end;
  end;
end;

function TfCadAgenda.RetornaData(intAgen_ID : Integer) : TDateTime;
begin
  Result := 0;
  try
    fData := TfData.Create(nil);
    fData.funcLocal       := Self.funcLocal;
    fData.edtData.Date    := funcLocal.DataServidor()+RetornaPeriodoServico(intAgen_ID);
    fData.edtHorario.Text := strHr;
    fData.Atendente       := StrToInt(Profissional);
    fData.ShowModal;
    strHr        := fData.edtHorario.Text;
    Profissional := fData.frPesqAtendente.InGrid();
    Result := fData.edtData.Date;
  finally
    FreeAndNil(fData);
  end;
end;

function TfCadAgenda.RetornaPeriodoServico(intAgen_ID : Integer) : Integer;
var
  intMenor : Integer;
  qryCons  : TSQLQuery;
  sPeriodo : String;
  intI     : Integer;
begin
  Result := 0; intMenor := 999999;
  try
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT PROD_PERIODO_RETORNO');
        sql.Add('  FROM ORDEM_SERVICO_ITENS');
        sql.Add('  JOIN PRODUTOS');
        sql.Add('    ON PROD_ID                   = ODIT_TPIT_PROD_ID');
        sql.Add('   AND PROD_EMPR_ID              = ODIT_TPIT_PROD_EMPR_ID');
        sql.Add(' WHERE ODIT_EMPR_ID              = :EMPR_ID');
        sql.Add('   AND ODIT_ORDS_ID              = (SELECT AGEN_ORDS_ID');
        sql.Add('                                      FROM AGENDA');
        sql.Add('                                     WHERE AGEN_ID      = :AGEN_ID');
        sql.Add('                                       AND AGEN_EMPR_ID = :EMPR_ID)');
        sql.Add('   AND ODIT_ORDS_EMPR_ID         = :EMPR_ID');
        sql.Add('   AND PROD_GENE_EMPR_ID_TP_PROD = 0');
        sql.Add('   AND PROD_GENE_TGEN_ID_TP_PROD = 10');
        sql.Add('   AND PROD_GENE_ID_TP_PROD      = 2');
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Params.ParamByName('AGEN_ID').AsInteger := intAgen_ID;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
        if IsEmpty then begin
          intMenor := funcLocal.PeriodoReagendamento;
          Exit;
        end;
        First;
        while not Eof do begin
          sPeriodo := FieldByName('PROD_PERIODO_RETORNO').AsString;
          for intI := 1 to 50 do begin
            if funcLocal.Buscar_Coluna(FieldByName('PROD_PERIODO_RETORNO').AsString,intI)<>'' then begin
              if StrToInt(funcLocal.Buscar_Coluna(FieldByName('PROD_PERIODO_RETORNO').AsString,intI))<intMenor then
                intMenor := StrToInt(funcLocal.Buscar_Coluna(FieldByName('PROD_PERIODO_RETORNO').AsString,intI))
            end;
          end;
          Next;
        end;
      end;
    except
      intMenor := funcLocal.PeriodoReagendamento;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
  Result := intMenor;
end;

procedure TfCadAgenda.Reagenda(intAgen_ID : Integer; dtData : TDateTime);
var
  qryCons : TSQLQuery;
  strAgen_ID : String;
  AGEN_ID    : String;
  ORDS_ID    : String;
begin
  try
    AGEN_ID  := funcLocal.ObterSequencia('AGENDA',IntToStr(funcLocal.Empr_ID));
    ORDS_ID  := funcLocal.ObterSequencia('ORDEM_SERVICO',IntToStr(funcLocal.Empr_ID));
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('INSERT INTO AGENDA(AGEN_ID,');                     //1
      sql.Add('                   AGEN_EMPR_ID,');                //2
      sql.Add('                   AGEN_CLIE_ID,');                //3
      sql.Add('                   AGEN_CLIE_EMPR_ID,');           //4
      sql.Add('                   AGEN_USER_ID_ATENDENTE,');      //5
      sql.Add('                   AGEN_TPRC_ID,');                //6
      sql.Add('                   AGEN_TPRC_EMPR_ID,');           //7
      sql.Add('                   AGEN_HORA,');                   //8
      sql.Add('                   AGEN_DATA,');                   //9
      sql.Add('                   AGEN_OBS,');                    //10
      sql.Add('                   AGEN_STATUS,');                 //11
      sql.Add('                   AGEN_CLIENTE,');                //12
      sql.Add('                   AGEN_VLR_TOTAL,');              //13
      sql.Add('                   AGEN_VLR_PAGO,');               //14
      sql.Add('                   AGEN_VLR_DESCONTO,');           //15
      sql.Add('                   AGEN_TELEFONE,');               //16
      sql.Add('                   AGEN_EXT_HORARIO,');            //17
      sql.Add('                   AGEN_AGEN_ID,');                //18
      sql.Add('                   AGEN_AGEN_EMPR_ID,');           //19
      sql.Add('                   AGEN_BLOQUEAR_HORARIO,');       //20
      sql.Add('                   AGEN_DTA_CADASTRO,');           //21
      sql.Add('                   AGEN_USER_ID,');                //22
      sql.Add('                   AGEN_BAIXA_ESTOQUE,');          //23
      sql.Add('                   AGEN_FECHOU_FINANCEIRO,');      //24
      sql.Add('                   AGEN_PIGMENTO_COR,');           //25
      sql.Add('                   AGEN_PIGMENTO_MARCA,');         //26
      sql.Add('                   AGEN_PIGMENTO_LOTE,');          //27
      sql.Add('                   AGEN_ORDS_EMPR_ID,');           //28
      sql.Add('                   AGEN_REAGENDOU,');              //29
      sql.Add('                   AGEN_ORIGEM_REAGENDAMENTO)');   //30
      sql.Add('            SELECT :PK_ID,');                      //1
      sql.Add('                   AGEN_EMPR_ID,');                //2
      sql.Add('                   AGEN_CLIE_ID,');                //3
      sql.Add('                   AGEN_CLIE_EMPR_ID,');           //4
      sql.Add('                   :AGEN_USER_ID_ATENDENTE,');      //5
      sql.Add('                   AGEN_TPRC_ID,');                //6
      sql.Add('                   AGEN_TPRC_EMPR_ID,');           //7
      sql.Add('                   :AGEN_HORA,');                  //8
      sql.Add('                   :AGEN_DATA,');                  //9
      sql.Add('                   AGEN_OBS,');                    //10
      sql.Add('                   ''A'',');                       //11
      sql.Add('                   AGEN_CLIENTE,');                //12
      sql.Add('                   0,');                           //13
      sql.Add('                   0,');                           //14
      sql.Add('                   0,');                           //15
      sql.Add('                   AGEN_TELEFONE,');               //16
      sql.Add('                   AGEN_EXT_HORARIO,');            //17
      sql.Add('                   AGEN_AGEN_ID,');                //18
      sql.Add('                   AGEN_AGEN_EMPR_ID,');           //19
      sql.Add('                   AGEN_BLOQUEAR_HORARIO,');       //20
      sql.Add('                   AGEN_DTA_CADASTRO,');           //21
      sql.Add('                   AGEN_USER_ID,');                //22
      sql.Add('                   0,');                           //23
      sql.Add('                   0,');                           //24
      sql.Add('                   AGEN_PIGMENTO_COR,');           //25
      sql.Add('                   AGEN_PIGMENTO_MARCA,');         //26
      sql.Add('                   AGEN_PIGMENTO_LOTE,');          //27
      sql.Add('                   AGEN_EMPR_ID,');                //28
      sql.Add('                   0,');                           //29
      sql.Add('                   1');                            //30
      sql.Add('              FROM AGENDA');
      sql.Add('             WHERE AGEN_ID       = :AGEN_ID');
      sql.Add('               AND AGEN_EMPR_ID  = :EMPR_ID');
      Params.ParamByName('PK_ID').AsString                  := AGEN_ID;
      Params.ParamByName('AGEN_USER_ID_ATENDENTE').AsString := Profissional;
      Params.ParamByName('AGEN_HORA').AsString              := strHr;
      Params.ParamByName('AGEN_DATA').AsDate                := dtData;
      Params.ParamByName('AGEN_ID').AsInteger               := intAgen_ID;
      Params.ParamByName('EMPR_ID').AsInteger               := funcLocal.Empr_ID;
      ExecSQL();
      sql.Clear;
      sql.Add('INSERT INTO ORDEM_SERVICO(ORDS_ID,                               ');
      sql.Add('                         ORDS_EMPR_ID,                           ');
      sql.Add('                         ORDS_CLIE_ID,                           ');
      sql.Add('                         ORDS_CLIE_EMPR_ID,                      ');
      sql.Add('                         ORDS_TPRC_ID,                           ');
      sql.Add('                         ORDS_TPRC_EMPR_ID,                      ');
      sql.Add('                         ORDS_DTA_INSTALACAO,                    ');
      sql.Add('                         ORDS_GENE_EMPR_ID_TIPO_OS,              ');
      sql.Add('                         ORDS_GENE_TGEN_ID_TIPO_OS,              ');
      sql.Add('                         ORDS_GENE_ID_TIPO_OS,                   ');
      sql.Add('                         ORDS_GENE_EMPR_ID_STATUS_OS,            ');
      sql.Add('                         ORDS_GENE_TGEN_ID_STATUS_OS,            ');
      sql.Add('                         ORDS_GENE_ID_STATUS_OS,                 ');
      sql.Add('                         ORDS_STATUS,                            ');
      sql.Add('                         ORDS_USER_ID_TEC,                       ');
      sql.Add('                         ORDS_PROD_ID_EQUIP,                     ');
      sql.Add('                         ORDS_PROD_EMPR_ID_EQUIP,                ');
      sql.Add('                         ORDS_NR_PEDIDO_SERIE,                   ');
      sql.Add('                         ORDS_VLR_TOTAL_OS,                      ');
      sql.Add('                         ORDS_VLR_DESCONTO,                      ');
      sql.Add('                         ORDS_VLR_PAGO,                          ');
      sql.Add('                         ORDS_OBSERVACAO,                        ');
      sql.Add('                         ORDS_INFORMACOES,                       ');
      sql.Add('                         ORDS_USER_ID_CANC,                      ');
      sql.Add('                         ORDS_MOTIVO_CANC,                       ');
      sql.Add('                         ORDS_DTA_CANC,                          ');
      sql.Add('                         ORDS_DTA_ENTREGA,                       ');
      sql.Add('                         ORDS_USER_ID_ENTREG,                    ');
      sql.Add('                         ORDS_BAIXADO_ESTOQUE,                   ');
      sql.Add('                         ORDS_FORN_ID_EQUIP,                     ');
      sql.Add('                         ORDS_GENE_EMPR_ID_TP_AGEND,             ');
      sql.Add('                         ORDS_GENE_TGEN_ID_TP_AGEND,             ');
      sql.Add('                         ORDS_GENE_ID_TP_AGEND,                  ');
      sql.Add('                         ORDS_GENE_EMPR_ID_FILTRO,               ');
      sql.Add('                         ORDS_GENE_TGEN_ID_FILTRO,               ');
      sql.Add('                         ORDS_GENE_ID_FILTRO,                    ');
      sql.Add('                         ORDS_CLIE_ID_GARANTIA,                  ');
      sql.Add('                         ORDS_CLIE_EMPR_ID_GARANTIA,             ');
      sql.Add('                         ORDS_DTA_CADASTRO,                      ');
      sql.Add('                         ORDS_USER_ID)                           ');
      sql.Add('                  SELECT :PK_OS,                                 ');
      sql.Add('                         ORDS_EMPR_ID,                           ');
      sql.Add('                         ORDS_CLIE_ID,                           ');
      sql.Add('                         ORDS_CLIE_EMPR_ID,                      ');
      sql.Add('                         ORDS_TPRC_ID,                           ');
      sql.Add('                         ORDS_TPRC_EMPR_ID,                      ');
      sql.Add('                         :DATA,                                  ');
      sql.Add('                         ORDS_GENE_EMPR_ID_TIPO_OS,              ');
      sql.Add('                         ORDS_GENE_TGEN_ID_TIPO_OS,              ');
      sql.Add('                         ORDS_GENE_ID_TIPO_OS,                   ');
      sql.Add('                         ORDS_GENE_EMPR_ID_STATUS_OS,            ');
      sql.Add('                         ORDS_GENE_TGEN_ID_STATUS_OS,            ');
      sql.Add('                         ORDS_GENE_ID_STATUS_OS,                 ');
      sql.Add('                         0,                                      ');
      sql.Add('                         ORDS_USER_ID_TEC,                       ');
      sql.Add('                         ORDS_PROD_ID_EQUIP,                     ');
      sql.Add('                         ORDS_PROD_EMPR_ID_EQUIP,                ');
      sql.Add('                         ORDS_NR_PEDIDO_SERIE,                   ');
      sql.Add('                         0,                                      ');
      sql.Add('                         0,                                      ');
      sql.Add('                         0,                                      ');
      sql.Add('                         ORDS_OBSERVACAO,                        ');
      sql.Add('                         ORDS_INFORMACOES,                       ');
      sql.Add('                         ORDS_USER_ID_CANC,                      ');
      sql.Add('                         ORDS_MOTIVO_CANC,                       ');
      sql.Add('                         ORDS_DTA_CANC,                          ');
      sql.Add('                         ORDS_DTA_ENTREGA,                       ');
      sql.Add('                         ORDS_USER_ID_ENTREG,                    ');
      sql.Add('                         ORDS_BAIXADO_ESTOQUE,                   ');
      sql.Add('                         ORDS_FORN_ID_EQUIP,                     ');
      sql.Add('                         ORDS_GENE_EMPR_ID_TP_AGEND,             ');
      sql.Add('                         ORDS_GENE_TGEN_ID_TP_AGEND,             ');
      sql.Add('                         ORDS_GENE_ID_TP_AGEND,                  ');
      sql.Add('                         ORDS_GENE_EMPR_ID_FILTRO,               ');
      sql.Add('                         ORDS_GENE_TGEN_ID_FILTRO,               ');
      sql.Add('                         ORDS_GENE_ID_FILTRO,                    ');
      sql.Add('                         ORDS_CLIE_ID_GARANTIA,                  ');
      sql.Add('                         ORDS_CLIE_EMPR_ID_GARANTIA,             ');
      sql.Add('                         ORDS_DTA_CADASTRO,                      ');
      sql.Add('                         ORDS_USER_ID                            ');
      sql.Add('                    FROM ORDEM_SERVICO                           ');
      sql.Add('                   WHERE ORDS_ID      = (SELECT AGEN_ORDS_ID FROM AGENDA WHERE AGEN_ID = :AGEN_ID AND AGEN_EMPR_ID = :EMPR_ID)');
      sql.Add('                     AND ORDS_EMPR_ID = :EMPR_ID');
      Params.ParamByName('PK_OS').AsString    := ORDS_ID;
      Params.ParamByName('DATA').AsDate       := dtData;
      Params.ParamByName('AGEN_ID').AsInteger := intAgen_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      ExecSQL();
      sql.Clear;
      sql.Add('UPDATE AGENDA SET AGEN_ORDS_ID = :ORDS_ID WHERE AGEN_ID = :AGEN_ID AND AGEN_EMPR_ID = :EMPR_ID');
      Params.ParamByName('ORDS_ID').AsString  := ORDS_ID;
      Params.ParamByName('AGEN_ID').AsString  := AGEN_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      ExecSQL();
      SQL.Clear;
      sql.Add('INSERT INTO ORDEM_SERVICO_ITENS(ODIT_ID,');
      sql.Add('                               ODIT_EMPR_ID,');
      sql.Add('                               ODIT_ORDS_ID,');
      sql.Add('                               ODIT_ORDS_EMPR_ID,');
      sql.Add('                               ODIT_ORDS_CLIE_ID,');
      sql.Add('                               ODIT_ORDS_CLIE_EMPR_ID,');
      sql.Add('                               ODIT_TPIT_ID,');
      sql.Add('                               ODIT_TPIT_EMPR_ID,');
      sql.Add('                               ODIT_TPIT_TPRC_ID,');
      sql.Add('                               ODIT_TPIT_TPRC_EMPR_ID,');
      sql.Add('                               ODIT_TPIT_PROD_ID,');
      sql.Add('                               ODIT_TPIT_PROD_EMPR_ID,');
      sql.Add('                               ODIT_VLR_UNITARIO,');
      sql.Add('                               ODIT_QTDE,');
      sql.Add('                               ODIT_VLR_TOTAL,');
      sql.Add('                               ODIT_USER_ID_TEC,');
      sql.Add('                               ODIT_DTA_CADASTRO,');
      sql.Add('                               ODIT_USER_ID)');
      sql.Add('                        SELECT (SELECT COALESCE(MAX(ODIT_ID),0)+1 FROM ORDEM_SERVICO_ITENS WHERE ODIT_EMPR_ID = :EMPR_ID),');
      sql.Add('                               ODIT_EMPR_ID,');
      sql.Add('                               :PK_ID,');
      sql.Add('                               ODIT_ORDS_EMPR_ID,');
      sql.Add('                               ODIT_ORDS_CLIE_ID,');
      sql.Add('                               ODIT_ORDS_CLIE_EMPR_ID,');
      sql.Add('                               ODIT_TPIT_ID,');
      sql.Add('                               ODIT_TPIT_EMPR_ID,');
      sql.Add('                               ODIT_TPIT_TPRC_ID,');
      sql.Add('                               ODIT_TPIT_TPRC_EMPR_ID,');
      sql.Add('                               ODIT_TPIT_PROD_ID,');
      sql.Add('                               ODIT_TPIT_PROD_EMPR_ID,');
      sql.Add('                               ODIT_VLR_UNITARIO,');
      sql.Add('                               ODIT_QTDE,');
      sql.Add('                               ODIT_VLR_TOTAL,');
      sql.Add('                               ODIT_USER_ID_TEC,');
      sql.Add('                               ODIT_DTA_CADASTRO,');
      sql.Add('                               ODIT_USER_ID');
      sql.Add('                          FROM ORDEM_SERVICO_ITENS');
      sql.Add('                         WHERE ODIT_EMPR_ID      = :EMPR_ID');
      sql.Add('                           AND ODIT_ORDS_ID      = (SELECT AGEN_ORDS_ID FROM AGENDA WHERE AGEN_ID = :AGEN_ID AND AGEN_EMPR_ID = :EMPR_ID)');
      sql.Add('                           AND ODIT_ORDS_EMPR_ID = :EMPR_ID');
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('PK_ID').AsString    := ORDS_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('AGEN_ID').AsInteger := intAgen_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      ExecSQL();
      sql.Clear;
      sql.Add('UPDATE AGENDA SET AGEN_REAGENDOU = 1 WHERE AGEN_ID = :AGEN_ID AND AGEN_EMPR_ID = :EMPR_ID');
      Params.ParamByName('AGEN_ID').AsInteger := intAgen_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      ExecSQL();
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfCadAgenda.Reagendou(intAgen_ID : Integer) : Boolean;
var
  qryCons : TSQLQuery;
begin
  Result := false;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT COALESCE(AGEN_REAGENDOU,0) AGEN_REAGENDOU');
      sql.Add('  FROM AGENDA');
      sql.Add(' WHERE AGEN_ID                    = :AGEN_ID');
      sql.Add('   AND AGEN_EMPR_ID               = :EMPR_ID');
      Params.ParamByName('AGEN_ID').AsInteger := intAgen_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
      Result := qryCons.FieldByName('AGEN_REAGENDOU').AsInteger = 1;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadAgenda.Fechar(intAGEN_ID : Integer; intPos : Integer = 1; intTipo : Integer = 1);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('UPDATE AGENDA SET');
      case intTipo of
        1 : begin
          sql.Add(' AGEN_FECHOU_FINANCEIRO = '+IntToStr(intPos));
          case intPos of
            1 : sql.Add(' ,AGEN_DTA_PAGTO        = ' + QuotedStr( FormatDateTime('mm/dd/yyyy',funcLocal.DataServidor())) );
            2 : sql.Add(' ,AGEN_DTA_PAGTO        = null');
          end;
        end;
        2 : sql.Add(' AGEN_BAIXA_ESTOQUE     = '+IntToStr(intPos));
      end;
      sql.Add(' WHERE AGEN_ID      = :AGEN_ID');
      sql.Add('   AND AGEN_EMPR_ID = :EMPR_ID');
      Params.ParamByName('AGEN_ID').AsInteger := intAGEN_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      ExecSQL();
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfCadAgenda.EstornaFinanceiro(intAGEN_ID : Integer) : Boolean;
var
  qryCons : TSQLQuery;
begin
  Result := false;
  if TitulosJaBaixados(intAGEN_ID) then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                     'O(s) título(s) vinculado a este agendamento já foram movimentados, seu estorno não será possível',0);
    Exit;
  end;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT SUM(LCAX_VLR_LANCAMENTO)');
      sql.Add('  FROM LIVRO_CAIXA');
      sql.Add(' WHERE LCAX_CAMPO1_TAB_MOV        = :AGEN_ID');
      sql.Add('   AND LCAX_CAMPO2_TAB_MOV        = :EMPR_ID');
      sql.Add('   AND LCAX_GENE_EMPR_ID_TP_ORIG  = 0');
      sql.Add('   AND LCAX_GENE_TGEN_ID_TP_ORIG  = 11');
      sql.Add('   AND LCAX_GENE_ID_TP_ORIG       = 8');
      Params.ParamByName('AGEN_ID').AsInteger := intAGEN_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;

      if Fields[0].AsFloat>0 then begin
        if not funcLocal.TemSaldoLivroCaixa(Fields[0].AsFloat) then begin
          funcLocal.Alerta('Não há saldo em caixa suficiente para realizar estorno.',0);
          Exit;
        end;
        funcLocal.LancamentoLivroCaixa('115',
                                       '3',
                                       IntToStr(intAGEN_ID),
                                       IntToStr(funcLocal.Empr_ID),
                                       '0',
                                       '0','11','8',(Fields[0].AsFloat*-1));
      end;
      Close;
      sql.Clear;
      sql.Add('UPDATE CONTAS_RECEBER');
      sql.Add('   SET CREC_STATUS       = ''C''');
      sql.Add('      ,CREC_DTA_CANC     = (SELECT CURRENT_TIMESTAMP FROM RDB$DATABASE)');
      sql.Add('      ,CREC_MOTIVO_CANC  = ''CANCELAMENTO DE AGENDAMENTO''');
      sql.Add(' WHERE CREC_EMPR_ID      = :EMPR_ID');
      sql.Add('   AND CREC_AGEN_ID      = :AGEN_ID');
      sql.Add('   AND CREC_AGEN_EMPR_ID = :EMPR_ID');
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('AGEN_ID').AsInteger := intAGEN_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      ExecSQL();

      Close;
      sql.Clear;
      sql.Add('UPDATE CONTAS_PAGAR');
      sql.Add('   SET CPAG_STATUS       = ''C''');
      sql.Add('      ,CPAG_DTA_CANC     = (SELECT CURRENT_TIMESTAMP FROM RDB$DATABASE)');
      sql.Add('      ,CPAG_MOTIVO_CANC  = ''CANCELAMENTO DE AGENDAMENTO''');
      sql.Add(' WHERE CPAG_EMPR_ID      = :EMPR_ID');
      sql.Add('   AND CPAG_AGEN_ID      = :AGEN_ID');
      sql.Add('   AND CPAG_AGEN_EMPR_ID = :EMPR_ID');
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('AGEN_ID').AsInteger := intAGEN_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      ExecSQL();

      Close;
      sql.Clear;
      sql.Add('UPDATE AGENDA');
      sql.Add('   SET AGEN_DTA_PAGTO = NULL');
      sql.Add(' WHERE AGEN_ID        = :AGEN_ID');
      sql.Add('   AND AGEN_EMPR_ID   = :EMPR_ID');
      Params.ParamByName('AGEN_ID').AsInteger := intAGEN_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      ExecSQL();

      Result := True;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfCadAgenda.TitulosJaBaixados(intAGEN_ID : Integer) : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT COUNT(*)');
      sql.Add('  FROM CONTAS_RECEBER');
      sql.Add(' WHERE CREC_EMPR_ID      = :EMPR_ID');
      sql.Add('   AND CREC_AGEN_ID      = :AGEN_ID');
      sql.Add('   AND CREC_AGEN_EMPR_ID = :EMPR_ID');
      sql.Add('   AND CREC_STATUS       = ''B''');
      sql.Add('');
      sql.Add('UNION');
      sql.Add('');
      sql.Add('SELECT COUNT(*)');
      sql.Add('  FROM CONTAS_PAGAR');
      sql.Add(' WHERE CPAG_EMPR_ID      = :EMPR_ID');
      sql.Add('   AND CPAG_AGEN_ID      = :AGEN_ID');
      sql.Add('   AND CPAG_AGEN_EMPR_ID = :EMPR_ID');
      sql.Add('   AND CPAG_STATUS       = ''B''');
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('AGEN_ID').AsInteger := intAGEN_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('AGEN_ID').AsInteger := intAGEN_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
      Result := Fields[0].AsInteger > 0;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadAgenda.EstornaEstoque(intAGEN_ID : Integer);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      SQL.Add('SELECT ODIT_TPIT_PROD_ID,');
      SQL.Add('       ODIT_QTDE');
      SQL.Add('  FROM ORDEM_SERVICO_ITENS');
      SQL.Add('  JOIN ORDEM_SERVICO');
      SQL.Add('    ON ORDS_ID            = ODIT_ORDS_ID');
      SQL.Add('   AND ORDS_EMPR_ID       = ODIT_ORDS_EMPR_ID');
      SQL.Add(' WHERE ODIT_EMPR_ID       = :EMPR_ID');
      SQL.Add('   AND ODIT_ORDS_ID       = (SELECT AGEN_ORDS_ID FROM AGENDA WHERE AGEN_ID = :AGEN_ID AND AGEN_EMPR_ID = :EMPR_ID)');
      SQL.Add('   AND ODIT_ORDS_EMPR_ID  = :EMPR_ID');
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('AGEN_ID').AsInteger := intAGEN_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
      First;
      while not Eof do begin
        funcLocal.MovimentaEstoque(Fields[0].AsString,Fields[1].AsFloat,1,'5');
        Next;
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadAgenda.MovimentaEstoque(intAGEN_ID : Integer);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      SQL.Add('SELECT ODIT_TPIT_PROD_ID,');
      SQL.Add('       ODIT_QTDE');
      SQL.Add('  FROM ORDEM_SERVICO_ITENS');
      SQL.Add('  JOIN ORDEM_SERVICO');
      SQL.Add('    ON ORDS_ID            = ODIT_ORDS_ID');
      SQL.Add('   AND ORDS_EMPR_ID       = ODIT_ORDS_EMPR_ID');
      SQL.Add(' WHERE ODIT_EMPR_ID       = :EMPR_ID');
      SQL.Add('   AND ODIT_ORDS_ID       = (SELECT AGEN_ORDS_ID FROM AGENDA WHERE AGEN_ID = :AGEN_ID AND AGEN_EMPR_ID = :EMPR_ID)');
      SQL.Add('   AND ODIT_ORDS_EMPR_ID  = :EMPR_ID');
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('AGEN_ID').AsInteger := intAGEN_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
      First;
      while not Eof do begin
        funcLocal.MovimentaEstoque(Fields[0].AsString,Fields[1].AsFloat,1,'4');
        Next;
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfCadAgenda.JaFechou(intAGEN_ID : Integer; intPos : Integer = 1):Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      SQL.Add('SELECT');
      case intPos of
        1 : begin //Financeiro
          sql.Add('COALESCE(AGEN_FECHOU_FINANCEIRO,0)');
        end;
        2 : begin //Estoque
          sql.Add('COALESCE(AGEN_BAIXA_ESTOQUE,0)');
        end;
      end;
      SQL.Add('  FROM AGENDA');
      SQL.Add(' WHERE AGEN_ID      = :AGEN_ID');
      SQL.Add('   AND AGEN_EMPR_ID = :EMPR_ID');
      Params.ParamByName('AGEN_ID').AsInteger := intAGEN_ID;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
      Result := Fields[0].AsInteger = 1;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

//Reservar demais horários conforme a quantidade de tarefas lançadas.
procedure TfCadAgenda.ReservarHorarios(strAGEN_ID, intStatus : Integer);
var
  qryCons  : TSQLQuery;
  boolCont : Boolean;
  intH,
  intM     : Integer;
  S,
  strSQL      : String;
begin
  boolCont := true;
  if not (rdStatus.ItemIndex in [0,1]) then Exit;
  try
    S := 'DELETE FROM AGENDA WHERE COALESCE(AGEN_AGEN_ID,0) = %d AND COALESCE(AGEN_AGEN_EMPR_ID,0) = %d';
    S := Format(S,[strAGEN_ID,funcLocal.Empr_ID]);
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add(S);
      ExecSQL();
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;

  while boolCont and (strHrIni<=strHrFim) do begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      strSQL := 'SELECT *                '+
                '  FROM AGENDA           '+
                ' WHERE AGEN_ID      = %D'+
                '   AND AGEN_EMPR_ID = %D';
      strSQL := Format(strSQL,[strAGEN_ID,funcLocal.Empr_ID]);
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add(strSQL);
        Open;
        //Verificando se há outro agendamento
        S := 'SELECT COUNT(*) AS QTDE                       '+
             '  FROM AGENDA                                 '+
             ' WHERE AGEN_EMPR_ID                   = %d    '+
             '   AND AGEN_DATA                      = ''%s'''+
             '   AND AGEN_USER_ID_ATENDENTE         = %d    '+
             '   AND AGEN_HORA                      = ''%s'''+
             '   AND COALESCE(AGEN_AGEN_ID,0)      <> %d    '+
             '   AND COALESCE(AGEN_AGEN_EMPR_ID,0)  = %d    ';
        S := Format(S,[funcLocal.Empr_ID,
                       FormatDateTime('MM/DD/YYYY',FieldByName('AGEN_DATA').AsDateTime),
                       FieldByName('AGEN_USER_ID_ATENDENTE').AsInteger,
                       strHrIni,
                       strAGEN_ID,
                       funcLocal.Empr_ID]);
        Close;
        sql.Clear;
        sql.Add(S);
        Open;
        if FieldByName('QTDE').AsInteger>0 then begin
          boolCont := false;
          Exit;
        end;

        S := 'INSERT INTO AGENDA(AGEN_ID,                                       '+ //1
             '                   AGEN_EMPR_ID,                                  '+ //2
             '                   AGEN_CLIE_ID,                                  '+ //3
             '                   AGEN_CLIE_EMPR_ID,                             '+ //4
             '                   AGEN_USER_ID_ATENDENTE,                        '+ //5
             '                   AGEN_TPRC_ID,                                  '+ //6
             '                   AGEN_TPRC_EMPR_ID,                             '+ //7
             '                   AGEN_HORA,                                     '+ //8
             '                   AGEN_DATA,                                     '+ //9
             '                   AGEN_STATUS,                                   '+ //10
             '                   AGEN_AGEN_ID,                                  '+ //11
             '                   AGEN_AGEN_EMPR_ID,                             '+ //12
             '                   AGEN_BLOQUEAR_HORARIO,                         '+ //13
             '                   AGEN_VLR_TOTAL,                                '+ //14
             '                   AGEN_VLR_PAGO,                                 '+ //15
             '                   AGEN_VLR_DESCONTO,                             '+ //16
             '                   AGEN_CLIENTE,                                  '+ //17
             '                   AGEN_DTA_CADASTRO,                             '+ //18
             '                   AGEN_USER_ID)                                  '+ //19
             '            SELECT %s,                                            '+ //1
             '                   AGEN_EMPR_ID,                                  '+ //2
             '                   AGEN_CLIE_ID,                                  '+ //3
             '                   AGEN_CLIE_EMPR_ID,                             '+ //4
             '                   AGEN_USER_ID_ATENDENTE,                        '+ //5
             '                   AGEN_TPRC_ID,                                  '+ //6
             '                   AGEN_TPRC_EMPR_ID,                             '+ //7
             '                   ''%s'',                                        '+ //8
             '                   AGEN_DATA,                                     '+ //9
             '                   AGEN_STATUS,                                   '+ //10
             '                   AGEN_ID,                                       '+ //11
             '                   AGEN_EMPR_ID,                                  '+ //12
             '                   1,                                             '+ //13
             '                   AGEN_VLR_TOTAL,                                '+ //14
             '                   AGEN_VLR_PAGO,                                 '+ //15
             '                   AGEN_VLR_DESCONTO,                             '+ //16
             '                   ''Ext. Procedimento(s)'',                      '+ //17
             '                   AGEN_DTA_CADASTRO,                             '+ //18
             '                   AGEN_USER_ID                                   '+ //19
             '              FROM AGENDA                                         '+
             '             WHERE AGEN_ID      = %d                              '+
             '               AND AGEN_EMPR_ID = %d                              ';

        S := Format(S,[funcLocal.ObterSequencia('AGENDA',IntToStr(funcLocal.Empr_ID)),
                       strHrIni,
                       strAGEN_ID,
                       funcLocal.Empr_ID]);
        Close;
        sql.Clear;
        sql.Add(S);
        ExecSQL();
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
    intH := StrToInt(Copy(strHrIni,1,2));
    intM := StrToInt(Copy(strHrIni,4,2));
    intM := intM + intHrInt;
    if intM = 60 then begin
      inc(intH);
      intM := 0;
    end;
    strHrIni := FormatFloat('00',intH)+':'+FormatFloat('00',intM);
  end;
end;

function TfCadAgenda.ValidaDados() : Boolean;
begin
  Result := false;
  pageCadastro.Pages[0].Show;
  dmAgenda.cdsOrdemServicoItens.Cancel;
  if edtDtaAgenda.Date <=0 then begin
    funcLocal.Alerta('Necessário informar uma Data antes de continuar!',0);
    edtDtaAgenda.SetFocus;
    Exit;
  end;
  if Length(Trim(edtHorario.Text)) <> 5 then begin
    funcLocal.Alerta('Necessário informar um horário de atendimento antes de continuar!',0);
    edtHorario.SetFocus;
    Exit;
  end;
  if not frPesqTabPrecos.TemRegistro then begin
    funcLocal.Alerta('Necessário informar a tabela de preço aplicável antes de continuar!',0);
    frPesqTabPrecos.SetFocus;
    Exit;
  end;
  if not frPesqAtendente.TemRegistro then begin
    funcLocal.Alerta('Necessário informar o profissional antes de continuar!',0);
    frPesqAtendente.SetFocus;
    Exit;
  end;
  if not frPesqCliente.TemRegistro then begin
    funcLocal.Alerta('Necessário informar o cliente antes de continuar!',0);
    frPesqCliente.SetFocus;
    Exit;
  end;
  if rdStatus.ItemIndex=4 then begin
    edtReserva.Text := 'HORARIO BLOQUEADO';
  end;
  if (rdStatus.ItemIndex<>4) and (edtReserva.Text='HORARIO BLOQUEADO') then begin
    edtReserva.Text := 'HORARIO DISPONIVEL (INFORMAR O CLIENTE)';
  end;
  if (StrToInt(frPesqCliente.InGrid)=funcLocal.ClientePadrao) and (Trim(edtReserva.Text) = '') then begin
    funcLocal.Alerta('Necessário informar o nome da reserva antes de continuar!',0);
    edtReserva.SetFocus;
    Exit;
  end;
  if Trim(cdsLocal.FieldByName('AGEN_TELEFONE').AsString) = '()-' then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                     'Agenda/Cliente sem telefone informado, informe um telefone antes de continuar!',0);
    edtTelefone.SetFocus;
    Exit;
  end;
  if dmAgenda.cdsOrdemServicoItens.IsEmpty then begin
    if ModoGrafico then begin
      if funcLocal.Alerta('Nenhum Produto ou Serviço informado!'+#13+#13+
                          'Deseja agendar mesmo assim?',1,true) <> 6 then begin
        if edtCodProd.CanFocus then
          edtCodProd.SetFocus;
        Exit;
      end;
    end;
  end;
  if JaExisteAgenda() then begin
    if ModoGrafico then begin
      funcLocal.Alerta('Já consta um agendamento para o Dia/Horário/Profissional selecionado!',0);
      edtDtaAgenda.SetFocus;
      Exit;
    end;
  end;
  if not TemHorarioDisponivel() then begin
    if ModoGrafico then begin
      if funcLocal.Alerta('A Carga Horária dos procedimentos deste agendamento ultrapassa outro(s) agendamento(s)!'+#13+#13+
                        'Deseja agendar mesmo assim?',1,true) <> 6 then
      Exit;
    end;
  end;
  if cdsLocal.FieldByName('AGEN_VLR_DESCONTO').AsFloat < 0 then begin
    funcLocal.Alerta('Você não pode informar valor negativo no campo desconto!',0);
    Exit;
  end;
  if cdsLocal.FieldByName('AGEN_VLR_DESCONTO').AsFloat > cdsLocal.FieldByName('AGEN_VLR_TOTAL').AsFloat then begin
    funcLocal.Alerta('O Valor do Desconto não pode ser superior ao valor dos produtos/serviços',0);
    Exit;
  end;


  Result := true;
end;

procedure TfCadAgenda.TabSheet1Hide(Sender: TObject);
begin
  inherited;
  SalvarHistoricoMedico();
end;

procedure TfCadAgenda.SalvarHistoricoMedico();
var
  S : String;
  qryCons : TSQLQuery;
begin
  if frPesqCliente.TemRegistro then begin
    if frPesqCliente.InGrid()<>IntToStr(funcLocal.ClientePadrao) then begin
      if Trim(edtTempoAnestesia.Text)=':' then edtTempoAnestesia.Text:='00:00';

      S := 'UPDATE CLIENTES                              '+
           '   SET CLIE_GLAUCOMA                = %S     '+
           '      ,CLIE_DEPRESSAO               = %S     '+
           '      ,CLIE_EPILEPSIA               = %S     '+
           '      ,CLIE_MARCA_PASSO             = %S     '+
           '      ,CLIE_HIPERTENSAO             = %S     '+
           '      ,CLIE_HEPATITE                = %S     '+
           '      ,CLIE_HEPATITE_TIPO           = ''%S'' '+
           '      ,CLIE_DIABETES                = %S     '+
           '      ,CLIE_DIABETES_TIPO           = ''%S'' '+
           '      ,CLIE_CANCER                  = %S     '+
           '      ,CLIE_HIV                     = %S     '+
           '      ,CLIE_ALCOOLIZADO             = %S     '+
           '      ,CLIE_GRAVIDA                 = %S     '+
           '      ,CLIE_ALERGICO_METAIS_PIGMETO = %S     '+
           '      ,CLIE_PROBLEMAS_PELE          = %S     '+
           '      ,CLIE_UTILIZOU_ANESTESIA      = %S     '+
           '      ,CLIE_TEMPO_ANESTESIA         = ''%S'' '+
           '      ,CLIE_NIVEL_ANESTESIA         = %S     '+
           ' WHERE CLIE_ID                      = %S     '+
           '   AND CLIE_EMPR_ID                 = %S     ';
      S := Format(S,[
                     funcLocal.Se(ckGlaucoma.Checked,'1','0'),
                     funcLocal.Se(ckDepressao.Checked,'1','0'),
                     funcLocal.Se(ckEpilepsia.Checked,'1','0'),
                     funcLocal.Se(ckMarcaPasso.Checked,'1','0'),
                     funcLocal.Se(ckHipertensao.Checked,'1','0'),
                     funcLocal.Se(ckHepatite.Checked,'1','0'),
                     edtTipoHepatite.Text,
                     funcLocal.Se(ckDiabetes.Checked,'1','0'),
                     edtTipoDiabetes.Text,
                     funcLocal.Se(ckCancer.Checked,'1','0'),
                     funcLocal.Se(ckHIV.Checked,'1','0'),
                     funcLocal.Se(ckAlcoolizado.Checked,'1','0'),
                     funcLocal.Se(ckGravida.Checked,'1','0'),
                     funcLocal.Se(ckAlergia.Checked,'1','0'),
                     funcLocal.Se(ckProblemaPele.Checked,'1','0'),
                     funcLocal.Se(ckUtilizouAnestesia.Checked,'1','0'),
                     edtTempoAnestesia.Text,
                     IntToStr(rdNivelAnestesia.ItemIndex),
                     frPesqCliente.InGrid(),
                     IntToStr( funcLocal.Empr_ID )
                     ]);
      try
        qryCons := TSQLQuery.Create(nil);
        qryCons.SQLConnection := funcLocal.Conexao;
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add(S);
          ExecSQL();
        end;
      finally
        qryCons.Close;
        FreeAndNil(qryCons);
      end;
    end;
  end;
end;

procedure TfCadAgenda.TabSheet1Show(Sender: TObject);
begin
  inherited;
  PreencheHistoricoMedico();
end;

procedure TfCadAgenda.PreencheHistoricoMedico();
var
  S : String;
  qryCons : TSQLQuery;
begin
  if frPesqCliente.TemRegistro then begin
    if frPesqCliente.InGrid()<>IntToStr(funcLocal.ClientePadrao) then begin
      S := 'SELECT COALESCE(CLIE_GLAUCOMA,0)                AS CLIE_GLAUCOMA,                '+
           '       COALESCE(CLIE_DEPRESSAO,0)               AS CLIE_DEPRESSAO,               '+
           '       COALESCE(CLIE_EPILEPSIA,0)               AS CLIE_EPILEPSIA,               '+
           '       COALESCE(CLIE_MARCA_PASSO,0)             AS CLIE_MARCA_PASSO,             '+
           '       COALESCE(CLIE_HIPERTENSAO,0)             AS CLIE_HIPERTENSAO,             '+
           '       COALESCE(CLIE_HEPATITE,0)                AS CLIE_HEPATITE,                '+
           '       CLIE_HEPATITE_TIPO,                                                       '+
           '       COALESCE(CLIE_DIABETES,0)                AS CLIE_DIABETES,                '+
           '       CLIE_DIABETES_TIPO,                                                       '+
           '       COALESCE(CLIE_CANCER,0)                  AS CLIE_CANCER,                  '+
           '       COALESCE(CLIE_HIV,0)                     AS CLIE_HIV,                     '+
           '       COALESCE(CLIE_ALCOOLIZADO,0)             AS CLIE_ALCOOLIZADO,             '+
           '       COALESCE(CLIE_GRAVIDA,0)                 AS CLIE_GRAVIDA,                 '+
           '       COALESCE(CLIE_ALERGICO_METAIS_PIGMETO,0) AS CLIE_ALERGICO_METAIS_PIGMETO, '+
           '       COALESCE(CLIE_PROBLEMAS_PELE,0)          AS CLIE_PROBLEMAS_PELE,          '+
           '       COALESCE(CLIE_UTILIZOU_ANESTESIA,0)      AS CLIE_UTILIZOU_ANESTESIA,      '+
           '       CLIE_TEMPO_ANESTESIA,                                                     '+
           '       COALESCE(CLIE_NIVEL_ANESTESIA,0)         AS CLIE_NIVEL_ANESTESIA          '+
           '  FROM CLIENTES                                                                  '+
           ' WHERE CLIE_ID      = %S                                                         '+
           '   AND CLIE_EMPR_ID = %S                                                         ';
      S := Format(S,[frPesqCliente.InGrid,IntToStr(funcLocal.Empr_ID)]);
      try
        qryCons := TSQLQuery.Create(nil);
        qryCons.SQLConnection := funcLocal.Conexao;
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add(S);
          Open;
          ckGlaucoma.Checked          := FieldByName('CLIE_GLAUCOMA').AsInteger=1;
          ckDepressao.Checked         := FieldByName('CLIE_DEPRESSAO').AsInteger=1;
          ckEpilepsia.Checked         := FieldByName('CLIE_EPILEPSIA').AsInteger=1;
          ckMarcaPasso.Checked        := FieldByName('CLIE_MARCA_PASSO').AsInteger=1;
          ckHipertensao.Checked       := FieldByName('CLIE_HIPERTENSAO').AsInteger=1;
          ckHepatite.Checked          := FieldByName('CLIE_HEPATITE').AsInteger=1;
          edtTipoHepatite.Text        := FieldByName('CLIE_HEPATITE_TIPO').AsString;
          ckDiabetes.Checked          := FieldByName('CLIE_DIABETES').AsInteger=1;
          edtTipoDiabetes.Text        := FieldByName('CLIE_DIABETES_TIPO').AsString;
          ckCancer.Checked            := FieldByName('CLIE_CANCER').AsInteger=1;
          ckHIV.Checked               := FieldByName('CLIE_HIV').AsInteger=1;
          ckAlcoolizado.Checked       := FieldByName('CLIE_ALCOOLIZADO').AsInteger=1;
          ckGravida.Checked           := FieldByName('CLIE_GRAVIDA').AsInteger=1;
          ckAlergia.Checked           := FieldByName('CLIE_ALERGICO_METAIS_PIGMETO').AsInteger=1;
          ckProblemaPele.Checked      := FieldByName('CLIE_PROBLEMAS_PELE').AsInteger=1;
          ckUtilizouAnestesia.Checked := FieldByName('CLIE_UTILIZOU_ANESTESIA').AsInteger=1;
          edtTempoAnestesia.Text      := FieldByName('CLIE_TEMPO_ANESTESIA').AsString;
          rdNivelAnestesia.ItemIndex  := FieldByName('CLIE_NIVEL_ANESTESIA').AsInteger;
        end;
      finally
        qryCons.Close;
        FreeAndNil(qryCons);
      end;
    end;
  end;
end;

function TfCadAgenda.TemHorarioDisponivel() : Boolean;
var
  qryCons  : TSQLQuery;
  intTempo : Integer;
  intM,
  intH     : Integer;
  strHrHr  : String;
begin
  Result := true;
  if not (rdStatus.ItemIndex in [0,1]) then Exit;
  //Somando total de tempo lançado nos itens
  intTempo := 0;
  with dmAgenda.cdsOrdemServicoItens do begin
    First;
    while not Eof do begin
      intTempo := intTempo + FieldByName('PROD_DURACAO').AsInteger;
      Next;
    end;
  end;

  //Se não houve tempo, pode agendar
  if intTempo = 0 then begin
    strHrIni := edtHorario.Text;
    strHrFim := strHrIni;
    Exit;
  end;
  //Pegando a Hora Inicial é os intervalor
  strHrIni := edtHorario.Text;
  intHrInt := StrToInt(Copy(funcLocal.Hr_Intervalo,4,2));

  if intHrInt = intTempo then begin
    strHrFim := strHrIni;
    Exit;
  end;

  //Determinando a hora inicial
  intH := StrToInt(Copy(strHrIni,1,2));
  intM := StrToInt(Copy(strHrIni,4,2));
  intM := intM + intHrInt; intTempo := intTempo-(intHrInt*2);
  if intM = 60 then begin
    inc(intH);
    intM := 0;
  end;
  strHrIni := FormatFloat('00',intH)+':'+FormatFloat('00',intM);
  strHrFim := strHrIni;

  //Determinando a Hora final
  while intTempo > 0 do begin
    intH := StrToInt(Copy(strHrFim,1,2));
    intM := StrToInt(Copy(strHrFim,4,2));
    intM := intM + intHrInt; intTempo := intTempo-(intHrInt);
    if intM = 60 then begin
      inc(intH);
      intM := 0;
    end;
    strHrFim := FormatFloat('00',intH)+':'+FormatFloat('00',intM);
  end;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT COUNT(*) AS QTDE');
      sql.Add('  FROM AGENDA');
      sql.Add(' WHERE AGEN_ID                       <> ' + cdsLocal.FieldByName('AGEN_ID').AsString);
      sql.Add('   AND AGEN_EMPR_ID                   = ' + IntToStr(funcLocal.Empr_ID));
      sql.Add('   AND AGEN_DATA                      = ' + QuotedStr(FormatDateTime('MM/DD/YYYY',cdsLocal.FieldByName('AGEN_DATA').AsDateTime)));
      sql.Add('   AND AGEN_HORA                     >= ' + QuotedStr(strHrIni));
      sql.Add('   AND AGEN_HORA                     <= ' + QuotedStr(strHrFim));
      sql.Add('   AND AGEN_USER_ID_ATENDENTE         = ' + frPesqAtendente.InGrid());
      sql.Add('   AND COALESCE(AGEN_AGEN_ID,0)      <> ' + cdsLocal.FieldByName('AGEN_ID').AsString);
      sql.Add('   AND COALESCE(AGEN_AGEN_EMPR_ID,0)  = ' + IntToStr(funcLocal.Empr_ID));
      Open;
      Result := FieldByName('QTDE').AsInteger=0;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfCadAgenda.JaExisteAgenda() : Boolean;
var
  qryCons : TSQLQuery;
begin
  Result := false;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT COUNT(*)');
      sql.Add('  FROM AGENDA');
      sql.Add(' WHERE AGEN_ID                      <> :AGEN_ID');
      sql.Add('   AND AGEN_EMPR_ID                  = :EMPR_ID');
      sql.Add('   AND AGEN_DATA                     = :DATA   ');
      sql.Add('   AND AGEN_HORA                     = :HORARIO');
      sql.Add('   AND AGEN_USER_ID_ATENDENTE        = :USER_ID');
      sql.Add('   AND COALESCE(AGEN_AGEN_ID,0)     <> :AGEN_ID');
      sql.Add('   AND COALESCE(AGEN_AGEN_EMPR_ID,0) = :EMPR_ID');
      Params.ParamByName('AGEN_ID').AsInteger := cdsLocal.FieldByName('AGEN_ID').AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('DATA').AsDateTime   := cdsLocal.FieldByName('AGEN_DATA').AsDateTime;
      Params.ParamByName('HORARIO').AsString  := cdsLocal.FieldByName('AGEN_HORA').AsString;
      Params.ParamByName('USER_ID').AsString  := frPesqAtendente.InGrid();
      Params.ParamByName('AGEN_ID').AsInteger := cdsLocal.FieldByName('AGEN_ID').AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
      Result := qryCons.Fields[0].AsInteger > 0;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadAgenda.TratarOrdemServico(intCod : Integer);
var
  S : String;
  qryCons    : TSQLQuery;
  qryConsI   : TSQLQuery;
  intORDS_ID : Integer;
begin
  S := 'SELECT * FROM AGENDA WHERE AGEN_ID = :AGEN_ID AND AGEN_EMPR_ID = :EMPR_ID';
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    qryConsI := TSQLQuery.Create(nil);
    qryConsI.SQLConnection := funcLocal.Conexao;
    qryCons.Close;
    qryCons.sql.Clear;
    qryCons.sql.Add(S);
    qryCons.Params.ParamByName('AGEN_ID').AsInteger := intCod;
    qryCons.Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    qryCons.Open;

//    if qryCons.FieldByName('AGEN_ORDS_ID').AsInteger = -1 then begin
      S := 'UPDATE OR INSERT INTO ORDEM_SERVICO(ORDS_ID,                      '+
           '                                    ORDS_EMPR_ID,                 '+
           '                                    ORDS_CLIE_ID,                 '+
           '                                    ORDS_CLIE_EMPR_ID,            '+
           '                                    ORDS_TPRC_ID,                 '+
           '                                    ORDS_TPRC_EMPR_ID,            '+
           '                                    ORDS_DTA_INSTALACAO,          '+
           '                                    ORDS_GENE_EMPR_ID_TIPO_OS,    '+
           '                                    ORDS_GENE_TGEN_ID_TIPO_OS,    '+
           '                                    ORDS_GENE_ID_TIPO_OS,         '+
           '                                    ORDS_STATUS,                  '+
           '                                    ORDS_USER_ID_TEC,             '+
           '                                    ORDS_VLR_TOTAL_OS,            '+
           '                                    ORDS_VLR_DESCONTO,            '+
           '                                    ORDS_VLR_PAGO,                '+
           '                                    ORDS_BAIXADO_ESTOQUE,         '+
           '                                    ORDS_DTA_CADASTRO,            '+
           '                                    ORDS_USER_ID)                 '+
           '                             VALUES(:ORDS_ID,                     '+
           '                                    :ORDS_EMPR_ID,                '+
           '                                    :ORDS_CLIE_ID,                '+
           '                                    :ORDS_CLIE_EMPR_ID,           '+
           '                                    :ORDS_TPRC_ID,                '+
           '                                    :ORDS_TPRC_EMPR_ID,           '+
           '                                    :ORDS_DTA_INSTALACAO,         '+
           '                                    :ORDS_GENE_EMPR_ID_TIPO_OS,   '+
           '                                    :ORDS_GENE_TGEN_ID_TIPO_OS,   '+
           '                                    :ORDS_GENE_ID_TIPO_OS,        '+
           '                                    :ORDS_STATUS,                 '+
           '                                    :ORDS_USER_ID_TEC,            '+
           '                                    :ORDS_VLR_TOTAL_OS,           '+
           '                                    :ORDS_VLR_DESCONTO,           '+
           '                                    :ORDS_VLR_PAGO,               '+
           '                                    :ORDS_BAIXADO_ESTOQUE,        '+
           '                                    :ORDS_DTA_CADASTRO,           '+
           '                                    :ORDS_USER_ID)                ';
    {end else begin
      S := 'UPDATE ORDEM_SERVICO                                             '+
           '   SET ORDS_CLIE_ID                 = :ORDS_CLIE_ID              '+
           '      ,ORDS_CLIE_EMPR_ID            = :ORDS_CLIE_EMPR_ID         '+
           '      ,ORDS_TPRC_ID                 = :ORDS_TPRC_ID              '+
           '      ,ORDS_TPRC_EMPR_ID            = :ORDS_TPRC_EMPR_ID         '+
           '      ,ORDS_DTA_INSTALACAO          = :ORDS_DTA_INSTALACAO       '+
           '      ,ORDS_GENE_EMPR_ID_TIPO_OS    = :ORDS_GENE_EMPR_ID_TIPO_OS '+
           '      ,ORDS_GENE_TGEN_ID_TIPO_OS    = :ORDS_GENE_TGEN_ID_TIPO_OS '+
           '      ,ORDS_GENE_ID_TIPO_OS         = :ORDS_GENE_ID_TIPO_OS      '+
           '      ,ORDS_STATUS                  = :ORDS_STATUS               '+
           '      ,ORDS_USER_ID_TEC             = :ORDS_USER_ID_TEC          '+
           '      ,ORDS_VLR_TOTAL_OS            = :ORDS_VLR_TOTAL_OS         '+
           '      ,ORDS_VLR_DESCONTO            = :ORDS_VLR_DESCONTO         '+
           '      ,ORDS_VLR_PAGO                = :ORDS_VLR_PAGO             '+
           '      ,ORDS_BAIXADO_ESTOQUE         = :ORDS_BAIXADO_ESTOQUE      '+
           '      ,ORDS_DTA_CADASTRO            = :ORDS_DTA_CADASTRO         '+
           '      ,ORDS_USER_ID                 = :ORDS_USER_ID              '+
           ' WHERE ORDS_ID                      = :ORDS_ID                   '+
           '   AND ORDS_EMPR_ID                 = :ORDS_EMPR_ID              ';
   end;}

    intORDS_ID := funcLocal.Se((qryCons.FieldByName('AGEN_ORDS_ID').IsNull)or(qryCons.FieldByName('AGEN_ORDS_ID').AsInteger = -1),funcLocal.ObterSequencia('ORDEM_SERVICO', IntToStr(funcLocal.Empr_ID)),qryCons.FieldByName('AGEN_ORDS_ID').AsInteger);

    qryConsI.Close;
    qryConsI.sql.Clear;
    qryConsI.sql.Add(S);
    qryConsI.Params.ParamByName('ORDS_ID').AsInteger                   := intORDS_ID;
    qryConsI.Params.ParamByName('ORDS_EMPR_ID').AsInteger              := funcLocal.Empr_ID;
    qryConsI.Params.ParamByName('ORDS_CLIE_ID').AsInteger              := qryCons.FieldByName('AGEN_CLIE_ID').AsInteger;
    qryConsI.Params.ParamByName('ORDS_CLIE_EMPR_ID').AsInteger         := funcLocal.Empr_ID;
    qryConsI.Params.ParamByName('ORDS_TPRC_ID').AsInteger              := qryCons.FieldByName('AGEN_TPRC_ID').AsInteger;
    qryConsI.Params.ParamByName('ORDS_TPRC_EMPR_ID').AsInteger         := funcLocal.Empr_ID;
    qryConsI.Params.ParamByName('ORDS_DTA_INSTALACAO').AsDateTime      := qryCons.FieldByName('AGEN_DATA').AsDateTime;
    qryConsI.Params.ParamByName('ORDS_GENE_EMPR_ID_TIPO_OS').AsInteger := 0;
    qryConsI.Params.ParamByName('ORDS_GENE_TGEN_ID_TIPO_OS').AsInteger := 12;
    qryConsI.Params.ParamByName('ORDS_GENE_ID_TIPO_OS').AsInteger      := 1;
    qryConsI.Params.ParamByName('ORDS_STATUS').AsInteger               := funcLocal.Se((qryCons.FieldByName('AGEN_STATUS').AsString[1] IN ['A','O']),0,
                                                                          funcLocal.Se(qryCons.FieldByName('AGEN_STATUS').AsString='F',2,3));
    qryConsI.Params.ParamByName('ORDS_USER_ID_TEC').AsInteger          := qryCons.FieldByName('AGEN_USER_ID_ATENDENTE').AsInteger;
    qryConsI.Params.ParamByName('ORDS_VLR_TOTAL_OS').AsFloat           := qryCons.FieldByName('AGEN_VLR_TOTAL').AsFloat;
    qryConsI.Params.ParamByName('ORDS_VLR_DESCONTO').AsFloat           := qryCons.FieldByName('AGEN_VLR_DESCONTO').AsFloat;
    qryConsI.Params.ParamByName('ORDS_VLR_PAGO').AsFloat               := qryCons.FieldByName('AGEN_VLR_PAGO').AsFloat;
    qryConsI.Params.ParamByName('ORDS_BAIXADO_ESTOQUE').AsInteger      := 0;
    qryConsI.Params.ParamByName('ORDS_DTA_CADASTRO').AsDateTime        := qryCons.FieldByName('AGEN_DTA_CADASTRO').AsDateTime;
    qryConsI.Params.ParamByName('ORDS_USER_ID').AsInteger              := qryCons.FieldByName('AGEN_USER_ID').AsInteger;
    qryConsI.ExecSQL();

    qryConsI.SQL.Clear;
    qryConsI.SQL.Add('UPDATE AGENDA');
    qryConsI.SQL.Add('   SET AGEN_ORDS_ID      = :ORDS_ID');
    qryConsI.SQL.Add('      ,AGEN_ORDS_EMPR_ID = :EMPR_ID');
    qryConsI.SQL.Add(' WHERE AGEN_ID           = :AGEN_ID');
    qryConsI.SQL.Add('   AND AGEN_EMPR_ID      = :EMPR_ID');
    qryConsI.Params.ParamByName('ORDS_ID').AsInteger := intORDS_ID;
    qryConsI.Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    qryConsI.Params.ParamByName('AGEN_ID').AsInteger := intCod;
    qryConsI.Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    qryConsI.ExecSQL();

    dmAgenda.cdsOrdemServicoItens.First;
    while not dmAgenda.cdsOrdemServicoItens.Eof do begin
      dmAgenda.cdsOrdemServicoItens.Edit;
      dmAgenda.cdsOrdemServicoItensODIT_ORDS_ID.AsInteger      := intORDS_ID;
      dmAgenda.cdsOrdemServicoItensODIT_ORDS_CLIE_ID.AsInteger := qryCons.FieldByName('AGEN_CLIE_ID').AsInteger;
      dmAgenda.cdsOrdemServicoItensODIT_TPIT_TPRC_ID.AsInteger := qryCons.FieldByName('AGEN_TPRC_ID').AsInteger;
      dmAgenda.cdsOrdemServicoItensODIT_USER_ID_TEC.AsInteger  := qryCons.FieldByName('AGEN_USER_ID_ATENDENTE').AsInteger;
      dmAgenda.cdsOrdemServicoItens.Next;
    end;
    dmAgenda.cdsOrdemServicoItens.ApplyUpdates(-1);

    try //Ele esta criando outra OS quando muda de cliente, entáo excluimos a antiga.
      qryConsI.Close;
      qryConsI.sql.Clear;
      qryConsI.sql.Add('DELETE FROM ORDEM_SERVICO');
      qryConsI.sql.Add(' WHERE ORDS_ID            = :ORDS_ID');
      qryConsI.sql.Add('   AND ORDS_EMPR_ID       = :ORDS_EMPR_ID');
      qryConsI.sql.Add('   AND ORDS_CLIE_ID      <> :ORDS_CLIE_ID');
      qryConsI.sql.Add('   AND ORDS_CLIE_EMPR_ID  = :ORDS_CLIE_EMPR_ID');
      qryConsI.Params.ParamByName('ORDS_ID').AsInteger                   := intORDS_ID;
      qryConsI.Params.ParamByName('ORDS_EMPR_ID').AsInteger              := funcLocal.Empr_ID;
      qryConsI.Params.ParamByName('ORDS_CLIE_ID').AsInteger              := qryCons.FieldByName('AGEN_CLIE_ID').AsInteger;
      qryConsI.Params.ParamByName('ORDS_CLIE_EMPR_ID').AsInteger         := funcLocal.Empr_ID;
      qryConsI.ExecSQL();
    except
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    qryConsI.Close;
    FreeAndNil(qryConsI);
  end;
end;

procedure TfCadAgenda.TratandoFrames;
begin
  cdsLocal.Edit;
  cdsLocal.FieldByName('AGEN_CLIE_ID').AsString := frPesqCliente.InGrid();
  cdsLocal.FieldByName('AGEN_CLIE_ID_INDICACAO').AsString := frPesqIndicacao.InGrid();
  cdsLocal.FieldByName('AGEN_USER_ID_ATENDENTE').AsString := frPesqAtendente.InGrid();
  cdsLocal.FieldByName('AGEN_TPRC_ID').AsString := frPesqTabPrecos.InGrid();
end;

procedure TfCadAgenda.imgAntesDblClick(Sender: TObject);
var
  imgLogo : TBitmap;
  imgJPEG : TJPEGImage;
begin
  try
    cdsLocal.Edit;
    imgLogo := TBitmap.Create;
    imgJPEG := TJPEGImage.Create;
    if OpenPictureDialog.Execute then begin
      try
        imgLogo.LoadFromFile(OpenPictureDialog.FileName);
        cdsLocal.FieldByName('AGEN_FOTO_ANT').Assign(imgLogo);
      except
        imgJPEG.LoadFromFile(OpenPictureDialog.FileName);
        imgLogo.Assign(imgJPEG);
        cdsLocal.FieldByName('AGEN_FOTO_ANT').Assign(imgLogo);
      end;
    end;
  except on e: exception do begin
    funcLocal.ReportaErro(Caption,(Sender as TComponent).Name,funcLocal.User_Login,e.Message);
    funcLocal.Alerta(e.Message,1);
  end; end;
end;

procedure TfCadAgenda.imgDepoisDblClick(Sender: TObject);
var
  imgLogo : TBitmap;
  imgJPEG : TJPEGImage;
begin
  try
    cdsLocal.Edit;
    imgLogo := TBitmap.Create;
    imgJPEG := TJPEGImage.Create;
    if OpenPictureDialog.Execute then begin
      try
        imgLogo.LoadFromFile(OpenPictureDialog.FileName);
        cdsLocal.FieldByName('AGEN_FOTO_DEP').Assign(imgLogo);
      except
        imgJPEG.LoadFromFile(OpenPictureDialog.FileName);
        imgLogo.Assign(imgJPEG);
        cdsLocal.FieldByName('AGEN_FOTO_DEP').Assign(imgLogo);
      end;
    end;
  except on e: exception do begin
    funcLocal.ReportaErro(Caption,(Sender as TComponent).Name,funcLocal.User_Login,e.Message);
    funcLocal.Alerta(e.Message,1);
  end; end;
end;

procedure TfCadAgenda.Label26Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(436);
end;

procedure TfCadAgenda.Label26MouseLeave(Sender: TObject);
begin
  inherited;
  funcLocal.UnPrintLabel(Sender);
end;

procedure TfCadAgenda.Label26MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  funcLocal.PrintLabel(Sender);
end;

procedure TfCadAgenda.OpenClientDataSet(intPos: Integer = 99);
begin
  with dmAgenda do begin
    case intPos of
      1: begin
        with cdsAcertos do begin
          try
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Params.ParamByName('ID').AsInteger      := cdsLocal.FieldByName('AGEN_ID').AsInteger;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
          except
          end;
        end;
      end;
      6: begin
          with cdsPesqProduto do begin
            try
              Close;
              Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
              Params.ParamByName('TPRC_ID').AsInteger := StrToInt(frPesqTabPrecos.edtCodigo.Text);
              Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
              Params.ParamByName('DATA').AsDate := funcLocal.DataServidor(funcLocal.Conexao);
              Params.ParamByName('DATA').AsDate := funcLocal.DataServidor(funcLocal.Conexao);
              Open;
            except
            end;
          end;
        end;
      7:
        begin
          try
            with dmAgenda.cdsOrdemServicoItens do
            begin
              Close;
              Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
              Params.ParamByName('ORDS_ID').AsInteger := dmAgenda.cdsAgendaAGEN_ORDS_ID.AsInteger;
              Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
              Open;
              frPesqTabPrecos.Enabled := true;
              if not IsEmpty then frPesqTabPrecos.Enabled := false;
              Append;
            end;
          except
          end;
        end;
    else
      begin
        OpenClientDataSet(1);
        OpenClientDataSet(6);
        OpenClientDataSet(7);
      end;
    end;
  end;
end;

procedure TfCadAgenda.btnPesqProdClick(Sender: TObject);
var
  strTMP, strTMPI: String;
  edtAtual: TRxDBCalcEdit;
begin
  OpenClientDataSet(6);
  with dmAgenda, cdsOrdemServicoItens do begin
    strTMP := funcLocal.Busca_Registro(cdsPesqProduto, '','TPIT_ID;TPIT_TPRC_ID;TPIT_PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;PROD_GARANTIA;MARCA_PROD;MODELO_PROD;PROD_DURACAO;TPIT_VLR_GONDOLA','');
    if strTMP <> '' then begin
      try
        Edit;
        FieldByName('ODIT_TPIT_ID').AsString      := funcLocal.Buscar_Coluna(strTMP, 1);
        FieldByName('ODIT_TPIT_TPRC_ID').AsString := funcLocal.Buscar_Coluna(strTMP, 2);
        FieldByName('ODIT_TPIT_PROD_ID').AsString := funcLocal.Buscar_Coluna(strTMP, 3);
        FieldByName('PROD_DESCRICAO').AsString    := funcLocal.Buscar_Coluna(strTMP, 4);
        FieldByName('PROD_UNIDADE').AsString      := funcLocal.Buscar_Coluna(strTMP, 5);
        FieldByName('PROD_GARANTIA').AsString     := funcLocal.Buscar_Coluna(strTMP, 6);
        FieldByName('MARCA_PROD').AsString        := funcLocal.Buscar_Coluna(strTMP, 7);
        FieldByName('MODELO_PROD').AsString       := funcLocal.Buscar_Coluna(strTMP, 8);
        FieldByName('PROD_DURACAO').AsString      := funcLocal.Buscar_Coluna(strTMP, 9);
        edtAtual := TRxDBCalcEdit.Create(nil);
        strTMPI := funcLocal.Buscar_Coluna(strTMP, 10);
        strTMPI := StringReplace(strTMPI, '.', '', []);
        edtAtual.Value := StrToFloat(strTMPI);
        FieldByName('ODIT_VLR_UNITARIO').AsFloat := edtAtual.Value;
        edtCodProd.Modified := true;
      finally
        FreeAndNil(edtAtual);
      end;
    end else begin
      Edit;
      FieldByName('ODIT_TPIT_ID').AsString := '';
      FieldByName('ODIT_TPIT_TPRC_ID').AsString := '';
      FieldByName('ODIT_TPIT_PROD_ID').AsString := '';
      FieldByName('PROD_DESCRICAO').AsString := '';
      FieldByName('PROD_UNIDADE').AsString := '';
      FieldByName('PROD_GARANTIA').AsString := '';
      FieldByName('MARCA_PROD').AsString := '';
      FieldByName('MODELO_PROD').AsString := '';
      FieldByName('ODIT_VLR_UNITARIO').AsFloat := 0;
      FieldByName('PROD_DURACAO').AsString := '';
    end;
  end;
  edtCodProd.SetFocus;
end;

procedure TfCadAgenda.btnRetClick(Sender: TObject);
begin
  inherited;
  with dmAgenda do begin
    if not cdsOrdemServicoItens.IsEmpty then begin
      cdsOrdemServicoItens.Delete;
      try
        cdsAgendaAGEN_VLR_TOTAL.AsFloat := cdsOrdemServicoItensTOTALITENS.Value;
      except
        cdsAgendaAGEN_VLR_TOTAL.AsFloat := 0;
      end;
      SomaPedido;
      edtCodProd.SetFocus;
    end else frPesqTabPrecos.Enabled := true;
  end;
end;

procedure TfCadAgenda.edtTelefoneExit(Sender: TObject);
begin
  inherited;
  cdsLocal.FieldByName( (Sender as TDBEdit).DataField ).AsString := funcLocal.TrataTelefone( cdsLocal.FieldByName( (Sender as TDBEdit).DataField ).AsString );
  ListaHistorico();
end;

procedure TfCadAgenda.ckDiabetesClick(Sender: TObject);
begin
  inherited;
  edtTipoDiabetes.Enabled := ckDiabetes.Checked;
  if not ckDiabetes.Checked then edtTipoDiabetes.Clear;
end;

procedure TfCadAgenda.ckHepatiteClick(Sender: TObject);
begin
  inherited;
  edtTipoHepatite.Enabled := ckHepatite.Checked;
  if not ckHepatite.Checked then edtTipoHepatite.Clear;
end;

procedure TfCadAgenda.ckUtilizouAnestesiaClick(Sender: TObject);
begin
  inherited;
  rdNivelAnestesia.Enabled := ckUtilizouAnestesia.Checked;
  if not ckUtilizouAnestesia.Checked then
    edtTempoAnestesia.Enabled := false;
end;

procedure TfCadAgenda.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(DBGrid1.DataSource.DataSet.RecNo) then
    begin
      DBGrid1.Canvas.Font.Color := clBlack;
      DBGrid1.Canvas.Brush.Color := $00FFDFDF;
    end
    else
    begin
      DBGrid1.Canvas.Font.Color := clBlack;
      DBGrid1.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in State then
    begin
      DBGrid1.Canvas.Brush.Color := clSilver;
      DBGrid1.Canvas.Font.Style := [fsBold];
    end;
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
end;

procedure TfCadAgenda.DBGrid1Enter(Sender: TObject);
begin
  inherited;
  dmAgenda.cdsOrdemServicoItens.Cancel;
end;

procedure TfCadAgenda.grdAcertosDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(grdAcertos.DataSource.DataSet.RecNo) then begin
      grdAcertos.Canvas.Font.Color  := clBlack;
      grdAcertos.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      grdAcertos.Canvas.Font.Color  := clBlack;
      grdAcertos.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      grdAcertos.Canvas.Brush.Color := clSilver;
      grdAcertos.Canvas.Font.Style  := [fsBold];
    end;
     grdAcertos.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
end;

procedure TfCadAgenda.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := false;
end;

procedure TfCadAgenda.DBMemo1Exit(Sender: TObject);
begin
  inherited;
    Self.KeyPreview := true;
end;

procedure TfCadAgenda.edtCodProdExit(Sender: TObject);
var
  strTMP, strTMPI, strPROD: String;
  edtAtual: TRxDBCalcEdit;
begin
  if not edtCodProd.Modified then
    Exit;
  with dmAgenda, cdsOrdemServicoItens do
  begin
    if edtCodProd.Text <> '' then
    begin
      OpenClientDataSet(6);
      strPROD := edtCodProd.Text;
      cdsOrdemServicoItens.Cancel;
      if not cdsOrdemServicoItens.Locate('ODIT_TPIT_TPRC_ID;ODIT_TPIT_PROD_ID',
        VarArrayOf([StrToInt(frPesqTabPrecos.edtCodigo.Text), StrToInt(strPROD)]), []) then
      begin
        Append;
        strTMP := funcLocal.Busca_Registro(cdsPesqProduto, '',
          'TPIT_ID;TPIT_TPRC_ID;TPIT_PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;PROD_GARANTIA;MARCA_PROD;MODELO_PROD;PROD_DURACAO;TPIT_VLR_GONDOLA',
          'TPIT_PROD_ID = ' + strPROD);
        if strTMP <> '' then
        begin
          try
            FieldByName('ODIT_TPIT_ID').AsString := funcLocal.Buscar_Coluna(strTMP, 1);
            FieldByName('ODIT_TPIT_TPRC_ID').AsString := funcLocal.Buscar_Coluna(strTMP, 2);
            FieldByName('ODIT_TPIT_PROD_ID').AsString := funcLocal.Buscar_Coluna(strTMP, 3);
            FieldByName('PROD_DESCRICAO').AsString :=funcLocal.Buscar_Coluna(strTMP, 4);
            FieldByName('PROD_UNIDADE').AsString :=  funcLocal.Buscar_Coluna(strTMP, 5);
            FieldByName('PROD_GARANTIA').AsString := funcLocal.Buscar_Coluna(strTMP, 6);
            FieldByName('MARCA_PROD').AsString :=    funcLocal.Buscar_Coluna(strTMP, 7);
            FieldByName('MODELO_PROD').AsString :=   funcLocal.Buscar_Coluna(strTMP, 8);
            FieldByName('PROD_DURACAO').AsString := funcLocal.Buscar_Coluna(strTMP, 9);
            edtAtual := TRxDBCalcEdit.Create(nil);
            strTMPI := funcLocal.Buscar_Coluna(strTMP, 10);
            strTMPI := StringReplace(strTMPI, '.', '', []);
            edtAtual.Value := StrToFloat(strTMPI);
            FieldByName('ODIT_VLR_UNITARIO').AsFloat := edtAtual.Value;
          finally
            FreeAndNil(edtAtual);
          end;
        end
        else
        begin
          FieldByName('ODIT_TPIT_ID').AsString := '';
          FieldByName('ODIT_TPIT_TPRC_ID').AsString := '';
          FieldByName('ODIT_TPIT_PROD_ID').AsString := '';
          FieldByName('PROD_DESCRICAO').AsString := '';
          FieldByName('PROD_UNIDADE').AsString := '';
          FieldByName('PROD_GARANTIA').AsString := '';
          FieldByName('MARCA_PROD').AsString := '';
          FieldByName('MODELO_PROD').AsString := '';
          FieldByName('ODIT_VLR_UNITARIO').AsFloat := 0;
          FieldByName('PROD_DURACAO').AsString := '';
        end;
      end
      else
      begin
        cdsOrdemServicoItens.Edit;
      end;
    end
    else
    begin
      FieldByName('ODIT_TPIT_ID').AsString := '';
      FieldByName('ODIT_TPIT_TPRC_ID').AsString := '';
      FieldByName('ODIT_TPIT_PROD_ID').AsString := '';
      FieldByName('PROD_DESCRICAO').AsString := '';
      FieldByName('PROD_UNIDADE').AsString := '';
      FieldByName('PROD_GARANTIA').AsString := '';
      FieldByName('MARCA_PROD').AsString := '';
      FieldByName('MODELO_PROD').AsString := '';
      FieldByName('ODIT_VLR_UNITARIO').AsFloat := 0;
      FieldByName('PROD_DURACAO').AsString := '';
    end;
  end;
end;

procedure TfCadAgenda.edtCodProdKeyPress(Sender: TObject; var Key: Char);
var
  btnTMP : TSpeedButton;
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then begin
    try
      if Trim(TDBEdit(Sender).Text) = '' then begin
        if Key = #27 then Exit;
        funcLocal.VlrPesq := Key;
        Key := #0;
        btnTMP := TSpeedButton(Self.FindComponent( funcLocal.Buscar_Coluna(TDBEdit(Sender).ImeName,1) ));
        btnTMP.Click;
      end else Key := #0;
    except
    end;
  end;
end;

procedure TfCadAgenda.edtQtdeEnter(Sender: TObject);
begin
  inherited;
  boolFrac := funcLocal.ProdutoVendeFracionado(edtCodProd.Text);
end;

procedure TfCadAgenda.edtQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if boolFrac then begin
    if not(CharInSet(Key, ['0' .. '9', ',', #8])) then
      Key := #0;
  end else begin
    if not(CharInSet(Key, ['0' .. '9', #8])) then
      Key := #0;
  end;
end;

procedure TfCadAgenda.edtVlrUnitEnter(Sender: TObject);
begin
  inherited;
  try
    edtVlrUnit.Enabled := funcLocal.RetornaPermissao(453);
    if not edtVlrUnit.Enabled then
      Perform(WM_NEXTDLGCTL, 0, 0);
  except
  end;
end;

procedure TfCadAgenda.FormShow(Sender: TObject);
begin
  inherited;

  IniciarForm();

  group1.Enabled := false;
  group2.Enabled := false;
  case rdStatus.ItemIndex of
    0,1 : begin
      group1.Enabled := true;
      group2.Enabled := true;
    end;
  end;
  edtDesconto.Enabled := group1.Enabled;
  SetarFocus();
  if not (dmAgenda.cdsOrdemServicoItens.State in [dsInsert,dsEdit]) then
    dmAgenda.cdsOrdemServicoItens.Edit;
  ModoGrafico := true;
  ListaHistorico();

  OpenClientDataSet(1);
end;

procedure TfCadAgenda.ListaHistorico();
var
  qryCons : TSQLQuery;
  intAberto,
  intConf,
  intFechado,
  intCancelado,
  intListaNegra : Integer;
begin
  try
    try
      intAberto := 0; intConf := 0; intFechado := 0;
      intCancelado :=0; intListaNegra := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT COUNT(*) AS QTDE,');
        sql.Add('       AGEN_STATUS');
        sql.Add('  FROM AGENDA');
        sql.Add('  LEFT JOIN CLIENTES');
        sql.Add('    ON CLIE_ID      = AGEN_CLIE_ID');
        sql.Add('   AND CLIE_EMPR_ID = AGEN_CLIE_EMPR_ID');
        sql.Add(' WHERE AGEN_EMPR_ID = :EMPR_ID');
        sql.Add('   AND CASE WHEN AGEN_CLIE_ID = (SELECT CSIS_CLIE_ID FROM CONF_SISTEMA WHERE CSIS_EMPR_ID = :EMPR_ID) THEN AGEN_TELEFONE');
        sql.Add('            ELSE CLIE_TELEFONE1');
        sql.Add('       END          = :TELEFONE');
        sql.Add('   AND AGEN_ID     <> :AGEN_ID');
        sql.Add(' GROUP BY');
        sql.Add('       AGEN_STATUS');
        sql.Add(' ORDER BY');
        sql.Add('       AGEN_STATUS');
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Params.ParamByName('TELEFONE').AsString := cdsLocal.FieldByName('AGEN_TELEFONE').AsString;
        Params.ParamByName('AGEN_ID').AsInteger := cdsLocal.FieldByName('AGEN_ID').AsInteger;
        Open;
        if IsEmpty then Exit;
        First;
        while not Eof do begin
          case Fields[1].AsString[1] of
            'A' : intAberto     := intAberto     + FieldByName('QTDE').AsInteger;
            'O' : intConf       := intConf       + FieldByName('QTDE').AsInteger;
            'F' : intFechado    := intFechado    + qryCons.FieldByName('QTDE').AsInteger;
            'C' : intCancelado  := intCancelado  + FieldByName('QTDE').AsInteger;
            'L' : intListaNegra := intListaNegra + FieldByName('QTDE').AsInteger;
          end;
          Next;
        end;
        lblAgendas.Caption      := FormatFloat('00',intAberto+intConf+intFechado+intCancelado+intListaNegra);
        lblAbertos.Caption      := FormatFloat('00',intAberto);
        lblConfirmados.Caption  := FormatFloat('00',intConf);
        lblFechados.Caption     := FormatFloat('00',intFechado);
        lblCancelados.Caption   := FormatFloat('00',intCancelado);
        lblListaNegra.Caption   := FormatFloat('00',intListaNegra);
      end;
    except
    end;
  finally
    lblAgendas.Caption      := FormatFloat('00',intAberto+intConf+intFechado+intCancelado+intListaNegra);
    lblAbertos.Caption      := FormatFloat('00',intAberto);
    lblConfirmados.Caption  := FormatFloat('00',intConf);
    lblFechados.Caption     := FormatFloat('00',intFechado);
    lblCancelados.Caption   := FormatFloat('00',intCancelado);
    lblListaNegra.Caption   := FormatFloat('00',intListaNegra);
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadAgenda.frPesqClientebtnPesquisarClick(Sender: TObject);
begin
  inherited;
  frPesqCliente.btnPesquisarClick(Sender);

end;

procedure TfCadAgenda.frPesqClienteedtCodigoExit(Sender: TObject);
begin
  inherited;
  frPesqCliente.edtCodigoExit(Sender);
  RetornaTelefoneCliente();
  ListaHistorico();
end;

procedure TfCadAgenda.RetornaTelefoneCliente();
var
  qryCons : TSQLQuery;
begin
  if not frPesqCliente.TemRegistro then Exit;
  if StrToInt(frPesqCliente.InGrid) = funcLocal.ClientePadrao then Exit;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT CLIE_TELEFONE1, CLIE_OBS FROM CLIENTES WHERE CLIE_ID = :CLIE_ID AND CLIE_EMPR_ID = :EMPR_ID');
      Params.ParamByName('CLIE_ID').AsString := frPesqCliente.InGrid;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
      if Trim(Fields[0].AsString) = '()-' then begin
        funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                         'Cliente sem telefone informado, verifique o cadastro do cliente antes de continuar!',0);
      end;
      cdsLocal.Edit;
      cdsLocal.FieldByName('AGEN_TELEFONE').AsString := Fields[0].AsString;
      mmObsCliente.Lines.Clear;
      mmObsCliente.Lines.Add(Fields[1].AsString);
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadAgenda.frRelatorioProgress(Sender: TfrxReport;
  ProgressType: TfrxProgressType; Progress: Integer);
begin
  inherited;
  try
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblUsuario')).Text      := funcLocal.User_Login;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblFantasia')).Text     := funcLocal.Empr_Fantasia;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblEndereco')).Text     := 'End......: '+funcLocal.Empr_Endereco + ' - ' +
                                                                               funcLocal.Empr_Bairro   + ' - ' +
                                                                               funcLocal.Empr_Cidade   + ' - ' +
                                                                               funcLocal.Empr_UF;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblRazao_Social')).Text := 'CNPJ...: ' + funcLocal.Empr_CNPJ +
                                                                       ' - Insc. Est.: ' + funcLocal.Empr_IE;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblTelefone')).Text     := 'Fone(s): ' +
                                                                               funcLocal.Empr_Telefone + '/' +
                                                                               funcLocal.Empr_Fax;
    TfrxPictureView(TfrxReport(Sender).FindComponent('imgLogo')).Picture.LoadFromFile(ExtractFileDir(ParamStr(0))+'\imgLogo.bmp');
  except
  end;
end;

procedure TfCadAgenda.IniciarForm();
begin
  OpenClientDataSet(7);
  SomaPedido;
  PreencheFrames;
  StatusOld := rdStatus.ItemIndex;
end;

procedure TfCadAgenda.SetarFocus();
begin
  if edtDtaAgenda.Date <=0 then begin
    edtDtaAgenda.SetFocus;
    Exit;
  end;
  if Length(Trim(edtHorario.Text))<>5 then begin
    edtHorario.SetFocus;
    Exit;
  end;
  if not frPesqTabPrecos.TemRegistro then begin
    frPesqTabPrecos.SetFocus;
    Exit;
  end;
  if not frPesqAtendente.TemRegistro then begin
    frPesqAtendente.SetFocus;
    Exit;
  end;
  frPesqCliente.SetFocus;
end;

procedure TfCadAgenda.PreencheFrames;
begin
  frPesqCliente.BuscarRegistro(cdsLocal.FieldByName('AGEN_CLIE_ID').AsString);
  frPesqIndicacao.BuscarRegistro(cdsLocal.FieldByName('AGEN_CLIE_ID_INDICACAO').AsString);
  frPesqAtendente.BuscarRegistro(cdsLocal.FieldByName('AGEN_USER_ID_ATENDENTE').AsString);
  frPesqTabPrecos.BuscarRegistro(cdsLocal.FieldByName('AGEN_TPRC_ID').AsString);
end;

procedure TfCadAgenda.rdNivelAnestesiaChange(Sender: TObject);
begin
  inherited;
  edtTempoAnestesia.Enabled := false;
  case rdNivelAnestesia.ItemIndex of
    2 : begin
      edtTempoAnestesia.Enabled := true;
    end;
  end;
end;

procedure TfCadAgenda.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  ExibirFichaCliente('S');
end;

procedure TfCadAgenda.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  Label26Click(Sender);
  edtCodProd.SetFocus;
end;

initialization
  fCadAgenda := TfCadAgenda.Create(nil);
finalization
  FreeAndNil(fCadAgenda);

end.
