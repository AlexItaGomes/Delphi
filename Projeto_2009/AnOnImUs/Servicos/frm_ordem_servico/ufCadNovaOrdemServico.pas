unit ufCadNovaOrdemServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, Mask,
  rxToolEdit, RXDBCtrl, Grids, DBGrids, rxCurrEdit, SQLExpr, DB,
  uFrPesqIndividual;

type
  TOrdemServico = class
  private
    function  getDtUltimoServ: TDate;
    function  getEquipamento: Integer;
    function  getFornecedor: Integer;
    function  getNrPedido: String;
    function  getTabPreco: Integer;
    function  getTipoOS: Integer;
    procedure setDtUltimoServ(const Value: TDate);
    procedure setEquipamento(const Value: Integer);
    procedure setFornecedor(const Value: Integer);
    procedure setNrPedido(const Value: String);
    procedure setTabPreco(const Value: Integer);
    procedure setTipoOS(const Value: Integer);
    function  getTecnico: Integer;
    procedure setTecnico(const Value: Integer);
    function  getCliente: Integer;
    procedure setCliente(const Value: Integer);
    function  getVlrDesc: Real;
    function  getVlrTotal: Real;
    procedure setVlrDesc(const Value: Real);
    procedure setVlrTotal(const Value: Real);
    function  getFiltro: Integer;
    procedure setFiltro(const Value: Integer);
    function  getClienteGarantia: Integer;
    procedure setClienteGarantia(const Value: Integer);

    property Cliente: Integer read getCliente write setCliente;
    property ClienteGarantia : Integer read getClienteGarantia write setClienteGarantia;
    property TipoOS: Integer read getTipoOS write setTipoOS;
    property TabPreco: Integer read getTabPreco write setTabPreco;
    property Tecnico: Integer read getTecnico write setTecnico;
    property Equipamento: Integer read getEquipamento write setEquipamento;
    property NrPedido: String read getNrPedido write setNrPedido;
    property Fornecedor: Integer read getFornecedor write setFornecedor;
    property DtUltimoServ: TDate read getDtUltimoServ write setDtUltimoServ;
    property VlrTotal: Real read getVlrTotal write setVlrTotal;
    property VlrDesc: Real read getVlrDesc write setVlrDesc;
    property Filtro : Integer read getFiltro write setFiltro;

  protected
    FCliente: Integer;
    FClienteGarantia: Integer;
    FTipoOS: Integer;
    FTabPreco: Integer;
    FTecnico: Integer;
    FEquip: Integer;
    FNrPedido: String;
    FFornec: Integer;
    FFiltro: Integer;
    FDtUltimoServ: TDate;
    FVlrTotal, FVlrDesc: Real;
  end;

