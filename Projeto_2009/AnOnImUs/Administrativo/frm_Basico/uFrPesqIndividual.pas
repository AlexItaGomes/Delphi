unit uFrPesqIndividual;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.Controls, Vcl.ExtCtrls, Vcl.Buttons,
  System.Classes, DataSnap.DBClient, Funcoes;

type
  TfrPesqIndividual = class(TFrame)
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnPesquisar: TSpeedButton;
    btnInserir: TSpeedButton;
    rdOpcoes: TRadioGroup;
    rdMovimento: TRadioGroup;
    ckOmitir: TCheckBox;
    edtOpcao: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtOpcao1: TEdit;
    ckPlanoContas: TCheckBox;
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    cdsPrLocal : TClientDataSet;
    strField1,
    strField2,
    strField3,
    strField4  : String;
    FHabilita  : Boolean;
    function  Pesquisa(strFiltro: String = ''): String;
    ///Get e Set
    function  getCdsLocal : TClientDataSet;
    function  getField1   : String;
    function  getField2   : String;
    function  getField3   : String;
    function  getField4   : String;
    procedure setCdsLocal(const Value: TClientDataSet);
    procedure setField1(const Value: String);
    procedure setField2(const Value: String);
    procedure setField3(const Value: String);
    procedure setField4(const Value: String);
    function  getValue: Integer;
    function  getHabilita: Boolean;
    procedure setHabilita(const Value: Boolean);
    ///Get e Set
  public
    funcLocal  : TFuncoes;
    function   TemRegistro: Boolean;
    function   InGrid: String;
    procedure  Limpar;
    procedure  BuscarRegistro(strCodigo : String);
    procedure  SetFocus;
  published
    property  cdsLocal  : TClientDataSet read getCdsLocal write setCdsLocal;
    property  cdsField1 : String         read getField1   write setField1;
    property  cdsField2 : String         read getField2   write setField2;
    property  cdsField3 : String         read getField3   write setField3;
    property  cdsField4 : String         read getField4   write setField4;
    property  Value     : Integer        read getValue;
    property  Habilita  : Boolean        read getHabilita write setHabilita default true;
  end;

implementation

uses
  udmFrPesquisa, System.SysUtils, Winapi.Windows;

{$R *.dfm}

procedure TfrPesqIndividual.btnInserirClick(Sender: TObject);
var
  formPric : TForm;
begin
  if funcLocal = nil then begin
    formPric := Application.MainForm;
    funcLocal := TFuncoes(formPric.FindComponent('funcPrincipal'));
  end;
  case rdOpcoes.ItemIndex of
    0  : funcLocal.ExecutaRotina(152);
    1  : funcLocal.ExecutaRotina(144);
    2  : funcLocal.ExecutaRotina(153);
    3  : funcLocal.ExecutaRotina(0);
    4  : funcLocal.ExecutaRotina(175);
    5  : funcLocal.ExecutaRotina(187);
    6  : funcLocal.ExecutaRotina(167);
    7  : funcLocal.ExecutaRotina(167);
    8  : funcLocal.ExecutaRotina(205);
    9  : funcLocal.ExecutaRotina(436);
    10 : funcLocal.ExecutaRotina(356);
    11 : funcLocal.ExecutaRotina(12);
    12 : funcLocal.ExecutaRotina(0);
    13 : funcLocal.ExecutaRotina(357);
    14 : funcLocal.ExecutaRotina(359);
    15 : funcLocal.ExecutaRotina(360);
    16 : funcLocal.ExecutaRotina(356);
    17 : funcLocal.ExecutaRotina(363);
    18 : funcLocal.ExecutaRotina(365);
    19 : funcLocal.ExecutaRotina(364);
    20 : funcLocal.ExecutaRotina(366);
    21 : funcLocal.ExecutaRotina(0);
    22 : funcLocal.ExecutaRotina(12);
    23 : funcLocal.ExecutaRotina(12);
    24 : funcLocal.ExecutaRotina(514);                                          //Região
    25 : funcLocal.ExecutaRotina(515);                                          //Rota
    26 : funcLocal.ExecutaRotina(505);
    27 : funcLocal.ExecutaRotina(206);
    28 : funcLocal.ExecutaRotina(542);
    29 : funcLocal.ExecutaRotina(525);
    30 : funcLocal.ExecutaRotina(204);
    31 : funcLocal.ExecutaRotina(533);
    32 : funcLocal.ExecutaRotina(541);
    33 : funcLocal.ExecutaRotina(0);
    34 : funcLocal.ExecutaRotina(555);
    35 : funcLocal.ExecutaRotina(0);
    36 : funcLocal.ExecutaRotina(0);
    37 : funcLocal.ExecutaRotina(0);                                            //Agendamentos
  end;
