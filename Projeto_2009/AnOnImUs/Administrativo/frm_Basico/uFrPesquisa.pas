unit uFrPesquisa;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.Buttons, Vcl.Controls, Vcl.ExtCtrls,
  System.Classes, Funcoes;

type
  TfrPesquisa = class(TFrame)
    GroupBox1: TGroupBox;
    rdContenha: TRadioGroup;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnPesq: TSpeedButton;
    lbRegistros: TListBox;
    btnAdicionar: TBitBtn;
    rdMovimento: TRadioGroup;
    rdOpcoes: TRadioGroup;
    ckPlanoContas: TCheckBox;
    procedure lbRegistrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnAdicionarClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    function  Pesquisa(strFiltro : String = '') : String;
    procedure btnPesqClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure Add();
  public
    funcLocal : TFuncoes;
    function  TemRegistros() : Boolean;
    function  InGrid() : String;
    procedure Limpar;
    procedure SetFocus; virtual;
    procedure BuscarRegistro(strCodigo : String);
  end;

implementation

uses
  Winapi.Messages, udmFrPesquisa, System.SysUtils, Winapi.Windows;

{$R *.dfm}

procedure TfrPesquisa.btnAdicionarClick(Sender: TObject);
begin
  if edtCodigo.Text <> '' then begin
    edtCodigo.Modified := true;
    edtCodigoExit(Sender);
    edtCodigo.Clear;
    edtDescricao.Clear;
    edtCodigo.SetFocus;
  end else Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrPesquisa.btnPesqClick(Sender: TObject);
var
  strTMP : String;
begin
  try
    if dmFrPesquisa = nil then
      dmFrPesquisa := TdmFrPesquisa.Create(nil);
    dmFrPesquisa.OpenClientDataSet(rdOpcoes.ItemIndex,Copy(rdMovimento.Items[rdMovimento.ItemIndex],1,1));

    strTMP := Pesquisa();

    if strTMP <> '' then begin
      edtCodigo.Text     := funcLocal.Buscar_Coluna(strTMP,1);
      edtDescricao.Text  := funcLocal.Buscar_Coluna(strTMP,2);
      edtCodigo.Modified := true;
      strTMP             := '';
    end else begin
      edtCodigo.Clear;
      edtDescricao.Clear;
    end;
    edtCodigo.SetFocus;
  finally
  end;
end;

procedure TfrPesquisa.BuscarRegistro(strCodigo: String);
begin
  edtCodigo.Text     := strCodigo;
  edtCodigo.Modified := true;
  edtCodigoExit(Self);
end;

procedure TfrPesquisa.edtCodigoExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCodigo.Modified then Exit;
  if edtCodigo.Text <> '' then begin

    ///Abrindo o ClientDataSet
    dmFrPesquisa.OpenClientDataSet(rdOpcoes.ItemIndex,Copy(rdMovimento.Items[rdMovimento.ItemIndex],1,1));

    ///Realizando a pesquisa
    case rdOpcoes.ItemIndex of
      0  : strTMP := Pesquisa('CLIE_ID = '      + edtCodigo.Text); ///Cliente
      1  : strTMP := Pesquisa('FORN_ID = '      + edtCodigo.Text); ///Fornecedores
      4  : strTMP := Pesquisa('CPAG_ID = '      + edtCodigo.Text); ///Contas a Pagar
      5  : strTMP := Pesquisa('CREC_ID = '      + edtCodigo.Text); ///Contas a Receber
      6  : strTMP := Pesquisa('PLCT_ID = '      + edtCodigo.Text); ///Plano de Contas
      7  : strTMP := Pesquisa('PLCT_ID = '      + edtCodigo.Text); ///Plano de Contas Geral
      8  : strTMP := Pesquisa('CBCO_ID = '      + edtCodigo.Text); ///Conta Bancaria
      9  : strTMP := Pesquisa('TPRC_ID = '      + edtCodigo.Text); ///Tabela de Preço
      10 : strTMP := Pesquisa('PROD_ID = '      + edtCodigo.Text); ///Equipamentos (O.S.)
      11 : strTMP := Pesquisa('USER_ID = '      + edtCodigo.Text); ///Tecnicos (O.S)
      16 : strTMP := Pesquisa('PROD_ID = '      + edtCodigo.Text); ///Produto
      17 : strTMP := Pesquisa('NFEN_ID = '      + edtCodigo.Text); ///Notas Fiscais
      18 : strTMP := Pesquisa('SAAV_ID = '      + edtCodigo.Text); ///Saida Avulsa
      19 : strTMP := Pesquisa('ENAV_ID = '      + edtCodigo.Text); ///Entrada Avulsa
      20 : strTMP := Pesquisa('SAIV_ID = '      + edtCodigo.Text); ///Saida Avaria
      22 : strTMP := Pesquisa('USER_ID = '      + edtCodigo.Text); ///Usuario
      23 : strTMP := Pesquisa('USER_ID = '      + edtCodigo.Text); ///Vendedor
      31 : strTMP := Pesquisa('PATR_ID = '      + edtCodigo.Text); ///Patrimonio
      33 : strTMP := Pesquisa('PEDV_ID = '      + edtCodigo.Text); ///Pedido/Orçamento
      else strTMP := Pesquisa('GENE_ID = '      + edtCodigo.Text); ///  02 - Praça                  ///  03 - Tipo de Documento
                                                                   ///  12 - Tipo Produto           ///  13 - Grupo Produto
                                                                   ///  14 - Marca Produto          ///  15 - Modelo Produto
                                                                   ///  21 - Tipo O.S.              ///  24 - Região
                                                                   ///  25 - Rota                   ///  26 - Grupo Cliente
                                                                   ///  27 - Movimentação Bancaria  ///  28 - Status Atendimento
                                                                   ///  29 - Status OS              ///  30 - Bancos
                                                                   ///  32 - Tipo Agendamento       ///  34 - Unidade de Medida
                                                                   ///  35 - Filtro OS              ///  36 - Bandeira Cartao
    end;

    //Verificando se o resultado da pesquisa retornou alguma coisa
    if strTMP <> '' then begin
      edtCodigo.Text    := funcLocal.Buscar_Coluna(strTMP,1);
      edtDescricao.Text := funcLocal.Buscar_Coluna(strTMP,2);
      Add();
      edtCodigo.Clear;
      edtDescricao.Clear;
      edtCodigo.Modified := false;
      if edtCodigo.CanFocus then
        edtCodigo.SetFocus;
    end else begin
      edtCodigo.Clear;
      edtDescricao.Clear;
    end;
  end else begin
    edtCodigo.Clear;
    edtDescricao.Clear;
  end;