type
  TfCadNovaOrdemServico = class(TfCadastro)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    GroupBox1: TGroupBox;
    edtCodTec: TDBEdit;
    lbCodTec: TLabel;
    DBEdit8: TDBEdit;
    lbTecnico: TLabel;
    edtCodEquip: TDBEdit;
    lbCodEquip: TLabel;
    DBEdit17: TDBEdit;
    lbEquipamento: TLabel;
    btnPesqTec: TSpeedButton;
    btnPesqEquip: TSpeedButton;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    DBGrid1: TDBGrid;
    edtCodProd: TDBEdit;
    Label26: TLabel;
    btnPesqProd: TSpeedButton;
    DBEdit16: TDBEdit;
    Label27: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    DBEdit24: TDBEdit;
    Label29: TLabel;
    DBEdit25: TDBEdit;
    Label30: TLabel;
    DBEdit26: TDBEdit;
    Label31: TLabel;
    btnAdic: TBitBtn;
    btnRet: TBitBtn;
    Label28: TLabel;
    edtVlrUnit: TRxDBCalcEdit;
    edtQtde: TRxDBCalcEdit;
    Label32: TLabel;
    Label33: TLabel;
    edtCodTipo: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    btnPesqTipo: TSpeedButton;
    Label13: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    btnPesqTab: TSpeedButton;
    edtCodTab: TDBEdit;
    DBEdit6: TDBEdit;
    btnPesqNovoEquip: TSpeedButton;
    Label5: TLabel;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    DBEdit3: TDBEdit;
    edtVlrDesconto: TRxDBCalcEdit;
    Label14: TLabel;
    DBEdit5: TDBEdit;
    TabSheet1: TTabSheet;
    GroupBox7: TGroupBox;
    DBGrid2: TDBGrid;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBEdit4: TDBEdit;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBEdit23: TDBEdit;
    SpeedButton4: TSpeedButton;
    edtDtInstalacao: TDBDateEdit;
    lbDtAgendamento: TLabel;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    lbNrPedido: TLabel;
    edtNrEquipamento: TDBEdit;
    rdStatus: TDBRadioGroup;
    btnPesqForn: TSpeedButton;
    lbCodFornec: TLabel;
    lbFornecedor: TLabel;
    btnAdicFornec: TSpeedButton;
    edtCodFornec: TDBEdit;
    edtFornecedor: TDBEdit;
    frPesqStatusOS: TfrPesqIndividual;
    GroupBox6: TGroupBox;
    DBMemo2: TDBMemo;
    GroupBox3: TGroupBox;
    DBMemo1: TDBMemo;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    procedure Label11MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Label11MouseLeave(Sender: TObject);
    procedure edtCodTabKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodTabExit(Sender: TObject);
    procedure btnPesqTabClick(Sender: TObject);
    procedure edtCodTipoExit(Sender: TObject);
    procedure btnPesqTipoClick(Sender: TObject);
    procedure edtCodTecExit(Sender: TObject);
    procedure btnPesqTecClick(Sender: TObject);
    procedure edtCodEquipExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btnPesqProdClick(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure edtCodProdExit(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure btnRetClick(Sender: TObject);
    procedure btnAdicClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure lbCodEquipMouseLeave(Sender: TObject);
    procedure lbCodEquipClick(Sender: TObject);
    procedure lbCodTecMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure lbCodTecMouseLeave(Sender: TObject);
    procedure lbCodTecClick(Sender: TObject);
    procedure Label26MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Label26MouseLeave(Sender: TObject);
    procedure Label26Click(Sender: TObject);
    procedure btnPesqNovoEquipClick(Sender: TObject);
    procedure btnPesqEquipClick(Sender: TObject);
    procedure edtVlrUnitEnter(Sender: TObject);
    procedure edtQtdeEnter(Sender: TObject);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure edtVlrDescontoExit(Sender: TObject);
    procedure edtVlrDescontoEnter(Sender: TObject);
    procedure edtCodTabEnter(Sender: TObject);
    procedure btnAdicEnter(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtCodFornecExit(Sender: TObject);
    procedure btnPesqFornClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure lbFornecedorMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure lbFornecedorMouseLeave(Sender: TObject);
    procedure lbCodFornecMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure lbCodFornecMouseLeave(Sender: TObject);
    procedure lbCodFornecClick(Sender: TObject);
    procedure btnAdicFornecClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBMemo2Enter(Sender: TObject);
    procedure DBMemo2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdStatusChange(Sender: TObject);
  private
    boolAgendado: Boolean;
    boolFrac, boolEstoqueNegativo: Boolean;
    intStatus: Integer;
    procedure OpenClientDataSet(intPos: Integer = 99);
    procedure RetornaTabelaPreco;
    function  ValidaProduto: Boolean;
    function  ValidaDados: Boolean;
    procedure SomaPedido;
    function  TrabalhaEstoqueNegativo: Boolean;
    procedure EstornaEstoque(intPos, intQtde: Integer);
    procedure SetaStatusOS(intPos: Integer; strOrds_ID, strClie_ID: String);
    procedure MovimentaFinanceiro(intPos, intQtde: Integer;
      strOrds_ID, strClie_ID: String; out boolOK: Boolean);
    procedure MovimentaEstoque(intPos, intEstoq: Integer);
    procedure MovimentaLancamentosFinanceiro(strOrds_ID: String);
    function  TemPagtos(strOrds_ID, strClie_ID: String): Boolean;
    procedure EstornaFinanceiro(strOrds_ID, strClie_ID: String);
    procedure ImprimirOS;
    procedure InformaTecnico(strUser_ID: String);
    function  TemProdutoVenda(strOrds_ID, strClie_ID: String): Boolean;
    function  JaTemAgendamento(Pedido: TOrdemServico): Boolean;
    function  RealizaAgendamento(Pedido: TOrdemServico; out strORDS: String; strAgendamento : String): Boolean;
    procedure ImprimirRequisicao;
    procedure SetaValoresFrames;
  public
    { Public declarations }
  end;

var
  fCadNovaOrdemServico: TfCadNovaOrdemServico;

implementation

uses udmOrdemServico, ufFechamentoOS, ufImprimirOS, ufRequisicaoMaterial, ufCadOrdemServico,
  ufCadTipoAgendamentoOS;

{$R *.dfm}

procedure TfCadNovaOrdemServico.btnAdicClick(Sender: TObject);
begin
  if ValidaProduto then begin
    with dmOrdemServico, cdsOrdemServicoItens do begin
      Edit;
      FieldByName('ODIT_VLR_TOTAL').AsFloat := (FieldByName('ODIT_VLR_UNITARIO').AsFloat * FieldByName('ODIT_QTDE').AsFloat);
      Append;
      cdsOrdemServicoORDS_VLR_TOTAL_OS.AsFloat := cdsOrdemServicoItensTOTALITENS.Value;
      SomaPedido;
    end;
    edtCodProd.SetFocus;
  end;
end;

procedure TfCadNovaOrdemServico.SomaPedido;
begin
  try
    with dmOrdemServico do begin
      cdsOrdemServico.Edit;
      cdsOrdemServicoVALOR_PAGAR.AsFloat := (cdsOrdemServicoORDS_VLR_TOTAL_OS.AsFloat -
                                            (cdsOrdemServicoORDS_VLR_PAGO.AsFloat +
                                             cdsOrdemServicoORDS_VLR_DESCONTO.AsFloat));
    end;
  except
  end;
end;

procedure TfCadNovaOrdemServico.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  lbCodTecClick(Sender);
  edtCodTec.SetFocus;
end;

procedure TfCadNovaOrdemServico.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  lbCodEquipClick(Sender);
  edtCodEquip.SetFocus;
end;

procedure TfCadNovaOrdemServico.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Label11Click(Sender);
  edtCodTab.SetFocus;
end;

procedure TfCadNovaOrdemServico.btnAdicFornecClick(Sender: TObject);
begin
  inherited;
  lbCodFornecClick(Sender);
  edtCodFornec.SetFocus;
end;

procedure TfCadNovaOrdemServico.SpeedButton5Click(Sender: TObject);
begin
  inherited;

  Label26Click(Sender);
  edtCodProd.SetFocus;
end;

function TfCadNovaOrdemServico.ValidaProduto: Boolean;
begin
  Result := true;
  if edtCodProd.Text = '' then begin
    funcLocal.Alerta
      ('Informe o código do produto/serviço antes de continuar.', 1);
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
  if not funcLocal.PermitePrecoVenda(edtCodTab.Text, edtCodProd.Text,
    edtVlrUnit.Value, 454, 455, 457) then begin
    edtCodProd.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfCadNovaOrdemServico.btnAdicEnter(Sender: TObject);
begin
  inherited;
  if (edtCodProd.Text <> '') and (edtQtde.Value > 0) then begin
    btnAdic.Click;
  end else
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfCadNovaOrdemServico.btnOkClick(Sender: TObject);

function InformeTipoAgendamento : String;
begin
  Result := 'Null';
  if funcLocal.TrabTipoAgendamento then begin
    fCadTipoAgendamentoOS.ShowModal;
    Result := fCadTipoAgendamentoOS.frPesquisa.InGrid();
  end;
end;

procedure MSGAgendamento(strORDS, strData, strValor : String);
begin
  funcLocal.Alerta('Reagendamento realizado com sucesso, verifique as informações lançadas antes de continuar.'+ #13 + #13 +
                   'Nrº Próx. O.S. :    ' + strORDS + #13 +
                   'Dt. Próx. Agend: ' + strData + #13 +
                   'Vlr. Total O.S.:     ' + strValor,0);
end;

var
  strOrds_ID, strORDS, strClie_ID: String;
  intQtde, intIndex: Integer;
  boolOK: Boolean;
  boolAgendamento: Boolean;
  Pedido: TOrdemServico;
begin
  if (edtVlrDesconto.Value = Null) or (edtVlrDesconto.Value < 0) then
    edtVlrDesconto.Value := 0;

  if ValidaDados then begin
    try
      funcLocal.MSGAguarde();
      if (intStatus <> rdStatus.ItemIndex) and (not dmOrdemServico.cdsOrdemServicoItens.IsEmpty) or
        (dmOrdemServico.cdsOrdemServico.Modified) then begin
        SomaPedido;
        Pedido := TOrdemServico.Create; //Criando um objeto para replicação depois
        ///Preenchendo os dados do objeto para replicação
        with Pedido do begin
          Cliente         := cdsLocal.FieldByName('ORDS_CLIE_ID').AsInteger;
          ClienteGarantia := cdsLocal.FieldByName('ORDS_CLIE_ID_GARANTIA').AsInteger;
          TipoOS          := 1;
          TabPreco        := cdsLocal.FieldByName('ORDS_TPRC_ID').AsInteger;
          Tecnico         := 1;
          Equipamento     := cdsLocal.FieldByName('ORDS_PROD_ID_EQUIP').AsInteger;
          Fornecedor      := funcLocal.Se((cdsLocal.FieldByName('ORDS_FORN_ID_EQUIP').AsString <> ''), cdsLocal.FieldByName('ORDS_FORN_ID_EQUIP').AsInteger, 0);
          NrPedido        := cdsLocal.FieldByName('ORDS_NR_PEDIDO_SERIE').AsString;
          DtUltimoServ    := (funcLocal.DataServidor(funcLocal.Conexao)) + funcLocal.PeriodoReagendamento;
          VlrTotal        := cdsLocal.FieldByName('ORDS_VLR_TOTAL_OS').AsFloat;
          VlrDesc         := cdsLocal.FieldByName('ORDS_VLR_DESCONTO').AsFloat;
//          Filtro          := frPesqFiltros.Value;
        end;
        try
          ///Alimentando variáveis
          strOrds_ID    := cdsLocal.FieldByName('ORDS_ID').AsString;
          strClie_ID    := cdsLocal.FieldByName('ORDS_CLIE_ID').AsString;
          intQtde       := cdsLocal.FieldByName('ORDS_BAIXADO_ESTOQUE').AsInteger;
          intIndex      := rdStatus.ItemIndex;

          if cdsLocal.State in dsEditModes then begin
            ///Se o Status for Rel./Pago e O.S. já estiver sido baixada apenas confirma e sai.
            if (intIndex = 2) and (intQtde <> 2) then begin
              cdsLocal.FieldByName('ORDS_STATUS').AsInteger := 1;
            end;
            cdsLocal.ApplyUpdates(-1);
            dmOrdemServico.cdsOrdemServicoItens.Cancel;
            dmOrdemServico.cdsOrdemServicoItens.ApplyUpdates(-1);
            cdsLocal.Edit;
            cdsLocal.FieldByName('ORDS_STATUS').AsInteger := intIndex;
          end;
          /// Se a O.S. já se encontra encerrada o sistema passa direto e fecha a tela
          if (intQtde <> 2) or (intIndex <> 2) then begin
            try
              case rdStatus.ItemIndex of
                0: begin
                    { Se feito o agendamento o sistema cancela os lançamentos financeiros }
                    MovimentaFinanceiro(0, intQtde, strOrds_ID, strClie_ID, boolOK);
                    if boolOK then begin
                      { Se confirmado pelo cliente, realiza o estorno do financeiro }
                      EstornaFinanceiro(strOrds_ID, strClie_ID)
                    end;
                    { Estornando o estoque baixado na O.S. }
                    EstornaEstoque(intQtde, intQtde);
                    { Seta o status atual da ordem de serviço }
                    SetaStatusOS(intIndex, strOrds_ID, strClie_ID);
                    ImprimirOS;
                    ImprimirRequisicao;
                  end;
                1: begin
                    { Se realizado o serviço o sistema cancela os lançamentos financeiros
                      e baixa o estoque disponível }
                    MovimentaFinanceiro(1, intQtde, strOrds_ID,
                      strClie_ID, boolOK);
                    if boolOK then begin
                      { Se confirmado pelo cliente, realiza o estorno do financeiro }
                      EstornaFinanceiro(strOrds_ID, strClie_ID)
                    end;
                    { Estornando o estoque lançado }
                    EstornaEstoque(intQtde, intQtde);
                    { Movimentando o estoque dos produtos lançados }
                    MovimentaEstoque(1, intQtde);
                    { Seta o status atual da ordem de serviço }
                    SetaStatusOS(intIndex, strOrds_ID, strClie_ID);
                  end;
                2: begin
                    { Se realizado e pago o servico o sistema solicita as formas de pagamento
                      e baixa o estoque atual e disponivel }
                    MovimentaFinanceiro(2, intQtde, strOrds_ID,
                      strClie_ID, boolOK);
                    if (not boolOK) then begin
                      rdStatus.ItemIndex := 1;
                      EstornaEstoque(1, intQtde);
                      MovimentaEstoque(1, intQtde);
                      intIndex := 1;
                      cdsLocal.Edit;
                      cdsLocal.FieldByName('ORDS_STATUS').AsInteger := 1;
                      if cdsLocal.FieldByName('ORDS_DTA_INSTALACAO').AsDateTime
                        <> funcLocal.DataServidor(funcLocal.Conexao) then begin
                        if funcLocal.Alerta('A T E N Ç Ã O ! !' + #13 + #13 +
                          'A data de agendamento/realização da O.S. difere da data atual.'
                          + #13 + #13 +
                          'Gostaria de alterar a data de agendamento/realização da O.S. para a data atual?',
                          1, true) = 6 then begin
                          cdsLocal.FieldByName('ORDS_DTA_INSTALACAO').AsDateTime
                            := funcLocal.DataServidor(funcLocal.Conexao);
                          Pedido.DtUltimoServ :=
                            (cdsLocal.FieldByName('ORDS_DTA_INSTALACAO')
                            .AsDateTime + funcLocal.PeriodoReagendamento);
                        end;
                      end;
                      cdsLocal.ApplyUpdates(-1);
                    end else begin
                      if cdsLocal.FieldByName('ORDS_DTA_INSTALACAO').AsDateTime
                        <> funcLocal.DataServidor(funcLocal.Conexao) then begin
                        if funcLocal.Alerta('A T E N Ç Ã O ! !' + #13 + #13 +
                          'A data de agendamento/realização da O.S. difere da data atual.'+ #13 + #13 +
                          'Gostaria de alterar a data de agendamento/realização da O.S. para a data atual?',
                          1, true) = 6 then begin
                          cdsLocal.Edit;
                          cdsLocal.FieldByName('ORDS_DTA_INSTALACAO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
                          Pedido.DtUltimoServ := (cdsLocal.FieldByName('ORDS_DTA_INSTALACAO').AsDateTime + funcLocal.PeriodoReagendamento);
                        end;
                      end;
                      EstornaEstoque(intQtde, intQtde);
                      MovimentaEstoque(2, intIndex);
                      MovimentaLancamentosFinanceiro(strOrds_ID);
                      InformaTecnico(IntToStr(Pedido.Tecnico));
                      if funcLocal.ReagendaOS then begin
                        if not JaTemAgendamento(Pedido) then begin
                          case funcLocal.ForcaReagendaOS of
                            true: begin
                                boolAgendamento := true;
                                while boolAgendamento do begin
                                  funcLocal.Alerta('É necessário que você já realize o novo agendamento da próxima visita deste cliente antes de continuar.',0);
                                  if RealizaAgendamento(Pedido, strORDS, InformeTipoAgendamento()) then begin
                                    boolAgendamento := false;
                                    MSGAgendamento(strORDS,DateToStr(Pedido.DtUltimoServ),FormatFloat('0.00',Pedido.VlrTotal));
                                  end;
                                end;
                              end;
                            false: begin
                                boolAgendamento := true;
                                while boolAgendamento do begin
                                  if funcLocal.Alerta('É necessário que você já realize o novo agendamento da próxima visita deste cliente antes de continuar.'+ #13 + #13 +
                                                      'Deseja realizar este agendamento agora?',1, true) = 6 then begin
                                    if RealizaAgendamento(Pedido, strORDS, InformeTipoAgendamento) then begin
                                      boolAgendamento := false;
                                      MSGAgendamento(strORDS,DateToStr(Pedido.DtUltimoServ),FormatFloat('0.00',Pedido.VlrTotal));
                                    end;
                                  end else begin
                                    boolAgendamento := false;
                                  end;
                                end;
                              end;
                          end;
                        end;
                      end;
                    end;
                    { Seta o status atual da ordem de serviço }
                    SetaStatusOS(intIndex, strOrds_ID, strClie_ID);
                  end;
                3:
                  begin
                    { Se cancelada a O.S. o sistema faz o cancelamento do financeiro }
                    MovimentaFinanceiro(3, intQtde, strOrds_ID, strClie_ID, boolOK);
                    if boolOK then begin
                      { Realiza o estorno do estoque dos produtos lançados na O.S. }
                      EstornaEstoque(intQtde, intQtde);
                      { Seta o status atual da ordem de serviço }
                      SetaStatusOS(intIndex, strOrds_ID, strClie_ID);
                      { Se confirmado pelo cliente, realiza o estorno do financeiro }
                      EstornaFinanceiro(strOrds_ID, strClie_ID)
                    end else begin
                      { Cancelando a oporeção de cancelamento da O.S. }
                      cdsLocal.Edit;
                      cdsLocal.FieldByName('ORDS_STATUS').AsInteger := intStatus;
                      cdsLocal.ApplyUpdates(-1);
                    end;
                  end;
              end;
            finally
              cdsLocal.ApplyUpdates(-1);
            end;
          end;
        except on e: exception do begin
            funcLocal.ReportaErro(Caption, (Sender as TComponent).Name,e.Message);
            funcLocal.Alerta('Erro ao tentar salvar o registro.' + #13 + '[' + e.Message + ']', 1);
            cdsLocal.CancelUpdates;
            funcLocal.RollBack;
            Exit;
          end;
        end;
      end;
    finally
      funcLocal.MSGAguarde(false);
      FreeAndNil(Pedido);
      Self.Close;
    end;
  end;
end;

function TfCadNovaOrdemServico.RealizaAgendamento(Pedido: TOrdemServico;
  out strORDS: String; strAgendamento : String): Boolean;
var
  qryCons: TSQLQuery;
  strOrds_ID: String;
  strTMP: String;

  function AgendaOS: Boolean;
  begin
    try
      Result := true;
      with qryCons do
      begin
        Close;
        sql.Clear;
        try
          funcLocal.StartCommit;
        except
        end;
        sql.Add('INSERT INTO ORDEM_SERVICO(ORDS_ID,'); // 0
        sql.Add('                          ORDS_EMPR_ID,'); // 1
        sql.Add('                          ORDS_CLIE_ID,'); // 2
        sql.Add('                          ORDS_CLIE_EMPR_ID,'); // 3
        sql.Add('                          ORDS_TPRC_ID,'); // 4
        sql.Add('                          ORDS_TPRC_EMPR_ID,'); // 5
        sql.Add('                          ORDS_DTA_INSTALACAO,'); // 6
        sql.Add('                          ORDS_GENE_EMPR_ID_TIPO_OS,'); // 7
        sql.Add('                          ORDS_GENE_TGEN_ID_TIPO_OS,'); // 8
        sql.Add('                          ORDS_GENE_ID_TIPO_OS,'); // 9
        sql.Add('                          ORDS_STATUS,'); // 10
        sql.Add('                          ORDS_USER_ID_TEC,'); // 11
        sql.Add('                          ORDS_PROD_ID_EQUIP,'); // 12
        sql.Add('                          ORDS_PROD_EMPR_ID_EQUIP,'); // 13
        sql.Add('                          ORDS_NR_PEDIDO_SERIE,'); // 14
        sql.Add('                          ORDS_VLR_TOTAL_OS,'); // 15
        sql.Add('                          ORDS_VLR_DESCONTO,'); // 16
        sql.Add('                          ORDS_VLR_PAGO,'); // 17
        sql.Add('                          ORDS_BAIXADO_ESTOQUE,'); // 18
        sql.Add('                          ORDS_FORN_ID_EQUIP,'); // 19
        sql.Add('                          ORDS_GENE_EMPR_ID_TP_AGEND,');
        sql.Add('                          ORDS_GENE_TGEN_ID_TP_AGEND,');
        sql.Add('                          ORDS_GENE_ID_TP_AGEND,');
        if Pedido.Filtro > 0 then begin
          sql.Add('                        ORDS_GENE_EMPR_ID_FILTRO,');
          sql.Add('                        ORDS_GENE_TGEN_ID_FILTRO,');
          sql.Add('                        ORDS_GENE_ID_FILTRO,');
        end;
        sql.Add('                          ORDS_DTA_CADASTRO,'); // 20
        sql.Add('                          ORDS_USER_ID)'); // 22
        strOrds_ID := funcLocal.ObterSequencia('ORDEM_SERVICO',IntToStr(funcLocal.Empr_ID));
        sql.Add('VALUES(' + strOrds_ID                                                                              + ',' +
                            IntToStr(funcLocal.Empr_ID)                                                             + ',' +
                            IntToStr(Pedido.Cliente)                                                                + ',' +
                            IntToStr(funcLocal.Empr_ID)                                                             + ',' +
                            IntToStr(Pedido.TabPreco)                                                               + ',' +
                            IntToStr(funcLocal.Empr_ID)                                                             + ',' +
                            QuotedStr(FormatDateTime('mm/dd/yyyy', Pedido.DtUltimoServ))                            + ',' +
                            '0'                                                                                     + ',' +
                            '12'                                                                                    + ',' +
                            '1'                                                                                     + ',' +
                            '0'                                                                                     + ',' +
                            IntToStr(funcLocal.Se(funcLocal.UserIDTecOS > 0,funcLocal.UserIDTecOS,Pedido.Tecnico))  + ',' +
                            IntToStr(Pedido.Equipamento)                                                            + ',' +
                            IntToStr(funcLocal.Empr_ID)                                                             + ',' +
                            QuotedStr(Pedido.NrPedido)                                                              + ',' +
                            FormatFloat('0.0000', Pedido.VlrTotal)                                                  + ',' +
                            FormatFloat('0.0000',Pedido.VlrDesc)                                                    + ',' +
                            '0'                                                                                     + ',' +
                            '0'                                                                                     + ',' +
                            funcLocal.Se(Pedido.Fornecedor <> 0, IntToStr(Pedido.Fornecedor),'Null')                + ',' +
                            IntToStr(funcLocal.Empr_ID)                                                             + ',' +
                            '518'                                                                                   + ',' +
                            strAgendamento                                                                          + ',');
                            if Pedido.Filtro > 0 then begin
        sql.Add(              IntToStr(funcLocal.Empr_ID)                                                             + ',' +
                              '520'                                                                                   + ',' +
                              IntToStr(Pedido.Filtro)                                                                 + ',');
                            end;
        sql.Add(            QuotedStr(FormatDateTime('mm/dd/yyyy',funcLocal.DataServidor(funcLocal.Conexao)))       + ',' +
                            IntToStr(funcLocal.User_ID) + ')');
        ExecSQL();
        try
          funcLocal.Commit;
        except
        end;
        with dmOrdemServico do
        begin
          cdsOrdemServicoItens.First;
          while not cdsOrdemServicoItens.Eof do
          begin
            sql.Clear;
            try
              funcLocal.StartCommit;
            except
            end;
            sql.Add('INSERT INTO ORDEM_SERVICO_ITENS(ODIT_ID,'); // 0
            sql.Add('                                ODIT_EMPR_ID,'); // 1
            sql.Add('                                ODIT_ORDS_ID,'); // 2
            sql.Add('                                ODIT_ORDS_EMPR_ID,'); // 3
            sql.Add('                                ODIT_ORDS_CLIE_ID,'); // 4
            sql.Add('                                ODIT_ORDS_CLIE_EMPR_ID,'); // 5
            sql.Add('                                ODIT_TPIT_ID,'); // 6
            sql.Add('                                ODIT_TPIT_EMPR_ID,'); // 7
            sql.Add('                                ODIT_TPIT_TPRC_ID,'); // 8
            sql.Add('                                ODIT_TPIT_TPRC_EMPR_ID,'); // 9
            sql.Add('                                ODIT_TPIT_PROD_ID,'); // 10
            sql.Add('                                ODIT_TPIT_PROD_EMPR_ID,'); // 11
            sql.Add('                                ODIT_VLR_UNITARIO,'); // 12
            sql.Add('                                ODIT_QTDE,'); // 13
            sql.Add('                                ODIT_VLR_TOTAL,'); // 14
            sql.Add('                                ODIT_USER_ID_TEC,'); // 15
            sql.Add('                                ODIT_DTA_CADASTRO,'); // 16
            sql.Add('                                ODIT_USER_ID)'); // 17
            sql.Add('VALUES(' + funcLocal.ObterSequencia('ORDEM_SERVICO_ITENS',IntToStr(funcLocal.Empr_ID))       + ',' +
                                IntToStr(funcLocal.Empr_ID)                                                       + ',' +
                                strOrds_ID                                                                        + ',' +
                                IntToStr(funcLocal.Empr_ID)                                                       + ',' +
                                IntToStr(Pedido.Cliente)                                                          + ',' +
                                IntToStr(funcLocal.Empr_ID)                                                       + ',' +
                                cdsOrdemServicoItensODIT_TPIT_ID.AsString                                         + ',' +
                                IntToStr(funcLocal.Empr_ID)                                                       + ',' +
                                cdsOrdemServicoItensODIT_TPIT_TPRC_ID.AsString                                    + ',' +
                                IntToStr(funcLocal.Empr_ID)                                                       + ',' +
                                cdsOrdemServicoItensODIT_TPIT_PROD_ID.AsString                                    + ',' +
                                IntToStr(funcLocal.Empr_ID)                                                       + ',' +
                                FormatFloat('0.0000', cdsOrdemServicoItensODIT_VLR_UNITARIO.AsFloat)              + ',' +
                                FormatFloat('0.0000', cdsOrdemServicoItensODIT_QTDE.AsFloat)                      + ',' +
                                FormatFloat('0.0000', cdsOrdemServicoItensODIT_VLR_TOTAL.AsFloat)                 + ',' +
                                cdsOrdemServicoItensODIT_USER_ID_TEC.AsString                                     + ',' +
                                QuotedStr(FormatDateTime('mm/dd/yyyy',funcLocal.DataServidor(funcLocal.Conexao))) + ',' +
                                IntToStr(funcLocal.User_ID) + ')');
            ExecSQL;
            try
              funcLocal.Commit;
            except
            end;
            cdsOrdemServicoItens.Next;
          end;
        end;
      end;
    except
      on e: exception do
      begin
        Result := false;
        funcLocal.RollBack;
        funcLocal.ReportaErro('TfCadNovaOrdemServico', 'RealizaAgendamento',
          e.Message);
        funcLocal.Alerta('Erro no reagendamento do clientes.' + #13 + '[' +
          e.Message + ']', 1);
      end;
    end;
  end;

begin
  try
    Result := true;
    FormatSettings.DecimalSeparator := '.';
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    strTMP := InputBox('Agendamento', 'Informe a data da próxima visita?',FormatDateTime('dd/mm/yyyy', Pedido.DtUltimoServ));
    if strTMP <> '' then begin
      try
        StrToDate(strTMP);
        Pedido.DtUltimoServ := StrToDate(strTMP);
        Result := AgendaOS;
      except
        funcLocal.Alerta('Data informada inválida!', 1);
        Result := false;
        Exit;
      end;
    end else begin
      Result := AgendaOS;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
    strORDS := strOrds_ID;
  end;
end;

function TfCadNovaOrdemServico.JaTemAgendamento(Pedido: TOrdemServico): Boolean;
var
  qryCons: TSQLQuery;
begin
  try
    Result := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(*)');
        sql.Add('FROM  ORDEM_SERVICO');
        sql.Add('WHERE ORDS_EMPR_ID               = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   ORDS_CLIE_ID               = ' + IntToStr(Pedido.Cliente));
        sql.Add('AND   ORDS_CLIE_EMPR_ID          = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   ORDS_DTA_INSTALACAO       >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',
          funcLocal.DataServidor(funcLocal.Conexao))));
        sql.Add('AND   ORDS_GENE_EMPR_ID_TIPO_OS  = 0');
        sql.Add('AND   ORDS_GENE_TGEN_ID_TIPO_OS  = 12');
        sql.Add('AND   ORDS_GENE_ID_TIPO_OS       = 1');
        sql.Add('AND   ORDS_STATUS                = 0');
        sql.Add('AND   ORDS_PROD_ID_EQUIP         = ' + IntToStr(Pedido.Equipamento));
        sql.Add('AND   ORDS_PROD_EMPR_ID_EQUIP    = ' + IntToStr(funcLocal.Empr_ID));
        Open;
      end;
      Result := qryCons.Fields[0].AsInteger > 0;
    except
      on e: exception do
      begin
        funcLocal.ReportaErro('TfCadNovaOrdemServico', 'JaTemAgendamento',
          e.Message);
        funcLocal.Alerta
          ('Erro no processo de verificação de agendamentos do clientes.' + #13
          + '[' + e.Message + ']', 1);
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadNovaOrdemServico.InformaTecnico(strUser_ID: String);
begin
  with dmOrdemServico do
  begin
    cdsOrdemServicoItens.First;
    while not cdsOrdemServicoItens.Eof do
    begin
      cdsOrdemServicoItens.Edit;
      cdsOrdemServicoItensODIT_USER_ID_TEC.AsString := strUser_ID;
      cdsOrdemServicoItens.Post;
      cdsOrdemServicoItens.Next;
    end;
    try
      cdsOrdemServicoItens.ApplyUpdates(-1);
    except
    end;
  end;
end;

procedure TfCadNovaOrdemServico.ImprimirOS;
begin
  if funcLocal.Alerta('Deseja realizar a impressão desta Ordem de Serviço?', 1,true) = 6 then begin
    try
      OpenClientDataSet(11);
      if fImprimirOS = nil then
        fImprimirOS := TfImprimirOS.Create(nil);
      fImprimirOS.funcLocal := Self.funcLocal;
      fImprimirOS.strOrds_ID := dmOrdemServico.cdsListaOSORDS_ID.AsString;
      fImprimirOS.qrepRelatorio.Preview;
    finally
      FreeAndNil(fImprimirOS);
    end;
  end;
end;

procedure TfCadNovaOrdemServico.ImprimirRequisicao;
begin
  if TemProdutoVenda(cdsLocal.FieldByName('ORDS_ID').AsString,
    cdsLocal.FieldByName('ORDS_CLIE_ID').AsString) then
  begin
    Sleep(100);
    if funcLocal.Alerta
      ('Deseja realizar a impressão da requisição de material?', 1,
      true) = 6 then
    begin
      try
        if fRequisicaoMaterial = nil then
          fRequisicaoMaterial := TfRequisicaoMaterial.Create(nil);
        fRequisicaoMaterial.funcLocal := Self.funcLocal;
        fRequisicaoMaterial.qrepRelatorio.Preview;
      finally
        FreeAndNil(fRequisicaoMaterial);
      end;
    end;
  end;
end;

function TfCadNovaOrdemServico.TemProdutoVenda(strOrds_ID,
  strClie_ID: String): Boolean;
var
  qryCons: TSQLQuery;
begin
  try
    Result := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(*)');
        sql.Add('FROM  ORDEM_SERVICO_ITENS OI');
        sql.Add('INNER JOIN PRODUTOS PR');
        sql.Add('ON (PR.PROD_ID                  = OI.ODIT_TPIT_PROD_ID');
        sql.Add('AND PR.PROD_EMPR_ID             = OI.ODIT_TPIT_PROD_EMPR_ID)');
        sql.Add('WHERE OI.ODIT_EMPR_ID           = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   OI.ODIT_ORDS_ID           = ' + strOrds_ID);
        sql.Add('AND   OI.ODIT_ORDS_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   OI.ODIT_ORDS_CLIE_ID      = ' + strClie_ID);
        sql.Add('AND   OI.ODIT_ORDS_CLIE_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   PR.PROD_GENE_ID_TP_PROD   NOT IN (2)');
        Open;
      end;
      Result := (qryCons.Fields[0].AsInteger > 0)
    except
      on e: exception do
      begin
        funcLocal.ReportaErro('TfCadNovaOrdemServico', 'TemProdutoVenda',
          e.Message);
        funcLocal.Alerta('Erro no processo de validação dos itens da O.S.' + '['
          + e.Message + ']', 1);
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadNovaOrdemServico.EstornaFinanceiro(strOrds_ID,
  strClie_ID: String);
var
  qryCons: TSQLQuery;
  strTMP: String;
begin
  try
    strTMP := '';
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      ODAC_ID');
        sql.Add('FROM  ORDEM_SERVICO_ACERTOS');
        sql.Add('WHERE ODAC_EMPR_ID           = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   ODAC_ORDS_ID           = ' + strOrds_ID);
        sql.Add('AND   ODAC_ORDS_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   ODAC_ORDS_CLIE_ID      = ' + strClie_ID);
        sql.Add('AND   ODAC_ORDS_CLIE_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   ODAC_STATUS            = 1');
        Open;
        if not IsEmpty then
        begin
          First;
          while not Eof do
          begin
            strTMP := strTMP + qryCons.Fields[0].AsString + ',';
            Next;
          end;
          strTMP := Copy(strTMP, 1, length(strTMP) - 1);
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      ODAC_ID,'); // 0
          sql.Add('      ODAC_EMPR_ID,'); // 1
          sql.Add('      CREC_ID,'); // 2
          sql.Add('      CREC_EMPR_ID,'); // 3
          sql.Add('      CREC_STATUS,'); // 4
          sql.Add('      CREC_VALOR_PAGO'); // 5
          sql.Add('FROM  CONTAS_RECEBER'); // 6
          sql.Add('INNER JOIN ORDEM_SERVICO_ACERTOS');
          sql.Add('ON (ODAC_ID                     = CREC_ODAC_ID');
          sql.Add('AND ODAC_EMPR_ID                = CREC_ODAC_EMPR_ID');
          sql.Add('AND ODAC_ORDS_ID                = CREC_ODAC_ORDS_ID');
          sql.Add('AND ODAC_ORDS_EMPR_ID           = CREC_ODAC_ORDS_EMPR_ID');
          sql.Add('AND ODAC_ORDS_CLIE_ID           = CREC_ODAC_ORDS_CLIE_ID');
          sql.Add('AND ODAC_ORDS_CLIE_EMPR_ID      = CREC_ODAC_ORDS_CLIE_EMPR_ID)');
          sql.Add('WHERE CREC_EMPR_ID                = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND   CREC_ODAC_ID                IN (' + strTMP + ')');
          sql.Add('AND   CREC_ODAC_EMPR_ID           = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND   CREC_ODAC_ORDS_ID           = ' + strOrds_ID);
          sql.Add('AND   CREC_ODAC_ORDS_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND   CREC_ODAC_ORDS_CLIE_ID      = ' + strClie_ID);
          sql.Add('AND   CREC_ODAC_ORDS_CLIE_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          Open;
          if not IsEmpty then
          begin
            First;
            while not Eof do
            begin
              if (qryCons.Fields[4].AsString <> 'C') and
                (qryCons.Fields[5].AsFloat > 0) then
              begin
                funcLocal.LancamentoLivroCaixa('117', '3',
                  qryCons.Fields[0].AsString, qryCons.Fields[1].AsString, '0',
                  '0', '11', '7', (qryCons.Fields[5].AsFloat * -1));
              end;
              Next;
            end;
          end;
          sql.Clear;
          try
            funcLocal.StartCommit;
          except
          end;
          sql.Add('UPDATE CONTAS_RECEBER');
          sql.Add('SET    CREC_STATUS       = ' + QuotedStr('C'));
          sql.Add('      ,CREC_VALOR_PAGO   = 0');
          sql.Add('      ,CREC_USER_ID_CANC = ' + IntToStr(funcLocal.User_ID));
          sql.Add('      ,CREC_DTA_CANC     = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',
            funcLocal.DataServidor(funcLocal.Conexao))));
          sql.Add('      ,CREC_MOTIVO_CANC  = ' +
            QuotedStr('Estorno auto. pela O.S.'));
          sql.Add('WHERE CREC_EMPR_ID                = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND   CREC_ODAC_ID                IN (' + strTMP + ')');
          sql.Add('AND   CREC_ODAC_EMPR_ID           = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND   CREC_ODAC_ORDS_ID           = ' + strOrds_ID);
          sql.Add('AND   CREC_ODAC_ORDS_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND   CREC_ODAC_ORDS_CLIE_ID      = ' + strClie_ID);
          sql.Add('AND   CREC_ODAC_ORDS_CLIE_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          // ShowMessage(qryCons.Text);
          ExecSQL;
          try
            funcLocal.Commit;
          except
          end;
          sql.Clear;
          try
            funcLocal.StartCommit
          except
          end;
          sql.Add('UPDATE ORDEM_SERVICO_ACERTOS');
          sql.Add('SET    ODAC_STATUS            = 0');
          sql.Add('WHERE  ODAC_ID                IN (' + strTMP + ')');
          sql.Add('AND    ODAC_EMPR_ID           = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND    ODAC_ORDS_ID           = ' + strOrds_ID);
          sql.Add('AND    ODAC_ORDS_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND    ODAC_ORDS_CLIE_ID      = ' + strClie_ID);
          sql.Add('AND    ODAC_ORDS_CLIE_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL;
          try
            funcLocal.Commit;
          except
          end;
          sql.Clear;
          try
            funcLocal.StartCommit
          except
          end;
          sql.Add('UPDATE ORDEM_SERVICO');
          sql.Add('SET    ORDS_VLR_PAGO     = 0');
          sql.Add('WHERE  ORDS_ID           = ' + strOrds_ID);
          sql.Add('AND    ORDS_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND    ORDS_CLIE_ID      = ' + strClie_ID);
          sql.Add('AND    ORDS_CLIE_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL;
          try
            funcLocal.Commit;
          except
          end;
        end;
      end;
    except
      on e: exception do
      begin
        funcLocal.RollBack;
        funcLocal.Alerta
          ('Erro no processo de estorno dos lançamentos financeiros desta ordem de serviço.'
          + #13 + '[' + e.Message + ']', 1);
        funcLocal.ReportaErro('TfCadNovaOrdemServico', 'EstornaFinanceiro',
          e.Message);
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadNovaOrdemServico.MovimentaFinanceiro(intPos, intQtde: Integer;
  strOrds_ID, strClie_ID: String; out boolOK: Boolean);
begin
  boolOK := true;
  case intPos of
    /// Estornando os lançamentos financeiros realizado para esta O.S.
    0, 1, 3:
      begin
        if TemPagtos(strOrds_ID, strClie_ID) then
        begin
          if funcLocal.Alerta('A T E N Ç Ã O ! ! !' + #13 + #13 +
            'Constam pagamentos para esta ordem de serviço. Com ' +
            'esta operação você poderá optar pelo cancelamento ' +
            'destes lançamentos é também o cancelamentos dos ' +
            'títulos lançados no contas a receber.' + #13 + #13 +
            'Está operação realizará a movimentação ' +
            'de seu financeiro, como o estorno dos valores já recebidos, ' +
            'por tanto certifique-se de haver saldo suficiente em ' +
            'caixa para o estorno dos lançamentos realizados.' + #13 + #13 +
            'Se você optar por [ SIM ] o sistema efetuará o estorno ' +
            'dos lançamentos e títulos lançados para esta Ordem de ' +
            'serviço, se optar pelo [ NÃO ] o sistema manterá os ' +
            'lançamentos efetuados, efetuando apenas as movimentações de estoque necessárias.'
            + #13 + #13 +
            'Deseja efetuar o cancelamento dos títulos lançados para esta Ordem de Serviço?',
            1, true) = 6 then
          begin
            Exit;
          end
          else
          begin
            boolOK := false;
          end;
        end;
      end;
    /// Lançando os pagamentos para a O.S.
    2:
      begin
        try
          if fFechamentoOS = nil then
            fFechamentoOS := TfFechamentoOS.Create(nil);
          fFechamentoOS.funcLocal := Self.funcLocal;
          fFechamentoOS.ShowModal;
          boolOK := fFechamentoOS.boolOK;
        finally
          FreeAndNil(fFechamentoOS);
        end;
      end;
  end;
end;

procedure TfCadNovaOrdemServico.MovimentaLancamentosFinanceiro
  (strOrds_ID: String);
var
  strStatus: String;
  fltVlrPago: Real;
  strObs: String;
begin
  with dmOrdemServico do
  begin
    try
      cdsAcertos_OS.ApplyUpdates(-1);
    except
    end;
    cdsAcertos_OS.Close;
    cdsAcertos_OS.Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    cdsAcertos_OS.Params.ParamByName('ORDS_ID').AsInteger := StrToInt(strOrds_ID);
    cdsAcertos_OS.Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    cdsAcertos_OS.Open;
    cdsAcertos_OS.First;
    while not cdsAcertos_OS.Eof do
    begin
      strStatus := 'F';
      fltVlrPago := cdsAcertos_OSODAC_VLR_DOC.AsFloat;
      case cdsAcertos_OSODAC_GENE_ID_TIPO_DOC.AsInteger of
        1:
          begin
            funcLocal.LancamentoLivroCaixa('71', '1',
              cdsAcertos_OSODAC_ID.AsString, IntToStr(funcLocal.Empr_ID), '0',
              '0', '11', '7', cdsAcertos_OSODAC_VLR_DOC.AsFloat);
          end;
        2, 3, 4, 5, 6, 7:
          begin
            fltVlrPago := 0;
            strStatus := 'A';
          end;
      end; { end case }
      if cdsAcertos_OSODAC_NR_DOC.AsString <> '' then
      begin
        strObs := 'Dados do documento: ' + #13 + #10 + 'Nrº Doc.: ' +
          cdsAcertos_OSODAC_NR_DOC.AsString + #13 + #10 + 'Agência: ' +
          cdsAcertos_OSODAC_NR_AGENCIA.AsString + #13 + #10 + 'Nrº Conta: ' +
          cdsAcertos_OSODAC_NR_CONTA.AsString + #13 + #10 + 'Títular: ' +
          cdsAcertos_OSODAC_TITULAR.AsString;
      end
      else
        strObs := 'Null';
      funcLocal.RegistraContasReceber(cdsAcertos_OSODAC_NR_DOC.AsString,
        'ACERTO REF. O.S. Nrº ' + strOrds_ID,
        cdsAcertos_OSODAC_ORDS_CLIE_ID.AsString, '71',
        cdsAcertos_OSODAC_GENE_ID_TIPO_DOC.AsString,
        cdsAcertos_OSODAC_DTA_CADASTRO.AsDateTime,
        cdsAcertos_OSODAC_DTA_VCTO.AsDateTime,
        cdsAcertos_OSODAC_VLR_DOC.AsFloat, 0, 0, fltVlrPago, strStatus, strObs,
        'Null', 'Null', cdsAcertos_OSODAC_ID.AsString,
        cdsAcertos_OSODAC_ORDS_ID.AsString);
      cdsAcertos_OS.Next;
    end;
  end;
end;

{ *******************************************************************************
  Data:       04/08/2010
  Autor:      Alex Itamar Gomes
  Descrição:  Metodo com a finalidade de verificar se a ordem de serviço repassada,
  conta com alguma pagamento já efetuado.

  Parametros:
  strORDS_ID  = ID da Ordem de serviço
  strCLIE_ID  = ID do Cliente da Ordem de Serviço

  Historico:
  Data          Autor               Descrição
  04/08/2010    Alex Itamar Gomes   Inclusão do cabeçalho
  ******************************************************************************* }
// function TfCadNovaOrdemServico.TemPagamentos(strOrds_ID,strClie_ID : String) : Boolean;
// var
// qryCons : TSQLQuery;
// begin
// try
// Result  := false;
// qryCons := TSQLQuery.Create(nil);
// qryCons.SQLConnection := funcLocal.Conexao;
// try
// with qryCons do begin
// Close;
// sql.Clear;
// sql.Add('SELECT');
// sql.Add('      COUNT(*)');
// sql.Add('FROM  ORDEM_SERVICO_ACERTOS');
// sql.Add('WHERE ODAC_EMPR_ID           = ' + IntToStr(funcLocal.Empr_ID));
// sql.Add('AND   ODAC_ORDS_ID           = ' + strOrds_ID);
// sql.Add('AND   ODAC_ORDS_EMPR_ID      = ');
// sql.Add('AND   ODAC_ORDS_CLIE_ID      = ' + strClie_ID);
// sql.Add('AND   ODAC_ORDS_CLIE_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
// sql.Add('AND   ODAC_STATUS            = 1');
// Open;
// Result := (qryCons.Fields[0].AsInteger > 0);
// end;
// except on e: exception do begin
// funcLocal.Alerta('Erro no processo de movimentação financeira da ordem de serviço.'+#13+'['+e.Message+']',1);
// funcLocal.ReportaErro('TfCadNovaOrdemServico','TemPagamentos',e.Message);
// end; end;
// finally
// qryCons.Close;
// FreeAndNil(qryCons);
// end;
// end;

function TfCadNovaOrdemServico.TemPagtos(strOrds_ID,
  strClie_ID: String): Boolean;
var
  qryCons: TSQLQuery;
begin
  try
    Result := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(*)');
        sql.Add('FROM  ORDEM_SERVICO_ACERTOS');
        sql.Add('WHERE ODAC_EMPR_ID           = ' +
          IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   ODAC_ORDS_ID           = ' + strOrds_ID);
        sql.Add('AND   ODAC_ORDS_EMPR_ID      = ' +
          IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   ODAC_ORDS_CLIE_ID      = ' + strClie_ID);
        sql.Add('AND   ODAC_ORDS_CLIE_EMPR_ID = ' +
          IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   ODAC_STATUS            = 1');
        Open;
      end;
      Result := (qryCons.Fields[0].AsInteger > 0)
    except
      on e: exception do
      begin
        funcLocal.Alerta('Erro no processo de movimentação da ordem de serviço.'
          + #13 + '[' + e.Message + ']', 1);
        funcLocal.ReportaErro('TfCadNovaOrdemServico', 'TemPagtos', e.Message);
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadNovaOrdemServico.MovimentaEstoque(intPos, intEstoq: Integer);
begin
  if (intEstoq <> -1) Then
  begin

    /// Caso não tenha sido feita nenhuma movimentação ainda no estoque e setado
    /// apenas como realizado o sistema fará a baixa do disponível
    if (intEstoq = 0) and (rdStatus.ItemIndex = 1) then
    begin
      intEstoq := 2;

      /// Caso não tenha sido feita nenhuma movimentação ainda de estoque e setado
      /// como realizado e pago o sistema fará a baixa tanto do Atual quanto Disponível
    end
    else if (intEstoq = 0) and (rdStatus.ItemIndex = 2) then
    begin
      intEstoq := 1;

      /// Caso já tenha sido movimentado o disponivel e setado como realizado
      /// o sistema fará a baixa do Disponível;
    end
    else if (intEstoq = 1) and (rdStatus.ItemIndex = 1) then
    begin
      intEstoq := 2;

      /// Caso já tenha sido movimentado o disponível e setado com realizado e pago
      /// o sistema fara a baixa do Atual;
    end
    else if (intEstoq = 1) and (rdStatus.ItemIndex = 2) then
    begin
      intEstoq := 1;

      /// Caso ja tenha sido movimentado o Atual e setado como realizado
      /// o sistema fará a baixa do disponivel
    end
    else if (intEstoq = 2) and (rdStatus.ItemIndex = 1) then
    begin
      intEstoq := 2;

      /// Caso já tenha sido movimentado o atual e setado como realizado e pago
      /// o sistema fará a baixa do atual
    end
    else if (intEstoq = 2) and
      ((rdStatus.ItemIndex = 2) or (rdStatus.ItemIndex = 0)) then
    begin
      intEstoq := 1;
    end;

    try
      funcLocal.MSGAguarde();
      with dmOrdemServico.cdsOrdemServicoItens do
      begin
        First;
        while not Eof do
        begin
          funcLocal.MovimentaEstoque(FieldByName('ODIT_TPIT_PROD_ID').AsString,
            (FieldByName('ODIT_QTDE').AsFloat * -1), intEstoq, '4');
          Next;
        end;
      end;
    finally
      funcLocal.MSGAguarde(false);
    end;
  end;
end;

{ *******************************************************************************
  Data:      19/07/2010
  Autor:     Alex Itamar Gomes
  Descrição: Metodo para a realização da baixa do estoque dos produtos informados
  na O.S.

  Parametros:
  intPos  = 0 - Estorna o lançamentos dos estoque realizados na O.S.
  - Atual e Disponível
  1 - Estorna o lançamento do estoque realizado na O.S.
  - Atual
  2 - Estoque o lançamento do estoque realizado na O.S.
  - Atual e Disponível
  3 - Ordem de Serviço Cancelada

  intQtde - 1 - Registra Movimentação do Estoque (Estoque Atual e Disponivel)
  2 - Registra Movimentação do Estoque (Estoque Disponível)
  3 - Registra Movimentação do Estoque (Estoque Atual)

  Historico
  Data          Autor                 Descrição
  19/07/2010    Alex Itamar Gomes     Inclusao do cabeçalho
  ******************************************************************************* }
procedure TfCadNovaOrdemServico.EstornaEstoque(intPos, intQtde: Integer);
begin
  if intQtde <> 0 then
  begin
    if (intPos <> -1) and (intPos <> 0) and (intPos <> 3) then
    begin
      if (intPos = 1) then
      begin
        intPos := 2;
      end
      else if (intPos = 2) then
      begin
        intPos := 1;
      end;
      try
        funcLocal.MSGAguarde();
        with dmOrdemServico.cdsOrdemServicoItens do
        begin
          First;
          while not Eof do
          begin
            funcLocal.MovimentaEstoque(FieldByName('ODIT_TPIT_PROD_ID')
              .AsString, FieldByName('ODIT_QTDE').AsFloat, intPos, '5');
            Next;
          end;
        end;
      finally
        funcLocal.MSGAguarde(false);
      end;
    end;
  end;
end;

procedure TfCadNovaOrdemServico.SetaStatusOS(intPos: Integer;
  strOrds_ID, strClie_ID: String);
var
  qryCons: TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do
      begin
        Close;
        sql.Clear;
        try
          funcLocal.StartCommit
        except
        end;
        sql.Add('UPDATE ORDEM_SERVICO');
        sql.Add('SET    ORDS_BAIXADO_ESTOQUE = ' + IntToStr(intPos));
        sql.Add('WHERE  ORDS_ID              = ' + strOrds_ID);
        sql.Add('AND    ORDS_EMPR_ID         = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND    ORDS_CLIE_ID         = ' + strClie_ID);
        sql.Add('AND    ORDS_CLIE_EMPR_ID    = ' + IntToStr(funcLocal.Empr_ID));
        ExecSQL;
        try
          funcLocal.Commit;
        except
        end;
      end;
    except
      on e: exception do
      begin
        funcLocal.RollBack;
        funcLocal.ReportaErro('TfCadNovaOrdemServico', 'SetaStatusOS',
          e.Message);
        funcLocal.Alerta('Erro no processo de alteração da Ordem de Serviço.' +
          #13 + '[' + e.Message + ']', 1);
        funcLocal.RollBack;
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfCadNovaOrdemServico.ValidaDados: Boolean;
var
  boolSalve: Boolean;
begin
  Result := true;
  boolSalve := false;
  dmOrdemServico.cdsOrdemServicoItens.Cancel;
//  if (edtCodTipo.Text = '3') and (not frPesqClienteGarantia.TemRegistro) then begin
//    funcLocal.Alerta('Você informou uma OS do tipo "GARANTIA" é necessário informar o cliente antes de continuar.', 1);
//    pageCadastro.Pages[0].Show;
//    frPesqClienteGarantia.SetFocus;
//    Result := false;
//    Exit;
//  end;
//  if (edtCodTipo.Text <> '3') then begin
//    frPesqClienteGarantia.Limpar;
//    frPesqClienteGarantia.Enabled := false;
//  end;
  if edtDtInstalacao.Date <= 0 then begin
    funcLocal.Alerta('Informe uma data de agendamento antes de continuar.', 1);
    pageCadastro.Pages[0].Show;
    edtDtInstalacao.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCodTipo.Text = '' then begin
    funcLocal.Alerta('Informe o tipo de ordem de serviço antes de continuar.', 1);
    pageCadastro.Pages[0].Show;
    edtCodTipo.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCodTab.Text = '' then
  begin
    funcLocal.Alerta('Informe uma tabela de preço antes de continuar.', 1);
    pageCadastro.Pages[0].Show;
    edtCodTab.SetFocus;
    Result := false;
    Exit;
  end;
  edtCodTec.Text := '1';
  edtCodTecExit(Self);
  if edtCodTec.Text = '' then
  begin
    funcLocal.Alerta
      ('Informe o técnico que realizará o serviço antes de continuar.', 1);
    pageCadastro.Pages[0].Show;
    edtCodTec.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCodEquip.Text = '' then
  begin
    funcLocal.Alerta('Informe o equipamento do cliente antes de continuar.', 1);
    pageCadastro.Pages[0].Show;
    edtCodEquip.SetFocus;
    Result := false;
    Exit;
  end;
  if dmOrdemServico.cdsOrdemServicoItens.IsEmpty then
  begin
    funcLocal.Alerta('Ordem de serviço sem produtos/serviços informado, verifique o lançamento antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    dmOrdemServico.cdsOrdemServicoItens.Edit;
    edtCodProd.SetFocus;
    Result := false;
    Exit;
  end;
  if edtVlrDesconto.Value > dmOrdemServico.cdsOrdemServicoItensTOTALITENS.Value then
  begin
    funcLocal.Alerta('Valor do desconto superior ao valor da O.S.', 1);
    pageCadastro.Pages[0].Show;
    edtVlrDesconto.SetFocus;
    Result := false;
    Exit;
  end;
  if (rdStatus.ItemIndex in [1, 2]) then
  begin
    if (rdStatus.ItemIndex in [1, 2]) and (boolEstoqueNegativo) then
    begin
      Exit;
    end;
    with dmOrdemServico, cdsOrdemServicoItens do
    begin
      First;
      while not Eof do
      begin
        Result := funcLocal.ProdutoTemEstoque
          (cdsOrdemServicoItensODIT_TPIT_PROD_ID.AsString,
          cdsOrdemServicoItensODIT_QTDE.AsFloat, (rdStatus.ItemIndex + 1));
        if (not Result) then
        begin
          if not boolSalve then
          begin
            funcLocal.Alerta('A T E N Ç Ã O ! ! !' + #13 + #13 +
              'Nem todos os produtos lançados possuem ' +
              'estoque suficiente para esta movimentação, verifique ' +
              'o estoque dos produtos lançados antes de continuar.', 1);
          end
          else if boolSalve then
          begin
            funcLocal.Alerta('A T E N Ç Ã O ! ! !' + #13 + #13 +
              'Nem todos os produtos lançados possuem ' +
              'estoque suficiente para esta movimentação, verifique ' +
              'o estoque dos produtos lançados antes de continuar.' + #13 + #13
              + 'Você optou por já realizar o salvamento das informações desta O.S. e seta-la como [ AGENDADO ] '
              + 'mas foi impedido na finalização devido as restrições de seu estoque, '
              + 'selecione a opção [ AGENDADO ] afim de manter as informações salvas '
              + 'para esta O.S. e continuar o uso do sistema. Faça as movimentações '
              + 'necessárias em seu estoque e volte a realizar a movimentação desejada nesta O.S.',
              1);
          end;
          Exit;
        end;
        Next;
      end;
    end;
  end;
end;

procedure TfCadNovaOrdemServico.btnPesqTecClick(Sender: TObject);
var
  strTMP: String;
begin
  with dmOrdemServico do
  begin
    OpenClientDataSet(4);
    strTMP := funcLocal.Busca_Registro(cdsPesqTecnico, '',
      'USER_ID;USER_NOME_COMPLETO', '');
    if strTMP <> '' then
    begin
      cdsLocal.FieldByName('ORDS_USER_ID_TEC').AsString := '1';
//        funcLocal.Buscar_Coluna(strTMP, 1);
      cdsLocal.FieldByName('USER_NOME_COMPLETO').AsString :=
        funcLocal.Buscar_Coluna(strTMP, 2);
      edtCodTec.Modified := true;
    end
    else
    begin
      cdsLocal.FieldByName('ORDS_USER_ID_TEC').AsString := '';
      cdsLocal.FieldByName('USER_NOME_COMPLETO').AsString := '';
    end;
  end;
  edtCodTec.SetFocus;
end;

procedure TfCadNovaOrdemServico.edtCodFornecExit(Sender: TObject);
var
  strTMP: String;
begin
  if not edtCodFornec.Modified then
    Exit;
  if edtCodFornec.Text <> '' then
  begin
    OpenClientDataSet(12);
    strTMP := funcLocal.Busca_Registro(dmOrdemServico.cdsPesqFornec, '',
      'FORN_ID;FORN_RAZAO_SOCIAL', 'FORN_ID = ' + edtCodFornec.Text);
    if strTMP <> '' then
    begin
      cdsLocal.FieldByName('ORDS_FORN_ID_EQUIP').AsString :=
        funcLocal.Buscar_Coluna(strTMP, 1);
      cdsLocal.FieldByName('FORN_RAZAO_SOCIAL').AsString :=
        funcLocal.Buscar_Coluna(strTMP, 2);
    end
    else
    begin
      cdsLocal.FieldByName('ORDS_FORN_ID_EQUIP').AsString := '';
      cdsLocal.FieldByName('FORN_RAZAO_SOCIAL').AsString := '';
    end;
  end
  else
  begin
    cdsLocal.FieldByName('ORDS_FORN_ID_EQUIP').AsString := '';
    cdsLocal.FieldByName('FORN_RAZAO_SOCIAL').AsString := '';
  end;
end;

procedure TfCadNovaOrdemServico.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TfCadNovaOrdemServico.DBGrid1Enter(Sender: TObject);
begin
  inherited;
  dmOrdemServico.cdsOrdemServicoItens.Cancel;
end;

procedure TfCadNovaOrdemServico.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  try
    dmOrdemServico.cdsOrdemServicoItens.IndexFieldNames :=
      Column.Field.FieldName;
  except
  end;
end;

procedure TfCadNovaOrdemServico.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(DBGrid2.DataSource.DataSet.RecNo) then
    begin
      DBGrid2.Canvas.Font.Color := clBlack;
      DBGrid2.Canvas.Brush.Color := $00FFDFDF;
    end
    else
    begin
      DBGrid2.Canvas.Font.Color := clBlack;
      DBGrid2.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in State then
    begin
      DBGrid2.Canvas.Brush.Color := clSilver;
      DBGrid2.Canvas.Font.Style := [fsBold];
    end;
    DBGrid2.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
end;

procedure TfCadNovaOrdemServico.DBMemo2Enter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := false;
end;

procedure TfCadNovaOrdemServico.DBMemo2Exit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := true;
end;

procedure TfCadNovaOrdemServico.edtCodEquipExit(Sender: TObject);
var
  strTMP: String;
begin
  if not edtCodEquip.Modified then Exit;
  with dmOrdemServico do begin
    if edtCodEquip.Text <> '' then begin
      OpenClientDataSet(8);
      if not cdsPesqEquipCliente.IsEmpty then begin
        strTMP := funcLocal.Busca_Registro(cdsPesqEquipCliente,'','PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;MARCA_PROD;MODELO_PROD;PROD_GARANTIA;FORN_ID;FORN_RAZAO_SOCIAL;ORDS_GENE_ID_FILTRO','PROD_ID = ' + edtCodEquip.Text);
      end else begin
        OpenClientDataSet(5);
        strTMP := funcLocal.Busca_Registro(cdsPesqEquipamento, '','PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;MARCA_PROD;MODELO_PROD;PROD_GARANTIA','PROD_ID = ' + edtCodEquip.Text);
      end;
      if strTMP <> '' then begin
        cdsLocal.FieldByName('ORDS_PROD_ID_EQUIP').AsString   := funcLocal.Buscar_Coluna(strTMP, 1);
        cdsLocal.FieldByName('PROD_DESCRICAO').AsString       := funcLocal.Buscar_Coluna(strTMP, 2);
        cdsLocal.FieldByName('PROD_UNIDADE').AsString         := funcLocal.Buscar_Coluna(strTMP, 3);
        cdsLocal.FieldByName('MARCA_PROD').AsString           := funcLocal.Buscar_Coluna(strTMP, 4);
        cdsLocal.FieldByName('MODELO_PROD').AsString          := funcLocal.Buscar_Coluna(strTMP, 5);
        cdsLocal.FieldByName('PROD_GARANTIA').AsString        := funcLocal.Buscar_Coluna(strTMP, 6);
        try
          cdsLocal.FieldByName('ORDS_FORN_ID_EQUIP').AsString := funcLocal.Buscar_Coluna(strTMP, 7);
          cdsLocal.FieldByName('FORN_RAZAO_SOCIAL').AsString  := funcLocal.Buscar_Coluna(strTMP, 8);
        except
          cdsLocal.FieldByName('ORDS_FORN_ID_EQUIP').AsString := '';
          cdsLocal.FieldByName('FORN_RAZAO_SOCIAL').AsString  := '';
        end;
//        frPesqFiltros.BuscarRegistro(funcLocal.Buscar_Coluna(strTMP, 9));
      end else begin
        cdsLocal.FieldByName('ORDS_PROD_ID_EQUIP').AsString := '';
        cdsLocal.FieldByName('PROD_DESCRICAO').AsString     := '';
        cdsLocal.FieldByName('PROD_UNIDADE').AsString       := '';
        cdsLocal.FieldByName('MARCA_PROD').AsString         := '';
        cdsLocal.FieldByName('MODELO_PROD').AsString        := '';
        cdsLocal.FieldByName('PROD_GARANTIA').AsString      := '';
        cdsLocal.FieldByName('ORDS_FORN_ID_EQUIP').AsString := '';
        cdsLocal.FieldByName('FORN_RAZAO_SOCIAL').AsString  := '';
//        frPesqFiltros.Limpar;
      end;
    end else begin
      cdsLocal.FieldByName('ORDS_PROD_ID_EQUIP').AsString   := '';
      cdsLocal.FieldByName('PROD_DESCRICAO').AsString       := '';
      cdsLocal.FieldByName('PROD_UNIDADE').AsString         := '';
      cdsLocal.FieldByName('MARCA_PROD').AsString           := '';
      cdsLocal.FieldByName('MODELO_PROD').AsString          := '';
      cdsLocal.FieldByName('PROD_GARANTIA').AsString        := '';
      cdsLocal.FieldByName('ORDS_FORN_ID_EQUIP').AsString   := '';
      cdsLocal.FieldByName('FORN_RAZAO_SOCIAL').AsString    := '';
//      frPesqFiltros.Limpar;
    end;
  end;
end;

procedure TfCadNovaOrdemServico.edtCodProdExit(Sender: TObject);
var
  strTMP, strTMPI, strPROD: String;
  edtAtual: TRxDBCalcEdit;
begin
  if not edtCodProd.Modified then
    Exit;
  with dmOrdemServico, cdsOrdemServicoItens do
  begin
    if edtCodProd.Text <> '' then
    begin
      OpenClientDataSet(6);
      strPROD := edtCodProd.Text;
      cdsOrdemServicoItens.Cancel;
      if not cdsOrdemServicoItens.Locate('ODIT_TPIT_TPRC_ID;ODIT_TPIT_PROD_ID',
        VarArrayOf([StrToInt(edtCodTab.Text), StrToInt(strPROD)]), []) then
      begin
        Append;
        strTMP := funcLocal.Busca_Registro(cdsPesqProduto, '',
          'TPIT_ID;TPIT_TPRC_ID;TPIT_PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;PROD_GARANTIA;MARCA_PROD;MODELO_PROD;TPIT_VLR_GONDOLA;ESTQ_EST_DISP',
          'TPIT_PROD_ID = ' + strPROD);
        if strTMP <> '' then
        begin
          try
            FieldByName('ODIT_TPIT_ID').AsString := funcLocal.Buscar_Coluna(strTMP, 1);
            FieldByName('ODIT_TPIT_TPRC_ID').AsString := funcLocal.Buscar_Coluna(strTMP, 2);
            FieldByName('ODIT_TPIT_PROD_ID').AsString := funcLocal.Buscar_Coluna(strTMP, 3);
            FieldByName('PROD_DESCRICAO').AsString := funcLocal.Buscar_Coluna(strTMP, 4);
            FieldByName('PROD_UNIDADE').AsString := funcLocal.Buscar_Coluna(strTMP, 5);
            FieldByName('PROD_GARANTIA').AsString := funcLocal.Buscar_Coluna(strTMP, 6);
            FieldByName('MARCA_PROD').AsString := funcLocal.Buscar_Coluna(strTMP, 7);
            FieldByName('MODELO_PROD').AsString := funcLocal.Buscar_Coluna(strTMP, 8);
            edtAtual := TRxDBCalcEdit.Create(nil);
            strTMPI := funcLocal.Buscar_Coluna(strTMP, 9);
            strTMPI := StringReplace(strTMPI, '.', '', []);
            edtAtual.Value := StrToFloat(strTMPI);
            FieldByName('ODIT_VLR_UNITARIO').AsFloat := edtAtual.Value;
            FieldByName('ESTQ_EST_DISP').AsString := funcLocal.Buscar_Coluna(strTMP, 10);
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
          FieldByName('ESTQ_EST_DISP').AsFloat := 0;
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
      FieldByName('ESTQ_EST_DISP').AsFloat := 0;
    end;
  end;
end;

procedure TfCadNovaOrdemServico.edtCodTabEnter(Sender: TObject);
begin
  inherited;
  dmOrdemServico.cdsOrdemServicoItens.Cancel;
  edtCodTab.Enabled := (dmOrdemServico.cdsOrdemServicoItens.IsEmpty);
  btnPesqTab.Enabled := edtCodTab.Enabled;
end;

procedure TfCadNovaOrdemServico.edtCodTabExit(Sender: TObject);
var
  strTMP: String;
begin
  if not edtCodTab.Modified then
    Exit;
  with dmOrdemServico do
  begin
    if edtCodTab.Text <> '' then
    begin
      OpenClientDataSet(2);
      strTMP := funcLocal.Busca_Registro(cdsPesqTabPreco, '',
        'TPRC_ID;TPRC_DESCRICAO', 'TPRC_ID = ' + edtCodTab.Text);
      if strTMP <> '' then
      begin
        cdsLocal.FieldByName('ORDS_TPRC_ID').AsString :=
          funcLocal.Buscar_Coluna(strTMP, 1);
        cdsLocal.FieldByName('TPRC_DESCRICAO').AsString :=
          funcLocal.Buscar_Coluna(strTMP, 2);
      end
      else
      begin
        cdsLocal.FieldByName('ORDS_TPRC_ID').AsString := '';
        cdsLocal.FieldByName('TPRC_DESCRICAO').AsString := '';
      end;
    end
    else
    begin
      cdsLocal.FieldByName('ORDS_TPRC_ID').AsString := '';
      cdsLocal.FieldByName('TPRC_DESCRICAO').AsString := '';
    end;
  end;
end;

procedure TfCadNovaOrdemServico.edtCodTabKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TfCadNovaOrdemServico.edtCodTecExit(Sender: TObject);
var
  strTMP: String;
begin
  if not edtCodTec.Modified then
    Exit;
  with dmOrdemServico do
  begin
    if edtCodTec.Text <> '' then
    begin
      OpenClientDataSet(4);
      strTMP := funcLocal.Busca_Registro(cdsPesqTecnico, '',
        'USER_ID;USER_NOME_COMPLETO', 'USER_ID = ' + edtCodTec.Text);
      if strTMP <> '' then
      begin
        cdsLocal.FieldByName('ORDS_USER_ID_TEC').AsString := '1';
//          funcLocal.Buscar_Coluna(strTMP, 1);
        cdsLocal.FieldByName('USER_NOME_COMPLETO').AsString :=
          funcLocal.Buscar_Coluna(strTMP, 2);
      end
      else
      begin
        cdsLocal.FieldByName('ORDS_USER_ID_TEC').AsString := '';
        cdsLocal.FieldByName('USER_NOME_COMPLETO').AsString := '';
      end;
    end
    else
    begin
      cdsLocal.FieldByName('ORDS_USER_ID_TEC').AsString := '';
      cdsLocal.FieldByName('USER_NOME_COMPLETO').AsString := '';
    end;
  end;
end;

procedure TfCadNovaOrdemServico.edtCodTipoExit(Sender: TObject);
var
  strTMP: String;
begin
  try
//    frPesqClienteGarantia.Enabled := false;
    if not edtCodTipo.Modified then Exit;
    with dmOrdemServico do begin
      if edtCodTipo.Text <> '' then begin
        OpenClientDataSet(3);
        strTMP := funcLocal.Busca_Registro(cdsPesqTipoOS, '',
          'GENE_ID;GENE_DESCR', 'GENE_ID = ' + edtCodTipo.Text);
        if strTMP <> '' then begin
          cdsLocal.FieldByName('ORDS_GENE_ID_TIPO_OS').AsString :=
            funcLocal.Buscar_Coluna(strTMP, 1);
          cdsLocal.FieldByName('TIPO_OS').AsString :=
            funcLocal.Buscar_Coluna(strTMP, 2);
        end else begin
          cdsLocal.FieldByName('ORDS_GENE_ID_TIPO_OS').AsString := '';
          cdsLocal.FieldByName('TIPO_OS').AsString := '';
        end;
      end else begin
        cdsLocal.FieldByName('ORDS_GENE_ID_TIPO_OS').AsString := '';
        cdsLocal.FieldByName('TIPO_OS').AsString := '';
      end;
    end;
  finally
//    if edtCodTipo.Text = '3' then begin
//      frPesqClienteGarantia.Enabled := true
//    end else begin
//      frPesqClienteGarantia.Limpar;
//    end;
  end;
end;

procedure TfCadNovaOrdemServico.edtQtdeEnter(Sender: TObject);
begin
  inherited;
  boolFrac := funcLocal.ProdutoVendeFracionado(edtCodProd.Text);
end;

procedure TfCadNovaOrdemServico.edtQtdeKeyPress(Sender: TObject; var Key: Char);
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

procedure TfCadNovaOrdemServico.edtVlrUnitEnter(Sender: TObject);
begin
  inherited;
  try
    edtVlrUnit.Enabled := funcLocal.RetornaPermissao(453);
    if not edtVlrUnit.Enabled then
      Perform(WM_NEXTDLGCTL, 0, 0);
  except
  end;
end;

procedure TfCadNovaOrdemServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dmOrdemServico do begin
    cdsPesqClie.Close;
    cdsPesqTabPreco.Close;
    cdsPesqTipoOS.Close;
    cdsPesqTecnico.Close;
    cdsPesqEquipamento.Close;
    cdsPesqProduto.Close;
    cdsOrdemServicoItens.Close;
    cdsPesqEquipCliente.Close;
    cdsAcertos_OS.Close;
    cdsOrdemServico.Close;
    cdsListaOS.Close;
    cdsPesqFornec.Close;
  end;
  inherited;
end;

procedure TfCadNovaOrdemServico.FormShow(Sender: TObject);
begin
  inherited;
  if cdsLocal.State = dsInsert then begin
    RetornaTabelaPreco;
  end else begin
      dmOrdemServico.cdsOrdemServico.Locate('ORDS_ID;ORDS_EMPR_ID;ORDS_STATUS',
        VarArrayOf([dmOrdemServico.cdsListaOSORDS_ID.AsInteger, funcLocal.Empr_ID,
        dmOrdemServico.cdsListaOSORDS_STATUS.AsInteger]), []);
  end;
  OpenClientDataSet(7);
  OpenClientDataSet(9);
  try
    edtDtInstalacao.SetFocus;
  except
  end;
  try
    edtVlrUnit.Enabled     := funcLocal.RetornaPermissao(453);
    edtVlrDesconto.Enabled := funcLocal.RetornaPermissao(496);
  except
  end;
  SomaPedido;
  boolEstoqueNegativo := TrabalhaEstoqueNegativo;
  if cdsLocal.State <> dsInsert then begin
    intStatus := cdsLocal.FieldByName('ORDS_STATUS').AsInteger;
  end else begin
    intStatus := -1;
    if funcLocal.AbreOS then begin
      edtCodEquip.Text     := IntToStr(funcLocal.CodEquip);
      edtCodEquip.Modified := true;
      edtCodEquipExit(Sender);
    end;
  end;
  boolAgendado := true;
  SetaValoresFrames;
//  frPesqFiltros.Enabled := false;
//  if funcLocal.TemPermissao('575') then
//    frPesqFiltros.Enabled := true;
//  frPesqAtendente.Enabled := cdsLocal.FieldByName('ORDS_STATUS').AsInteger <> 2;

  if cdsLocal.FieldByName('ORDS_STATUS').AsInteger = 2 then begin
    pageCadastro.Enabled := (funcLocal.TemPermissao('576'));
    edtVlrDesconto.Enabled := (funcLocal.TemPermissao('576'));
  end;
end;

procedure TfCadNovaOrdemServico.SetaValoresFrames;
var
  intI  : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TfrPesqIndividual) then begin
      (Components[intI] as TfrPesqIndividual).Limpar;
    end;
  end;

  frPesqStatusOS.cdsLocal         := Self.cdsLocal;
  frPesqStatusOS.cdsField1        := 'ORDS_GENE_ID_STATUS_OS';
  frPesqStatusOS.cdsField2        := 'STATUS_OS';

//  frPesqTipoAgendamento.cdsLocal  := Self.cdsLocal;
//  frPesqTipoAgendamento.cdsField1 := 'ORDS_GENE_ID_TP_AGEND';
//  frPesqTipoAgendamento.cdsField2 := 'TIPO_AGENDAMENTO';
//
//  frPesqFiltros.cdsLocal          := Self.cdsLocal;
//  frPesqFiltros.cdsField1         := 'ORDS_GENE_ID_FILTRO';
//
//  frPesqAtendente.cdsLocal        := Self.cdsLocal;
//  frPesqAtendente.cdsField1       := 'ORDS_USER_ID';

//  frPesqClienteGarantia.cdsLocal  := Self.cdsLocal;
//  frPesqClienteGarantia.cdsField1 := 'ORDS_CLIE_ID_GARANTIA';

  try
    if not (cdsLocal.State = dsInsert) then begin
      frPesqStatusOS.BuscarRegistro(cdsLocal.FieldByName('ORDS_GENE_ID_STATUS_OS').AsString);
//      frPesqTipoAgendamento.BuscarRegistro(cdsLocal.FieldByName('ORDS_GENE_ID_TP_AGEND').AsString);
//      frPesqFiltros.BuscarRegistro(cdsLocal.FieldByName('ORDS_GENE_ID_FILTRO').AsString);
//      frPesqAtendente.BuscarRegistro(cdsLocal.FieldByName('ORDS_USER_ID').AsString);
//      frPesqClienteGarantia.BuscarRegistro(cdsLocal.FieldByName('ORDS_CLIE_ID_GARANTIA').AsString);
    end;
  except
  end;
end;

function TfCadNovaOrdemServico.TrabalhaEstoqueNegativo: Boolean;
var
  qryCons: TSQLQuery;
begin
  try
    Result := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      CSIS_ESTOQUE_NEGATIVO');
        sql.Add('FROM  CONF_SISTEMA');
        sql.Add('WHERE CSIS_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        Open;
      end;
      try
        Result := (qryCons.Fields[0].AsInteger = 1);
      except
      end;
    except
      on e: exception do
      begin
        funcLocal.ReportaErro('TfCadNovaOrdemServico',
          'TrabalhaEstoqueNegativo', e.Message);
        funcLocal.Alerta('Erro no processo de leitura das configurações do sistema.' + #13 +'[' + e.Message + ']', 1);
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadNovaOrdemServico.RetornaTabelaPreco;
var
  qryCons: TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      CSIS_TPRC_ID');
        sql.Add('FROM  CONF_SISTEMA');
        sql.Add('WHERE CSIS_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        Open;
        if not qryCons.IsEmpty then
        begin
          edtCodTab.Text := qryCons.Fields[0].AsString;
          edtCodTab.Modified := true;
          edtCodTabExit(Self);
        end;
      end;
    except
      on e: exception do
      begin
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadNovaOrdemServico.edtVlrDescontoEnter(Sender: TObject);
begin
  inherited;
  SomaPedido;
end;

procedure TfCadNovaOrdemServico.edtVlrDescontoExit(Sender: TObject);
begin
  inherited;
  SomaPedido;
end;

procedure TfCadNovaOrdemServico.btnPesqNovoEquipClick(Sender: TObject);
var
  strTMP: String;
begin
  with dmOrdemServico do
  begin
    OpenClientDataSet(5);
    strTMP := funcLocal.Busca_Registro(cdsPesqEquipamento, '',
      'PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;MARCA_PROD;MODELO_PROD;PROD_GARANTIA',
      '');
    if strTMP <> '' then
    begin
      cdsLocal.FieldByName('ORDS_PROD_ID_EQUIP').AsString :=
        funcLocal.Buscar_Coluna(strTMP, 1);
      cdsLocal.FieldByName('PROD_DESCRICAO').AsString :=
        funcLocal.Buscar_Coluna(strTMP, 2);
      cdsLocal.FieldByName('PROD_UNIDADE').AsString :=
        funcLocal.Buscar_Coluna(strTMP, 3);
      cdsLocal.FieldByName('MARCA_PROD').AsString :=
        funcLocal.Buscar_Coluna(strTMP, 4);
      cdsLocal.FieldByName('MODELO_PROD').AsString :=
        funcLocal.Buscar_Coluna(strTMP, 5);
      cdsLocal.FieldByName('PROD_GARANTIA').AsString :=
        funcLocal.Buscar_Coluna(strTMP, 6);
      edtCodEquip.Modified := false;
    end
    else
    begin
      cdsLocal.FieldByName('ORDS_PROD_ID_EQUIP').AsString := '';
      cdsLocal.FieldByName('PROD_DESCRICAO').AsString := '';
      cdsLocal.FieldByName('PROD_UNIDADE').AsString := '';
      cdsLocal.FieldByName('MARCA_PROD').AsString := '';
      cdsLocal.FieldByName('MODELO_PROD').AsString := '';
      cdsLocal.FieldByName('PROD_GARANTIA').AsString := '';
    end;
  end;
  edtCodEquip.SetFocus;
end;

procedure TfCadNovaOrdemServico.lbCodTecClick(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(12);
end;

procedure TfCadNovaOrdemServico.lbCodTecMouseLeave(Sender: TObject);
begin
  inherited;
  funcLocal.UnPrintLabel(Sender);
end;

procedure TfCadNovaOrdemServico.lbCodTecMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  funcLocal.PrintLabel(Sender);
end;

procedure TfCadNovaOrdemServico.lbFornecedorMouseLeave(Sender: TObject);
begin
  inherited;
  funcLocal.UnPrintLabel(Sender);
end;

procedure TfCadNovaOrdemServico.lbFornecedorMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  funcLocal.PrintLabel(Sender);
end;

procedure TfCadNovaOrdemServico.Label11Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(436);
end;

procedure TfCadNovaOrdemServico.Label11MouseLeave(Sender: TObject);
begin
  inherited;
  funcLocal.UnPrintLabel(Sender);
end;

procedure TfCadNovaOrdemServico.Label11MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  funcLocal.PrintLabel(Sender);
end;

procedure TfCadNovaOrdemServico.lbCodEquipClick(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(356);
end;

procedure TfCadNovaOrdemServico.lbCodEquipMouseLeave(Sender: TObject);
begin
  inherited;
  funcLocal.UnPrintLabel(Sender);
end;

procedure TfCadNovaOrdemServico.lbCodFornecClick(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(144);
end;

procedure TfCadNovaOrdemServico.lbCodFornecMouseLeave(Sender: TObject);
begin
  inherited;
  funcLocal.UnPrintLabel(Sender);
end;

procedure TfCadNovaOrdemServico.lbCodFornecMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  funcLocal.PrintLabel(Sender);
end;

procedure TfCadNovaOrdemServico.Label26Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(436);
end;

procedure TfCadNovaOrdemServico.Label26MouseLeave(Sender: TObject);
begin
  inherited;
  funcLocal.UnPrintLabel(Sender);
end;

procedure TfCadNovaOrdemServico.Label26MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  funcLocal.PrintLabel(Sender);
end;

procedure TfCadNovaOrdemServico.OpenClientDataSet(intPos: Integer = 99);
begin
  with dmOrdemServico do
  begin
    case intPos of
      1:
        begin
          with cdsPesqClie do
          begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
          end;
        end;
      2:
        begin
          with cdsPesqTabPreco do
          begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
          end;
        end;
      3:
        begin
          with cdsPesqTipoOS do
          begin
            Close;
            Open;
          end;
        end;
      4:
        begin
          with cdsPesqTecnico do
          begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
          end;
        end;
      5:
        begin
          with cdsPesqEquipamento do
          begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
          end;
        end;
      6:
        begin
          with cdsPesqProduto do
          begin
            try
              Close;
              Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
              Params.ParamByName('TPRC_ID').AsInteger := StrToInt(edtCodTab.Text);
              Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
              Params.ParamByName('DATA').AsDate       := funcLocal.DataServidor(funcLocal.Conexao);
              Params.ParamByName('DATA').AsDate       := funcLocal.DataServidor(funcLocal.Conexao);
              Open;
            except
              funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+'Necessário informar uma tabela de preço primeiro.',1);
              edtCodTab.SetFocus;
              Abort;
            end;
          end;
        end;
      7:
        begin
          with cdsOrdemServicoItens do begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Params.ParamByName('ORDS_ID').AsInteger := cdsOrdemServicoORDS_ID.AsInteger;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Params.ParamByName('CLIE_ID').AsInteger := cdsOrdemServicoORDS_CLIE_ID.AsInteger;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
            try
              Append;
            except
            end;
          end;
        end;
      8:
        begin
          with cdsPesqEquipCliente do
          begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Params.ParamByName('CLIE_ID').AsInteger := cdsOrdemServicoORDS_CLIE_ID.AsInteger;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
          end;
        end;
      9:
        begin
          with cdsAcertos_OS do
          begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Params.ParamByName('ORDS_ID').AsInteger := cdsOrdemServicoORDS_ID.AsInteger;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
          end;
        end;
      10:
        begin
          with cdsOrdemServico do
          begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
          end;
          cdsLocal := cdsOrdemServico;
          OpenClientDataSet(7);
          OpenClientDataSet(9);
        end;
      11:
        begin
          with cdsListaOS do
          begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Params.ParamByName('CLIE_ID').AsInteger := cdsClientesCLIE_ID.AsInteger;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
            Locate('ORDS_ID', cdsOrdemServicoORDS_ID.AsInteger, []);
          end;
        end;
      12:
        begin
          with cdsPesqFornec do
          begin
            Close;
            Open;
          end;
        end;
    else
      begin
        OpenClientDataSet(1);
        OpenClientDataSet(2);
        OpenClientDataSet(3);
        OpenClientDataSet(4);
        OpenClientDataSet(5);
        OpenClientDataSet(6);
        OpenClientDataSet(7);
        OpenClientDataSet(8);
        OpenClientDataSet(9);
        OpenClientDataSet(10);
        OpenClientDataSet(11);
        OpenClientDataSet(12);
      end;
    end;
  end;
end;

procedure TfCadNovaOrdemServico.rdStatusChange(Sender: TObject);
begin
  inherited;
//  case rdStatus.ItemIndex of
//    2 : frPesqAtendente.Enabled := false;
//  end;
end;

// procedure TfCadNovaOrdemServico.HabilitaDesabilita(intPos : Integer);
// begin
// case intPos of
// 0 : begin
// edtDtInstalacao.Enabled := true;
// edtCodTipo.Enabled      := true;
// edtCodTab.Enabled       := true;
// edtCodTec.Enabled       := true;
// edtCodEquip.Enabled     := true;
// edtCodProd.Enabled      := true;
// DBMemo1.Enabled         := true;
// DBMemo2.Enabled         := true;
// end;
// 1 : begin
// edtDtInstalacao.Enabled := false;
// edtCodTipo.Enabled      := false;
// edtCodTab.Enabled       := false;
// edtCodTec.Enabled       := false;
// edtCodEquip.Enabled     := false;
// edtCodProd.Enabled      := false;
// DBMemo1.Enabled         := true;
// DBMemo2.Enabled         := true;
// end;
// 2 : begin
// edtDtInstalacao.Enabled := false;
// edtCodTipo.Enabled      := false;
// edtCodTab.Enabled       := false;
// edtCodTec.Enabled       := false;
// edtCodEquip.Enabled     := false;
// edtCodProd.Enabled      := false;
// DBMemo1.Enabled         := false;
// DBMemo2.Enabled         := false;
// end;
// 3 : begin
// edtDtInstalacao.Enabled := false;
// edtCodTipo.Enabled      := false;
// edtCodTab.Enabled       := false;
// edtCodTec.Enabled       := false;
// edtCodEquip.Enabled     := false;
// edtCodProd.Enabled      := false;
// rdStatus.Enabled        := false;
// DBMemo1.Enabled         := false;
// DBMemo2.Enabled         := false;
// end;
// end;
// btnPesqTipo.Enabled       := edtCodTipo.Enabled;
// btnPesqTab.Enabled        := edtCodTab.Enabled;
// btnPesqTec.Enabled        := edtCodTec.Enabled;
// btnPesqEquip.Enabled      := edtCodEquip.Enabled;
// btnPesqNovoEquip.Enabled  := edtCodEquip.Enabled;
// edtNrEquipamento.Enabled  := edtCodEquip.Enabled;
// btnPesqProd.Enabled       := edtCodProd.Enabled;
// edtQtde.Enabled           := edtCodProd.Enabled;
// edtVlrUnit.Enabled        := edtCodProd.Enabled;
// btnAdic.Enabled           := edtCodProd.Enabled;
// btnRet.Enabled            := edtCodProd.Enabled;
// DBGrid1.Enabled           := edtCodProd.Enabled;
// edtVlrDesconto.Enabled    := edtCodProd.Enabled;
// end;

procedure TfCadNovaOrdemServico.btnPesqTipoClick(Sender: TObject);
var
  strTMP: String;
begin
  with dmOrdemServico do begin
    OpenClientDataSet(3);
    strTMP := funcLocal.Busca_Registro(cdsPesqTipoOS, '', 'GENE_ID;GENE_DESCR', '');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('ORDS_GENE_ID_TIPO_OS').AsString := funcLocal.Buscar_Coluna(strTMP, 1);
      cdsLocal.FieldByName('TIPO_OS').AsString := funcLocal.Buscar_Coluna(strTMP, 2);
      edtCodTipo.Modified := true;
    end else begin
      cdsLocal.FieldByName('ORDS_GENE_ID_TIPO_OS').AsString := '';
      cdsLocal.FieldByName('TIPO_OS').AsString := '';
    end;
  end;
  edtCodTipo.SetFocus;
end;

procedure TfCadNovaOrdemServico.btnRetClick(Sender: TObject);
begin
  inherited;
  with dmOrdemServico do
  begin
    if not cdsOrdemServicoItens.IsEmpty then
    begin
      cdsOrdemServicoItens.Delete;
      try
        cdsOrdemServicoORDS_VLR_TOTAL_OS.AsFloat :=
          cdsOrdemServicoItensTOTALITENS.Value;
      except
        cdsOrdemServicoORDS_VLR_TOTAL_OS.AsFloat := 0;
      end;
      SomaPedido;
      edtCodProd.SetFocus;
    end;
  end;
end;

procedure TfCadNovaOrdemServico.btnPesqEquipClick(Sender: TObject);
var
  strTMP: String;
begin
  with dmOrdemServico do begin
    OpenClientDataSet(8);
    if not cdsPesqEquipCliente.IsEmpty then begin
      strTMP := funcLocal.Busca_Registro(cdsPesqEquipCliente, '','PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;MARCA_PROD;MODELO_PROD;PROD_GARANTIA;ORDS_GENE_ID_FILTRO','');
    end else begin
      OpenClientDataSet(5);
      strTMP := funcLocal.Busca_Registro(cdsPesqEquipamento, '','PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;MARCA_PROD;MODELO_PROD;PROD_GARANTIA','');
    end;
    if strTMP <> '' then begin
      cdsLocal.FieldByName('ORDS_PROD_ID_EQUIP').AsString := funcLocal.Buscar_Coluna(strTMP, 1);
      cdsLocal.FieldByName('PROD_DESCRICAO').AsString     := funcLocal.Buscar_Coluna(strTMP, 2);
      cdsLocal.FieldByName('PROD_UNIDADE').AsString       := funcLocal.Buscar_Coluna(strTMP, 3);
      cdsLocal.FieldByName('MARCA_PROD').AsString         := funcLocal.Buscar_Coluna(strTMP, 4);
      cdsLocal.FieldByName('MODELO_PROD').AsString        := funcLocal.Buscar_Coluna(strTMP, 5);
      cdsLocal.FieldByName('PROD_GARANTIA').AsString      := funcLocal.Buscar_Coluna(strTMP, 6);
      edtCodEquip.Modified := true;
//      frPesqFiltros.BuscarRegistro(funcLocal.Buscar_Coluna(strTMP, 7));
    end else begin
      cdsLocal.FieldByName('ORDS_PROD_ID_EQUIP').AsString := '';
      cdsLocal.FieldByName('PROD_DESCRICAO').AsString := '';
      cdsLocal.FieldByName('PROD_UNIDADE').AsString := '';
      cdsLocal.FieldByName('MARCA_PROD').AsString := '';
      cdsLocal.FieldByName('MODELO_PROD').AsString := '';
      cdsLocal.FieldByName('PROD_GARANTIA').AsString := '';
//      frPesqFiltros.Limpar;
    end;
  end;
  edtCodEquip.SetFocus;
end;

procedure TfCadNovaOrdemServico.btnPesqFornClick(Sender: TObject);
var
  strTMP: String;
begin
  OpenClientDataSet(12);
  strTMP := funcLocal.Busca_Registro(dmOrdemServico.cdsPesqFornec, '',
    'FORN_ID;FORN_RAZAO_SOCIAL', '');
  if strTMP <> '' then
  begin
    cdsLocal.FieldByName('ORDS_FORN_ID_EQUIP').AsString :=
      funcLocal.Buscar_Coluna(strTMP, 1);
    cdsLocal.FieldByName('FORN_RAZAO_SOCIAL').AsString :=
      funcLocal.Buscar_Coluna(strTMP, 2);
    edtCodFornec.Modified := true;
  end
  else
  begin
    cdsLocal.FieldByName('ORDS_FORN_ID_EQUIP').AsString := '';
    cdsLocal.FieldByName('FORN_RAZAO_SOCIAL').AsString := '';
  end;
  edtCodFornec.SetFocus;
end;

procedure TfCadNovaOrdemServico.btnPesqProdClick(Sender: TObject);
var
  strTMP, strTMPI: String;
  edtAtual: TRxDBCalcEdit;
begin
  OpenClientDataSet(6);
  with dmOrdemServico, cdsOrdemServicoItens do
  begin
    strTMP := funcLocal.Busca_Registro(cdsPesqProduto, '',
      'TPIT_ID;TPIT_TPRC_ID;TPIT_PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;PROD_GARANTIA;MARCA_PROD;MODELO_PROD;TPIT_VLR_GONDOLA;ESTQ_EST_DISP',
      '');
    if strTMP <> '' then
    begin
      try
        Edit;
        FieldByName('ODIT_TPIT_ID').AsString := funcLocal.Buscar_Coluna(strTMP, 1);
        FieldByName('ODIT_TPIT_TPRC_ID').AsString := funcLocal.Buscar_Coluna(strTMP, 2);
        FieldByName('ODIT_TPIT_PROD_ID').AsString := funcLocal.Buscar_Coluna(strTMP, 3);
        FieldByName('PROD_DESCRICAO').AsString := funcLocal.Buscar_Coluna(strTMP, 4);
        FieldByName('PROD_UNIDADE').AsString := funcLocal.Buscar_Coluna(strTMP, 5);
        FieldByName('PROD_GARANTIA').AsString := funcLocal.Buscar_Coluna(strTMP, 6);
        FieldByName('MARCA_PROD').AsString := funcLocal.Buscar_Coluna(strTMP, 7);
        FieldByName('MODELO_PROD').AsString := funcLocal.Buscar_Coluna(strTMP, 8);
        edtAtual := TRxDBCalcEdit.Create(nil);
        strTMPI := funcLocal.Buscar_Coluna(strTMP, 9);
        strTMPI := StringReplace(strTMPI, '.', '', []);
        edtAtual.Value := StrToFloat(strTMPI);
        FieldByName('ODIT_VLR_UNITARIO').AsFloat := edtAtual.Value;
        FieldByName('ESTQ_EST_DISP').AsString := funcLocal.Buscar_Coluna(strTMP, 10);
        edtCodProd.Modified := true;
      finally
        FreeAndNil(edtAtual);
      end;
    end
    else
    begin
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
      FieldByName('ESTQ_EST_DISP').AsFloat := 0;
    end;
  end;
  edtCodProd.SetFocus;
end;

procedure TfCadNovaOrdemServico.btnPesqTabClick(Sender: TObject);
var
  strTMP: String;
begin
  dmOrdemServico.cdsOrdemServicoItens.Cancel;
  edtCodTab.Enabled := (dmOrdemServico.cdsOrdemServicoItens.IsEmpty);
  btnPesqTab.Enabled := edtCodTab.Enabled;
  if btnPesqTab.Enabled then
  begin
    with dmOrdemServico do
    begin
      OpenClientDataSet(2);
      strTMP := funcLocal.Busca_Registro(cdsPesqTabPreco, '',
        'TPRC_ID;TPRC_DESCRICAO', '');
      if strTMP <> '' then
      begin
        cdsLocal.FieldByName('ORDS_TPRC_ID').AsString :=
          funcLocal.Buscar_Coluna(strTMP, 1);
        cdsLocal.FieldByName('TPRC_DESCRICAO').AsString :=
          funcLocal.Buscar_Coluna(strTMP, 2);
        edtCodTab.Modified := true;
      end
      else
      begin
        cdsLocal.FieldByName('ORDS_TPRC_ID').AsString := '';
        cdsLocal.FieldByName('TPRC_DESCRICAO').AsString := '';
      end;
    end;
    edtCodTab.SetFocus;
  end
  else
    Exit;
end;

{ TOrdemServico }

function TOrdemServico.getCliente: Integer;
begin
  Result := FCliente;
end;

function TOrdemServico.getClienteGarantia: Integer;
begin
  Result := FClienteGarantia;
end;

function TOrdemServico.getDtUltimoServ: TDate;
begin
  Result := FDtUltimoServ;
end;

function TOrdemServico.getEquipamento: Integer;
begin
  Result := FEquip;
end;

function TOrdemServico.getFiltro: Integer;
begin
  Result := FFiltro;
end;

function TOrdemServico.getFornecedor: Integer;
begin
  Result := FFornec;
end;

function TOrdemServico.getNrPedido: String;
begin
  Result := FNrPedido;
end;

function TOrdemServico.getTabPreco: Integer;
begin
  Result := FTabPreco;
end;

function TOrdemServico.getTecnico: Integer;
begin
  Result := FTecnico;
end;

function TOrdemServico.getTipoOS: Integer;
begin
  Result := FTipoOS;
end;

function TOrdemServico.getVlrDesc: Real;
begin
  Result := FVlrDesc;
end;

function TOrdemServico.getVlrTotal: Real;
begin
  Result := FVlrTotal;
end;

procedure TOrdemServico.setCliente(const Value: Integer);
begin
  FCliente := Value;
end;

procedure TOrdemServico.setClienteGarantia(const Value: Integer);
begin
  FClienteGarantia := Value;
end;

procedure TOrdemServico.setDtUltimoServ(const Value: TDate);
begin
  FDtUltimoServ := Value;
end;

procedure TOrdemServico.setEquipamento(const Value: Integer);
begin
  FEquip := Value;
end;

procedure TOrdemServico.setFiltro(const Value: Integer);
begin
  FFiltro := Value;
end;

procedure TOrdemServico.setFornecedor(const Value: Integer);
begin
  FFornec := Value;
end;

procedure TOrdemServico.setNrPedido(const Value: String);
begin
  FNrPedido := Value;
end;

procedure TOrdemServico.setTabPreco(const Value: Integer);
begin
  FTabPreco := Value;
end;

procedure TOrdemServico.setTecnico(const Value: Integer);
begin
  FTecnico := Value;
end;

procedure TOrdemServico.setTipoOS(const Value: Integer);
begin
  FTipoOS := Value;
end;

procedure TOrdemServico.setVlrDesc(const Value: Real);
begin
  FVlrDesc := Value;
end;

procedure TOrdemServico.setVlrTotal(const Value: Real);
begin
  FVlrTotal := Value;
end;

end.