end;

procedure TfrPesqIndividual.btnPesquisarClick(Sender: TObject);
var
  strTMP : String;
begin
  if rdOpcoes.ItemIndex = -1 then funcLocal.Alerta('Index não informado para a pesquisa!',1);
  if dmFrPesquisa = nil then
    dmFrPesquisa := TdmFrPesquisa.Create(nil);
  dmFrPesquisa.OpenClientDataSet(rdOpcoes.ItemIndex,Copy(rdMovimento.Items[rdMovimento.ItemIndex],1,1));

  strTMP := Pesquisa();

  if strTMP <> '' then begin
    edtCodigo.Text     := funcLocal.Buscar_Coluna(strTMP,1);
    edtDescricao.Text  := funcLocal.Buscar_Coluna(strTMP,2);
    edtOpcao.Text      := funcLocal.Buscar_Coluna(strTMP,3);
    edtOpcao1.Text     := funcLocal.Buscar_Coluna(strTMP,4);
    if cdsLocal <> nil then begin
      cdsLocal.FieldByName(cdsField1).AsString      := funcLocal.Buscar_Coluna(strTMP,1);
      if Trim(cdsField2) <> '' then
        cdsPrLocal.FieldByName(cdsField2).AsString  := funcLocal.Buscar_Coluna(strTMP,2);
      if Trim(cdsField3) <> '' then
        cdsPrLocal.FieldByName(cdsField3).AsString  := funcLocal.Buscar_Coluna(strTMP,3);
      if Trim(cdsField4) <> '' then
        cdsPrLocal.FieldByName(cdsField4).AsString  := funcLocal.Buscar_Coluna(strTMP,4);
    end;
    edtCodigo.Modified := true;
    strTMP             := '';
  end else begin
    edtCodigo.Clear;
    edtDescricao.Clear;
    edtOpcao.Clear;
    edtOpcao1.Clear;
    if cdsLocal <> nil then begin
      cdsPrLocal.FieldByName(cdsField1).AsString    := '';
      if Trim(cdsField2) <> '' then
        cdsPrLocal.FieldByName(cdsField2).AsString  := '';
      if Trim(cdsField3) <> '' then
        cdsPrLocal.FieldByName(cdsField3).AsString  := '';
      if Trim(cdsField4) <> '' then
        cdsPrLocal.FieldByName(cdsField4).AsString  := '';
    end;
  end;
  edtCodigo.SetFocus;
end;

procedure TfrPesqIndividual.BuscarRegistro(strCodigo: String);
begin
  edtCodigo.Text     := strCodigo;
  edtCodigo.Modified := true;
  edtCodigoExit(Self);
end;