end;

procedure TfrPesquisa.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Shift = [ssAlt]) and (key = 40)) or (key = VK_F5) then begin
    btnPesq.Click;
  end;
end;

procedure TfrPesquisa.edtCodigoKeyPress(Sender: TObject; var Key: Char);
var
  formPric : TForm;
begin
  if funcLocal = nil then begin
    formPric := Application.MainForm;
    funcLocal := TFuncoes(formPric.FindComponent('funcPrincipal'));
  end;
  if not (CharInSet(key,['0'..'9',#8])) then begin
    try
      if Trim(edtCodigo.Text) = '' then begin
        if Key = #27 then Exit;
        funcLocal.VlrPesq := Key;
        Key := #0;
        btnPesq.Click
      end else Key := #0;
    except
    end;
  end;
end;

function TfrPesquisa.InGrid(): String;
begin
  Result := funcLocal.InGrid(lbRegistros,rdContenha,ckPlanoContas);
end;

procedure TfrPesquisa.Add();
var
  strTMP : String;
begin
  strTMP := FormatFloat('000000',StrToFloat(edtCodigo.Text)) + ' - ' + Trim(edtDescricao.Text);
  if lbRegistros.Items.IndexOf(strTMP) = -1 then begin
    lbRegistros.Items.Add(strTMP);
  end;
end;

procedure TfrPesquisa.lbRegistrosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_delete then
    lbRegistros.DeleteSelected;
end;

procedure TfrPesquisa.Limpar;
var
  intI : Integer;
begin
  for intI := 0 to ComponentCount -1 do begin
    if (Components[intI] is TEdit) then
      (Components[intI] as TEdit).Clear;
    if (Components[intI] is TListBox) then
      (Components[intI] as TListBox).Clear;
  end;
  rdContenha.ItemIndex := 1;
end;

function TfrPesquisa.Pesquisa(strFiltro : String = ''): String;
begin
  with dmFrPesquisa do begin
    try
      case rdOpcoes.ItemIndex of
        0  : Result := funcLocal.Busca_Registro(cdsPesqCliente,'CLIE_FANTASIA','CLIE_ID;CLIE_FANTASIA;CLIE_CNPJ_CPF',strFiltro);                    ///Clientes
        1  : Result := funcLocal.Busca_Registro(cdsPesqFornec,'FORN_NOME_FANTASIA','FORN_ID;FORN_NOME_FANTASIA',strFiltro);                         ///Fornecedores
        2  : Result := funcLocal.Busca_Registro(cdsPesqPraca,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1',strFiltro);                                ///Praças
        3  : Result := funcLocal.Busca_Registro(cdsPesqTipo,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                           ///Tipos de Doc.
        4  : Result := funcLocal.Busca_Registro(cdsPesqContaPagar,'CPAG_PROVENIENTE','CPAG_ID;CPAG_PROVENIENTE',strFiltro);                         ///Contas a Pagar
        5  : Result := funcLocal.Busca_Registro(cdsPesqContaReceber,'CREC_PROVENIENTE','CREC_ID;CREC_PROVENIENTE',strFiltro);                       ///Contas a Receber
        6  : Result := funcLocal.Busca_Registro(cdsPesqPlanoContas,'PLCT_DESCRICAO','PLCT_ID;PLCT_DESCRICAO;PLCT_COD_SIMPLIFICADO',strFiltro);      ///Plano de Contas
        7  : Result := funcLocal.Busca_Registro(cdsPesqPlanoContasGeral,'PLCT_DESCRICAO','PLCT_ID;PLCT_DESCRICAO;PLCT_COD_SIMPLIFICADO',strFiltro); ///Plano de Contas Geral
        8  : Result := funcLocal.Busca_Registro(cdsPesqContaBancaria,'GENE_DESCR','CBCO_ID;GENE_DESCR',strFiltro);                                  ///Contas Bancaria
        9  : Result := funcLocal.Busca_Registro(cdsPesqPrc,'TPRC_DESCRICAO','TPRC_ID;TPRC_DESCRICAO',strFiltro);                                    ///Tabela de Preço
        10 : Result := funcLocal.Busca_Registro(cdsPesqEquipamento,'','PROD_ID;PROD_DESCRICAO',strFiltro);                                          ///Equipamentos (O.S.)
        11 : Result := funcLocal.Busca_Registro(cdsPesqTecnico,'','USER_ID;USER_NOME_COMPLETO',strFiltro);                                          ///Tecnicos (O.S)
        12 : Result := funcLocal.Busca_Registro(cdsPesqTipoProd,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                       ///Tipo de Produto
        13 : Result := funcLocal.Busca_Registro(cdsPesqGrupoProd,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                      ///Grupo de Produto
        14 : Result := funcLocal.Busca_Registro(cdsPesqMarcaProd,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                      ///Marca de Produto
        15 : Result := funcLocal.Busca_Registro(cdsPesqModeloProd,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                     ///Modelo de Produto
        16 : Result := funcLocal.Busca_Registro(cdsPesqProd,'PROD_DESCRICAO','PROD_ID;PROD_DESCRICAO;PROD_UNIDADE',strFiltro);                      ///Produtos
        17 : Result := funcLocal.Busca_Registro(cdsPesqNotaFiscal,'NFEN_ID','NFEN_ID;FORN_NOME_FANTASIA',strFiltro);                                ///Notas Fiscais
        18 : Result := funcLocal.Busca_Registro(cdsPesqSaida,'SAAV_ID','SAAV_ID;ENAV_NR_DOCUMENTO',strFiltro);                                      ///Saida Avulsa
        19 : Result := funcLocal.Busca_Registro(cdsPesqEntrada,'ENAV_ID','ENAV_ID;ENAV_NR_DOCUMENTO',strFiltro);                                    ///Entrada Avulsa
        20 : Result := funcLocal.Busca_Registro(cdsPesqSaidaAvaria,'SAIV_ID','SIAV_ID;SIAV_NR_DOCUMENTO',strFiltro);                                ///Saída Avaria
        21 : Result := funcLocal.Busca_Registro(cdsPesqTipoOS,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                         ///Tipos O.S.
        22 : Result := funcLocal.Busca_Registro(cdsPesqUsuario,'','USER_ID;USER_NOME_COMPLETO',strFiltro);                                          ///Usuario
        23 : Result := funcLocal.Busca_Registro(cdsPesqVendedor,'','USER_ID;USER_NOME_COMPLETO',strFiltro);                                         ///Vendedor
        24 : Result := funcLocal.Busca_Registro(cdsPesqRegiao,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1',strFiltro);                               ///Regiao
        25 : Result := funcLocal.Busca_Registro(cdsPesqRota,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1',strFiltro);                                 ///Rota
        26 : Result := funcLocal.Busca_Registro(cdsPesqGrupoCliente,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                   ///Grupo Cliente
        27 : Result := funcLocal.Busca_Registro(cdsPesqTipoMov,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1;GENE_PAR2',strFiltro);                    ///Movimentação Bancaria
        28 : Result := funcLocal.Busca_Registro(cdsStatusAtendimento,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_NUMBER1',strFiltro);                     ///Status Atendimento
        29 : Result := funcLocal.Busca_Registro(cdsStatusOS,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                           ///Status Atendimento
        30 : Result := funcLocal.Busca_Registro(cdsPesq_Bancos,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1',strFiltro);                              ///Bancos
        31 : Result := funcLocal.Busca_Registro(cdsPesqPatrimonio,'PATR_DESCRICAO','PATR_ID;PATR_DESCRICAO',strFiltro);                             ///Patrimonio
        32 : Result := funcLocal.Busca_Registro(cdsTipoAgendamento,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                    ///Tipo Agendamento
        33 : Result := funcLocal.Busca_Registro(cdsPedidoOrcamento,'CLIE_FANTASIA','PEDV_ID;CLIE_FANTASIA;PEDV_DTA_CADASTRO',strFiltro);            ///Pedido/Orçamento
        34 : Result := funcLocal.Busca_Registro(cdsPesqUnidade,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1',strFiltro);                              ///Unidade Medida
        35 : Result := funcLocal.Busca_Registro(cdsPesqFiltro,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                         ///Filtro O.S.
        36 : Result := funcLocal.Busca_Registro(cdsPesqBandeira,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                       ///Bandeira Cartão
      end;
    except
      Result := '';
    end;
  end;
end;

procedure TfrPesquisa.SetFocus;
begin
  edtCodigo.SetFocus;
end;

function TfrPesquisa.TemRegistros(): Boolean;
begin
  Result := funcLocal.TemRegistros(lbRegistros)
end;

end.