function TfrPesqIndividual.Pesquisa(strFiltro : String = ''): String;
begin
  with dmFrPesquisa do begin
    try
      case rdOpcoes.ItemIndex of
        0  : Result := funcLocal.Busca_Registro(cdsPesqCliente,'CLIE_FANTASIA','CLIE_ID;CLIE_FANTASIA;CLIE_CNPJ_CPF',strFiltro);                          ///Clientes
        1  : Result := funcLocal.Busca_Registro(cdsPesqFornec,'FORN_NOME_FANTASIA','FORN_ID;FORN_NOME_FANTASIA',strFiltro);                               ///Fornecedores
        2  : Result := funcLocal.Busca_Registro(cdsPesqPraca,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1',strFiltro);                                      ///Praças
        3  : Result := funcLocal.Busca_Registro(cdsPesqTipo,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                                 ///Tipos de Doc.
        4  : Result := funcLocal.Busca_Registro(cdsPesqContaPagar,'CPAG_PROVENIENTE','CPAG_ID;CPAG_PROVENIENTE',strFiltro);                               ///Contas a Pagar
        5  : Result := funcLocal.Busca_Registro(cdsPesqContaReceber,'CREC_PROVENIENTE','CREC_ID;CREC_PROVENIENTE',strFiltro);                             ///Contas a Receber
        6  : Result := funcLocal.Busca_Registro(cdsPesqPlanoContas,'PLCT_DESCRICAO','PLCT_ID;PLCT_DESCRICAO;PLCT_COD_SIMPLIFICADO;PLCT_TIPO',strFiltro);  ///Plano de Contas
        7  : Result := funcLocal.Busca_Registro(cdsPesqPlanoContasGeral,'PLCT_DESCRICAO','PLCT_ID;PLCT_DESCRICAO;PLCT_COD_SIMPLIFICADO',strFiltro);       ///Plano de Contas Geral
        8  : Result := funcLocal.Busca_Registro(cdsPesqContaBancaria,'GENE_DESCR','CBCO_ID;GENE_DESCR;CBCO_SALDO_ATUAL;CBCO_LIMITE',strFiltro);           ///Contas Bancaria
        9  : Result := funcLocal.Busca_Registro(cdsPesqPrc,'TPRC_DESCRICAO','TPRC_ID;TPRC_DESCRICAO',strFiltro);                                          ///Tabela de Preço
        10 : Result := funcLocal.Busca_Registro(cdsPesqEquipamento,'','PROD_ID;PROD_DESCRICAO',strFiltro);                                                ///Equipamentos (O.S.)
        11 : Result := funcLocal.Busca_Registro(cdsPesqTecnico,'','USER_ID;USER_NOME_COMPLETO',strFiltro);                                                ///Tecnicos (O.S)
        12 : Result := funcLocal.Busca_Registro(cdsPesqTipoProd,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                             ///Tipo de Produto
        13 : Result := funcLocal.Busca_Registro(cdsPesqGrupoProd,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                            ///Grupo de Produto
        14 : Result := funcLocal.Busca_Registro(cdsPesqMarcaProd,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                            ///Marca de Produto
        15 : Result := funcLocal.Busca_Registro(cdsPesqModeloProd,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                           ///Modelo de Produto
        16 : Result := funcLocal.Busca_Registro(cdsPesqProd,'PROD_DESCRICAO','PROD_ID;PROD_DESCRICAO;PROD_UNIDADE',strFiltro);                            ///Produtos
        17 : Result := funcLocal.Busca_Registro(cdsPesqNotaFiscal,'NFEN_ID','NFEN_ID;FORN_NOME_FANTASIA',strFiltro);                                      ///Notas Fiscais
        18 : Result := funcLocal.Busca_Registro(cdsPesqSaida,'SAAV_ID','SAAV_ID;ENAV_NR_DOCUMENTO',strFiltro);                                            ///Saida Avulsa
        19 : Result := funcLocal.Busca_Registro(cdsPesqEntrada,'ENAV_ID','ENAV_ID;ENAV_NR_DOCUMENTO',strFiltro);                                          ///Entrada Avulsa
        20 : Result := funcLocal.Busca_Registro(cdsPesqSaidaAvaria,'SAIV_ID','SIAV_ID;SIAV_NR_DOCUMENTO',strFiltro);                                      ///Saída Avaria
        21 : Result := funcLocal.Busca_Registro(cdsPesqTipoOS,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                               ///Tipos O.S.
        22 : Result := funcLocal.Busca_Registro(cdsPesqUsuario,'','USER_ID;USER_NOME_COMPLETO',strFiltro);                                                ///Usuario
        23 : Result := funcLocal.Busca_Registro(cdsPesqVendedor,'','USER_ID;USER_NOME_COMPLETO',strFiltro);                                               ///Vendedor
        24 : Result := funcLocal.Busca_Registro(cdsPesqRegiao,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1',strFiltro);                                     ///Região
        25 : Result := funcLocal.Busca_Registro(cdsPesqRota,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_NUMERIC1;GENE_GENE_ID_PROD',strFiltro);                 ///Rota
        26 : Result := funcLocal.Busca_Registro(cdsPesqGrupoCliente,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                         ///Grupo Cliente
        27 : Result := funcLocal.Busca_Registro(cdsPesqTipoMov,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR2;GENE_PAR1',strFiltro);                          ///Movimentação Bancaria
        28 : Result := funcLocal.Busca_Registro(cdsStatusAtendimento,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_NUMBER1',strFiltro);                           ///Status Atendimento
        29 : Result := funcLocal.Busca_Registro(cdsStatusOS,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                                 ///Status OS
        30 : Result := funcLocal.Busca_Registro(cdsPesq_Bancos,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1',strFiltro);                                    ///Bancos
        31 : Result := funcLocal.Busca_Registro(cdsPesqPatrimonio,'PATR_DESCRICAO','PATR_ID;PATR_DESCRICAO',strFiltro);                                   ///Patrimonio
        32 : Result := funcLocal.Busca_Registro(cdsTipoAgendamento,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                          ///Tipo Agendamento
        33 : Result := funcLocal.Busca_Registro(cdsPedidoOrcamento,'CLIE_FANTASIA','PEDV_ID;CLIE_FANTASIA;PEDV_DTA_CADASTRO',strFiltro);                  ///Pedido/Orçamento
        34 : Result := funcLocal.Busca_Registro(cdsPesqUnidade,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1',strFiltro);                                    ///Unidade de Medida
        35 : Result := funcLocal.Busca_Registro(cdsPesqFiltro,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                               ///Filtro
        36 : Result := funcLocal.Busca_Registro(cdsPesqBandeira,'GENE_DESCR','GENE_ID;GENE_DESCR',strFiltro);                                             ///Bandeira Cartão
        37 : Result := funcLocal.Busca_Registro(cdsAgendamentos,'CLIE_FANTASIA','AGEN_ID;CLIE_FANTASIA;AGEN_DATA;AGEN_HORA',strFiltro);                   ///Agendamentos
      end;
    except
      Result := '';
    end;
  end;
end;

procedure TfrPesqIndividual.setCdsLocal(const Value: TClientDataSet);
begin
  cdsPrLocal := Value;
end;

procedure TfrPesqIndividual.setField1(const Value: String);
begin
  strField1 := Value;
end;

procedure TfrPesqIndividual.setField2(const Value: String);
begin
  strField2 := Value;
end;

procedure TfrPesqIndividual.setField3(const Value: String);
begin
  strField3 := Value;
end;

procedure TfrPesqIndividual.setField4(const Value: String);
begin
  strField4 := Value;
end;

procedure TfrPesqIndividual.SetFocus;
begin
  try
    edtCodigo.SetFocus;
    edtCodigo.SelectAll;
  except
  end;
end;

procedure TfrPesqIndividual.setHabilita(const Value: Boolean);
var
  intI : Integer;
begin
  for intI := 0 to Self.ComponentCount-1 do begin
    (Components[intI] as TControl).Enabled := Value;
  end;
  FHabilita := Value;
end;

function TfrPesqIndividual.TemRegistro() : Boolean;
begin
  Result := funcLocal.TemRegistros(edtCodigo,edtDescricao);
end;

function TfrPesqIndividual.InGrid() : String;
begin
  Result := funcLocal.InGrid(edtCodigo,ckOmitir,ckPlanoContas);
end;

procedure TfrPesqIndividual.Limpar;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  edtOpcao.Clear;
  edtOpcao1.Clear;
  ckOmitir.Checked := false;
end;

procedure TfrPesqIndividual.edtCodigoExit(Sender: TObject);
var
  strTMP : String;
  formPric : TForm;
begin
  if funcLocal = nil then begin
    formPric := Application.MainForm;
    funcLocal := TFuncoes(formPric.FindComponent('funcPrincipal'));
  end;
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
      37 : strTMP := Pesquisa('AGEN_ID = '      + edtCodigo.Text); ///Agendamentos
      else strTMP := Pesquisa('GENE_ID = '      + edtCodigo.Text); ///  02 - Praça                  ///  03 - Tipo de Documento
                                                                   ///  12 - Tipo Produto           ///  13 - Grupo Produto
                                                                   ///  14 - Marca Produto          ///  15 - Modelo Produto
                                                                   ///  21 - Tipo O.S.              ///  24 - Região
                                                                   ///  25 - Rota                   ///  26 - Grupo Cliente
                                                                   ///  27 - Movimentação Bancaria  ///  28 - Status Atendimento
                                                                   ///  29 - Status OS              ///  30 - Bancos
                                                                   ///  32 - Tipo Agendamento       ///  34 - Unidade de Medida
                                                                   ///  35 - Filtro OS              ///  36 - Bandeira Cartão
    end;

    if strTMP <> '' then begin
      edtCodigo.Text    := funcLocal.Buscar_Coluna(strTMP,1);
      edtDescricao.Text := funcLocal.Buscar_Coluna(strTMP,2);
      edtOpcao.Text     := funcLocal.Buscar_Coluna(strTMP,3);
      edtOpcao1.Text    := funcLocal.Buscar_Coluna(strTMP,4);
      if cdsLocal <> nil then begin
        cdsPrLocal.FieldByName(cdsField1).AsString    := funcLocal.Buscar_Coluna(strTMP,1);
        if Trim(cdsField2) <> '' then
          cdsPrLocal.FieldByName(cdsField2).AsString  := funcLocal.Buscar_Coluna(strTMP,2);
        if Trim(cdsField3) <> '' then
          cdsPrLocal.FieldByName(cdsField3).AsString  := funcLocal.Buscar_Coluna(strTMP,3);
        if Trim(cdsField4) <> '' then
          cdsPrLocal.FieldByName(cdsField4).AsString  := funcLocal.Buscar_Coluna(strTMP,4);
      end;
    end else begin
      edtCodigo.Clear;
      edtDescricao.Clear;
      edtOpcao.Clear;
      edtOpcao1.Clear;
      if cdsLocal <> nil then begin
        cdsPrLocal.FieldByName(cdsField1).AsString    := '';
        if Trim(cdsField2) <> '' then
          cdsPrLocal.FieldByName(cdsField2).AsString  := '';
        if Trim(cdsField3) <> '' then
          cdsPrLocal.FieldByName(cdsField3).AsString  := '';
        if Trim(cdsField4) <> '' then
          cdsPrLocal.FieldByName(cdsField4).AsString  := '';
      end;
    end;
  end else begin
    edtCodigo.Clear;
    edtDescricao.Clear;
    edtOpcao.Clear;
    edtOpcao1.Clear;
    if cdsLocal <> nil then begin
      cdsPrLocal.FieldByName(cdsField1).AsString    := '';
      if Trim(cdsField2) <> '' then
        cdsPrLocal.FieldByName(cdsField2).AsString  := '';
      if Trim(cdsField3) <> '' then
        cdsPrLocal.FieldByName(cdsField3).AsString  := '';
      if Trim(cdsField4) <> '' then
        cdsPrLocal.FieldByName(cdsField4).AsString  := '';
    end;
  end;
end;

procedure TfrPesqIndividual.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Shift = [ssAlt]) and (key = 40)) or (key = VK_F5) then begin
    btnPesquisar.Click;
  end;
  if (Shift = [ssAlt]) and (key = 45) then begin
    btnInserir.Click;
  end;
end;

procedure TfrPesqIndividual.edtCodigoKeyPress(Sender: TObject; var Key: Char);
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
        btnPesquisar.Click;
      end else Key := #0;
    except
    end;
  end;
end;

function TfrPesqIndividual.getCdsLocal: TClientDataSet;
begin
  Result := cdsPrLocal;
end;

function TfrPesqIndividual.getField1: String;
begin
  Result := strField1;
end;

function TfrPesqIndividual.getField2: String;
begin
  Result := strField2;
end;

function TfrPesqIndividual.getField3: String;
begin
  Result := strField3
end;

function TfrPesqIndividual.getField4: String;
begin
  Result := strField4;
end;

function TfrPesqIndividual.getHabilita: Boolean;
begin
  Result := FHabilita;
end;

function TfrPesqIndividual.getValue: Integer;
begin
  Result := StrToIntDef(edtCodigo.Text,0);
end;

end.
