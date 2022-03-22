{*******************************************************************************

Descrição:  Componente Funcoes, destinado a execução de metodos a serem
            utilizados internamente pelo sistema ou em varios modulos do sistema,
            o componente armazena também valores padrão como usuário logado e
            empresa logada.
Data:
Autor:      Alex Itamar Gomes

*******************************************************************************}
unit Funcoes;

interface

uses
  System.Classes, Vcl.Forms, Data.SqlExpr, RxCurrEdit, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.ExtCtrls, Winapi.Windows, WinInet, UrlMon;

const
  FORMAT_DATE     = 'dd/mm/yyyy';
  FORMAT_DATETIME = 'dd/mm/yyyy hh:mm';
  CURRENT_FLOAT   = '###,###,##0.00';
  intFHeight      =  -10;
  intFWidth       =   -1;
  intFLeft        =    2;
  intFTop         =   22;
  OffsetMemoryStream : Int64 = 0;

type
  TFuncoes = class(TComponent)
  private
    FcontConexao            : TSQLConnection;
    FPermissoes             : array[1..99999] of Integer;
    FcontEmpr_ID            : Integer;
    FcontUser_ID            : Integer;
    FcontRazao              : String;
    FcontFantasia           : String;
    FcontEndereco           : String;
    FcontBairro             : String;
    FcontCidade             : String;
    FcontUF                 : String;
    FcontCEP                : String;
    FcontCNPJ               : String;
    FcontIE                 : String;
    FcontTelefone           : String;
    FcontFax                : String;
    FcontLogin              : String;
    FJanelaAtiva            : String;
    FJanelasFechar          : String;
    FHandleJanelas          : TStringList;
    FJanelas                : TStringList;
    formMsg                 : TForm;
    formMsgErro             : TForm;
    Transact                : TTransactionDesc;
    intWinTop               : Integer;
    FLicenca                : Array[1..15] of Integer;
    FReportaError           : Boolean;
    FVisualFinanc           : Boolean;
    FJuro                   : Real;
    FMora                   : Real;
    FPercentRenda           : Real;
    FEstoqueNegativo        : Boolean;
    FVersionSystem          : Integer;
    FTabPrecoPadrao         : Integer;
    FClientePadrao          : Integer;
    FReagendaOS             : Boolean;
    FForcaReagendaOS        : Boolean;
    FPeriodoReagendamento   : Integer;
    FMensagemRodapeOS       : Integer;
    FIntegraProdutos        : Boolean;
    FIntegraClientes        : Boolean;
    FValorMetaAno           : Real;
    FControlaLimite         : Boolean;
    FTipoMenu               : Integer;
    FTipoEmpresa            : Integer;
    FOptanteSimples         : Boolean;
    FEmpresaMatriz          : Boolean;
    FAliquotaPIS            : Real;
    FAliquotaCOFINS         : Real;
    FPrivado                : Boolean;
    FFree                   : Boolean;
    FSemAnuncio             : Boolean;
    FSepararTeleAtendimento : Boolean;
    FAbreOS                 : Boolean;
    FCodEquip               : Integer;
    FCodCliente             : Integer;
    FCodUserIDTecOS         : Integer;
    FTrabTipoAgendamento    : Boolean;
    FNovoPadraoTelefone     : Boolean;
    FTrabStatusOS           : Boolean;
    FInformeFornecEquip     : Boolean;
    FTrabNrPedido           : Boolean;
    FFiltrarPlanoContasPAI  : Boolean;
    FChamaAzul              : Boolean;
    FVinculaCartaoCredito   : Boolean;
    FSolicitaNrTransCartao  : Boolean;

    {Expecificação de monenclaturas para a Ordem de Serviço}
    ///Form Principal
    FCod_Equip,
    FEquipamento,
    FUnidade,
    FMarca,
    FModelo,
    FGarantia,
    FNrPedido,
    FCod_Fornecedor,
    FFornecedor,
    FCod_Tecnico,
    FTecnico,
    FDt_Cadastro,
    FDt_Instalacao,
    FDt_Entrega,
    ///Form Ordem de Servico
    FGrupo_Equipamento,
    FGrupo_Pecas_Servicos,
    ///Form Cadastro Ordem de Serviço
    FDt_Agendamento : String;
    FShearch: String;
    FAplicFundoReservaRecLiq: Boolean;
    FPercFundoReserva: Real;
    FAplicFDERecLiq: Boolean;
    FPercReservaLucro: Real;
    FPercReservaEstatutarias: Real;
    FPercReservaLegal: Real;
    FReplicClienteFornecedor: Boolean;
    FHr_Inicio: String;
    FHr_Termino: String;
    FHr_Intervalo : String;
    FHr_Almoco_Fim: String;
    FOcultarClientes: Boolean;
    FHr_Almoco_Inicio: String;
    FDiasDepositoCredito: Integer;
    FTaxaDebito: Real;
    FDiasDepositoDebito: Integer;
    FTaxaCredito: Real;
    FEmiteReciboPagtoParc: Boolean;
    FContaBcoCredito: Integer;
    FContaBcoDebito: Integer;
    FqryConsulta: TSQLQuery;
    FFornecCartaoCred: Integer;
    FFornecCartaoDeb: Integer;
    FBackupDomingo : Boolean;
    FBackupSegunda : Boolean;
    FBackupTerca   : Boolean;
    FBackupQuarta  : Boolean;
    FBackupQuinta  : Boolean;
    FBackupSexta   : Boolean;
    FBackupSabado  : Boolean;
    FBackupHora2: String;
    FBackupHora3: String;
    FBackupHora1: String;
    FLimitadoListaDeProf: Boolean;
    FLimitarProfNoSistema: Boolean;

    procedure RegistraMovimentoEstoque(intTipo: Integer; strPROD_ID, strEstq_ID : String;
                floatQtde: Real; strGene_ID : String);
    function  RetornaUsuario(fltVenda, fltGondola, fltMinimo, fltEspecial, fltAtacado : Real;
      intPer1, intPer2, intPer3 : Integer) : Boolean;
    procedure MovimentaComposicao(intTipo: Integer; strPROD_ID,
      strEstq_ID: String; floatQtde: Real; strGene_ID: String); overload;
    function  MovimentaComposicao(strProd_ID : String; floatQtde : Real;
      intTipo : Integer = 1) : Boolean; overload;
    function  ProdMovimentaEstoque(out boolMovEstq: Boolean; strProd_ID : String): Boolean;
    function  GetClientePadrao: Integer;
    function  GetEstoqueNegativo: Boolean;
    function  GetForcaReagendaOS: Boolean;
    function  GetPeriodoReagendamento : Integer;
    function  GetMensagemRodapeOS : Integer;
    function  GetJuro: Real;
    function  GetMora: Real;
    function  GetPercentRenda: Real;
    function  GetReagendaOS: Boolean;
    function  GetReportarError: Boolean;
    function  GetTabPrecoPadrao: Integer;
    function  GetVersionSystem: Integer;
    function  GetVisualFinanc: Boolean;
    function  getIntegraClientes: Boolean;
    function  getIntegraProdutos: Boolean;
    function  getTipoMenu: Integer;
    function  getAliquotaCofins: Real;
    function  getAliquotaPIS: Real;
    function  getEmpresaMatriz: Boolean;
    function  getOptanteSimples: Boolean;
    function  getTipoEmpresa: Integer;
    function  getControlaLimite: Boolean;
    function  getValorMetaAno: Real;
    function  getPrivado: Boolean;
    function  getFree : Boolean;
    function  getSepararTeleAtendimento : Boolean;
    procedure setIntegraClientes(const Value: Boolean);
    procedure setIntegraProdutos(const Value: Boolean);
    procedure setTipoMenu(const Value : Integer);
    procedure setTipoEmpresa(const Value : Integer);
    procedure setOptanteSimples(const Value : Boolean);
    procedure setEmpresaMatriz(const Value : Boolean);
    procedure setAliquotaPIS(const Value : Real);
    procedure setAliquotaCOFINS(const Value : Real);
    procedure setSepararTeleAtendimento(const Value : Boolean);
    procedure setPrivado(const Value : Boolean);
    procedure setFree(const Value : Boolean);

    {Ordem de Serviço}
    function  getCod_Equip: String;
    function  getCod_Fornecedor: String;
    function  getCod_Tecnico: String;
    function  getDt_Agendamento: String;
    function  getDt_Cadastro: String;
    function  getDt_Entrega: String;
    function  getDt_Instalacao: String;
    function  getEquipamento: String;
    function  getFornecedor: String;
    function  getGarantia: String;
    function  getGrupo_Equipamento: String;
    function  getGrupo_Pecas_Servicos: String;
    function  getMarca: String;
    function  getModelo: String;
    function  getNrPedido: String;
    function  getTecnico: String;
    function  getUnidade: String;
    {End Ordem de Serviço}
    procedure setReportaErro(Value : Integer);
    procedure setVisualFinanc(Value : Integer);
    procedure setJuro(Value : Real);
    procedure setMora(Value : Real);
    procedure setPercentRenda(Value : Real);
    procedure setEstoqueNegativo(Value : Integer);
    procedure setVersionSystem(Value : Integer);
    procedure setTabPrecoPadrao(Value : Integer);
    procedure setClientePadrao(Value : Integer);
    procedure setReagendaOS(Value : Integer);
    procedure setForcaReagenda(Value : Integer);
    procedure setVlrMetaAno(Value : Real);
    procedure setControlaLimite(Value : Boolean);
    {Ordem de Serviço}
    procedure setCod_Equip(const Value: String);
    procedure setCod_Fornecedor(const Value: String);
    procedure setCod_Tecnico(const Value: String);
    procedure setDt_Agendamento(const Value: String);
    procedure setDt_Cadastro(const Value: String);
    procedure setDt_Entrega(const Value: String);
    procedure setDt_Instalacao(const Value: String);
    procedure setEquipamento(const Value: String);
    procedure setFornecedor(const Value: String);
    procedure setGarantia(const Value: String);
    procedure setGrupo_Equipamento(const Value: String);
    procedure setGrupo_Pecas_Servicos(const Value: String);
    procedure setMarca(const Value: String);
    procedure setModelo(const Value: String);
    procedure setNrPedido(const Value: String);
    procedure setTecnico(const Value: String);
    procedure setUnidade(const Value: String);
    procedure setPeriodoReagendamento(const Value: Integer);
    procedure setMensagemRodapeOS(const Value : Integer);
    function  getSQLCliente: String;
    function  getSemAnuncio: Boolean;
    procedure setSemAnuncio(const Value: Boolean);
    function  getAbreOS: Boolean;
    procedure setAbreOS(const Value: Boolean);
    function  getCodCliente: Integer;
    function  getCodEquip: Integer;
    procedure setCodCliente(const Value: Integer);
    procedure setCodEquip(const Value: Integer);
    function  getCodUserIDTecOS: Integer;
    procedure setCodUserIDTecOS(const Value: Integer);
    function  getTrabTipoAgendamento: Boolean;
    procedure setTrabTipoAgendamento(const Value: Boolean);
    function  getNovoPadraoTelefone: Boolean;
    procedure setNovoPadraoTelefone(const Value: Boolean);
    function  getInformeFornecEquip: Boolean;
    function  getTrabNrPedido: Boolean;
    function  getTrabStatusOS: Boolean;
    procedure setInformeFornecEquip(const Value: Boolean);
    procedure setTrabNrPedido(const Value: Boolean);
    procedure setTrabStatusOS(const Value: Boolean);
    function  getFiltrarPlanoContasPAI: Boolean;
    procedure setFiltrarPlanoContasPAI(const Value: Boolean);
    function  getChamaAzul: Boolean;
    procedure setChamaAzul(const Value: Boolean);
    function  getVinculaCartaoCredito: Boolean;
    procedure setVinculaCartaoCredito(const Value: Boolean);
    function  getAplicFundoReservaRecLiq: Boolean;
    function  getPercFundoReserva: Real;
    procedure setAplicFundoReservaRecLiq(const Value: Boolean);
    procedure setPercFundoReserva(const Value: Real);
    function  getAplicFDERecLiq: Boolean;
    function  getPercReservaEstatutarias: Real;
    function  getPercReservaLegal: Real;
    function  getPercReservaLucro: Real;
    procedure setAplicFDERecLiq(const Value: Boolean);
    procedure setPercReservaEstatutarias(const Value: Real);
    procedure setPercReservaLegal(const Value: Real);
    procedure setPercReservaLucro(const Value: Real);
    function  getReplicClienteFornecedor: Boolean;
    procedure setReplicClienteFornecedor(const Value: Boolean);
    function  getHr_Inicio: String;
    function  getHr_Termino: String;
    procedure setHr_Inicio(const Value: String);
    procedure setHr_Termino(const Value: String);
    function  getHr_Intervalo: String;
    procedure setHr_Intervalo(const Value: String);
    function  getHr_Almoco_Fim: String;
    function  getHr_Almoco_Inicio: String;
    function  getOcultarClientes: Boolean;
    procedure setHr_Almoco_Fim(const Value: String);
    procedure setHr_Almoco_Inicio(const Value: String);
    procedure setOcultarClientes(const Value: Boolean);
    function  getDiasDepositoCredito: Integer;
    function  getDiasDepositoDebito: Integer;
    function  getTaxaCredito: Real;
    function  getTaxaDebito: Real;
    procedure setDiasDepositoCredito(const Value: Integer);
    procedure setDiasDepositoDebito(const Value: Integer);
    procedure setTaxaCredito(const Value: Real);
    procedure setTaxaDebito(const Value: Real);
    function  getEmiteReciboPagtoParc: Boolean;
    procedure setEmiteReciboPagtoParc(const Value: Boolean);
    function  getContaBcoCredito: Integer;
    procedure setContaBcoCredito(const Value: Integer);
    function  getContaBcoDebito: Integer;
    procedure setContaBcoDebito(const Value: Integer);
    function  getFornecCartaoCred: Integer;
    function  getFornecCartaoDeb: Integer;
    procedure setFornecCartaoDeb(const Value: Integer);
    procedure setFornecCartaoCred(const Value: Integer);
    function  getSolicitaNrTransCartao: Boolean;
    procedure setSolicitaNrTransCartao(const Value: Boolean);
    function getBackupDomingo: Boolean;
    function getBackupQuarta: Boolean;
    function getBackupQuinta: Boolean;
    function getBackupSabado: Boolean;
    function getBackupSegunda: Boolean;
    function getBackupSexta: Boolean;
    function getBackupTerca: Boolean;
    procedure setBackupDomingo(const Value: Boolean);
    procedure setBackupQuarta(const Value: Boolean);
    procedure setBackupQuinta(const Value: Boolean);
    procedure setBackupSabado(const Value: Boolean);
    procedure setBackupSegunda(const Value: Boolean);
    procedure setBackupSexta(const Value: Boolean);
    procedure setBackupTerca(const Value: Boolean);
    function getBackupHora1: String;
    function getBackupHora2: String;
    function getBackupHora3: String;
    procedure setBackupHora1(const Value: String);
    procedure setBackupHora2(const Value: String);
    procedure setBackupHora3(const Value: String);
    function getLimitadoListaDeProf: Boolean;
    procedure setLimitadoListaDeProf(const Value: Boolean);
    function getLimitarProfNoSistema: Boolean;
    procedure setLimitarProfNoSistema(const Value: Boolean);

    {End Ordem de Serviço}
  protected
    procedure DeleteIECache;
    procedure SetLicenca(intPos, intValue : Integer);
    procedure SetPermissao(intUSRM_ID : Integer);
    procedure ConfiguracoesSystem(strEmpr_ID : String = '');
    function  TableNoPermision(strTable, strRelacaoTabela: String) : Boolean;
    function  Contar_Colunas(Texto: String; strPos : String = ';') : Integer;
    function  RetornaForm(strForm: String): TForm;
    function  FormAberto(strForm: String): Boolean;
    function  GetTempDirectory: String;
    function  GetPermissao(intUSRM_ID : Integer) : Boolean;
  public
    ///Variavéis Globais;
    qryConsSQL : TSQLQuery;

    ///CONSTRUCAO
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;

    ///PROCEDIMENTOS
    procedure InicializationSystem(strEmpr_ID : String = '');
    procedure ReportaErro(strCaption, strComponente : String; strErro : String = ''; strUsuario : String = '');
    procedure MSGAguarde(boolAguarde     : Boolean = true; strTexto : String = '');
    procedure MSGAguardeErro(boolAguarde : Boolean = true; strTexto : String = '');
    procedure MSGUpdate(boolAguarde      : Boolean = true; strTexto : String = '');
    procedure DescarregarPacote(frmClass           : String);
    procedure PrintLabel(Sender              : TObject);
    procedure UnPrintLabel(Sender            : TObject);
    function LancamentoLivroCaixa(strPLCT_ID,
                                   strTP_Mov,
                                   strCamp1,
                                   strCamp2,
                                   strCamp3,
                                   strEmpr_ID_Orig,
                                   strTgen_ID_Orig,
                                   strGene_ID_Orig : String;
                                   floatValor      : Real) : String;
    procedure ExecutaRotina(intRotina : Integer);
    procedure RegistraMovBancario(strCBCO_ID : String; floatValor : Real);
    procedure RegistraMovConta(strCBCO_ID, strGENE_ID, strGene_Orig, strID_ORIG : String; floatValor : Real);
    procedure MovimentaEstoque(strPROD_ID : String; floatQtde : Real = 0;
                intTipo : Integer = 1; strGene_ID : String = '1');
    function RegistraContasPagar(strNrDoc,
                                  strProveniente,
                                  strFORN_ID,
                                  strPLCT_ID,
                                  strTP_DOC   : String;
                                  dtDtEmissao,
                                  dtDtVcto    : TDateTime;
                                  floatVlrDoc : Real = 0;
                                  floatJuro   : Real = 0;
                                  floatMora   : Real = 0;
                                  strNFAC_ID  : String = 'Null';
                                  strNFEN_ID  : String = 'Null';
                                  strViaBanco : String = 'Null';
                                  strCBCO_ID  : String = 'Null';
                                  strCodOrigem : String  = 'Null';
                                  strOrigem    : String  = 'O') : String;
    function RegistraContasReceber(strNr_Doc,
                                    strProveniente,
                                    strClie_ID,
                                    strPLCT_ID,
                                    strTipoDoc   : String;
                                    dtDtEmissao,
                                    dtDtVcto     : TDateTime;
                                    fltValor_Doc : Real    = 0;
                                    fltJuro      : Real    = 0;
                                    fltMora      : Real    = 0;
                                    fltPago      : Real    = 0;
                                    strStatus    : String  = 'A';
                                    strObs       : String  = 'Null';
                                    strViaBanco  : String  = 'Null';
                                    strCBCO_ID   : String  = 'Null';
                                    strODAC_ID   : String  = 'Null';
                                    strCodOrigem : String  = 'Null';
                                    strOrigem    : String  = 'O') : String;
    function RegistraAcerto(sOrigem       : String;
                             IdOrigem,
                             IdClieForn    : Integer;
                             sEmprClieForn : String;
                             IdTpDoc       : Integer;
                             dtVcto        : TDate;
                             VlrDoc        : Real) : String;
    procedure EstornaAcertos(Codigo, sOrigem: String);
    procedure PermissoesSystem(strIDEHD : String);
    procedure CarregaPermissoesUsuario;
    procedure CarregaInfoOrdemServico(strEmpr_ID : String = '');
    procedure ValorPlanejado(strPLCT_ID: String; out edtVlrPlanejado, edtVlrComprometido : TRxCalcEdit; dtData : TDate);
    procedure CarregaDadosEmpresa();
    procedure BaixarContaReceberPrevisto(dtDTA_VCTO : TDateTime; fltVALOR_DOC : Real; strPLCT_ID : String; strOrigem : String = 'CP');

    ///Funcoes de Banco de Dados
    procedure InserirSQL(strTabela : String; arrayCamposInsert : Array of String; arrayValoresInsert : Array of Variant);
    procedure AtualizarSQL(strTabela          : String;
                           arrayCamposUpdate,
                           arrayChavesWhere   : Array of String;
                           arrayValoresUpdate,
                           arrayValoresWhere  : Array of Variant);
    procedure ExcluirSQL(strTabela         : String;
                         arrayChavesWhere  : Array of String;
                         arrayValoresWhere : Array of Variant);
    procedure InstrucaoSQL();
    procedure RecalcularLivroCaixa(dtTMP : TDateTime; intTipo : Integer; strPLCT_ID, strTit_ID : String);
    procedure ReplicaCadastro(cdsTMP : TClientDataSet; Tipo : String = 'F');
    procedure ExecSQL(strSQL : String);
    procedure RealizaPesquisa(strSQL : String);
    procedure RegistraAcesso(intRotina : Integer);
    ///End Banco de Dados

    ///FUNCOES
    function  StartCommit : Boolean;
    function  Commit      : Boolean;
    function  RollBack    : Boolean;
    function  DataServidor(DB: TSQLConnection = nil; boolHora: Boolean = false)       : TDateTime;
    function  ObterSequencia(strTabela, strEmpresa : String; boolObter : Boolean = true) : String; overload;
    function  ObterSequencia(strTabela : String; intEmpresa : Integer; boolObter : Boolean = true) : Integer; overload;
    function  ObterSequenciaGen(strTabela, strEmpresa : String; bool1000 : Boolean = false) : String;
    function  DeletaRegistro(Nome_Tabela, strCodigo, strRelacaoTabela : String) : Boolean;
    function  Criptografar(wStri: String): String;
    function  Criptografar2(wStri: String): String;
    function  Alerta(sStr : String; nTipo : Integer = 0; YesNo : Boolean = False) : Integer;
    function  Busca_Registro(cdsGeral: TClientDataSet; strField, strParametros,strChaveBusca : String): String;
    function  RetornaPermissao(intPermissao: Integer): Boolean;
    function  Buscar_Coluna(Texto: String; Coluna: Integer; strSep : String = ';'): String;
    function  EliminaCaracter(strTexto: String): String;
    function  TemSaldoEmConta(strCBCO_ID: String; floatValor: Real): Boolean;
    function  TemSaldoLivroCaixa(floatValor : Real) : Boolean;
    function  TemPermissao(strMenu_ID: String): Boolean;
    function  Busca_Troca(strTexto, strTextoBusca, strTextoTroca : String) : String;
    function  RetornaSaldoConta(strCBCO_ID : String) : Real;
    function  TemInternet: Boolean;
    function  MacAddress: string;
    function  ProdutoTemEstoque(strProd_ID : String = '99') : Boolean; overload;
    function  ProdutoTemEstoque(strProd_ID : String; floatQtde : Real; intTipo : Integer = 1) : Boolean; overload;
    function  Crypt(Action, Src: String; boolCrpt : Boolean = False): String;
    function  Se(boolVerdadeiro : Boolean; Verdadeiro, Falso : Variant) : Variant;
    function  GetLicenca(intPos : Integer) : Boolean;
    function  PermitePrecoVenda(strTPRC_ID, strPROD_ID : String; fltValor : Real;
                intPer1, intPer2 : Integer; intPer3 : Integer = -1) : Boolean;
    function  ProdutoVendeFracionado(strProd_ID : String) : Boolean;
    function  WinVersion: Boolean;
    function  InstructionSQL(strSQL: String; chErro : Char = 'N'; chTipo : Char = 'E') : Variant;
    function  AtualizaValorTitulos(strID, strValor : String; strOrig : Char = 'P') : Boolean;
    function  AtualizaDtaVectoTitulos(strID, strDias : String; strOrig : Char = 'P') : Boolean;
    function  AtualizarPrevisaoTitulos(strID : String; strOrig : Char = 'P') : Boolean;
    function  EServidor : Boolean;
    function  TemRegistros(lbTMP : TListBox) : Boolean; overload;
    function  TemRegistros(edtCodigo, edtDescricao : TEdit) : Boolean; overload;
    function  InGrid(lbTMP: TListBox; rdTMP: TRadioGroup; ckPlano : TCheckBox): String; overload;
    function  InGrid(edtTMP : TEdit; ckTMP : TCheckBox; ckPlano : TCheckBox) : String; overload;
    function  RetornaFilhosPlanoContas(strPLCT_ID : String; intAtivo: Integer = 0; intTipo : Integer = 3): String;
    function  SoNumeros(strTMP : String) : String;
    function  GerarFilter(cdsPesq : TClientDataSet; strTexto : String) : String;
    function  getSQLOS : String;
    function  ContaBancariaAtiva(strCBCO_ID: String): Boolean;
    function  AlteraTitulos(strCodigo, strValue : String; strTipo : Char; strConta : Char = 'P') : Boolean;
    function  Repetir(intQtde : Integer; strTexto : String) : String;
    function  Padr(strEsquerda : String; intTam : Integer; cDireita : Char = ' '; cSeMenor : String = '') : String;
    function  Padl(strDireita : String; intTam : Integer; cEsquerda : Char = ' ') : String;
    //function  DownloadArquivo(const strOrigem, strDestino : String) : Boolean;
    function  BoolToInt(boolValue : Boolean) : Integer;
    function  SaldoBancario(bMeta : Boolean = False) : Real;
    function  TrataTelefone(strFone : String) : String;
    function  EmpresasBloqueada() : Boolean;
    function  RetornaCartaoCredito(intTipoCartao : Integer = 4; fltValorCompra : Real = 0; strTipoTransacao : String = 'C') : String;
    function  TrataFloat(strValor : String) : String;
    function  TratarNome(sNome: String): String;
    function  RetiraEspaco(sNome: String): String;
    function  FechamentoVenda(fltValor: Real; strOrigem, strCodigo : String; intCliente : Integer) : Boolean;
    function  ValorPorExtenso(fltValor: Real): String;
    function  RetornaInicioSemana(dtData : TDate) : TDate;
    function  RetornaFimSemana(dtData : TDate) : TDate;
    function  BuscarAtendente(strNome : String) : Integer;
    function  BuscarEmprBCO(CBCO_ID : String) : Integer;
    function  RetornaListadeProfissionaisBloqueados: String;
    function  RegistraAuditoria(sRotina, sCampo, sValorAnt, sValorAtual : String) : Boolean;

  published
    property  Conexao                 : TSQLConnection            read FcontConexao                 write FcontConexao;
    property  Empr_ID                 : Integer                   read FcontEmpr_ID                 write FcontEmpr_ID;
    property  User_ID                 : Integer                   read FcontUser_ID                 write FcontUser_ID;
    property  Empr_Razao              : String                    read FcontRazao                   write FcontRazao;
    property  Empr_Fantasia           : String                    read FcontFantasia                write FcontFantasia;
    property  Empr_Endereco           : String                    read FcontEndereco                write FcontEndereco;
    property  Empr_Bairro             : String                    read FcontBairro                  write FcontBairro;
    property  Empr_Cidade             : String                    read FcontCidade                  write FcontCidade;
    property  Empr_UF                 : String                    read FcontUF                      write FcontUF;
    property  Empr_CEP                : String                    read FcontCEP                     write FcontCEP;
    property  Empr_CNPJ               : String                    read FcontCNPJ                    write FcontCNPJ;
    property  Empr_IE                 : String                    read FcontIE                      write FcontIE;
    property  Empr_Telefone           : String                    read FcontTelefone                write FcontTelefone;
    property  Empr_Fax                : String                    read FcontFax                     write FcontFax;
    property  User_Login              : String                    read FcontLogin                   write FcontLogin;
    property  JanelaAtiva             : String                    read FJanelaAtiva                 write FJanelaAtiva;
    property  JanelasFechar           : String                    read FJanelasFechar               write FJanelasFechar;
    property  Janelas                 : TStringList               read FJanelas                     write FJanelas;
    property  HandleJanelas           : TStringList               read FHandleJanelas               write FHandleJanelas;
    property  WinTop                  : Integer                   read intWinTop                    write intWinTop;
    property  ReportaError            : Boolean                   read GetReportarError;
    property  VisualFinanc            : Boolean                   read GetVisualFinanc;
    property  Juro                    : Real                      read GetJuro;
    property  Mora                    : Real                      read GetMora;
    property  PercentRenda            : Real                      read GetPercentRenda;
    property  EstoqueNegativo         : Boolean                   read GetEstoqueNegativo;
    property  VersionSystem           : Integer                   read GetVersionSystem             write setVersionSystem;
    property  TabPrecoPadrao          : Integer                   read GetTabPrecoPadrao;
    property  ClientePadrao           : Integer                   read GetClientePadrao;
    property  ReagendaOS              : Boolean                   read GetReagendaOS;
    property  ForcaReagendaOS         : Boolean                   read GetForcaReagendaOS;
    property  PeriodoReagendamento    : Integer                   read GetPeriodoReagendamento      write setPeriodoReagendamento;
    property  MensagemRodapeOS        : Integer                   read GetMensagemRodapeOS          write setMensagemRodapeOS;
    property  Cod_Equip               : String                    read getCod_Equip                 write setCod_Equip;
    property  Equipamento             : String                    read getEquipamento               write setEquipamento;
    property  Unidade                 : String                    read getUnidade                   write setUnidade;
    property  Marca                   : String                    read getMarca                     write setMarca;
    property  Modelo                  : String                    read getModelo                    write setModelo;
    property  Garantia                : String                    read getGarantia                  write setGarantia;
    property  NrPedido                : String                    read getNrPedido                  write setNrPedido;
    property  Cod_Fornecedor          : String                    read getCod_Fornecedor            write setCod_Fornecedor;
    property  Fornecedor              : String                    read getFornecedor                write setFornecedor;
    property  Cod_Tecnico             : String                    read getCod_Tecnico               write setCod_Tecnico;
    property  Tecnico                 : String                    read getTecnico                   write setTecnico;
    property  Dt_Cadastro             : String                    read getDt_Cadastro               write setDt_Cadastro;
    property  Dt_Instalacao           : String                    read getDt_Instalacao             write setDt_Instalacao;
    property  Dt_Entrega              : String                    read getDt_Entrega                write setDt_Entrega;
    property  Grupo_Equipamento       : String                    read getGrupo_Equipamento         write setGrupo_Equipamento;
    property  Grupo_Pecas_Servicos    : String                    read getGrupo_Pecas_Servicos      write setGrupo_Pecas_Servicos;
    property  Dt_Agendamento          : String                    read getDt_Agendamento            write setDt_Agendamento;
    property  IntegraProdutos         : Boolean                   read getIntegraProdutos           write setIntegraProdutos;
    property  IntegraClientes         : Boolean                   read getIntegraClientes           write setIntegraClientes;
    property  TipoMenu                : Integer                   read getTipoMenu;
    property  TipoEmpresa             : Integer                   read getTipoEmpresa;
    property  OptanteSimples          : Boolean                   read getOptanteSimples;
    property  EmpresaMatriz           : Boolean                   read getEmpresaMatriz;
    property  AliquotaPIS             : Real                      read getAliquotaPIS;
    property  AliquotaCofins          : Real                      read getAliquotaCofins;
    property  ValorMetaAno            : Real                      read getValorMetaAno;
    property  ControlaLimiteCredito   : Boolean                   read getControlaLimite;
    property  Privado                 : Boolean                   read getPrivado;
    property  UserFree                : Boolean                   read getFree default false;
    property  SemAnuncio              : Boolean                   read getSemAnuncio                write setSemAnuncio;
    property  SepararTeleAtendimento  : Boolean                   read getSepararTeleAtendimento    write setSepararTeleAtendimento;
    ///Instruções SQL
    property  InstrucaoSQLOS          : String                    read GetSQLOS;
    property  InstrucaoSQLCliente     : String                    read GetSQLCliente;
    property  AbreOS                  : Boolean                   read getAbreOS                    write setAbreOS;
    property  CodEquip                : Integer                   read getCodEquip                  write setCodEquip;
    property  CodCliente              : Integer                   read getCodCliente                write setCodCliente;
    property  UserIDTecOS             : Integer                   read getCodUserIDTecOS            write setCodUserIDTecOS;
    property  TrabTipoAgendamento     : Boolean                   read getTrabTipoAgendamento       write setTrabTipoAgendamento;
    property  NovoPadraoTelefone      : Boolean                   read getNovoPadraoTelefone        write setNovoPadraoTelefone;
    property  TrabNrPedido            : Boolean                   read getTrabNrPedido              write setTrabNrPedido default false;
    property  InformeFornecEquip      : Boolean                   read getInformeFornecEquip        write setInformeFornecEquip default false;
    property  TrabStatusOS            : Boolean                   read getTrabStatusOS              write setTrabStatusOS default false;
    property  FiltrarPlanoContasPAI   : Boolean                   read getFiltrarPlanoContasPAI     write setFiltrarPlanoContasPAI default false;
    property  ChamaAzul               : Boolean                   read getChamaAzul                 write setChamaAzul default false;
    property  VinculaCartaoCredito    : Boolean                   read getVinculaCartaoCredito      write setVinculaCartaoCredito default false;
    property  VlrPesq                 : String                    read FShearch                     write FShearch;
    property  PercFundoReserva        : Real                      read getPercFundoReserva          write setPercFundoReserva;
    property  AplicFundoReservaRecLiq : Boolean                   read getAplicFundoReservaRecLiq   write setAplicFundoReservaRecLiq default false;
    property  PercReservaLucro        : Real                      read getPercReservaLucro          write setPercReservaLucro;
    property  PercReservaLegal        : Real                      read getPercReservaLegal          write setPercReservaLegal;
    property  PercReservaEstatutarias : Real                      read getPercReservaEstatutarias   write setPercReservaEstatutarias;
    property  AplicFDERecLiq          : Boolean                   read getAplicFDERecLiq            write setAplicFDERecLiq default false;
    property  ReplicClienteFornecedor : Boolean                   read getReplicClienteFornecedor   write setReplicClienteFornecedor default false;
    property  Hr_Inicio               : String                    read getHr_Inicio                 write setHr_Inicio;
    property  Hr_Termino              : String                    read getHr_Termino                write setHr_Termino;
    property  Hr_Intervalo            : String                    read getHr_Intervalo              write setHr_Intervalo;
    property  Hr_Almoco_Inicio        : String                    read getHr_Almoco_Inicio          write setHr_Almoco_Inicio;
    property  Hr_Almoco_Fim           : String                    read getHr_Almoco_Fim             write setHr_Almoco_Fim;
    property  OcultaClientes          : Boolean                   read getOcultarClientes           write setOcultarClientes default false;
    property  TaxaCredito             : Real                      read getTaxaCredito               write setTaxaCredito;
    property  TaxaDebito              : Real                      read getTaxaDebito                write setTaxaDebito;
    property  DiasDepositoCredito     : Integer                   read getDiasDepositoCredito       write setDiasDepositoCredito;
    property  DiasDepositoDebito      : Integer                   read getDiasDepositoDebito        write setDiasDepositoDebito;
    property  EmiteReciboPagtoParc    : Boolean                   read getEmiteReciboPagtoParc      write setEmiteReciboPagtoParc default false;
    property  ContaBcoCredito         : Integer                   read getContaBcoCredito           write setContaBcoCredito;
    property  ContaBcoDebito          : Integer                   read getContaBcoDebito            write setContaBcoDebito;
    property  qryConsulta             : TSQLQuery                 read FqryConsulta                 write FqryConsulta;
    property  FornecCartaoCred        : Integer                   read getFornecCartaoCred          write setFornecCartaoCred;
    property  FornecCartaoDeb         : Integer                   read getFornecCartaoDeb           write setFornecCartaoDeb;
    property  SolicitaNrTransCartao   : Boolean                   read getSolicitaNrTransCartao     write setSolicitaNrTransCartao default false;
    property  BackupDomingo           : Boolean                   read getBackupDomingo             write setBackupDomingo default false;
    property  BackupSegunda           : Boolean                   read getBackupSegunda             write setBackupSegunda default false;
    property  BackupTerca             : Boolean                   read getBackupTerca               write setBackupTerca   default false;
    property  BackupQuarta            : Boolean                   read getBackupQuarta              write setBackupQuarta  default false;
    property  BackupQuinta            : Boolean                   read getBackupQuinta              write setBackupQuinta  default false;
    property  BackupSexta             : Boolean                   read getBackupSexta               write setBackupSexta   default false;
    property  BackupSabado            : Boolean                   read getBackupSabado              write setBackupSabado  default false;
    property  BackupHora1             : String                    read getBackupHora1               write setBackupHora1;
    property  BackupHora2             : String                    read getBackupHora2               write setBackupHora2;
    property  BackupHora3             : String                    read getBackupHora3               write setBackupHora3;
    property  LimitadoListaDeProf     : Boolean                   read getLimitadoListaDeProf       write setLimitadoListaDeProf default false;
    property  LimitarProfNoSistema    : Boolean                   read getLimitarProfNoSistema      write setLimitarProfNoSistema default false;
  end;

var
  intTopJan : Integer;

procedure Register;

{$WARN SYMBOL_DEPRECATED OFF}

implementation

uses
  ufLoginUser, ufLocaliza, ufListCartaoCredito, ufFechamento, System.SysUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Dialogs, Data.DB;

procedure Register;
begin
  RegisterComponents('AnOnImUs.Info', [TFuncoes]);
end;

{ TFuncoes }

procedure TFuncoes.MSGAguarde(boolAguarde : Boolean = true; strTexto : String = '');
var
  formAguarde  : TForm;
  bevelAguarde : TBevel;
  lblTitulo,
  lblTituloI,
  lblTexto     : TLabel;
  mmMemo       : TMemo;
  imgTMP       : TImage;
  formPrinc    : TForm;
begin
  try
    while formMsg <> nil do begin
      Application.ProcessMessages;
      formMsg.Close;
      FreeAndNil(formMsg);
    end;
  except
  end;
  if boolAguarde then begin
    formAguarde       := TForm.Create(nil);
    formMsg           := formAguarde;
    formPrinc         := Application.MainForm;
    with formMsg do begin
      Width           := 280;
      Height          := 100;
      BorderStyle     := bsNone;
      Color           := clWindow;
      Tag             := 999;
      Position        := poScreenCenter;
      ///Bevel
      bevelAguarde    := TBevel.Create(nil);
      with bevelAguarde do begin
        Parent        := formAguarde;
        Align         := alClient;
        Shape         := bsFrame;
        Color         := clWhite;
      end;
      try
        ///Imagem
        imgTMP          := TImage.Create(nil);
        with imgTMP do begin
          Picture.Assign(TImage(formPrinc.FindComponent('img2')).Picture);
          Parent        := formAguarde;
          Top           := 15;
          Left          := 5;
          Transparent   := true;
          AutoSize      := true;
          Center        := true;
        end;
      except
      end;
      ///Label Titulo - AnOnImUs.Info
//      lblTitulo       := TLabel.Create(nil);
//      with lblTitulo do begin
//        Caption       := 'AR Sistemas';
//        Font.Size     := 12;
//        Top           := 5;
//        Left          := 60;
//        Font.Style    := [fsBold];
//        Font.Name     := 'Segoe UI';
//        Font.Color    := $000074E8;
//        Parent        := formAguarde;
//      end;
//      ///Label TituloI - Sistemas Comerciais
//      lblTituloI      := TLabel.Create(nil);
//      with lblTituloI do begin
//        Caption       := '&& Consultoria Ltda';
//        Font.Size     := 8;
//        Top           := 22;
//        Left          := 88;
//        Font.Name     := 'Segoe UI';
//        Font.Color    := $000074E8;
//        Parent        := formAguarde;
//      end;
      ///Mensagem Aguarde
      if strTexto      = '' then begin
        lblTexto      := TLabel.Create(nil);
        with lblTexto do begin
          Caption     := 'Por favor, Aguarde...';
          Font.Size   := 10;
          Top         := 70;
          Left        := 135;
          Font.Style  := [fsBold];
          Font.Name   := 'Segoe UI';
          Font.Color  := clNavy;
          Parent      := formAguarde;
        end;
      end else begin
        mmMemo        := TMemo.Create(nil);
        with mmMemo do begin
          Text        := strTexto;
          Align       := alClient;
          Alignment   := taCenter;
          BorderStyle := bsNone;
          Color       := clGradientActiveCaption;
          Font.Size   := 8;
          Font.Name   := 'Segoe UI';
          Parent      := formAguarde;
          ParentColor := true;
        end;
      end;
      Show;
      Repaint;
      Application.ProcessMessages;
    end;
  end else begin
    try
      while formMsg <> nil do begin
        Application.ProcessMessages;
        formMsg.Close;
        FreeAndNil(formMsg);
      end;
    except
    end;
  end;
end;

procedure TFuncoes.MSGAguardeErro(boolAguarde : Boolean = true; strTexto : String = '');
var
  formAguarde  : TForm;
  bevelAguarde : TBevel;
  lblTitulo,
  lblTituloI,
  lblTexto,
  lblTextoI    : TLabel;
  imgTMP       : TImage;
  formPrinc    : TForm;
begin
  try
    while formMsgErro <> nil do begin
      formMsgErro.Close;
      FreeAndNil(formMsgErro);
    end;
  except
  end;
  if boolAguarde then begin
    formAguarde       := TForm.Create(nil);
    formMsgErro       := formAguarde;
    formMsg           := formAguarde;
    formPrinc         := Application.MainForm;
    with formMsgErro do begin
      Width           := 285;
      Height          := 80;
      BorderStyle     := bsNone;
      Color           := clWindow;
      Tag             := 999;
      Position        := poScreenCenter;
      ///bevel
      bevelAguarde    := TBevel.Create(nil);
      with bevelAguarde do begin
        Parent        := formAguarde;
        Align         := alClient;
        Shape         := bsFrame;
        Color         := clWhite;
      end;
      ///Imagem
      imgTMP          := TImage.Create(nil);
      with imgTMP do begin
        Picture.Assign(TImage(formPrinc.FindComponent('img2')).Picture);
        Parent        := formAguarde;
        Top           := 15;
        Left          := 5;
        Transparent   := true;
        AutoSize      := true;
        Center        := true;
      end;
//      ///Label Titulo - AnOnImUs.Info
//      lblTitulo       := TLabel.Create(nil);
//      with lblTitulo do begin
//        Caption       := 'AR Sistemas';
//        Font.Size     := 12;
//        Top           := 5;
//        Left          := 60;
//        Font.Style    := [fsBold];
//        Font.Name     := 'Segoe UI';
//        Font.Color    := $000074E8;
//        Parent        := formAguarde;
//      end;
//      ///Label TituloI - Sistemas Comerciais
//      lblTituloI      := TLabel.Create(nil);
//      with lblTituloI do begin
//        Caption       := '&& Consultoria Ltda';
//        Font.Size     := 8;
//        Top           := 21;
//        Left          := 88;
//        Font.Name     := 'Segoe UI';
//        Font.Color    := $000074E8;
//        Parent        := formAguarde;
//      end;
//      lblTexto      := TLabel.Create(nil);
      with lblTexto do begin
        Caption     := 'Por favor aguarde...';
        Font.Size   := 10;
        Top         := 45;
        Left        := 60;
        Font.Name   := 'Segoe UI';
        Font.Color  := clNavy;
        Parent      := formAguarde;
      end;
      lblTextoI      := TLabel.Create(nil);
      with lblTextoI do begin
        Caption     := 'Reportanto erros do sistema!';
        Font.Size   := 10;
        Top         := 59;
        Left        := 60;
        Font.Name   := 'Segoe UI';
        Font.Color  := $000074E8;
        Parent      := formAguarde;
      end;
      Show;
      Repaint;
      Application.ProcessMessages;
    end;
  end else begin
    try
      while formMsgErro <> nil do begin
        formMsgErro.Close;
        FreeAndNil(formMsgErro);
      end;
    except
    end;
  end;
end;

procedure TFuncoes.MSGUpdate(boolAguarde: Boolean = true; strTexto: String = '');
var
  formAguarde  : TForm;
  bevelAguarde : TBevel;
  lblTitulo,
  lblTituloI,
  lblTexto     : TLabel;
  mmMemo       : TMemo;
  imgTMP       : TImage;
  formPrinc    : TForm;
begin
  try
    while formMsg <> nil do begin
      Application.ProcessMessages;
      formMsg.Close;
      FreeAndNil(formMsg);
    end;
  except
  end;
  if boolAguarde then begin
    formAguarde       := TForm.Create(nil);
    formMsg           := formAguarde;
    formPrinc         := Application.MainForm;
    with formMsg do begin
      Width           := 350;
      Height          := 80;
      BorderStyle     := bsNone;
      Color           := clWindow;
      Tag             := 999;
      Position        := poScreenCenter;
      ///Bevel
      bevelAguarde    := TBevel.Create(nil);
      with bevelAguarde do begin
        Parent        := formAguarde;
        Align         := alClient;
        Shape         := bsFrame;
        Color         := clWhite;
      end;
      try
        ///Imagem
        imgTMP          := TImage.Create(nil);
        with imgTMP do begin
          Picture.Assign(TImage(formPrinc.FindComponent('img2')).Picture);
          Parent        := formAguarde;
          Top           := 15;
          Left          := 5;
          Transparent   := true;
          AutoSize      := true;
          Center        := true;
        end;
      except
      end;
      ///Label Titulo - AnOnImUs.Info
//      lblTitulo       := TLabel.Create(nil);
//      with lblTitulo do begin
//        Caption       := 'AR Sistemas';
//        Font.Size     := 12;
//        Top           := 5;
//        Left          := 60;
//        Font.Style    := [fsBold];
//        Font.Name     := 'Segoe UI';
//        Font.Color    := $000074E8;
//        Parent        := formAguarde;
//      end;
//      ///Label TituloI - Sistemas Comerciais
//      lblTituloI      := TLabel.Create(nil);
//      with lblTituloI do begin
//        Caption       := '&& Consultoria Ltda';
//        Font.Size     := 8;
//        Top           := 21;
//        Left          := 88;
//        Font.Name     := 'Segoe UI';
//        Font.Color    := $000074E8;
//        Parent        := formAguarde;
//      end;
      ///Mensagem Aguarde
      if strTexto      = '' then begin
        lblTexto      := TLabel.Create(nil);
        with lblTexto do begin
          Caption     := 'Atualizando seu banco de dados! Aguarde...';
          Font.Size   := 10;
          Top         := 57;
          Left        := 60;
          Font.Style  := [fsBold];
          Font.Name   := 'Segoe UI';
          Font.Color  := clNavy;
          Parent      := formAguarde;
        end;
      end else begin
        mmMemo        := TMemo.Create(nil);
        with mmMemo do begin
          Text        := strTexto;
          Align       := alClient;
          Alignment   := taCenter;
          BorderStyle := bsNone;
          Color       := clGradientActiveCaption;
          Font.Size   := 8;
          Font.Name   := 'Segoe UI';
          Parent      := formAguarde;
          ParentColor := true;
        end;
      end;
      Show;
      Repaint;
      Application.ProcessMessages;
    end;
  end else begin
    try
      while formMsg <> nil do begin
        Application.ProcessMessages;
        formMsg.Close;
        FreeAndNil(formMsg);
      end;
    except
    end;
  end;
end;

function TFuncoes.ObterSequencia(strTabela : String; intEmpresa : Integer; boolObter : Boolean = true) : Integer;
begin
  Result := StrToInt(ObterSequencia(strTabela,IntToStr(intEmpresa),boolObter));
end;

function TFuncoes.ObterSequencia(strTabela, strEmpresa : String; boolObter : Boolean = true) : String;
label
  Volta;

{$REGION 'SalvarID'}
  procedure SalvarID(strID,strTabela,strEmpresa : String);
  var
    qryCons : TSQLQuery;
  begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          SQL.Add('SELECT');
          SQL.Add('      GENE_ID');
          SQL.Add('FROM  GERADORES');
          SQL.Add('WHERE GENE_EMPR_ID = ' + strEmpresa);
          SQL.Add('AND   GENE_TABELA  = ' + QuotedStr(strTabela));
          Open;
          if IsEmpty then begin
            SQL.Clear;
            try
              StartCommit;
            except
            end;
            sql.Add('INSERT INTO GERADORES(GENE_ID, GENE_EMPR_ID, GENE_TABELA)');
            sql.Add('VALUES(' + strID                + ','
                              + strEmpresa           + ','
                              + QuotedStr(strTabela) + ')');
            ExecSQL;
            try
              Commit;
            except
            end;
          end else begin
            SQL.Clear;
            try
              StartCommit;
            except
            end;
            sql.Add('UPDATE GERADORES');
            sql.Add('SET    GENE_ID        = ' + strID);
            SQL.Add('WHERE  GENE_EMPR_ID   = ' + strEmpresa);
            SQL.Add('AND    GENE_TABELA    = ' + QuotedStr(strTabela));
            ExecSQL;
            try
              Commit;
            except
            end;
          end;
        end;
      except
        RollBack;
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'JaEmUso'}
  function JaEmUso(strID, strTabela, strEmpresa : String) : Boolean;
  var
    qryCons : TSQLQuery;
  begin
    Result := false;
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COUNT(*)');
          sql.Add('FROM  GERADORES');
          sql.Add('WHERE GENE_ID     >= ' + strID);
          sql.Add('AND   GENE_EMPR_ID = ' + strEmpresa);
          sql.Add('AND   GENE_TABELA  = ' + QuotedStr(strTabela));
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
{$ENDREGION}

{$REGION 'RetornaIDInutilizado'}
  function RetornaIDInutilizado(strTabela, strEmpresa : String) : String;
  var
    qryCons    : TSQLQuery;
    strID,
    strEmpr_ID : String;
    intI       : Integer;
  begin
    Result   := '';
    try
      qryCons  := TSQLQuery.Create(nil);
      qryCons.SQLConnection := Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      RDB$FIELD_NAME');
          sql.Add('FROM  RDB$INDEX_SEGMENTS');
          sql.Add('WHERE RDB$INDEX_NAME IN (SELECT');
          sql.Add('                               RDB$INDEX_NAME');
          sql.Add('                         FROM  RDB$INDICES');
          sql.Add('                         WHERE RDB$RELATION_NAME IN (SELECT');
          sql.Add('                                                           RDB$RELATION_NAME');
          sql.Add('                                                     FROM  RDB$RELATION_CONSTRAINTS');
          sql.Add('                                                     WHERE RDB$RELATION_NAME       = ' + QuotedStr(strTabela));
          sql.Add('                                                     AND   RDB$CONSTRAINT_TYPE     = ' + QuotedStr('PRIMARY KEY') + ')');
          sql.Add('                         )');
          sql.Add('AND   RDB$FIELD_POSITION = 0');
          sql.Add('ORDER BY CHAR_LENGTH(RDB$FIELD_NAME)');
          Open;
          if not IsEmpty then begin
            First;
            intI    := 0;
            while not eof do begin
              inc(intI);
              if intI = 1 then begin
                strID        := Trim(qryCons.Fields[0].AsString);
              end else if intI = 2 then begin
                try
                  strEmpr_ID := Trim(qryCons.Fields[0].AsString);
                except
                end;
              end;
              Next;
            end;
          end else Exit;
          sql.Clear;
          sql.Add('SELECT COALESCE(MAX('+strID+')+1,1)');
          sql.Add('  FROM ' + strTabela);
          if (strEmpr_ID <> '') and (Copy(strEmpr_ID,6,7) = 'EMPR_ID') then begin
            sql.Add('WHERE ' + strEmpr_ID + ' = ' + strEmpresa);
          end;
          Open;
          Result := Fields[0].AsString;
        end;
      except on e: exception do
        ShowMessage(e.Message);
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'ReiniciaGenerator'}
  procedure ReiniciaGenerator(strTabela,strEmpr_ID : String);
  var
    qryCons : TSQLQuery;
  begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          try
            StartCommit;
          except
          end;
          sql.Add('UPDATE GERADORES');
          sql.Add('SET    GENE_ID      = 0');
          sql.Add('WHERE  GENE_EMPR_ID = ' + strEmpr_ID);
          sql.Add('AND    GENE_TABELA  = ' + QuotedStr(strTabela));
          ExecSQL;
          try
            Commit;
          except
          end;
        end;
      except
        RollBack;
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

var
	qCons    : TSQLQuery;
	Nome_Gen : String;
  boolGene : Boolean;
begin
  boolGene := true;
	try
    Result   := '';
		qCons    := TSQLQuery.Create(Nil);
		qCons.SQLConnection := Conexao;
		Nome_Gen := 'GEN_'+strTabela+'_'+strEmpresa;
		///Verificando se existe se o Generation já existe
		qCons.SQL.Add('SELECT *');
    qCons.SQL.Add('  FROM RDB$GENERATORS');
		qCons.SQL.Add(' WHERE RDB$SYSTEM_FLAG IS NULL');
		qCons.SQL.Add('   AND RDB$GENERATORS.RDB$GENERATOR_NAME = '+QuotedStr(Nome_Gen)+'');
		qCons.Open;
    ///Caso o Generation não exista o sistema então efetua a geração de um
		if qCons.IsEmpty then begin
			///StartCommit;
			qCons.Close;
			try
				Commit;
			except
			end;
			qCons.SQL.Clear;
			try
				StartCommit;
			except
			end;
			qCons.SQL.Add('INSERT INTO RDB$GENERATORS (RDB$GENERATOR_NAME)');
			qCons.SQL.Add('VALUES ('+QuotedStr(Nome_Gen)+')');
			qCons.ExecSQL;
			try
				Commit;
			except
			end;
 		end;
    Volta:
    try
      if boolObter then begin
        Result := RetornaIDInutilizado(strTabela,strEmpresa);
        qCons.Close;
        qCons.SQL.Clear;
        qCons.SQL.Add('SET GENERATOR '+Nome_Gen+' TO ' + Result);
        qCons.ExecSQL();
      end;
    except
    end;
    if boolObter then begin
      Exit;
    end else begin
      boolGene := false;
      Result := '';
    end;
    qCons.Close;
    qCons.SQL.Clear;
    qCons.SQL.Add('SELECT GEN_ID('+Nome_Gen+',1) FROM RDB$DATABASE');
    qCons.Open;
    Result   := qCons.Fields[0].Text;
    if Result < RetornaIDInutilizado(strTabela,strEmpresa) then begin
      boolObter := true;
      goto Volta;
    end;

    boolGene := false;
    if boolObter then begin
      ReiniciaGenerator(strTabela,strEmpresa);
    end;
	except on E : exception do
		ShowMessage(e.message)
	end;
  if boolGene then Exit;
end;

function TFuncoes.ObterSequenciaGen(strTabela, strEmpresa: String; bool1000 : Boolean = false): String;
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      MAX(GENE_ID) + 1');
        sql.Add('FROM  GENERICA');
        sql.Add('WHERE GENE_EMPR_ID = ' + strEmpresa);
        sql.Add('AND   GENE_TGEN_ID = ' + strTabela);
        if not bool1000 then
          sql.Add('AND GENE_ID < 1000');
        Open;
        if not IsEmpty then begin
          if qryCons.Fields[0].AsString <> '' then
            Result      := qryCons.Fields[0].AsString
          else Result   := '1';
        end else Result := '1';
      end;
    except on e: exception do begin
      ReportaErro('Funcoes','ObterSequenciaGen',e.Message);
      Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.Padl(strDireita: String; intTam: Integer;
  cEsquerda: Char): String;
begin
  Result := Copy(Repetir(intTam-Length(strDireita),cEsquerda)+strDireita,1,intTam);
end;

function TFuncoes.Padr(strEsquerda: String; intTam: Integer; cDireita: Char;
  cSeMenor: String): String;
begin
  if (cSeMenor <> '') and (Length(strEsquerda) > intTam) then begin
    Result := Repetir(intTam,cSeMenor);
  end else begin
    Result := Copy(strEsquerda+Repetir(intTam-Length(strEsquerda),cDireita),1,intTam);
  end;
end;

procedure TFuncoes.PermissoesSystem(strIDEHD: String);

function IcodeBloqueado() : Boolean;
begin
  {Result := true;
  if strIDEHD = '08-00-27-00-D8-4C' then Exit;
  if strIDEHD = '00-E0-4C-80-11-FD' then Exit;
  if strIDEHD = '00-24-8C-FF-44-61' then Exit;
  if strIDEHD = '00-24-8C-FF-43-D9' then Exit;
  if strIDEHD = '00-19-21-44-6E-1D' then Exit;
  if strIDEHD = '00-19-5B-CE-A2-55' then Exit;
  if strIDEHD = '00-19-5B-CE-A2-31' then Exit;
  if strIDEHD = '00-1C-F0-A5-26-F2' then Exit;
  if strIDEHD = '00-1D-7D-E0-7A-7A' then Exit;
  if strIDEHD = '00-19-5B-CE-A2-55' then Exit;}
  Result := false;
end;

var
  txtTMP    : TextFile;
  strTMP    : String;
  intI      : Integer;
  dtInicio,
  dtFim     : TDateTime;
begin
  try
    ///Inicia-se variavel torna o sistema gratuito
    for intI := 1 to 15 do begin
      SetLicenca(intI,1);
    end;
    setFree(false);
    setPrivado(false);
    setSemAnuncio(false);

    if IcodeBloqueado() then begin
      setPrivado(true);
      setSemAnuncio(true);
      for intI := 1 to 15 do begin
        SetLicenca(intI,0);
      end;
      Exit;
    end;

    ///Verifica-se se o arquivo de licença existe, caso contrario, seta-se o sistema
    ///com gratis
    if FileExists(ExtractFilePath(Application.ExeName)+'rtlwinsystem.bpl') then begin
      try
        ///Lê as informações da licença do usuário setando seu valores
        AssignFile(txtTMP, ExtractFilePath(Application.ExeName)+'rtlwinsystem.bpl');
        Reset(txtTMP);
        Readln(txtTMP,strTMP);
        try
          strTMP := Crypt('D',strTMP,True);
          ///Caso o valor retornado seja diferente do sistema do usuário
          ///a licença do usuário bloqueando todos os valores.
          if Trim(Buscar_Coluna(strTMP,1)) = strIDEHD then begin
            dtInicio := StrToDate(Buscar_Coluna(strTMP,2));
            dtFim    := StrToDate(Buscar_Coluna(strTMP,3));

            ///Verifica se a versão e Free
            SetLicenca(14,Se((Buscar_Coluna(strTMP,17) = '1'),1,0));
            setFree(GetLicenca(14));

            ///Verifica se a versão e sem anuncios
            SetLicenca(15,Se((Buscar_Coluna(strTMP,18) = '1'),1,0));
            setSemAnuncio(GetLicenca(15));

            ///Se for usuário free não continua daqui.
            if getFree then begin
              Exit;
            end;

            ///Verifica-se se a data de licença ainda e uma data válida.
            if (DataServidor(Conexao) >= dtInicio) and (DataServidor(Conexao) <= dtFim) then begin

              intI := (Trunc(dtFim) - Trunc(DataServidor(Conexao)));

              if intI <= 10 then begin

                Alerta('A T E N Ç Ã O ! ! !   A T E N Ç Ã O ! ! !   A T E N Ç Ã O ! ! !'+#13+#13+
                       'Sua licença expirará em ' + IntToStr(intI) + ' DIAS!'+#13+
                       'Evite o bloqueio de seu sistema, procure seu representante!'+#13+#13+
                       'A T E N Ç Ã O ! ! !   A T E N Ç Ã O ! ! !   A T E N Ç Ã O ! ! !',0)
              end;

              ///Financeiro
              SetLicenca(1, Se((Buscar_Coluna(strTMP,4)  = '1'),1,0));
              ///Estoque
              SetLicenca(2, Se((Buscar_Coluna(strTMP,5)  = '1'),1,0));
              ///Vendas
              SetLicenca(3, Se((Buscar_Coluna(strTMP,6)  = '1'),1,0));
              ///Ordem de Serviço
              SetLicenca(4, Se((Buscar_Coluna(strTMP,7)  = '1'),1,0));
              ///Construção
              SetLicenca(5, Se((Buscar_Coluna(strTMP,8)  = '1'),1,0));
              ///Outros
              SetLicenca(6, Se((Buscar_Coluna(strTMP,9)  = '1'),1,0));
              SetLicenca(7, Se((Buscar_Coluna(strTMP,10) = '1'),1,0));
              SetLicenca(8, Se((Buscar_Coluna(strTMP,11) = '1'),1,0));
              SetLicenca(9, Se((Buscar_Coluna(strTMP,12) = '1'),1,0));
              SetLicenca(10,Se((Buscar_Coluna(strTMP,13) = '1'),1,0));
              SetLicenca(11,Se((Buscar_Coluna(strTMP,14) = '1'),1,0));
              SetLicenca(12,Se((Buscar_Coluna(strTMP,15) = '1'),1,0));
              SetLicenca(13,Se((Buscar_Coluna(strTMP,16) = '1'),1,0));

              //Posições 14 e 15 declaradas acima.

              setPrivado( true );
            end else begin
              if not GetLicenca(15) then begin
                setPrivado(true);
                for intI := 1 to 15 do begin
                  SetLicenca(intI,0); ///Data de Validade da licença ja venceu
                end;
              end else begin
                setSemAnuncio(false);
              end;
              Exit;
            end;
          end else begin
            for intI := 1 to 15 do begin
              SetLicenca(intI,0); ///Tentaram burlar a licença
            end;
            Exit;
          end;
        except
          for intI := 1 to 15 do begin
            SetLicenca(intI,0); ///Tentaram burlar a licença
          end;
          Exit;
        end;
      finally
        CloseFile(txtTMP);
      end;
    end;
  except
  end;
end;

function TFuncoes.PermitePrecoVenda(strTPRC_ID, strPROD_ID: String;
  fltValor: Real; intPer1, intPer2 : Integer; intPer3 : Integer = -1): Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      TPIT_VLR_GONDOLA,');  //0
        sql.Add('      TPIT_VLR_MINIMO,');   //1
        sql.Add('      TPIT_VLR_ESPECIAL,'); //2
        sql.Add('      TPIT_VLR_ATACADO');   //3
        sql.Add('FROM  TABELA_PRECO_ITENS');
        sql.Add('WHERE TPIT_EMPR_ID      = ' + IntToStr(Empr_ID));
        sql.Add('AND   TPIT_TPRC_ID      = ' + strTPRC_ID);
        sql.Add('AND   TPIT_TPRC_EMPR_ID = ' + IntToStr(Empr_ID));
        sql.Add('AND   TPIT_PROD_ID      = ' + strPROD_ID);
        sql.Add('AND   TPIT_PROD_EMPR_ID = ' + IntToStr(Empr_ID));
        Open;
        if not IsEmpty then begin
          ///Verificando se o valor repassado e maior ou igual ao valor de gondola
          Result := (fltValor >= qryCons.Fields[0].AsFloat);
          ///Verificando o preço minimo
          if RetornaPermissao(intPer1) then begin
            Result := (fltValor >= qryCons.Fields[1].AsFloat)
          end;
          ///Verificando o preço Especial
          if RetornaPermissao(intPer2) then begin
            Result := (fltValor >= qryCons.Fields[2].AsFloat)
          end;
          ///Verificando o preço Atacado
          if RetornaPermissao(intPer3) then begin
            Result := (fltValor >= qryCons.Fields[3].AsFloat)
          end;
        end;
      end;
      if not Result then begin
        if Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                  'Preço abaixo o mínimo permitido ou usuário sem previlégios suficientes para este valor.'+#13+#13+
                  'Gostaria de entrar com usuário e senha de supervisor?',1,true) = 6 then begin
          Result := RetornaUsuario(fltValor,
                                   qryCons.Fields[0].AsFloat,
                                   qryCons.Fields[1].AsFloat,
                                   qryCons.Fields[2].AsFloat,
                                   qryCons.Fields[3].AsFloat,
                                   intPer1,
                                   intPer2,
                                   intPer3);
        end;
      end;
    except on e: exception do begin
      ReportaErro('TFuncoes','PermitePrecoVenda',e.Message);
      Alerta('Erro no processo de verificação do preço atribuido.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.WinVersion: Boolean;
var
  VersionInfo: TOSVersionInfo;
begin
  Result := true;
  try
    VersionInfo.dwOSVersionInfoSize := SizeOf(VersionInfo);
    GetVersionEx(VersionInfo);
    with VersionInfo do begin
      case dwPlatformId of
        2: begin
          case dwMajorVersion of
            6: begin
              case dwMinorVersion of
                1: Result := false;
              end;
            end;
          end;
        end;
      end;
    end;
  except
  end;
end;

function TFuncoes.RetornaUsuario(fltVenda, fltGondola, fltMinimo, fltEspecial, fltAtacado : Real;
  intPer1, intPer2, intPer3 : Integer) : Boolean;
var
  strUSER_ID,
  strUser, strPWD : String;
  qryCons : TSQLQuery;
begin
  try
    Result := false;
    if fLoginUser = nil then begin
      fLoginUser := TfLoginUser.create(nil);
    end;
    fLoginUser.ShowModal;
    strUser := fLoginUser.strUsuario;
    strPWD  := fLoginUser.strSenha;
    if (strUser <> '') and (strPWD <> '') then begin
      try
        qryCons := TSQLQuery.Create(nil);
        qryCons.SQLConnection := Conexao;
        try
          with qryCons do begin
            Close;
            sql.Clear;
            sql.Add('SELECT');
            sql.Add('      USER_ID');
            sql.Add('FROM  USUARIO');
            sql.Add('INNER JOIN USUARIO_EMPR');
            sql.Add('ON (USEP_USER_ID   = USER_ID)');
            sql.Add('WHERE USER_LOGIN   = ' + QuotedStr(Trim(strUser)));
            sql.Add('AND   USER_SENHA   = ' + QuotedStr(Trim(Criptografar(strPWD))));
            sql.Add('AND   USEP_EMPR_ID = ' + IntToStr(Empr_ID));
            Open;
            if not IsEmpty then begin
              strUSER_ID := qryCons.Fields[0].AsString;
              sql.Clear;
              sql.Add('SELECT');
              sql.Add('      USRM_MENU_ID');
              sql.Add('FROM  USUARIO_M');
              sql.Add('WHERE USRM_EMPR_ID = ' + IntToStr(Empr_ID));
              sql.Add('AND   USRM_USER_ID = ' + strUSER_ID);
              sql.Add('AND   USRM_MENU_ID IN ('+ IntToStr(intPer1) + ',' + IntToStr(intPer2) + ',' + IntToStr(intPer3) +')');
              Open;
              if not IsEmpty then begin
                First;
                while not eof do begin
                  if qryCons.Fields[0].AsInteger = intPer1 then begin
                    Result := (fltVenda >= fltMinimo);
                  end;
                  if qryCons.Fields[0].AsInteger = intPer2 then begin
                    Result := (fltVenda >= fltEspecial);
                  end;
                  if qryCons.Fields[0].AsInteger = intPer3 then begin
                    Result := (fltVenda >= fltAtacado);
                  end;
                  if Result then Exit;
                  Next;
                end;
              end;
            end;
          end;
        except on e: exception do begin
          ReportaErro('TFuncoes','RetornaUsuario',e.Message);
          Alerta('Erro no processo de autenticação do usuário.'+#13+'['+e.Message+']',1);
        end; end;
      finally
        qryCons.Close;
        FreeAndNil(qryCons);
      end;
    end;
    if not Result then begin
      Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
             'Preço abaixo o mínimo permitido ou usuário sem previlégios suficientes para o valor informado.',1);
    end;
  finally
    FreeAndNil(fLoginUser);
  end;
end;

procedure TFuncoes.PrintLabel(Sender: TObject);
begin
  with (Sender as TLabel) do begin
    Font.Style := [fsBold,fsUnderline];
    Font.Color := clBlue;
    Cursor     := crHandPoint;
  end;
end;

{*******************************************************************************
Data:       18/03/2010
Autor:      Alex Itamar Gomes
Descrição:  Metodo para verificar se um determinado produto possui estoque sufi-
            ciente;

Parametros:
  strProd_ID  = Codigo do produtoa ser pesquisado;
  floatQtde   = Quantidade de estoque a ser consultado;
  intTipo     = Tipo de verificação a ser feita:
              1 - Atual e Disponivel;
              2 - Disponivel;
              3 - Atual;
*******************************************************************************}
function TFuncoes.ProdutoTemEstoque(strProd_ID: String; floatQtde: Real;
  intTipo: Integer = 1): Boolean;
var
  qryCons     : TSQLQuery;
  boolMovEstq : Boolean;
begin
  try
    strProd_ID := Se((strProd_ID = ''),'-1',strProd_ID);
    Result  := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      if ProdMovimentaEstoque(boolMovEstq,strProd_ID) then begin
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(ESTQ_EST_ATUAL,0),');
          sql.Add('      COALESCE(ESTQ_EST_DISP,0)');
          sql.Add('FROM  ESTOQUE');
          sql.Add('WHERE ESTQ_EMPR_ID      = ' + IntToStr(Empr_ID));
          sql.Add('AND   ESTQ_PROD_ID      = ' + strProd_ID);
          sql.Add('AND   ESTQ_PROD_EMPR_ID = ' + IntToStr(Empr_ID));
          Open;
          if not IsEmpty  then begin
            case intTipo of
              1 : Result := ((qryCons.Fields[0].AsFloat >= floatQtde) and (qryCons.Fields[1].AsFloat >= floatQtde));
              2 : Result := (qryCons.Fields[1].AsFloat >= floatQtde);
              3 : Result := (qryCons.Fields[0].AsFloat >= floatQtde);
            end;
          end;
        end;
      end;
      if not Result then begin
        Exit;
      end;
      Result := MovimentaComposicao(strProd_ID,floatQtde,intTipo);
    except on e: exception do begin
      ReportaErro('TFuncoes','ProdutoTemEstoque',e.Message);
      Alerta('Erro no processo de pesquisa do estoque do produto.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.MovimentaComposicao(strProd_ID : String; floatQtde : Real;
  intTipo : Integer = 1) : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      PRCP_PROD_ID_COMP,');
        sql.Add('      PRCP_QTDE');
        sql.Add('FROM  PRODUTOS_COMP PC');
        sql.Add('WHERE PRCP_EMPR_ID      = ' + IntToStr(Empr_ID));
        sql.Add('AND   PRCP_PROD_ID      = ' + strPROD_ID);
        sql.Add('AND   PRCP_PROD_EMPR_ID = ' + IntToStr(Empr_ID));
        Open;
        if not IsEmpty then begin
          First;
          while not eof do begin
            Result := ProdutoTemEstoque(qryCons.Fields[0].AsString,qryCons.Fields[1].AsFloat,intTipo);
            if not Result then begin
              Exit;
            end;
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      ReportaErro('TFuncoes','MovimentaComposição',e.Message);
      Alerta('Erro no processo de movimentação do estoque do produto.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.ProdutoVendeFracionado(strProd_ID: String): Boolean;
var
  qryCons : TSQLQuery;
begin
  Result := false;
  if strProd_ID = '' then Exit;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      PROD_FLG_FRACIONADO');
        sql.Add('FROM  PRODUTOS');
        sql.Add('WHERE PROD_ID      = ' + strProd_ID);
        sql.Add('AND   PROD_EMPR_ID = ' + IntToStr(Empr_ID));
        Open;
      end;
      Result := (qryCons.Fields[0].AsInteger = 1);
    except on e: exception do begin
      ReportaErro('TFuncoes','ProdutoVendeFracionado',e.Message);
      Alerta('Erro no processo de verificação das propriedades do produto informado.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.ProdutoTemEstoque(strProd_ID: String = '99'): Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    strProd_ID := Se((strProd_ID = ''),'-1',strProd_ID);
    Result  := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(*)');
        sql.Add('FROM  ESTOQUE');
        sql.Add('WHERE ESTQ_EMPR_ID      = ' + IntToStr(Empr_ID));
        sql.Add('AND   ESTQ_PROD_ID      = ' + strProd_ID);
        sql.Add('AND   ESTQ_PROD_EMPR_ID = ' + IntToStr(Empr_ID));
        Open;
      end;
      Result := (qryCons.Fields[0].AsInteger > 0);
    except on e: exception do begin
      Alerta('Erro ao verificar estoque inicial do produto.'+#13+'['+e.Message+']',1);
      ReportaErro('TFuncoes','ProdutoTemEstoque',e.Message);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TFuncoes.RegistraMovBancario(strCBCO_ID: String; floatValor: Real);
var
  qryCons : TSQLQuery;
begin
    try
    FormatSettings.DecimalSeparator := '.';
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          StartCommit;
        except
        end;
        sql.Add('UPDATE CONTAS_BANCARIAS');
        sql.Add('   SET CBCO_SALDO_ATUAL = CBCO_SALDO_ATUAL + (' + FormatFloat('0.00',floatValor)+')');
        sql.Add(' WHERE CBCO_ID = (SELECT FIRST 1 DISTINCT');
        sql.Add('                         CBCO_ID');
        sql.Add('                    FROM CONTAS_BANCARIAS');
        sql.Add('                   WHERE CBCO_ID IN (SELECT CBCO_ID');
        sql.Add('                                       FROM CONTAS_BANCARIAS');
        sql.Add('                                      WHERE CBCO_ID            = ' + strCBCO_ID);
        sql.Add('                                        AND CBCO_EMPR_ID       = ' + IntToStr(Empr_ID));
        sql.Add('                                      UNION ALL');
        sql.Add('                                     SELECT CBCO_ID');
        sql.Add('                                       FROM CONTAS_BANCARIAS');
        sql.Add('                                      WHERE CBCO_ID            = '+strCBCO_ID);
        sql.Add('                                        AND CBCO_MULTI_EMPRESA = 1)');
        sql.Add('                  )');
        ExecSQL;
        try
          Commit;
        except
        end;
      end;
    except on e: exception do begin
      RollBack;
      ReportaErro('TFuncoes','RegistraMovBancario',e.Message);
      Alerta('Erro ao registrar a movimentação bancária.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TFuncoes.RegistraMovConta(strCBCO_ID, strGENE_ID, strGene_Orig, strID_ORIG : String; floatValor : Real);
var
  qryCons : TSQLQuery;
begin
  try
    FormatSettings.DecimalSeparator := '.';
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          StartCommit;
        except
        end;
        sql.Add('INSERT INTO CONTAS_BANCARIAS_MOV(CBMV_ID,');
        sql.Add('                                 CBMV_EMPR_ID,');
        sql.Add('                                 CBMV_CBCO_ID,');
        sql.Add('                                 CBMV_CBCO_EMPR_ID,');
        sql.Add('                                 CBMV_GENE_EMPR_ID_TIPO_MOV,');
        sql.Add('                                 CBMV_GENE_TGEN_ID_TIPO_MOV,');
        sql.Add('                                 CBMV_GENE_ID_TIPO_MOV,');
        sql.Add('                                 CBMV_GENE_EMPR_ID_ORIG,');
        sql.Add('                                 CBMV_GENE_TGEN_ID_ORIG,');
        sql.Add('                                 CBMV_GENE_ID_ORIG,');
        sql.Add('                                 CBMV_CAMPO1_EMPR_ID_ORIG,');
        sql.Add('                                 CBMV_CAMPO2_TGEN_ID_ORIG,');
        sql.Add('                                 CBMV_CAMPO3_ID_ORIG,');
        sql.Add('                                 CBMV_VALOR_MOV,');
        sql.Add('                                 CBMV_SALDO_DISP,');
        sql.Add('                                 CBMV_DTA_CADASTRO,');
        sql.Add('                                 CBMV_USER_ID)');
        sql.Add('VALUES(' + ObterSequencia('CONTAS_BANCARIAS_MOV',IntToStr(Empr_ID)) + ','
                          + IntToStr(Empr_ID)               + ','
                          + strCBCO_ID                      + ','
                          + IntToStr(BuscarEmprBCO(strCBCO_ID) ) + ','
                          + '0'                             + ','
                          + '506'                           + ','
                          + strGENE_ID                      + ','
                          + '0'                             + ','
                          + '13'                            + ','
                          + strGene_Orig                    + ','
                          + IntToStr(Empr_ID)               + ','
                          + 'Null'                          + ','
                          + strID_Orig                      + ','
                          + FormatFloat('0.00',floatValor)  + ','
                          + FormatFloat('0.00',(RetornaSaldoConta(strCBCO_ID)))  + ','
                          + QuotedStr(FormatDateTime('mm/dd/yyyy',DataServidor(Conexao)))     + ','
                          + IntToStr(User_ID)               + ')');
        ExecSQL;
        try
          Commit;
        except
        end;
      end;
    except on e: exception do begin
      RollBack;
      ReportaErro('TFuncoes','RegistraMovConta',e.Message);
      Alerta('Erro no processo de registro da movimentação bancária.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

function TFuncoes.RetornaSaldoConta(strCBCO_ID : String) : Real;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := 0;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('       CBCO_SALDO_ATUAL');
        sql.Add('  FROM CONTAS_BANCARIAS');
        sql.Add(' WHERE CBCO_EMPR_ID           = ' + IntToStr(BuscarEmprBCO(strCBCO_ID)));
        sql.Add('   AND CBCO_ID                = ' + strCBCO_ID);
        sql.Add('   AND CBCO_ATIVO             = 1');
        Open;
        if not IsEmpty then
          Result    := qryCons.Fields[0].AsFloat
        else Result := 0;
      end;
    except on e: exception do begin
      ReportaErro('TFuncoes','RetornaSaldoConta',e.Message);
      Alerta('Erro no processo de baixa do(s) título(s) selecionado(s).'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.Repetir(intQtde : Integer; strTexto : String) : String;
var
  intI : Integer;
begin
  Result := '';
  if intQtde > 0 then  begin
    for intI := 1 to intQtde do begin
      Result := Result + strTexto;
    end;
  end;
end;

procedure TFuncoes.ReplicaCadastro(cdsTMP : TClientDataSet; Tipo: String = 'F');
var
  qryCons : TSQLQuery;
begin
  if not ReplicClienteFornecedor then Exit;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      case Tipo[1] of
        'F' : begin
          sql.Add('SELECT COUNT(*) AS QTDE FROM CLIENTES WHERE CLIE_CNPJ_CPF = :CLIE_CNPJ_CPF');
          Params.ParamByName('CLIE_CNPJ_CPF').AsString := cdsTMP.FieldByName('FORN_CNPJ_CPF').AsString;
          Open;
          if (FieldByName('QTDE').AsInteger > 0) then Exit;
          Close;
          sql.Clear;
          sql.Add('INSERT INTO CLIENTES(CLIE_ID,');
          sql.Add('                     CLIE_EMPR_ID,');
          sql.Add('                     CLIE_RAZAO_SOCIAL,');
          sql.Add('                     CLIE_FANTASIA,');
          sql.Add('                     CLIE_CEP,');
          sql.Add('                     CLIE_ENDERECO,');
          sql.Add('                     CLIE_BAIRRO,');
          sql.Add('                     CLIE_GENE_EMPR_ID_PRACA,');
          sql.Add('                     CLIE_GENE_TGEN_ID_PRACA,');
          sql.Add('                     CLIE_GENE_ID_PRACA,');
//          sql.Add('                     CLIE_GENE_EMPR_ID_ROTA,');
//          sql.Add('                     CLIE_GENE_TGEN_ID_ROTA,');
//          sql.Add('                     CLIE_GENE_ID_ROTA,');
          sql.Add('                     CLIE_RG,');
          sql.Add('                     CLIE_TIPO,');
          sql.Add('                     CLIE_CNPJ_CPF,');
//          sql.Add('                     CLIE_USER_ID_VENDEDOR,');
          sql.Add('                     CLIE_SITE,');
          sql.Add('                     CLIE_EMAIL,');
          sql.Add('                     CLIE_ATIVO,');
          sql.Add('                     CLIE_TELEFONE1,');
          sql.Add('                     CLIE_TELEFONE2,');
//          sql.Add('                     CLIE_TELEFONE3,');
//          sql.Add('                     CLIE_TELEFONE4,');
//          sql.Add('                     CLIE_OBS,');
//          sql.Add('                     CLIE_LIMITE_CREDITO,');
//          sql.Add('                     CLIE_ACEITA_ULT_LIMITE_CRED,');
//          sql.Add('                     CLIE_TIPO_VENDA,');
//          sql.Add('                     CLIE_TIPO_CLIENTE,');
//          sql.Add('                     CLIE_REFERENCIA,');
//          sql.Add('                     CLIE_DTA_ATENDIMENTO,');
//          sql.Add('                     CLIE_HORA_ATEND,');
//          sql.Add('                     CLIE_USER_ID_ATENDENTE,');
//          sql.Add('                     CLIE_BLOQUEAR_ATENDIMENTO,');
//          sql.Add('                     CLIE_DT_NASCIMENTO,');
          sql.Add('                     CLIE_DTA_CADASTRO,');
          sql.Add('                     CLIE_USER_ID)');
          sql.Add('              VALUES(:CLIE_ID,');
          sql.Add('                     :CLIE_EMPR_ID,');
          sql.Add('                     :CLIE_RAZAO_SOCIAL,');
          sql.Add('                     :CLIE_FANTASIA,');
          sql.Add('                     :CLIE_CEP,');
          sql.Add('                     :CLIE_ENDERECO,');
          sql.Add('                     :CLIE_BAIRRO,');
          sql.Add('                     :CLIE_GENE_EMPR_ID_PRACA,');
          sql.Add('                     :CLIE_GENE_TGEN_ID_PRACA,');
          sql.Add('                     :CLIE_GENE_ID_PRACA,');
//          sql.Add('                     :CLIE_GENE_EMPR_ID_ROTA,');
//          sql.Add('                     :CLIE_GENE_TGEN_ID_ROTA,');
//          sql.Add('                     :CLIE_GENE_ID_ROTA,');
          sql.Add('                     :CLIE_RG,');
          sql.Add('                     :CLIE_TIPO,');
          sql.Add('                     :CLIE_CNPJ_CPF,');
//          sql.Add('                     :CLIE_USER_ID_VENDEDOR,');
          sql.Add('                     :CLIE_SITE,');
          sql.Add('                     :CLIE_EMAIL,');
          sql.Add('                     :CLIE_ATIVO,');
          sql.Add('                     :CLIE_TELEFONE1,');
          sql.Add('                     :CLIE_TELEFONE2,');
//          sql.Add('                     :CLIE_TELEFONE3,');
//          sql.Add('                     :CLIE_TELEFONE4,');
//          sql.Add('                     :CLIE_OBS,');
//          sql.Add('                     :CLIE_LIMITE_CREDITO,');
//          sql.Add('                     :CLIE_ACEITA_ULT_LIMITE_CRED,');
//          sql.Add('                     :CLIE_TIPO_VENDA,');
//          sql.Add('                     :CLIE_TIPO_CLIENTE,');
//          sql.Add('                     :CLIE_REFERENCIA,');
//          sql.Add('                     :CLIE_DTA_ATENDIMENTO,');
//          sql.Add('                     :CLIE_HORA_ATEND,');
//          sql.Add('                     :CLIE_USER_ID_ATENDENTE,');
//          sql.Add('                     :CLIE_BLOQUEAR_ATENDIMENTO,');
//          sql.Add('                     :CLIE_DT_NASCIMENTO,');
          sql.Add('                     :CLIE_DTA_CADASTRO,');
          sql.Add('                     :CLIE_USER_ID)');
          Params.ParamByName('CLIE_ID').AsString                                := ObterSequencia('CLIENTES',IntToStr(Empr_ID));
          Params.ParamByName('CLIE_EMPR_ID').AsInteger                          := Empr_ID;
          Params.ParamByName('CLIE_RAZAO_SOCIAL').AsString                      := cdsTMP.FieldByName('FORN_RAZAO_SOCIAL').AsString;
          Params.ParamByName('CLIE_FANTASIA').AsString                          := cdsTMP.FieldByName('FORN_NOME_FANTASIA').AsString;
          Params.ParamByName('CLIE_CEP').AsString                               := cdsTMP.FieldByName('FORN_CEP').AsString;
          Params.ParamByName('CLIE_ENDERECO').AsString                          := cdsTMP.FieldByName('FORN_ENDERECO').AsString;
          Params.ParamByName('CLIE_BAIRRO').AsString                            := cdsTMP.FieldByName('FORN_BAIRRO').AsString;
          Params.ParamByName('CLIE_GENE_EMPR_ID_PRACA').AsInteger               := cdsTMP.FieldByName('FORN_GENE_EMPR_ID_PRACA').AsInteger;
          Params.ParamByName('CLIE_GENE_TGEN_ID_PRACA').AsInteger               := cdsTMP.FieldByName('FORN_GENE_TGEN_ID_PRACA').AsInteger;
          Params.ParamByName('CLIE_GENE_ID_PRACA').AsInteger                    := cdsTMP.FieldByName('FORN_GENE_ID_PRACA').AsInteger;
//          Params.ParamByName('CLIE_GENE_EMPR_ID_ROTA').AsInteger                := cdsTMP.FieldByName('').AsInteger;
//          Params.ParamByName('CLIE_GENE_TGEN_ID_ROTA').AsInteger                := cdsTMP.FieldByName('').AsInteger;
//          Params.ParamByName('CLIE_GENE_ID_ROTA').AsInteger                     := cdsTMP.FieldByName('').AsInteger;
          Params.ParamByName('CLIE_RG').AsString                                := cdsTMP.FieldByName('FORN_IE').AsString;
          Params.ParamByName('CLIE_TIPO').AsString                              := cdsTMP.FieldByName('FORN_ATIVO').AsString;
          Params.ParamByName('CLIE_CNPJ_CPF').AsString                          := cdsTMP.FieldByName('FORN_CNPJ_CPF').AsString;
//          Params.ParamByName('CLIE_USER_ID_VENDEDOR').AsInteger                 := cdsTMP.FieldByName('').AsInteger;
          Params.ParamByName('CLIE_SITE').AsString                              := cdsTMP.FieldByName('FORN_SITE').AsString;
          Params.ParamByName('CLIE_EMAIL').AsString                             := cdsTMP.FieldByName('FORN_EMAIL').AsString;
          Params.ParamByName('CLIE_ATIVO').AsInteger                            := cdsTMP.FieldByName('FORN_ATIVO').AsInteger;
          Params.ParamByName('CLIE_TELEFONE1').AsString                         := cdsTMP.FieldByName('FORN_TELEFONE').AsString;
          Params.ParamByName('CLIE_TELEFONE2').AsString                         := cdsTMP.FieldByName('FORN_FAX').AsString;
//          Params.ParamByName('CLIE_TELEFONE3').AsInteger                        := cdsTMP.FieldByName('').AsInteger;
//          Params.ParamByName('CLIE_TELEFONE4').AsInteger                        := cdsTMP.FieldByName('').AsInteger;
//          Params.ParamByName('CLIE_OBS').AsString                               := cdsTMP.FieldByName('FORN_OBS').AsString;
//          Params.ParamByName('CLIE_LIMITE_CREDITO').AsInteger                   := cdsTMP.FieldByName('').AsInteger;
//          Params.ParamByName('CLIE_ACEITA_ULT_LIMITE_CRED').AsInteger           := cdsTMP.FieldByName('').AsInteger;
//          Params.ParamByName('CLIE_TIPO_VENDA').AsInteger                       := cdsTMP.FieldByName('').AsInteger;
//          Params.ParamByName('CLIE_TIPO_CLIENTE').AsInteger                     := cdsTMP.FieldByName('').AsInteger;
//          Params.ParamByName('CLIE_REFERENCIA').AsInteger                       := cdsTMP.FieldByName('').AsInteger;
//          Params.ParamByName('CLIE_DTA_ATENDIMENTO').AsInteger                  := cdsTMP.FieldByName('').AsInteger;
//          Params.ParamByName('CLIE_HORA_ATEND').AsInteger                       := cdsTMP.FieldByName('').AsInteger;
//          Params.ParamByName('CLIE_USER_ID_ATENDENTE').AsInteger                := cdsTMP.FieldByName('').AsInteger;
//          Params.ParamByName('CLIE_BLOQUEAR_ATENDIMENTO').AsInteger             := cdsTMP.FieldByName('').AsInteger;
//          Params.ParamByName('CLIE_DT_NASCIMENTO').AsInteger                    := cdsTMP.FieldByName('').AsInteger;
          Params.ParamByName('CLIE_DTA_CADASTRO').AsDateTime                    := cdsTMP.FieldByName('FORN_DTA_CADASTRO').AsDateTime;
          Params.ParamByName('CLIE_USER_ID').AsInteger                          := cdsTMP.FieldByName('FORN_USER_ID').AsInteger;
        end;
        'C' : begin
          sql.Add('SELECT COUNT(*) AS QTDE FROM FORNECEDORES WHERE FORN_CNPJ_CPF = :FORN_CNPJ_CPF');
          Params.ParamByName('FORN_CNPJ_CPF').AsString := cdsTMP.FieldByName('CLIE_CNPJ_CPF').AsString;
          Open;
          if FieldByName('QTDE').AsInteger > 0 then Exit;
          Close;
          sql.Clear;
          sql.Add('INSERT INTO FORNECEDORES(FORN_ID,');
          sql.Add('                         FORN_RAZAO_SOCIAL,');
          sql.Add('                         FORN_NOME_FANTASIA,');
          sql.Add('                         FORN_CNPJ_CPF,');
          sql.Add('                         FORN_IE,');
          sql.Add('                         FORN_CEP,');
          sql.Add('                         FORN_ENDERECO,');
          sql.Add('                         FORN_BAIRRO,');
          sql.Add('                         FORN_GENE_EMPR_ID_PRACA,');
          sql.Add('                         FORN_GENE_TGEN_ID_PRACA,');
          sql.Add('                         FORN_GENE_ID_PRACA,');
//          sql.Add('                         FORN_CONTATO,');
          sql.Add('                         FORN_TELEFONE,');
          sql.Add('                         FORN_FAX,');
          sql.Add('                         FORN_SITE,');
          sql.Add('                         FORN_EMAIL,');
          sql.Add('                         FORN_ATIVO,');
          sql.Add('                         FORN_TIPO,');
//          sql.Add('                         FORN_OBS,');
          sql.Add('                         FORN_DTA_CADASTRO,');
          sql.Add('                         FORN_USER_ID)');
          sql.Add('                  VALUES(:FORN_ID,');
          sql.Add('                         :FORN_RAZAO_SOCIAL,');
          sql.Add('                         :FORN_NOME_FANTASIA,');
          sql.Add('                         :FORN_CNPJ_CPF,');
          sql.Add('                         :FORN_IE,');
          sql.Add('                         :FORN_CEP,');
          sql.Add('                         :FORN_ENDERECO,');
          sql.Add('                         :FORN_BAIRRO,');
          sql.Add('                         :FORN_GENE_EMPR_ID_PRACA,');
          sql.Add('                         :FORN_GENE_TGEN_ID_PRACA,');
          sql.Add('                         :FORN_GENE_ID_PRACA,');
//          sql.Add('                         :FORN_CONTATO,');
          sql.Add('                         :FORN_TELEFONE,');
          sql.Add('                         :FORN_FAX,');
          sql.Add('                         :FORN_SITE,');
          sql.Add('                         :FORN_EMAIL,');
          sql.Add('                         :FORN_ATIVO,');
          sql.Add('                         :FORN_TIPO,');
//          sql.Add('                         :FORN_OBS,');
          sql.Add('                         :FORN_DTA_CADASTRO,');
          sql.Add('                         :FORN_USER_ID)');
          Params.ParamByName('FORN_ID').AsString                                := ObterSequencia('FORNECEDORES','0');
          Params.ParamByName('FORN_RAZAO_SOCIAL').AsString                      := cdsTMP.FieldByName('CLIE_RAZAO_SOCIAL').AsString;
          Params.ParamByName('FORN_NOME_FANTASIA').AsString                     := cdsTMP.FieldByName('CLIE_FANTASIA').AsString;
          Params.ParamByName('FORN_CNPJ_CPF').AsString                          := cdsTMP.FieldByName('CLIE_CNPJ_CPF').AsString;
          Params.ParamByName('FORN_IE').AsString                                := cdsTMP.FieldByName('CLIE_RG').AsString;
          Params.ParamByName('FORN_CEP').AsString                               := cdsTMP.FieldByName('CLIE_CEP').AsString;
          Params.ParamByName('FORN_ENDERECO').AsString                          := cdsTMP.FieldByName('CLIE_ENDERECO').AsString;
          Params.ParamByName('FORN_BAIRRO').AsString                            := cdsTMP.FieldByName('CLIE_BAIRRO').AsString;
          Params.ParamByName('FORN_GENE_EMPR_ID_PRACA').AsInteger               := cdsTMP.FieldByName('CLIE_GENE_EMPR_ID_PRACA').AsInteger;
          Params.ParamByName('FORN_GENE_TGEN_ID_PRACA').AsInteger               := cdsTMP.FieldByName('CLIE_GENE_TGEN_ID_PRACA').AsInteger;
          Params.ParamByName('FORN_GENE_ID_PRACA').AsInteger                    := cdsTMP.FieldByName('CLIE_GENE_ID_PRACA').AsInteger;
//          Params.ParamByName('FORN_CONTATO').AsInteger                          := cdsTMP.FieldByName('').AsInteger;
          Params.ParamByName('FORN_TELEFONE').AsString                          := cdsTMP.FieldByName('CLIE_TELEFONE1').AsString;
          Params.ParamByName('FORN_FAX').AsString                               := cdsTMP.FieldByName('CLIE_TELEFONE2').AsString;
          Params.ParamByName('FORN_SITE').AsString                              := cdsTMP.FieldByName('CLIE_SITE').AsString;
          Params.ParamByName('FORN_EMAIL').AsString                             := cdsTMP.FieldByName('CLIE_EMAIL').AsString;
          Params.ParamByName('FORN_ATIVO').AsInteger                            := cdsTMP.FieldByName('CLIE_ATIVO').AsInteger;
          Params.ParamByName('FORN_TIPO').AsString                              := cdsTMP.FieldByName('CLIE_TIPO').AsString;
//          Params.ParamByName('FORN_OBS').AsString                               := cdsTMP.FieldByName('CLIE_OBS').AsString;
          Params.ParamByName('FORN_DTA_CADASTRO').AsDateTime                    := cdsTMP.FieldByName('CLIE_DTA_CADASTRO').AsDateTime;
          Params.ParamByName('FORN_USER_ID').AsInteger                          := cdsTMP.FieldByName('CLIE_USER_ID').AsInteger;
        end;
      end;
      ExecSQL();
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TFuncoes.ReportaErro(strCaption, strComponente : String; strErro: String = ''; strUsuario : String = '');
var
  erroTMP : TextFile;
  strName : String;
begin
  try
    if strUsuario = '' then
      strUsuario := User_Login;
    if not DirectoryExists(ExtractFilePath(Application.ExeName)+'Except') then
      ForceDirectories(ExtractFilePath(Application.ExeName)+'Except');
    strName := FormatDateTime('dd-mm-yyyy hh-mm-ss',DataServidor(Conexao,true));
    AssignFile(erroTMP,ExtractFilePath(Application.ExeName)+'Except\'+strName+'.log');
    Rewrite(erroTMP);
    Writeln(erroTMP,'Cliente  : ' + Empr_Razao);
    Writeln(erroTMP,'Usuário  : ' + strUsuario);
    Writeln(erroTMP,'Data/Hora: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',DataServidor(Conexao,true)));
    Writeln(erroTMP,'Mac:       ' + MacAddress);
//    Writeln(erroTMP,'Versão:    ' + Version);
    Writeln(erroTMP,'---------------------------------------------');
    Writeln(erroTMP,'Form:      ' + strCaption);
    Writeln(erroTMP,'Comp:      ' + strComponente);
    Writeln(erroTMP,'Erro:      ' + strErro);
    CloseFile(erroTMP);
  except
  end;
end;

function TFuncoes.RollBack: Boolean;
begin
  Result := true;
  try
    Conexao.Rollback(Transact);
  except
    Conexao.Rollback(Transact);
    Result := false;
  end;
end;

function TFuncoes.SaldoBancario(bMeta : Boolean = false): Real;
var
  qryCons  : TSQLQuery;
begin
  Result := 0;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT COALESCE(SUM(CBCO_SALDO_ATUAL),0)');
        sql.Add('  FROM CONTAS_BANCARIAS');
        sql.Add(' WHERE CBCO_EMPR_ID                       = ' + IntToStr(Empr_ID));
//        sql.Add('   AND COALESCE(CBCO_SALDO_ATUAL,0)       > 0');
        sql.Add('   AND COALESCE(CBCO_ATIVO,1)             = 1');
        if bMeta then begin
          sql.Add('   AND COALESCE(CBCO_PARTICIPA_METAS,0)  = 1')
        end else begin
          sql.Add('   AND COALESCE(CBCO_CONSIDERAR_SALDOS,1) = 1');
        end;
        Open;
        Result := qryCons.Fields[0].AsFloat;
      end;
    except on e: exception do
      ReportaErro('Pro_Funcoes','SaldoBancario',e.Message);
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.Se(boolVerdadeiro: Boolean; Verdadeiro,
  Falso: Variant): Variant;
begin
  if boolVerdadeiro then
    Result    := Verdadeiro
  else Result := Falso;
end;

procedure TFuncoes.setAbreOS(const Value: Boolean);
begin
  FAbreOS := Value;
end;

procedure TFuncoes.setAliquotaCOFINS(const Value: Real);
begin
  FAliquotaCOFINS := Value;
end;

procedure TFuncoes.setAliquotaPIS(const Value: Real);
begin
 FAliquotaPIS := Value;
end;

procedure TFuncoes.setAplicFDERecLiq(const Value: Boolean);
begin
  FAplicFDERecLiq := Value;
end;

procedure TFuncoes.setAplicFundoReservaRecLiq(const Value: Boolean);
begin
  FAplicFundoReservaRecLiq := Value;
end;

procedure TFuncoes.setBackupDomingo(const Value: Boolean);
begin
  FBackupDomingo := Value;
end;

procedure TFuncoes.setBackupHora1(const Value: String);
begin
  FBackupHora1 := Value;
end;

procedure TFuncoes.setBackupHora2(const Value: String);
begin
  FBackupHora2 := Value;
end;

procedure TFuncoes.setBackupHora3(const Value: String);
begin
  FBackupHora3 := Value;
end;

procedure TFuncoes.setBackupQuarta(const Value: Boolean);
begin
  FBackupQuarta := Value;
end;

procedure TFuncoes.setBackupQuinta(const Value: Boolean);
begin
  FBackupQuinta := Value;
end;

procedure TFuncoes.setBackupSabado(const Value: Boolean);
begin
  FBackupSabado := Value;
end;

procedure TFuncoes.setBackupSegunda(const Value: Boolean);
begin
  FBackupSegunda := Value;
end;

procedure TFuncoes.setBackupSexta(const Value: Boolean);
begin
  FBackupSexta := Value;
end;

procedure TFuncoes.setBackupTerca(const Value: Boolean);
begin
  FBackupTerca := Value;
end;

procedure TFuncoes.setChamaAzul(const Value: Boolean);
begin
  FChamaAzul := Value;
end;

procedure TFuncoes.setClientePadrao(Value: Integer);
begin
  FClientePadrao := Value;
end;

procedure TFuncoes.setCodCliente(const Value: Integer);
begin
  FCodCliente := Value;
end;

procedure TFuncoes.setCodEquip(const Value: Integer);
begin
  FCodEquip := Value;
end;

procedure TFuncoes.setCodUserIDTecOS(const Value: Integer);
begin
  FCodUserIDTecOS := Value;
end;

procedure TFuncoes.setCod_Equip(const Value: String);
begin
  FCod_Equip := Value;
end;

procedure TFuncoes.setCod_Fornecedor(const Value: String);
begin
  FCod_Fornecedor := Value;
end;

procedure TFuncoes.setCod_Tecnico(const Value: String);
begin
  FCod_Tecnico := Value;
end;

procedure TFuncoes.setContaBcoCredito(const Value: Integer);
begin
  FContaBcoCredito := Value;
end;

procedure TFuncoes.setContaBcoDebito(const Value: Integer);
begin
  FContaBcoDebito := Value;
end;

procedure TFuncoes.setControlaLimite(Value: Boolean);
begin

end;

procedure TFuncoes.setDiasDepositoCredito(const Value: Integer);
begin
  FDiasDepositoCredito := Value;
end;

procedure TFuncoes.setDiasDepositoDebito(const Value: Integer);
begin
  FDiasDepositoDebito := Value;
end;

procedure TFuncoes.setDt_Agendamento(const Value: String);
begin
  FDt_Agendamento := Value;
end;

procedure TFuncoes.setDt_Cadastro(const Value: String);
begin
  FDt_Cadastro := Value;
end;

procedure TFuncoes.setDt_Entrega(const Value: String);
begin
  FDt_Entrega := Value;
end;

procedure TFuncoes.setDt_Instalacao(const Value: String);
begin
  FDt_Instalacao := Value;
end;

procedure TFuncoes.setEmiteReciboPagtoParc(const Value: Boolean);
begin
  FEmiteReciboPagtoParc := Value;
end;

procedure TFuncoes.setEmpresaMatriz(const Value: Boolean);
begin
  FEmpresaMatriz := Value;
end;

procedure TFuncoes.setEquipamento(const Value: String);
begin
  FEquipamento := Value;
end;

procedure TFuncoes.setEstoqueNegativo(Value: Integer);
begin
  FEstoqueNegativo := (Value = 1);
end;

procedure TFuncoes.setFornecCartaoDeb(const Value: Integer);
begin
  FFornecCartaoDeb := Value;
end;

procedure TFuncoes.setFiltrarPlanoContasPAI(const Value: Boolean);
begin
  FFiltrarPlanoContasPAI := Value;
end;

procedure TFuncoes.setForcaReagenda(Value: Integer);
begin
  FForcaReagendaOS := (Value = 1);
end;

procedure TFuncoes.setFornecCartaoCred(const Value: Integer);
begin
  FFornecCartaoCred := Value;
end;

procedure TFuncoes.setFornecedor(const Value: String);
begin
  FFornecedor := Value;
end;

procedure TFuncoes.setFree(const Value: Boolean);
begin
  FFree := Value;
end;

procedure TFuncoes.setGarantia(const Value: String);
begin
  FGarantia := Value;
end;

procedure TFuncoes.setGrupo_Equipamento(const Value: String);
begin
  FGrupo_Equipamento := Value;
end;

procedure TFuncoes.setGrupo_Pecas_Servicos(const Value: String);
begin
  FGrupo_Pecas_Servicos := Value;
end;

procedure TFuncoes.setHr_Almoco_Fim(const Value: String);
begin
  FHr_Almoco_Fim := Value;
end;

procedure TFuncoes.setHr_Almoco_Inicio(const Value: String);
begin
  FHr_Almoco_Inicio := Value;
end;

procedure TFuncoes.setHr_Inicio(const Value: String);
begin
  FHr_Inicio := Value;
end;

procedure TFuncoes.setHr_Intervalo(const Value: String);
begin
  FHr_Intervalo := Value;
end;

procedure TFuncoes.setHr_Termino(const Value: String);
begin
  FHr_Termino := Value;
end;

procedure TFuncoes.setInformeFornecEquip(const Value: Boolean);
begin
  FInformeFornecEquip := Value;
end;

procedure TFuncoes.setIntegraClientes(const Value: Boolean);
begin
  FIntegraClientes := Value;
end;

procedure TFuncoes.setIntegraProdutos(const Value: Boolean);
begin
  FIntegraProdutos := Value;
end;

procedure TFuncoes.setJuro(Value: Real);
begin
  FJuro := Value;
end;

procedure TFuncoes.SetLicenca(intPos, intValue: Integer);
begin
  FLicenca[intPos] := intValue;
end;

procedure TFuncoes.setLimitadoListaDeProf(const Value: Boolean);
begin
  FLimitadoListaDeProf := Value;
end;

procedure TFuncoes.setLimitarProfNoSistema(const Value: Boolean);
begin
  FLimitarProfNoSistema := value;
end;

procedure TFuncoes.setMarca(const Value: String);
begin
  FMarca := Value;
end;

procedure TFuncoes.setMensagemRodapeOS(const Value: Integer);
begin
  FMensagemRodapeOS := Value;
end;

procedure TFuncoes.setModelo(const Value: String);
begin
  FModelo := Value
end;

procedure TFuncoes.setMora(Value: Real);
begin
  FMora := Value;
end;

procedure TFuncoes.setNovoPadraoTelefone(const Value: Boolean);
begin
  FNovoPadraoTelefone := Value;
end;

procedure TFuncoes.setNrPedido(const Value: String);
begin
  FNrPedido := Value;
end;

procedure TFuncoes.setOcultarClientes(const Value: Boolean);
begin
  FOcultarClientes := Value;
end;

procedure TFuncoes.setOptanteSimples(const Value: Boolean);
begin
  FOptanteSimples := Value;
end;

procedure TFuncoes.setPercentRenda(Value: Real);
begin
  FPercentRenda := Value;
end;

procedure TFuncoes.setPercFundoReserva(const Value: Real);
begin
  FPercFundoReserva := Value;
end;

procedure TFuncoes.setPercReservaEstatutarias(const Value: Real);
begin
  FPercReservaEstatutarias := Value;
end;

procedure TFuncoes.setPercReservaLegal(const Value: Real);
begin
  FPercReservaLegal := Value
end;

procedure TFuncoes.setPercReservaLucro(const Value: Real);
begin
  FPercReservaLucro := Value;
end;

procedure TFuncoes.setPeriodoReagendamento(const Value: Integer);
begin
  FPeriodoReagendamento := Value;
end;

procedure TFuncoes.SetPermissao(intUSRM_ID: Integer);
begin
  FPermissoes[intUSRM_ID] := intUSRM_ID;
end;

procedure TFuncoes.setPrivado(const Value: Boolean);
begin
  FPrivado := Value;
end;

procedure TFuncoes.setReagendaOS(Value: Integer);
begin
  FReagendaOS := (Value = 1);
end;

procedure TFuncoes.setReplicClienteFornecedor(const Value: Boolean);
begin
  FReplicClienteFornecedor := Value;
end;

procedure TFuncoes.setReportaErro(Value: Integer);
begin
  FReportaError := (Value = 1);
end;

procedure TFuncoes.setSemAnuncio(const Value: Boolean);
begin
  FSemAnuncio := Value;
end;

procedure TFuncoes.setSepararTeleAtendimento(const Value: Boolean);
begin
  FSepararTeleAtendimento := Value;
end;

procedure TFuncoes.setSolicitaNrTransCartao(const Value: Boolean);
begin
  FSolicitaNrTransCartao := Value;
end;

procedure TFuncoes.setTabPrecoPadrao(Value: Integer);
begin
  FTabPrecoPadrao := Value;
end;

procedure TFuncoes.setTaxaCredito(const Value: Real);
begin
  FTaxaCredito := Value;
end;

procedure TFuncoes.setTaxaDebito(const Value: Real);
begin
  FTaxaDebito := Value;
end;

procedure TFuncoes.setTecnico(const Value: String);
begin
  FTecnico := value;
end;

procedure TFuncoes.setTipoEmpresa(const Value: Integer);
begin
  FTipoEmpresa := Value;
end;

procedure TFuncoes.setTipoMenu(const Value: Integer);
begin
  FTipoMenu := Se((Value = 1) or (Value = 2),Value,2);
end;

procedure TFuncoes.setTrabNrPedido(const Value: Boolean);
begin
  FTrabNrPedido := Value
end;

procedure TFuncoes.setTrabStatusOS(const Value: Boolean);
begin
  FTrabStatusOS := Value;
end;

procedure TFuncoes.setTrabTipoAgendamento(const Value: Boolean);
begin
  FTrabTipoAgendamento := Value;
end;

procedure TFuncoes.setUnidade(const Value: String);
begin
  FUnidade := Value;
end;

procedure TFuncoes.setVersionSystem(Value: Integer);
begin
  FVersionSystem := Value;
end;

procedure TFuncoes.setVinculaCartaoCredito(const Value: Boolean);
begin
  FVinculaCartaoCredito := Value;
end;

procedure TFuncoes.setVisualFinanc(Value: Integer);
begin
  FVisualFinanc := (Value = 1);
end;

procedure TFuncoes.setVlrMetaAno(Value: Real);
begin
  FValorMetaAno := Value;
end;

function TFuncoes.SoNumeros(strTMP: String): String;
var
  intI : Integer;
begin
  Result := '';
  if Length(strTMP) <= 0 then Exit;
  for intI := 0 to Length(strTMP) do begin
    if (CharInSet(strTMP[intI],['0'..'9'])) then begin
      Result := Result + strTMP[intI];
    end;
  end;
end;

function TFuncoes.StartCommit : Boolean;
begin
  Result := true;
  try
    if (not Conexao.InTransaction) then begin
      Transact.TransactionID  := 1;
      Transact.IsolationLevel := xilREADCOMMITTED;
    end;
    Conexao.StartTransaction(Transact);
  except
    Result := false;
  end;
end;

procedure TFuncoes.CarregaDadosEmpresa;
var
  qryCons : TSQLQuery;
  BS      : TStream;
  bmpIMG  : TBitmap;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT');
      sql.Add('	      EP.EMPR_ID,');
      sql.Add('       EP.EMPR_RAZAO_SOCIAL,');
      sql.Add('       EP.EMPR_NOME_FANTASIA,');
      sql.Add('       EP.EMPR_ENDERECO,');
      sql.Add('       EP.EMPR_BAIRRO,');
      sql.Add('       CD.GENE_DESCR AS CIDADE,');
      sql.Add('       CD.GENE_PAR1  AS UF,');
      sql.Add('       EP.EMPR_CEP,');
      sql.Add('       EP.EMPR_CNPJ,');
      sql.Add('       EP.EMPR_IE,');
      sql.Add('       EP.EMPR_TELEFONE,');
      sql.Add('       EP.EMPR_FAX,');
      sql.Add('       EP.EMPR_LOGOTIPO');
      sql.Add('  FROM EMPRESAS EP');
      sql.Add(' INNER JOIN GENERICA CD');
      sql.Add('    ON (CD.GENE_EMPR_ID = EP.EMPR_GENE_EMPR_ID_PRACA');
      sql.Add('   AND CD.GENE_TGEN_ID  = EP.EMPR_GENE_TGEN_ID_PRACA');
      sql.Add('   AND CD.GENE_ID       = EP.EMPR_GENE_ID_PRACA)');
      sql.Add(' WHERE EP.EMPR_ATIVO    = 1');
      sql.Add('   AND EP.EMPR_ID       = :EMPR_ID');
      Params.ParamByName('EMPR_ID').AsInteger := Empr_ID;
      Open;
      Empr_Razao    := FieldByName('EMPR_RAZAO_SOCIAL').AsString;
      Empr_Fantasia := FieldByName('EMPR_NOME_FANTASIA').AsString;
      Empr_Endereco := FieldByName('EMPR_ENDERECO').AsString;
      Empr_Bairro   := FieldByName('EMPR_BAIRRO').AsString;
      Empr_Cidade   := FieldByName('CIDADE').AsString;
      Empr_UF       := FieldByName('UF').AsString;
      Empr_CEP      := FieldByName('EMPR_CEP').AsString;
      Empr_CNPJ     := FieldByName('EMPR_CNPJ').AsString;
      Empr_IE       := FieldByName('EMPR_IE').AsString;
      Empr_Telefone := FieldByName('EMPR_TELEFONE').AsString;
      Empr_Fax      := FieldByName('EMPR_FAX').AsString;
      try
        try
          bmpIMG := TBitmap.Create;
          BS := qryCons.CreateBlobStream(qryCons.FieldByName('EMPR_LOGOTIPO'),bmRead);
          if BS.Size > 0 then begin
            bmpIMG.LoadFromStream(BS);
            if FileExists(ExtractFileDir(ParamStr(0))+'\imgLogo.bmp') then
              DeleteFile(PChar(ExtractFileDir(ParamStr(0))+'\imgLogo.bmp'));
            bmpIMG.SaveToFile(ExtractFileDir(ParamStr(0))+'\imgLogo.bmp');
          end;
        except
        end;
      finally
        FreeAndNil(bmpIMG);
        FreeAndNil(BS);
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TFuncoes.CarregaInfoOrdemServico(strEmpr_ID : String = '');
var
  qryCons : TSQLQuery;
begin
  try
    if strEmpr_ID = '' then begin
      strEmpr_ID := IntToStr(Empr_ID);
    end;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      CFOS_FCOD_EQUIP,');            //0
        sql.Add('      CFOS_FEQUIPAMENTO,');          //1
        sql.Add('      CFOS_FUNIDADE,');              //2
        sql.Add('      CFOS_FMARCA,');                //3
        sql.Add('      CFOS_FMODELO,');               //4
        sql.Add('      CFOS_FGARANTIA,');             //5
        sql.Add('      CFOS_FNRPEDIDO,');             //6
        sql.Add('      CFOS_FCOD_FORNECEDOR,');       //7
        sql.Add('      CFOS_FFORNECEDOR,');           //8
        sql.Add('      CFOS_FCOD_TECNICO,');          //9
        sql.Add('      CFOS_FTECNICO,');              //10
        sql.Add('      CFOS_FDTCADASTRO,');           //11
        sql.Add('      CFOS_FDTINSTALACAO,');         //12
        sql.Add('      CFOS_FDTENTREGA,');            //13
        sql.Add('      CFOS_FGRUPO_EQUIP,');          //14
        sql.Add('      CFOS_FGRUPO_PECAS_SERVICOS,'); //15
        sql.Add('      CFOS_FDTAGENDAMENTO,');        //16
        sql.Add('      CFOS_DIAS_REAGENDAMENTO,');    //17
        sql.Add('      CFOS_MENSAGEM_RODAPE,');       //18
        sql.Add('      COALESCE(CFOS_USER_ID_TEC_OS,0)'); //19
        sql.Add('FROM  CONF_ORDEM_SERVICO');
        sql.Add('WHERE CFOS_EMPR_ID      = ' + strEmpr_ID);
        sql.Add('AND   CFOS_CSIS_EMPR_ID = ' + strEmpr_ID);
        Open;
        if not IsEmpty then begin
          setCod_Equip(qryCons.Fields[0].AsString);
          setEquipamento(qryCons.Fields[1].AsString);
          setUnidade(qryCons.Fields[2].AsString);
          setMarca(qryCons.Fields[3].AsString);
          setModelo(qryCons.Fields[4].AsString);
          setGarantia(qryCons.Fields[5].AsString);
          setNrPedido(qryCons.Fields[6].AsString);
          setCod_Fornecedor(qryCons.Fields[7].AsString);
          setFornecedor(qryCons.Fields[8].AsString);
          setCod_Tecnico(qryCons.Fields[9].AsString);
          setTecnico(qryCons.Fields[10].AsString);
          setDt_Cadastro(qryCons.Fields[11].AsString);
          setDt_Instalacao(qryCons.Fields[12].AsString);
          setDt_Entrega(qryCons.Fields[13].AsString);
          setGrupo_Equipamento(qryCons.Fields[14].AsString);
          setGrupo_Pecas_Servicos(qryCons.Fields[15].AsString);
          setDt_Agendamento(qryCons.Fields[16].AsString);
          setPeriodoReagendamento(qryCons.Fields[17].AsInteger);
          setMensagemRodapeOS(qryCons.Fields[18].AsInteger);
          setCodUserIDTecOS(qryCons.Fields[19].AsInteger);
        end;
      end;
    except on e: exception do begin
      Alerta('Erro no processo de carregamento das informações da ordem de serviço.'+#13+'['+e.Message+']',1);
      ReportaErro('TFuncoes','CarregaInfoOrdemServico',e.Message);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TFuncoes.CarregaPermissoesUsuario;
var
  qryCons : TSQLQuery;
begin
  try
//    ShowMessage('');
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      USRM_MENU_ID');
        sql.Add('FROM  USUARIO_M');
        sql.Add('WHERE USRM_USER_ID = ' + IntToStr(User_ID));
        sql.Add('AND   USRM_EMPR_ID = ' + IntToStr(Empr_ID));
        sql.Add('ORDER BY');
        sql.Add('      USRM_MENU_ID');
        Open;
        First;
        while not eof do begin
          SetPermissao(qryCons.Fields[0].AsInteger);
          Next;
        end;
      end;
    except on e: exception do begin
      ReportaErro('TFuncoes','CarregaPermissoesUsuario',e.Message);
      Alerta('Erro no processo de leitura das permissões do usuário logado.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.Commit : Boolean;
begin
  Result := true;
  try
    Conexao.Commit(Transact);
  except
    Conexao.Rollback(Transact);
    Result := false;
  end;
end;

function TFuncoes.DataServidor(DB: TSQLConnection = nil; boolHora: Boolean = false): TDateTime;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := Date;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT CURRENT_TIMESTAMP FROM RDB$DATABASE');
        Open;
        //Verifica se requer a hora do servidor tambem
        if boolHora then
          Result := StrToDateTime(FormatDateTime('dd/mm/yyyy hh:mm:ss',qryCons.Fields[0].Value))
        else Result := StrToDateTime(FormatDateTime('dd/mm/yyyy',qryCons.Fields[0].Value));
      end;
    except on e: exception do begin
      ReportaErro('TFuncoes','DataServidor',e.Message);
      Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.DeletaRegistro(Nome_Tabela, strCodigo, strRelacaoTabela : String) : Boolean;
var
  qryCons,
  qryConsII,
  qryConsIII : TSQLQuery;
begin
  try
    Result  := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      RDB$RELATION_NAME,');
        sql.Add('      RDB$INDEX_NAME');
        sql.Add('FROM  RDB$INDICES');
        sql.Add('WHERE RDB$FOREIGN_KEY IN (SELECT');
        sql.Add('                                RDB$INDEX_NAME');
        sql.Add('                          FROM  RDB$RELATION_CONSTRAINTS');
        sql.Add('                          WHERE RDB$RELATION_NAME   = ' + QuotedStr(Nome_Tabela));
        sql.Add('                          AND   RDB$CONSTRAINT_TYPE = ' + QuotedStr('PRIMARY KEY') + ')');
        Open;
        if not IsEmpty then begin
          First;
          qryConsII := TSQLQuery.Create(nil);
          qryConsII.SQLConnection := Conexao;
          while not qryCons.Eof do begin
            if TableNoPermision(Trim(qryCons.Fields[0].AsString),strRelacaoTabela) then begin
              with qryConsII do begin
                Close;
                sql.Clear;
                sql.Add('SELECT');
                sql.Add('      RDB$FIELD_NAME');
                sql.Add('FROM  RDB$INDEX_SEGMENTS');
                sql.Add('WHERE (RDB$INDEX_NAME = ' + QuotedStr(Trim(qryCons.Fields[1].AsString)) + ')');
                Open;
                if not IsEmpty then begin
                  First;
                  qryConsIII := TSQLQuery.Create(nil);
                  qryConsIII.SQLConnection := Conexao;
                  while not qryConsII.Eof do begin
                    with qryConsIII do begin
                      Close;
                      sql.Clear;
                      sql.Add('SELECT');
                      sql.Add('      COUNT(*)');
                      sql.Add('FROM');
                      sql.Add(Trim(qryCons.Fields[0].AsString));
                      sql.Add('WHERE ' + Trim(qryConsII.Fields[0].AsString) + ' = ' +
                      QuotedStr(Trim(strCodigo)));
                      Open;
                      if qryConsIII.Fields[0].AsInteger > 0 then begin
                        Result := true;
                        Exit;
                      end;
                    end;
                    Next;
                  end;
                end;
              end;
            end;
            Next;
          end;
        end else Result := false;
      end;
    except on e: exception do begin
      ReportaErro('TFuncoes','DeletaRegistro',e.Message);
      Alerta('Erro no processo de validação do registro para exclusão.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.RetornaListadeProfissionaisBloqueados() : String;
var
  qryCons : TSQLQuery;
  strTMP  : String;
begin
  Result := '0';
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT USPR_USER_ID_PROFISSIONAL');
      sql.Add('  FROM USUARIO_PROFISSIONAIS');
      sql.Add(' WHERE USPR_USER_ID_USUARIO = :USER_ID');
      Params.ParamByName('USER_ID').AsInteger := User_ID;
      Open;
      if IsEmpty then Exit;
      First;
      strTMP := '';
      while not Eof do begin
        strTMP := strTMP + FormatFloat('000000',FieldByName('USPR_USER_ID_PROFISSIONAL').AsInteger) +',';
        Next;
      end;
      strTMP := Copy(strTMP,1,length(strTMP)-1);
    end;
    Result := strTMP;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.TableNoPermision(strTable, strRelacaoTabela : String) : Boolean;
begin
  if strRelacaoTabela <> '' then begin
    if Pos(strTable,strRelacaoTabela) > 0 then
      Result      := false
    else Result   := true;
  end else Result := true;
end;

procedure TFuncoes.UnPrintLabel(Sender: TObject);
begin
  with (Sender as TLabel) do begin
    Font.Style := [];
    Font.Color := clBlack;
    Cursor     := crDefault;
  end;
end;

function TFuncoes.Criptografar2(wStri: String): String;
var
  SimbolosI,
  SimbolosII : String;
  intI       : Integer;
begin            //00.071.488/8631-72;10/02/2015
  SimbolosI  := 'ABCDEF1234567890/;-.';
  SimbolosII := '.-;/0987654321FEDCBA';
  Result     := '';
  for intI := 1 to Length(wStri) do begin
    Result := Result + Copy(SimbolosII,Pos(Copy(wStri,intI,1),SimbolosI),1);
  end;
end;

function TFuncoes.Criptografar(wStri: String): String;
var
  Simbolos : array [0..4] of String;
  x : Integer;
begin
  Simbolos[1] := 'ABCDEFGHIJLMNOPQRSTUVXZYWKÇ ~!@#$%^&*()\';
  Simbolos[2] := 'ÂÀ©Øû×ƒçêùÿ5Üø£úñÑªº¿®¬¼ëèïÙýÄÅÉæÆôöò»Á';
  Simbolos[3] := 'abcdefghijlmnopqrstuvxzywkç1234567890';
  Simbolos[4] := 'áâäàåíóüé¾¶§÷ÎÏ-+ÌÓß¸°¨·¹³²Õµþîì¡«½';
  for x := 1 to Length(Trim(wStri)) do begin
    if pos(copy(wStri,x,1),Simbolos[1])>0 then
      Result := Result+copy(Simbolos[2],pos(copy(wStri,x,1),Simbolos[1]),1)
    else if pos(copy(wStri,x,1),Simbolos[2])>0 then
      Result := Result+copy(Simbolos[1],pos(copy(wStri,x,1),Simbolos[2]),1)
    else if pos(copy(wStri,x,1),Simbolos[3])>0 then
      Result := Result+copy(Simbolos[4],pos(copy(wStri,x,1),Simbolos[3]),1)
    else if pos(copy(wStri,x,1),Simbolos[4])>0 then
      Result := Result+copy(Simbolos[3],pos(copy(wStri,x,1),Simbolos[4]),1);
  end;
end;

function TFuncoes.Alerta(sStr : String; nTipo : Integer = 0; YesNo : Boolean = False) : Integer;
{nTp = 0 - Alerta de Informação
 nTp = 1 - Alerta de Cuidado
 nTp = 2 - Alerta Crítico}
var sAPP:String;
begin
  sAPP := 'AR Sistemas e Consultoria Ltda';
  Result := 0;
  with Application do begin
    NormalizeTopMosts;
    case nTipo of
      1: if YesNo then
           Result    := MessageBox(PChar(sStr),PChar(sAPP), MB_YESNO + MB_ICONINFORMATION)
         else Result := MessageBox(PChar(sStr),PChar(sAPP), MB_OK + MB_ICONINFORMATION);
      0: if YesNo then
           Result    := MessageBox(PChar(sStr),PChar(sAPP), MB_YESNO + MB_ICONWARNING)
         else Result := MessageBox(PChar(sStr),PChar(sAPP), MB_OK + MB_ICONWARNING);
      2: if YesNo then
           Result    := MessageBox(PChar(sStr),PChar(sAPP), MB_YESNO + MB_ICONERROR)
         else Result := MessageBox(PChar(sStr),PChar(sAPP), MB_OK + MB_ICONERROR);
    end;
    RestoreTopMosts;
  end;
end;

procedure TFuncoes.DescarregarPacote(frmClass: String);
var
  intHandle : Integer;
begin
  //intHandle := 0;
  try
    intHandle := FindWindow(PWideChar(frmClass),nil);
    while intHandle <> 0 do
      UnloadPackage(intHandle);
  except
  end;
end;

function TFuncoes.AlteraTitulos(strCodigo, strValue : String; strTipo : Char;
  strConta : Char = 'P') : Boolean;
begin
  try
    Result := true;
    try
      qryConsSQL := TSQLQuery.Create(nil);
      qryConsSQL.SQLConnection := Conexao;
      with qryConsSQL do begin
        Close;
        sql.Clear;
        case Char(strConta) of
          'P' : begin
            sql.Add('UPDATE CONTAS_PAGAR');
            case Char(strTipo) of
              'P' : sql.Add('SET CPAG_PLCT_ID = ' + strValue);
              'C' : SQL.Add('SET CPAG_CBCO_ID = ' + strValue);
              'F' : SQL.Add('SET CPAG_FORN_ID = ' + strValue);
            end;
            SQL.Add('WHERE CPAG_ID     IN ('+strCodigo+')');
            SQL.Add('  AND CPAG_EMPR_ID = ' + IntToStr(Empr_ID));
          end;
          'R' : begin
            SQL.Add('UPDATE CONTAS_RECEBER');
            case Char(strTipo) of
              'P' : sql.Add('SET CREC_PLCT_ID = ' + strValue);
              'C' : SQL.Add('SET CREC_CBCO_ID = ' + strValue);
              'F' : SQL.Add('SET CREC_CLIE_ID = ' + strValue);
            end;
            SQL.Add('WHERE CREC_ID     IN ('+strCodigo+')');
            SQL.Add('  AND CREC_EMPR_ID = ' + IntToStr(Empr_ID));
          end;
        end;
        ExecSQL();
        Close;
      end;
    except on e: exception do begin
      Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
             'Erro no processo de alteração do(s) título(s) selecionado(s).'+#13+#13+
             '['+e.Message+']',0);
      Result := false;
    end; end;
  finally
    qryConsSQL.Close;
    FreeAndNil(qryConsSQL);
  end;
end;

function TFuncoes.BuscarEmprBCO(CBCO_ID : String) : Integer;
var
  qryCons : TSQLQuery;
begin
  Result := Empr_ID;

  if Trim(CBCO_ID) = '' then Exit;

  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add(Format( 'SELECT CBCO_EMPR_ID FROM CONTAS_BANCARIAS FROM CBCO_ID = %S ',[CBCO_ID]));
        Open;
        Result := qryCons.Fields[0].AsInteger;
      end;
    except
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.AtualizaDtaVectoTitulos(strID, strDias : String; strOrig : Char = 'P') : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          StartCommit
        except
        end;
        case strOrig of
          'P' : begin ///Contas Pagar
            sql.Add('UPDATE CONTAS_PAGAR');
            sql.Add('SET    CPAG_DTA_VCTO  = (CPAG_DTA_VCTO + ' + strDias + ')');
            sql.Add('WHERE  CPAG_ID       IN ('+strID+')');
            sql.Add('AND    CPAG_EMPR_ID   = ' + IntToStr(Empr_ID));
          end;
          'R' : begin ///Contas Receber
            sql.Add('UPDATE CONTAS_RECEBER');
            sql.Add('SET    CREC_DTA_VCTO  = (CREC_DTA_VCTO + ' + strDias + ')');
            sql.Add('WHERE  CREC_ID       IN ('+strID+')');
            sql.Add('AND    CREC_EMPR_ID   = ' + IntToStr(Empr_ID));
          end;
        end;
        ExecSQL;
        try
          Commit
        except
        end;
      end;
    except on e: exception do begin
      RollBack;
      Alerta('Erro no processo de alteração da data de vencimento dos títulos.'+#13+'['+e.Message+']',1);
      ReportaErro('TFuncoes','AtualizaValorTitulos',e.Message);
      Result := false;
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

function TFuncoes.AtualizarPrevisaoTitulos(strID : String; strOrig: Char = 'P'): Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          StartCommit
        except
        end;
        case strOrig of
          'P' : begin ///Contas Pagar
            sql.Add('UPDATE CONTAS_PAGAR');
            sql.Add('SET    CPAG_PREVISAO  = (CASE CPAG_PREVISAO');
            sql.Add('                             WHEN 1 THEN 0');
            sql.Add('                             WHEN 0 THEN 1');
            sql.Add('                             ELSE 0');
            sql.Add('                          END)');
            sql.Add('WHERE  CPAG_ID       IN ('+strID+')');
            sql.Add('AND    CPAG_EMPR_ID   = ' + IntToStr(Empr_ID));
          end;
          'R' : begin ///Contas Receber
            sql.Add('UPDATE CONTAS_RECEBER');
            sql.Add('SET    CREC_PREVISAO  = (CASE CREC_PREVISAO');
            sql.Add('                             WHEN 1 THEN 0');
            sql.Add('                             WHEN 0 THEN 1');
            sql.Add('                             ELSE 0');
            sql.Add('                         END)');
            sql.Add('WHERE  CREC_ID       IN ('+strID+')');
            sql.Add('AND    CREC_EMPR_ID   = ' + IntToStr(Empr_ID));
          end;
        end;
        ExecSQL;
        try
          Commit
        except
        end;
      end;
    except on e: exception do begin
      RollBack;
      Alerta('Erro no processo de reverte posição dos títulos.'+#13+'['+e.Message+']',1);
      ReportaErro('TFuncoes','AtualizarPrevisaoTitulos',e.Message);
      Result := false;
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TFuncoes.AtualizarSQL(strTabela          : String;
                                arrayCamposUpdate,
                                arrayChavesWhere   : Array of String;
                                arrayValoresUpdate,
                                arrayValoresWhere  : Array of Variant);
var
  qryCons : TSQLQuery;
  intI    : Integer;
  boolPri : Boolean;
begin
  try
    boolPri := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    FormatSettings.DecimalSeparator := '.';
    try
      StartCommit;
      with qryCons do begin
        Close;
        sql.Clear;
        ///Cabeçalho da instrução SQL
        sql.Add('UPDATE ' + strTabela + ' SET ');

        ///Passagem dos campos da instrução
        for intI := Low(arrayCamposUpdate) to High(arrayCamposUpdate) do begin
          sql.Add(Se(boolPri,'',',') + arrayCamposUpdate[intI] + ' = :' + arrayCamposUpdate[intI]);
          boolPri := false;
        end;
        ///Fim da passagem dos campos

        sql.Add(' WHERE ');

        ///Passagem dos parametros
        boolPri := true;
        for intI := Low(arrayChavesWhere) to High(arrayChavesWhere) do begin
          sql.Add(Se(boolPri,'',' AND ') + arrayChavesWhere[intI] + ' = :' + arrayChavesWhere[intI]);
          boolPri := false;
        end;
        ///Fim da passagem dos parametros

        ///Passagem dos valores do Update
        for intI := Low(arrayValoresUpdate) to High(arrayValoresUpdate) do begin
          ParamByName(arrayCamposUpdate[intI]).Value := arrayValoresUpdate[intI];
        end;
        ///Fim da passagem dos valores Update

        ///Passagem Valores dos parametros
        for intI := Low(arrayValoresWhere) to High(arrayValoresWhere) do begin
          ParamByName(arrayChavesWhere[intI]).Value := arrayValoresWhere[intI];
        end;
        ///Fim da passagem dos valores dos parametros
        ExecSQL();
      end;
      Commit;
    except on e: exception do begin
      Alerta('Erro no processo de Atualização automática!'+#13+#13+'['+e.Message+']',1);
      ReportaErro('TFuncoes','AtualizarSQL:'+strTabela,e.Message);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

function TFuncoes.AtualizaValorTitulos(strID, strValor: String; strOrig : Char = 'P'): Boolean;
var
  qryCons : TSQLQuery;
  fltTMP  : Real;
begin
  try
    Result  := true;
    fltTMP  := StrToFloat(strValor);
    FormatSettings.DecimalSeparator := '.';
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          StartCommit
        except
        end;
        case strOrig of
          'P' : begin ///Contas Pagar
            sql.Add('UPDATE CONTAS_PAGAR');
            sql.Add('SET    CPAG_VALOR_DOC = ' + FormatFloat('0.00',fltTMP));
            sql.Add('WHERE  CPAG_ID       IN ('+strID+')');
            sql.Add('AND    CPAG_EMPR_ID   = ' + IntToStr(Empr_ID));
          end;
          'R' : begin ///Contas Receber
            sql.Add('UPDATE CONTAS_RECEBER');
            sql.Add('SET    CREC_VALOR_DOC = ' + FormatFloat('0.00',fltTMP));
            sql.Add('WHERE  CREC_ID       IN ('+strID+')');
            sql.Add('AND    CREC_EMPR_ID   = ' + IntToStr(Empr_ID));
          end;
        end;
        ExecSQL;
        try
          Commit
        except
        end;
      end;
    except on e: exception do begin
      RollBack;
      Alerta('Erro no processo de alteração no valor dos títulos.'+#13+'['+e.Message+']',1);
      ReportaErro('TFuncoes','AtualizaValorTitulos',e.Message);
      Result := false;
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TFuncoes.BaixarContaReceberPrevisto(dtDTA_VCTO : TDateTime; fltVALOR_DOC : Real; strPLCT_ID : String; strOrigem : String = 'CP');
var
  qryCons : TSQLQuery;
  Dia, Mes, Ano : Word;
  DiaOld, MesOld, AnoOld : Word;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    DecodeDate(dtDTA_VCTO,Ano,Mes,Dia);
    DecodeDate(DataServidor(),AnoOld,MesOld,DiaOld);
    if (Mes = MesOld) and (Ano = AnoOld) then Exit;
    with qryCons do begin
      Close;
      sql.Clear;
      ///Atualiza o valor da previsao
      if Trim(strOrigem) = 'CR' then begin
        sql.Add('UPDATE CONTAS_RECEBER');
        sql.Add('   SET CREC_VALOR_DOC = CREC_VALOR_DOC + ( ' + StringReplace(StringReplace(FloatToStr(fltVALOR_DOC),'.','',[]),',','.',[])+')');
        sql.Add(' WHERE CREC_EMPR_ID                      = ' + IntToStr(Empr_ID));
        sql.Add('   AND EXTRACT(MONTH FROM CREC_DTA_VCTO) = ' + IntToStr(Mes));
        sql.Add('   AND EXTRACT(YEAR  FROM CREC_DTA_VCTO) = ' + IntToStr(Ano));
        sql.Add('   AND CREC_PLCT_ID                      = ' + strPLCT_ID);
        sql.Add('   AND CREC_PREVISAO                     = 1');
      end else begin
        sql.Add('UPDATE CONTAS_PAGAR');
        sql.Add('   SET CPAG_VALOR_DOC = CPAG_VALOR_DOC + ( ' + StringReplace(StringReplace(FloatToStr(fltVALOR_DOC),'.','',[]),',','.',[])+')');
        sql.Add(' WHERE CPAG_EMPR_ID                      = ' + IntToStr(Empr_ID));
        sql.Add('   AND EXTRACT(MONTH FROM CPAG_DTA_VCTO) = ' + IntToStr(Mes));
        sql.Add('   AND EXTRACT(YEAR  FROM CPAG_DTA_VCTO) = ' + IntToStr(Ano));
        sql.Add('   AND CPAG_PLCT_ID                      = ' + strPLCT_ID);
        sql.Add('   AND CPAG_PREVISAO                     = 1');
      end;
      ExecSQL();

      sql.Clear;
      ///Verifica se a previsa zerou
      if Trim(strOrigem) = 'CR' then begin
        sql.Add('SELECT COALESCE(CREC_VALOR_DOC,0) AS VALOR');
        sql.Add('  FROM CONTAS_RECEBER');
        sql.Add(' WHERE CREC_EMPR_ID                      = ' + IntToStr(Empr_ID));
        sql.Add('   AND EXTRACT(MONTH FROM CREC_DTA_VCTO) = ' + IntToStr(Mes));
        sql.Add('   AND EXTRACT(YEAR  FROM CREC_DTA_VCTO) = ' + IntToStr(Ano));
        sql.Add('   AND CREC_PLCT_ID                      = ' + strPLCT_ID);
        sql.Add('   AND CREC_PREVISAO                     = 1');
      end else begin
        sql.Add('SELECT COALESCE(CPAG_VALOR_DOC,0) AS VALOR');
        sql.Add('  FROM CONTAS_PAGAR');
        sql.Add(' WHERE CPAG_EMPR_ID                      = ' + IntToStr(Empr_ID));
        sql.Add('   AND EXTRACT(MONTH FROM CPAG_DTA_VCTO) = ' + IntToStr(Mes));
        sql.Add('   AND EXTRACT(YEAR  FROM CPAG_DTA_VCTO) = ' + IntToStr(Ano));
        sql.Add('   AND CPAG_PLCT_ID                      = ' + strPLCT_ID);
        sql.Add('   AND CPAG_PREVISAO                     = 1');
      end;
      Open;
      ///Se estiver Zerada cancela o titulo
      if FieldByName('VALOR').AsFloat <= 0 then begin
        sql.Clear;
        if Trim(strOrigem) = 'CR' then begin
          sql.Add('UPDATE CONTAS_RECEBER');
          sql.Add('   SET CREC_STATUS                       = ''C''');
          sql.Add(' WHERE CREC_EMPR_ID                      = ' + IntToStr(Empr_ID));
          sql.Add('   AND EXTRACT(MONTH FROM CREC_DTA_VCTO) = ' + IntToStr(Mes));
          sql.Add('   AND EXTRACT(YEAR  FROM CREC_DTA_VCTO) = ' + IntToStr(Ano));
          sql.Add('   AND CREC_PLCT_ID                      = ' + strPLCT_ID);
          sql.Add('   AND CREC_PREVISAO                     = 1');
          sql.Add('   AND CREC_STATUS                       = ''A''');
        end else begin
          sql.Add('UPDATE CONTAS_PAGAR');
          sql.Add('   SET CPAG_STATUS                       = ''C''');
          sql.Add(' WHERE CPAG_EMPR_ID                      = ' + IntToStr(Empr_ID));
          sql.Add('   AND EXTRACT(MONTH FROM CPAG_DTA_VCTO) = ' + IntToStr(Mes));
          sql.Add('   AND EXTRACT(YEAR  FROM CPAG_DTA_VCTO) = ' + IntToStr(Ano));
          sql.Add('   AND CPAG_PLCT_ID                      = ' + strPLCT_ID);
          sql.Add('   AND CPAG_PREVISAO                     = 1');
          sql.Add('   AND CPAG_STATUS                       = ''A''');
        end;
      ///Se não estiver Zerada reabre o titulo.
      end else begin
        sql.Clear;
        if Trim(strOrigem) = 'CR' then begin
          sql.Add('UPDATE CONTAS_RECEBER');
          sql.Add('   SET CREC_STATUS                       = ''A''');
          sql.Add(' WHERE CREC_EMPR_ID                      = ' + IntToStr(Empr_ID));
          sql.Add('   AND EXTRACT(MONTH FROM CREC_DTA_VCTO) = ' + IntToStr(Mes));
          sql.Add('   AND EXTRACT(YEAR  FROM CREC_DTA_VCTO) = ' + IntToStr(Ano));
          sql.Add('   AND CREC_PLCT_ID                      = ' + strPLCT_ID);
          sql.Add('   AND CREC_PREVISAO                     = 1');
          sql.Add('   AND CREC_STATUS                       = ''C''');
        end else begin
          sql.Add('UPDATE CONTAS_PAGAR');
          sql.Add('   SET CPAG_STATUS                       = ''A''');
          sql.Add(' WHERE CPAG_EMPR_ID                      = ' + IntToStr(Empr_ID));
          sql.Add('   AND EXTRACT(MONTH FROM CPAG_DTA_VCTO) = ' + IntToStr(Mes));
          sql.Add('   AND EXTRACT(YEAR  FROM CPAG_DTA_VCTO) = ' + IntToStr(Ano));
          sql.Add('   AND CPAG_PLCT_ID                      = ' + strPLCT_ID);
          sql.Add('   AND CPAG_PREVISAO                     = 1');
          sql.Add('   AND CPAG_STATUS                       = ''C''');
        end;
      end;
      ExecSQL();
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.BoolToInt(boolValue: Boolean): Integer;
begin
  Result := Se(boolValue,1,0);
end;

function TFuncoes.Buscar_Coluna(Texto: String; Coluna: Integer; strSep : String = ';'): String;
var
  Posicao: Integer;
begin
  Texto := Texto + strSep;
  for Posicao := 1 to Coluna do begin
    Result := Copy(Texto,1,Pos(strSep,Texto)-1);
    Texto  := Copy(Texto,Pos(strSep,Texto)+1,Length(Texto));
  end;
end;

function TFuncoes.Busca_Registro(cdsGeral: TClientDataSet; strField, strParametros,
  strChaveBusca : String): String;
begin
  Try
    Application.CreateForm(TfLocaliza, fLocaliza);
    fLocaliza.cdsLocal      := cdsGeral;
    fLocaliza.strCampo      := strField;
    fLocaliza.ChaveBusca    := strChaveBusca;
    fLocaliza.CamposRetorno := strParametros;
    if strChaveBusca <> '' then begin
      fLocaliza.cdsLocal.Filtered    := false;
      fLocaliza.cdsLocal.Filter      := fLocaliza.ChaveBusca;
      fLocaliza.cdsLocal.Filtered    := true;
      if fLocaliza.cdsLocal.RecordCount = 1 then
        fLocaliza.btnOK.Click
      else if fLocaliza.cdsLocal.RecordCount > 1 then
        fLocaliza.ShowModal;
    end else fLocaliza.ShowModal;
    try
      VlrPesq := '';
    except
    end;
    Result := fLocaliza.strResult;
    fLocaliza.cdsLocal.Filtered := false;
  except on e: exception do
    Alerta('Erro no processo de pesquisa.'+#13+'['+e.Message+']',0)
  end;
  FreeAndNil(fLocaliza);
end;

function TFuncoes.Busca_Troca(strTexto, strTextoBusca,
  strTextoTroca: String): String;
var
  intI : Integer;
begin
  Result := '';
  for intI := 1 to Length(Trim(strTexto)) do begin
    if strTexto[intI] <> strTextoBusca then
      Result := Result + strTexto[intI]
    else Result := Result + strTextoTroca;
  end;
end;

function TFuncoes.Contar_Colunas(Texto : String; strPos : String = ';') : Integer;
var
  intCont ,
  intI    : Integer;
begin
  intCont  := 0;
  Texto    := Texto + strPos;
  for intI := 0 to length(Texto)-1 do begin
    if Texto[intI] = strPos then
      inc(intCont);
  end;
  result := intCont;
end;

constructor TFuncoes.create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FJanelas      := TStringList.Create;
  HandleJanelas := TStringList.Create;
end;

destructor TFuncoes.destroy;
begin
  FreeAndNil(FJanelas);
  FreeAndNil(FHandleJanelas);
  inherited destroy;
end;

{function TFuncoes.DownloadArquivo(const strOrigem, strDestino: String): Boolean;
const
  BufferSize = 1024;
var
  hSession, hURL  : HINTERNET;
  Buffer          : Array[1..BufferSize] of Byte;
  BufferLen       : DWORD;
  fTMP            : File;
  sAppName        : String;
begin
  Result    := false;
  sAppName  := ExtractFileName(Application.ExeName);
  hSession  := InternetOpen(PChar(sAppName),INTERNET_OPEN_TYPE_PRECONFIG,nil,nil,INTERNET_FLAG_NO_CACHE_WRITE);
  try
    hURL := InternetOpenUrl(hSession,PChar(strOrigem),nil,0,INTERNET_FLAG_NO_CACHE_WRITE,0);
    try
      AssignFile(fTMP,strDestino);
      Rewrite(fTMP,1);
      repeat
        InternetReadFile(hURL,@Buffer, SizeOf(Buffer),BufferLen);
        BlockWrite(fTMP,Buffer,BufferLen);
      until (BufferLen = 0);
      CloseFile(fTMP);
      Result := true;
    finally
      InternetCloseHandle(hURL);
    end;
  finally
    InternetCloseHandle(hSession)
  end;
end;}

function TFuncoes.RetornaPermissao(intPermissao : Integer) : Boolean;
begin
  Result := GetPermissao(intPermissao)
end;

{*******************************************************************************
Data:       __/__/____
Autor:      Alex Itamar Gomes
Descrição:  Metodo para realizar o registro de movimentações no caixa da empresa

Parametros:
  strPLCT_ID      = Plano de contas correspondente ao lançamento
  strTP_Mov       = Tipo de Movimentação a ser realizada
    0,6,1         = Entrada de Crédito
    0,6,2         = Saída de Crédito
    0,6,3         = Estorno de Lançamento
  strCamp1,
  strCamp2,
  strCamp3        = Campos correspondentes aos ID da tabela a ser movimentada
  strEmpr_ID_Orig,
  strTgen_ID_Orig,
  strGene_ID_Orig = Tabela Generica para identificar a movimentação de origem do
                    do título
  0,11,1          = Pedido de Venda
  0,11,2          = Contas a Receber
  0,11,3          = Contas a Pagar
  0,11,4          = Sangria de Caixa
  0,11,5          = Suprimento de Caixa
  0,11,6          = Movimentação Bancaria
  0,11,7          = Ordem de Serviço
  0,11,8          = Agenda
  floatValor      = Valor a ser registrado

Historico
Data
__/__/____      Alex Itamar Gomes     Inclusão do Cabeçalho
01/08/2010      Alex Itamar Gomes     Documentação sobre o metodo
*******************************************************************************}
function TFuncoes.LancamentoLivroCaixa(strPLCT_ID, strTP_Mov, strCamp1, strCamp2, strCamp3,
  strEmpr_ID_Orig, strTgen_ID_Orig, strGene_ID_Orig : String; floatValor : Real) : String;

{$REGION 'SaldoCaixa'}
  function SaldoCaixa : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(LCAX_VLR_LANCAMENTO),0) SALDO');
          sql.Add('FROM  LIVRO_CAIXA');
          sql.Add('WHERE LCAX_EMPR_ID = ' + IntToStr(Empr_ID));
          Open;
          if not IsEmpty then
            Result    := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        ReportaErro('Funcoes','SaldoCaixa',e.Message);
        Alerta(e.Message,1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

var
  qryCons    : TSQLQuery;
  floatSaldo : Real;
  strLCAX_ID : String;
begin
  try
    if strCamp2 = '' then
      strCamp2 := 'Null';
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    floatSaldo := SaldoCaixa;
    try
      FormatSettings.DecimalSeparator := '.';
      with qryCons do begin
        Close;
        sql.Clear;
        try
          StartCommit;
        except
        end;
        strLCAX_ID := ObterSequencia('LIVRO_CAIXA',IntToStr(Empr_ID));
        Result := strLCAX_ID;
        sql.Add('INSERT INTO LIVRO_CAIXA');
        SQL.Add('VALUES(' + strLCAX_ID        + ','
                          + IntToStr(Empr_ID) + ','
                          + strPLCT_ID        + ','
                          + '0'               + ','
                          + '0'               + ','
                          + '6'               + ','
                          + strTP_Mov         + ','
                          + strCamp1          + ','
                          + strCamp2          + ','
                          + strCamp3          + ','
                          + QuotedStr(FormatDateTime('mm/dd/yyyy',DataServidor(Conexao))) + ','
                          + FloatToStr(floatValor) + ','
                          + FloatToStr(floatSaldo + floatValor) + ','
                          + '0'  + ','
                          + '11' + ','
                          + strGene_ID_Orig + ','
                          + QuotedStr(FormatDateTime('mm/dd/yyyy',DataServidor(Conexao))) + ','
                          + IntToStr(User_ID) + ')');
          ExecSQL;
        try
          Commit;
        except
        end;
      end;
    except on e: exception do begin
      RollBack;
      ReportaErro('Funcoes','LancamentoLivroCaixa',e.Message);
      Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

function TFuncoes.EliminaCaracter(strTexto : String) : String;
var
  intI : Integer;
begin
  for intI := 1 to length(strTexto) do
    case strTexto[intI] of
      'á': strTexto[intI] := 'a';
      'é': strTexto[intI] := 'e';
      'í': strTexto[intI] := 'i';
      'ó': strTexto[intI] := 'o';
      'ú': strTexto[intI] := 'u';
      'à': strTexto[intI] := 'a';
      'è': strTexto[intI] := 'e';
      'ì': strTexto[intI] := 'i';
      'ò': strTexto[intI] := 'o';
      'ù': strTexto[intI] := 'u';
      'â': strTexto[intI] := 'a';
      'ê': strTexto[intI] := 'e';
      'î': strTexto[intI] := 'i';
      'ô': strTexto[intI] := 'o';
      'û': strTexto[intI] := 'u';
      'ä': strTexto[intI] := 'a';
      'ë': strTexto[intI] := 'e';
      'ï': strTexto[intI] := 'i';
      'ö': strTexto[intI] := 'o';
      'ü': strTexto[intI] := 'u';
      'ã': strTexto[intI] := 'a';
      'õ': strTexto[intI] := 'o';
      'ñ': strTexto[intI] := 'n';
      'ç': strTexto[intI] := 'c';
      'Á': strTexto[intI] := 'A';
      'É': strTexto[intI] := 'E';
      'Í': strTexto[intI] := 'I';
      'Ó': strTexto[intI] := 'O';
      'Ú': strTexto[intI] := 'U';
      'À': strTexto[intI] := 'A';
      'È': strTexto[intI] := 'E';
      'Ì': strTexto[intI] := 'I';
      'Ò': strTexto[intI] := 'O';
      'Ù': strTexto[intI] := 'U';
      'Â': strTexto[intI] := 'A';
      'Ê': strTexto[intI] := 'E';
      'Î': strTexto[intI] := 'I';
      'Ô': strTexto[intI] := 'O';
      'Û': strTexto[intI] := 'U';
      'Ä': strTexto[intI] := 'A';
      'Ë': strTexto[intI] := 'E';
      'Ï': strTexto[intI] := 'I';
      'Ö': strTexto[intI] := 'O';
      'Ü': strTexto[intI] := 'U';
      'Ã': strTexto[intI] := 'A';
      'Õ': strTexto[intI] := 'O';
      'Ñ': strTexto[intI] := 'N';
      'Ç': strTexto[intI] := 'C';
    end;
    Result := strTexto;
end;

function TFuncoes.EmpresasBloqueada: Boolean;
begin
  Result := False;
  Exit;
  if Result then begin
    Alerta('I M P O R T A N T E ! ! !'+#13+#13+
           'Desculpe! Está opção não está disponível a usuários FREE.'+#13+#13+
           'Procure um de nossos representantes e conheça nossas opções de licença.',0);
  end;
end;

function TFuncoes.EServidor: Boolean;
var
  strCaminho : String;
begin
  Result     := false;
  try
    strCaminho := ExtractFilePath(ParamStr(0))+'..\DataBase\';
    Result     := FileExists(strCaminho + 'UPSYSTEM.GDB') and FileExists(strCaminho+'Temp\ANONIMUS.GDB');
  except
  end;
end;

function TFuncoes.RetornaForm(strForm : String) : TForm;
var
  strTMP : String;
  intI   : Integer;
  Form   : TForm;
begin
  Result   := nil;
  for intI := 0 to Screen.FormCount - 1 do begin
    Form   := Screen.Forms[intI];
    strTMP := String(Form.ClassName);
    if strTMP = strForm then begin
      Result := Form;
      Break;
    end;
  end;
end;

function TFuncoes.FechamentoVenda(fltValor: Real;
                                  strOrigem,
                                  strCodigo  : String;
                                  intCliente : Integer): Boolean;
begin
  Result := false;
  if fltValor <= 0 then begin
    Result := true;
    Exit;
  end;
  try
    fFechamento := TfFechamento.Create(nil);
    fFechamento.ValorDebito := fltValor;
    fFechamento.Origem      := strOrigem;
    fFechamento.Codigo      := strCodigo;
    fFechamento.Cliente     := IntToStr(intCliente);
    fFechamento.DtaCadastro := DataServidor();
    fFechamento.ShowModal;
    Result := fFechamento.ModalResult=mrOk;
  finally
    FreeAndNil(fFechamento);
  end;
end;

function TFuncoes.FormAberto(strForm : String) : Boolean;
begin
  Result := (Janelas.IndexOf(strForm) <> -1);
end;

function TFuncoes.GerarFilter(cdsPesq: TClientDataSet; strTexto : String): String;

function TratarInteiro(strTMP : String) : String;
var
  boolTrue  : Boolean;
  strTXT    : String;
begin
  boolTrue := false; Result := strTMP;
  while not boolTrue do begin
    strTXT := Copy(Result,Length(Result),Length(Result));
    try
      StrToInt(strTXT);
      boolTrue := true;
    except
      Result := Copy(Result,1,Length(Result)-1);
    end;
  end;
end;

var
  strTMP    : String;
  intI      : Integer;
  strFilter : String;
  strFone   : String;
begin
  if cdsPesq = nil then Exit;
  try
    strTMP   := '';
    for intI := 0 to cdsPesq.Fields.Count - 1 do begin
      strFilter := cdsPesq.Fields[intI].Name;
      if (cdsPesq.Fields[intI].DataType in [ftInteger]) then begin
        try
          StrToInt(strTexto);
          strTMP := strTMP + cdsPesq.Fields[intI].FieldName + ' = ' + strTexto + ' OR ';
        except
        end;
      end;
      if (cdsPesq.Fields[intI].DataType in [ftFloat,ftCurrency]) then begin
        try
          StrToFloat(strTexto);
          strTMP := strTMP + cdsPesq.Fields[intI].FieldName + ' = ' + strTexto + ' OR ';
        except
        end;
      end;
      if (cdsPesq.Fields[intI].DataType = ftString) then begin
        strTMP := strTMP + cdsPesq.Fields[intI].FieldName + ' LIKE ' + QuotedStr('%'+strTexto+'%') + ' OR ';

        ///Tratando CEP
        if Pos('CEP',strFilter) > 0 then begin
          strFone := SoNumeros(strTexto);
          if Length(strFone) > 0 then begin
            strFone := Format('%s.%s-%s',[Copy(strFone,1,2),Copy(strFone,3,3),Copy(strFone,6,3)]);
            strFone := TratarInteiro(strFone);
            strTMP  := strTMP + cdsPesq.Fields[intI].FieldName + ' LIKE ' + QuotedStr('%'+strFone+'%') + ' OR ';
          end;
        end;

        ///Tratando Telefones
        if Pos('TELEFONE',strFilter) > 0 then begin
          strFone := SoNumeros(strTexto);
          if Length(strFone) > 0 then begin
            strFone := Format('(%s)%s-%s',[Copy(strFone,1,2),Copy(strFone,3,4),Copy(strFone,7,4)]);
            strFone := TratarInteiro(strFone);
            strTMP := strTMP + cdsPesq.Fields[intI].FieldName + ' LIKE ' + QuotedStr('%'+strFone+'%') + ' OR ';
          end;
        end;

        ///Tratando Telefones com o 5 digito
        if Pos('TELEFONE',strFilter) > 0 then begin
          strFone := SoNumeros(strTexto);
          if Length(strFone) > 0 then begin
            strFone := Format('(%s)%s-%s',[Copy(strFone,1,2),Copy(strFone,3,5),Copy(strFone,8,4)]);
            strFone := TratarInteiro(strFone);
            strTMP := strTMP + cdsPesq.Fields[intI].FieldName + ' LIKE ' + QuotedStr('%'+strFone+'%') + ' OR ';
          end;
        end;

        ///Tratando Telefones sem o DDD
//        if Pos('TELEFONE',strFilter) > 0 then begin
//          strFone := SoNumeros(strTexto);
//          if Length(strFone) > 0 then begin
//            strFone := Format('%s-%s',[Copy(strFone,3,5),Copy(strFone,8,4)]);
//            strFone := TratarInteiro(strFone);
//            strTMP := strTMP + cdsPesq.Fields[intI].FieldName + ' LIKE ' + QuotedStr('%'+strFone+'%') + ' OR ';
//          end;
//        end;

        ///Tratando CPF
        if Pos('CPF',strFilter) > 0 then begin
          strFone := SoNumeros(strTexto);
          if Length(strFone) > 0 then begin
            strFone := Format('%s.%s.%s-%s',[Copy(strFone,1,3),Copy(strFone,4,3),Copy(strFone,7,3),Copy(strFone,10,2)]);
            strFone := TratarInteiro(strFone);
            strTMP := strTMP + cdsPesq.Fields[intI].FieldName + ' LIKE ' + QuotedStr('%'+strFone+'%') + ' OR ';
          end;
        end;

        ///Tratando CNPJ
        if Pos('CNPJ',strFilter) > 0 then begin
          strFone := SoNumeros(strTexto);
          if Length(strFone) > 0 then begin
            strFone := Format('%s.%s.%s/%s-%s',[Copy(strFone,1,2),Copy(strFone,3,3),Copy(strFone,6,3),Copy(strFone,9,4),Copy(strFone,13,2)]);
            strFone := TratarInteiro(strFone);
            strTMP := strTMP + cdsPesq.Fields[intI].FieldName + ' LIKE ' + QuotedStr('%'+strFone+'%') + ' OR ';
          end;
        end;
      end;
      if (cdsPesq.Fields[intI].DataType in [ftTime,ftDate,ftTimeStamp,ftDateTime]) then begin
        try
          StrToDate(strTexto);
          strTMP := strTMP + cdsPesq.Fields[intI].FieldName + ' = ' + QuotedStr(strTexto) + ' OR ';
        except
        end;
      end;
      if (cdsPesq.Fields[intI].DataType in [ftBlob]) then begin
        strTMP := strTMP + cdsPesq.Fields[intI].FieldName + ' LIKE ' + QuotedStr('%'+strTexto+'%') + ' OR ';
      end;
    end;
    strTMP := Copy(strTMP,1,length(strTMP)-4);
    Result := strTMP;
  except
  end;
end;

function TFuncoes.getAbreOS: Boolean;
begin
  Result := FAbreOS;
end;

function TFuncoes.getAliquotaCofins: Real;
begin
  Result := FAliquotaCOFINS;
end;

function TFuncoes.getAliquotaPIS: Real;
begin
  Result := FAliquotaPIS;
end;

function TFuncoes.getAplicFDERecLiq: Boolean;
begin
  Result := FAplicFDERecLiq;
end;

function TFuncoes.getAplicFundoReservaRecLiq: Boolean;
begin
  Result := FAplicFundoReservaRecLiq;
end;

function TFuncoes.getBackupDomingo: Boolean;
begin
  Result := FBackupDomingo;
end;

function TFuncoes.getBackupHora1: String;
begin
  Result := Copy(FBackupHora1,1,8);
end;

function TFuncoes.getBackupHora2: String;
begin
  Result := Copy(FBackupHora2,1,8);
end;

function TFuncoes.getBackupHora3: String;
begin
  Result := Copy(FBackupHora3,1,8);
end;

function TFuncoes.getBackupQuarta: Boolean;
begin
  Result := FBackupQuarta;
end;

function TFuncoes.getBackupQuinta: Boolean;
begin
  Result := FBackupQuinta;
end;

function TFuncoes.getBackupSabado: Boolean;
begin
  Result := FBackupSabado;
end;

function TFuncoes.getBackupSegunda: Boolean;
begin
  Result := FBackupSegunda;
end;

function TFuncoes.getBackupSexta: Boolean;
begin
  Result := FBackupSexta;
end;

function TFuncoes.getBackupTerca: Boolean;
begin
  Result := FBackupTerca;
end;

function TFuncoes.getChamaAzul: Boolean;
begin
  Result := FChamaAzul;
end;

procedure TFuncoes.ExcluirSQL(strTabela         : String;
                              arrayChavesWhere  : Array of String;
                              arrayValoresWhere : Array of Variant);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    FormatSettings.DecimalSeparator := '.';
    try
      StartCommit;
      with qryCons do begin
        Close;
        sql.Clear;
        ExecSQL();
      end;
      Commit;
    except on e: exception do begin
      Alerta('Erro no processo de Exclusão automática!'+#13+#13+'['+e.Message+']',1);
      ReportaErro('TFuncoes','AtualizarSQL:'+strTabela,e.Message);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TFuncoes.ExecSQL(strSQL: String);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;

    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add(strSQL);
      try
        StartCommit;
      except
      end;
      ExecSQL();
      try
        Commit;
      except
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TFuncoes.ExecutaRotina(intRotina: Integer);
var
  AForm             : TForm;
  FormClass         : TFormClass;
  HandlePack        : HModule;
  panelPrincipal    : TPanel;
  strDescr,
  strBPL,strClasse  : String;
  qryCons           : TSQLQuery;
begin
  AForm             := nil;
  try
    HandlePack      := 0;
    FreeAndNil(FormClass);
    panelPrincipal  := TPanel(Application.MainForm.FindComponent('panelPrincipal'));
    qryCons         := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT');
      sql.Add('      MENU_NOME_BPL,');         ///strBPL
      sql.Add('      MENU_CLASSE_FORM_BPL,');  ///strClasse
      sql.Add('      MENU_DESCRICAO,');        ///strDescr
      SQL.Add('      MENU_ID');
      sql.Add('FROM  MENU');
      sql.Add('WHERE MENU_ID = ' + QuotedStr(IntToStr(intRotina)));
      Open;
      if (not IsEmpty) and (Pos('bpl',Trim(qryCons.Fields[0].AsString)) > 0) then begin
        if not TemPermissao(qryCons.Fields[3].AsString) then begin
          Alerta('I N F O R M A Ç Ã O ! ! !'+#13+#13+'Você não possui permissão a esta rotina!',0);
          Exit;
        end;

        RegistraAcesso(intRotina);

        strBPL     := 'bpl/'+Trim(qryCons.Fields[0].AsString);
        strClasse  := Trim(qryCons.Fields[1].AsString);
        strDescr   := Trim(qryCons.Fields[2].AsString);
        if (strBPL <> '') or (strBPL <> 'CMD') then begin
          if (Janelas.IndexOf(strClasse) >= 0) then begin
              AForm := RetornaForm(strClasse);
              if AForm <> nil then begin
                AForm.Visible  := true;
                ///Verificar as constantes [ intFHeight, intFWidth, intFLeft, intFTop ]
                AForm.SetBounds(Application.MainForm.Left + intFLeft, Application.MainForm.Top, panelPrincipal.Width + intFWidth, panelPrincipal.Height + intFHeight);
                AForm.Constraints.MaxHeight := panelPrincipal.Height;//  - 100;
                AForm.Constraints.MaxWidth  := panelPrincipal.Width + intFWidth;//   - 250;
                AForm.Constraints.MinHeight := panelPrincipal.Height;//  - 100;
                AForm.Constraints.MinWidth  := panelPrincipal.Width + intFWidth;//   - 250;
                AForm.Position              := poScreenCenter;
                AForm.BringToFront;
              end;
            Exit;
          end;
          try
            if not Assigned(FormClass) then
              HandlePack := LoadPackage(strBPL);
          except
          end;
          if (HandlePack > 0 ) then begin
            FormClass := TFormClass(GetClass(strClasse));
            if Assigned(FormClass) then begin
               HandleJanelas.Add(strClasse + ';' + inttostr(HandlePack));
              if not FormAberto(strClasse) then begin
                AForm := FormClass.Create(nil);
                Janelas.Add(strClasse);
                try
                  ///Verificar as constantes [ intFHeight, intFWidth, intFLeft, intFTop ]
                  ///Verificar as constantes [ intFHeight, intFWidth, intFLeft, intFTop ]
                  AForm.SetBounds(Application.MainForm.Left + intFLeft, Application.MainForm.Top, panelPrincipal.Width + intFWidth, panelPrincipal.Height + intFHeight);
                  AForm.Constraints.MaxHeight := panelPrincipal.Height;//  - 100;
                  AForm.Constraints.MaxWidth  := panelPrincipal.Width + intFWidth;//   - 250;
                  AForm.Constraints.MinHeight := panelPrincipal.Height;//  - 100;
                  AForm.Constraints.MinWidth  := panelPrincipal.Width + intFWidth;//   - 250;
                  AForm.Position              := poScreenCenter;
                  AForm.Show;
                  AForm.BringToFront;
                finally
                end;
              end else begin
                try
                  AForm := FormClass.Create(Application);
                  ///Verificar as constantes [ intFHeight, intFWidth, intFLeft, intFTop ]
                  ///Verificar as constantes [ intFHeight, intFWidth, intFLeft, intFTop ]
                  AForm.SetBounds(Application.MainForm.Left + intFLeft, Application.MainForm.Top, panelPrincipal.Width + intFWidth, panelPrincipal.Height + intFHeight);
                  AForm.Constraints.MaxHeight := panelPrincipal.Height;//  - 100;
                  AForm.Constraints.MaxWidth  := panelPrincipal.Width + intFWidth;//   - 250;
                  AForm.Constraints.MinHeight := panelPrincipal.Height;//  - 100;
                  AForm.Constraints.MinWidth  := panelPrincipal.Width + intFWidth;//   - 250;
                  AForm.Position              := poScreenCenter;
                  AForm.Show;
                  AForm.BringToFront;
                finally
                end;
              end;
            end else Alerta('Rotina não encontrada ou arquivo corrompido.',1);
          end;
        end;
      end;
    end;
  finally
    MSGAguarde(false);
    try
      AForm.BringToFront;
    except
    end;
  end;
end;

function TFuncoes.ContaBancariaAtiva(strCBCO_ID : String) : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(CBCO_ATIVO,0)');
        sql.Add('FROM  CONTAS_BANCARIAS');
        sql.Add('WHERE CBCO_ID      = ' + strCBCO_ID);
        sql.Add('AND   CBCO_EMPR_ID = ' + IntToStr(Empr_ID));
        Open;
        if not IsEmpty then
          Result := (qryCons.Fields[0].AsInteger = 1);
      end;
    except on e: exception do begin
      ReportaErro('Funcoes','ContaBancariaAtiva',e.Message);
      Alerta('Erro no processo de verificação da conta.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.TemSaldoEmConta(strCBCO_ID : String; floatValor : Real) : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('       COALESCE((CBCO_LIMITE + CBCO_SALDO_ATUAL),0)');
        sql.Add('  FROM CONTAS_BANCARIAS');
        sql.Add(' WHERE CBCO_ID      = ' + strCBCO_ID);
        sql.Add('   AND CBCO_EMPR_ID = ' + IntToStr(Empr_ID));
        sql.Add('   AND CBCO_ATIVO   = 1');
//        ShowMessage(qryCons.Text);
        Open;
        if not IsEmpty then
          Result := (qryCons.Fields[0].AsFloat >= floatValor);
      end;
    except on e: exception do begin
      ReportaErro('Funcoes','TemSaldoEmConta',e.Message);
      Alerta('Erro no processo de verificação de saldo da conta.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.TemSaldoLivroCaixa(floatValor: Real): Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(SUM(LCAX_VLR_LANCAMENTO),0)');
        sql.Add('FROM  LIVRO_CAIXA');
        sql.Add('WHERE LCAX_EMPR_ID = ' + IntToStr(Empr_ID));
        Open;
        if not IsEmpty then
          Result := (qryCons.Fields[0].AsFloat >= floatValor);
      end;
    except on e: exception do begin
      ReportaErro('Funcoes','TemSaldoLivroCaixa',e.Message);
      Alerta('Erro no processo de verificação do saldo em caixa.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;
    
function TFuncoes.TrataFloat(strValor: String): String;
begin
  Result := '0.00';
  Result := StringReplace(strValor,'.','',[]);
end;

function TFuncoes.TratarNome(sNome: String): String;
const
  Excecao: array[0..9] of string = (' da ', ' de ', ' do ', ' das ', ' dos ', ' e ', ' o ', ' a ', ' à ', ' ao ');
var
  Tam, J: integer;
  intI: byte;
begin
  Result := AnsiLowerCase(sNome);
  Tam := Length(Result);

  for J := 1 to Tam do
    // Se é a primeira letra ou se o caracter anterior é um espaço
    if (J = 1) or ((J>1) and (Result[J-1]=Chr(32))) then
      Result[J] := AnsiUpperCase(Result[J])[1];
  for intI := 0 to Length(Excecao)-1 do
    Result:= StringReplace(Result,Excecao[intI],Excecao[intI],[rfReplaceAll, rfIgnoreCase]);
end;

function TFuncoes.TrataTelefone(strFone: String): String;
begin
  Result := '';
  strFone := SoNumeros(strFone);
  if (Length(strFone) < 10) and (Length(strFone) > 1) then begin
    Exit;
  end;
  Result := '(' + Copy(strFone,1,2) + ')';
  case Length(strFone) of
    10 : begin
      Result := Result + Copy(strFone,3,4) + '-';
      Result := Result + Copy(strFone,Length(strFone)-3,4);
    end;
    else begin
      Result := Result + Copy(strFone,3,5) + '-';
      Result := Result + Copy(strFone,Length(strFone)-3,4);
    end;
  end;
end;

procedure TFuncoes.DeleteIECache;
var
  lpEntryInfo : PInternetCacheEntryInfo;
  hCacheDir: LongWord;
  dwEntrySize: LongWord;
begin
  dwEntrySize := 0;
  FindFirstUrlCacheEntry(nil, TInternetCacheEntryInfo(nil^), dwEntrySize);
  GetMem(lpEntryInfo, dwEntrySize);
  if dwEntrySize > 0 then lpEntryInfo^.dwStructSize := dwEntrySize;
  hCacheDir := FindFirstUrlCacheEntry(nil, lpEntryInfo^, dwEntrySize);
  if hCacheDir <> 0 then begin
    repeat
      DeleteUrlCacheEntry(lpEntryInfo^.lpszSourceUrlName);
      FreeMem(lpEntryInfo, dwEntrySize);
      dwEntrySize := 0;
      FindNextUrlCacheEntry(hCacheDir, TInternetCacheEntryInfo(nil^), dwEntrySize);
      GetMem(lpEntryInfo, dwEntrySize);
      if dwEntrySize > 0 then lpEntryInfo^.dwStructSize := dwEntrySize;
    until not FindNextUrlCacheEntry(hCacheDir, lpEntryInfo^, dwEntrySize);
  end;
  FreeMem(lpEntryInfo, dwEntrySize);
  FindCloseUrlCache(hCacheDir);
end;

function TFuncoes.GetClientePadrao: Integer;
begin
  Result := FClientePadrao;
end;

function TFuncoes.getCodCliente: Integer;
begin
  Result := FCodCliente;
end;

function TFuncoes.getCodEquip: Integer;
begin
  Result := FCodEquip;
end;

function TFuncoes.getCodUserIDTecOS: Integer;
begin
  Result := FCodUserIDTecOS;
end;

function TFuncoes.getCod_Equip: String;
begin
  Result := Se((FCod_Equip <> ''),FCod_Equip,'Cód. Equip.');
end;

function TFuncoes.getCod_Fornecedor: String;
begin
  Result := Se((FCod_Fornecedor <> ''),FCod_Fornecedor,'Cód. Fornec.');
end;

function TFuncoes.getCod_Tecnico: String;
begin
  Result := Se((FCod_Tecnico <> ''),FCod_Tecnico,'Cód. Téc.');
end;

function TFuncoes.getContaBcoCredito: Integer;
begin
  Result := FContaBcoCredito
end;

function TFuncoes.getContaBcoDebito: Integer;
begin
  Result := FContaBcoDebito;
end;

function TFuncoes.getControlaLimite: Boolean;
begin
  Result := FControlaLimite;
end;

function TFuncoes.getDiasDepositoCredito: Integer;
begin
  Result := FDiasDepositoCredito;
end;

function TFuncoes.getDiasDepositoDebito: Integer;
begin
  Result := FDiasDepositoDebito;
end;

function TFuncoes.getDt_Agendamento: String;
begin
  Result := Se((FDt_Agendamento <> ''),FDt_Agendamento,'Dt. Agendamento');
end;

function TFuncoes.getDt_Cadastro: String;
begin
  Result := Se((FDt_Cadastro <> ''),FDt_Cadastro,'Dt. Cadastro');
end;

function TFuncoes.getDt_Entrega: String;
begin
  Result := Se((FDt_Entrega <> ''),FDt_Entrega,'Dt. Entrega');
end;

function TFuncoes.getDt_Instalacao: String;
begin
  Result := Se((FDt_Instalacao <> ''),FDt_Instalacao,'Dt. Instalação');
end;

function TFuncoes.getEmiteReciboPagtoParc: Boolean;
begin
  Result := FEmiteReciboPagtoParc;
end;

function TFuncoes.getEmpresaMatriz: Boolean;
begin
  Result := FEmpresaMatriz;
end;

function TFuncoes.getEquipamento: String;
begin
  Result := Se((FEquipamento <> ''),FEquipamento,'Equipamento');
end;

function TFuncoes.GetEstoqueNegativo: Boolean;
begin
  Result := FEstoqueNegativo;
end;

function TFuncoes.getFiltrarPlanoContasPAI: Boolean;
begin
  Result := FFiltrarPlanoContasPAI;
end;

function TFuncoes.GetForcaReagendaOS: Boolean;
begin
  Result := FForcaReagendaOS;
end;

function TFuncoes.getFornecCartaoCred: Integer;
begin
  Result := FFornecCartaoCred;
end;

function TFuncoes.getFornecCartaoDeb: Integer;
begin
  Result := FFornecCartaoDeb;
end;

function TFuncoes.getFornecedor: String;
begin
  Result := Se((FFornecedor <> ''),FFornecedor,'Fornecedor');
end;

function TFuncoes.getFree: Boolean;
begin
  Result := FFree;
end;

function TFuncoes.getGarantia: String;
begin
  Result := Se((FGarantia <> ''),FGarantia,'Garantia');
end;

function TFuncoes.getGrupo_Equipamento: String;
begin
  Result := Se((FGrupo_Equipamento <> ''),FGrupo_Equipamento,'Equipamentos do Cliente');
end;

function TFuncoes.getGrupo_Pecas_Servicos: String;
begin
  Result := Se((FGrupo_Pecas_Servicos <> ''),FGrupo_Pecas_Servicos,'Peças/Serviços');
end;

function TFuncoes.getHr_Almoco_Fim: String;
begin
  Result := FHr_Almoco_Fim;
end;

function TFuncoes.getHr_Almoco_Inicio: String;
begin
  Result := FHr_Almoco_Inicio;
end;

function TFuncoes.getHr_Inicio: String;
begin
  Result := FHr_Inicio;
end;

function TFuncoes.getHr_Intervalo: String;
begin
  Result := FHr_Intervalo;
end;

function TFuncoes.getHr_Termino: String;
begin
  Result := FHr_Termino;
end;

function TFuncoes.getInformeFornecEquip: Boolean;
begin
  Result := FInformeFornecEquip;
end;

function TFuncoes.getIntegraClientes: Boolean;
begin
  Result := FIntegraClientes;
end;

function TFuncoes.getIntegraProdutos: Boolean;
begin
  Result := FIntegraProdutos;
end;

function TFuncoes.GetJuro: Real;
begin
  Result := FJuro;
end;

function TFuncoes.GetLicenca(intPos: Integer): Boolean;
begin
  {1 - Financeiro
   2 - Estoque
   3 - Venda
   4 - Ordem de Serviço
   5 - Construção
  }
  Result := (FLicenca[intPos] = 1);
end;

function TFuncoes.getLimitadoListaDeProf: Boolean;
begin
  Result := FLimitadoListaDeProf;
end;

function TFuncoes.getLimitarProfNoSistema: Boolean;
begin
  Result := FLimitarProfNoSistema;
end;

function TFuncoes.getMarca: String;
begin
  Result := Se((FMarca <> ''),FMarca,'Marca');
end;

function TFuncoes.GetMensagemRodapeOS: Integer;
begin
  Result := FMensagemRodapeOS;
end;

function TFuncoes.getModelo: String;
begin
  Result := Se((FModelo <> ''),FModelo,'Modelo');
end;

function TFuncoes.GetMora: Real;
begin
  Result := FMora;
end;

function TFuncoes.getNovoPadraoTelefone: Boolean;
begin
  Result := FNovoPadraoTelefone;
end;

function TFuncoes.getNrPedido: String;
begin
  Result := Se((FNrPedido <> ''),FNrPedido,'Nrº Pedido/Fabricante/Série');
end;

function TFuncoes.getOcultarClientes: Boolean;
begin
  Result := FOcultarClientes;
end;

function TFuncoes.getOptanteSimples: Boolean;
begin
  Result := FOptanteSimples;
end;

function TFuncoes.GetPercentRenda: Real;
begin
  Result := FPercentRenda;
end;

function TFuncoes.getPercFundoReserva: Real;
begin
  Result := FPercFundoReserva;
end;

function TFuncoes.getPercReservaEstatutarias: Real;
begin
  Result := FPercReservaEstatutarias;
end;

function TFuncoes.getPercReservaLegal: Real;
begin
  Result := FPercReservaLegal;
end;

function TFuncoes.getPercReservaLucro: Real;
begin
  Result := FPercReservaLucro;
end;

function TFuncoes.GetPeriodoReagendamento: Integer;
begin
  Result := FPeriodoReagendamento;
end;

function TFuncoes.GetPermissao(intUSRM_ID: Integer): Boolean;
begin
  Result := (FPermissoes[intUSRM_ID] <> 0);
end;

function TFuncoes.getPrivado: Boolean;
begin
  Result := FPrivado;
end;

function TFuncoes.GetReagendaOS: Boolean;
begin
  Result := FReagendaOS;
end;

function TFuncoes.getReplicClienteFornecedor: Boolean;
begin
  Result := FReplicClienteFornecedor;
end;

function TFuncoes.GetReportarError: Boolean;
begin
  Result := FReportaError;
end;

function TFuncoes.getSemAnuncio: Boolean;
begin
  Result := FSemAnuncio;
end;

function TFuncoes.getSepararTeleAtendimento: Boolean;
begin
  Result := FSepararTeleAtendimento;
end;

function TFuncoes.getSolicitaNrTransCartao: Boolean;
begin
  Result := FSolicitaNrTransCartao;
end;

function TFuncoes.GetSQLCliente: String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      Add('SELECT');
      Add('      CL.*,');
      Add('      PR.GENE_DESCR               AS CIDADE,');
      Add('      PR.GENE_PAR1                AS UF,');
      Add('      VD.USER_NOME_COMPLETO       AS VENDEDOR,');
      Add('      RT.GENE_DESCR               AS ROTA,');
      Add('      RT.GENE_PAR1                AS KM_FINAL,');
      Add('      RT.GENE_NUMERIC1            AS VLR_FRETE,');
      Add('      RG.GENE_ID                  AS REGIAO_ID,');
      Add('      RG.GENE_DESCR               AS REGIAO,');
      Add('      RG.GENE_PAR1                AS AREA_TOTAL');
      Add('FROM  CLIENTES CL');
      Add('INNER JOIN GENERICA PR');
      Add('ON (PR.GENE_EMPR_ID   = CL.CLIE_GENE_EMPR_ID_PRACA');
      Add('AND PR.GENE_TGEN_ID   = CL.CLIE_GENE_TGEN_ID_PRACA');
      Add('AND PR.GENE_ID        = CL.CLIE_GENE_ID_PRACA)');
      Add('LEFT OUTER JOIN USUARIO VD');
      Add('ON (VD.USER_ID        = CL.CLIE_USER_ID_VENDEDOR)');
      Add('LEFT OUTER JOIN GENERICA RT');
      Add('ON (RT.GENE_EMPR_ID   = CL.CLIE_GENE_EMPR_ID_ROTA');
      Add('AND RT.GENE_TGEN_ID   = CL.CLIE_GENE_TGEN_ID_ROTA');
      Add('AND RT.GENE_ID        = CL.CLIE_GENE_ID_ROTA)');
      Add('LEFT OUTER JOIN GENERICA RG');
      Add('ON (RG.GENE_EMPR_ID   = RT.GENE_GENE_EMPR_ID_PROP');
      Add('AND RG.GENE_TGEN_ID   = RT.GENE_GENE_TGEN_ID_PROP');
      Add('AND RG.GENE_ID        = RT.GENE_GENE_ID_PROD)');
      Add('WHERE CL.CLIE_EMPR_ID = ' + IntToStr(Empr_ID));
    end;
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

function TFuncoes.getSQLOS: String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      Add('SELECT');
      Add('       OS.*,');
      Add('       CL.CLIE_RAZAO_SOCIAL,');
      Add('       TP.TPRC_DESCRICAO,');
      Add('       OT.GENE_DESCR TIPO_OS,');
      Add('       US.USER_NOME_COMPLETO,');
      Add('       PR.PROD_DESCRICAO,');
      Add('       PR.PROD_GARANTIA,');
      Add('       MC.GENE_DESCR MARCA_PROD,');
      Add('       MD.GENE_DESCR MODELO_PROD,');
      Add('       FN.FORN_RAZAO_SOCIAL,');
      Add('       UC.USER_NOME_COMPLETO USER_CANC,');
      Add('       CL.CLIE_GENE_ID_ROTA,');
      Add('       ST.GENE_DESCR AS STATUS_OS,');
      Add('       TA.GENE_DESCR AS TIPO_AGENDAMENTO,');
      Add('       UN.GENE_PAR1  AS PROD_UNIDADE');
      Add('  FROM ORDEM_SERVICO OS');
      Add(' INNER JOIN CLIENTES CL');
      Add('    ON (OS.ORDS_CLIE_ID              = CL.CLIE_ID');
      Add('   AND OS.ORDS_CLIE_EMPR_ID          = CL.CLIE_EMPR_ID)');
      Add(' INNER JOIN TABELA_PRECO TP');
      Add('    ON (OS.ORDS_TPRC_ID              = TP.TPRC_ID');
      Add('   AND OS.ORDS_TPRC_EMPR_ID          = TP.TPRC_EMPR_ID)');
      Add(' INNER JOIN GENERICA OT');
      Add('    ON (OS.ORDS_GENE_EMPR_ID_TIPO_OS = OT.GENE_EMPR_ID');
      Add('   AND OS.ORDS_GENE_TGEN_ID_TIPO_OS  = OT.GENE_TGEN_ID');
      Add('   AND OS.ORDS_GENE_ID_TIPO_OS       = OT.GENE_ID)');
      Add(' INNER JOIN USUARIO US');
      Add('    ON (OS.ORDS_USER_ID_TEC = US.USER_ID)');
      Add(' INNER JOIN PRODUTOS PR');
      Add('    ON (OS.ORDS_PROD_ID_EQUIP        = PR.PROD_ID');
      Add('   AND OS.ORDS_PROD_EMPR_ID_EQUIP    = PR.PROD_EMPR_ID)');
      Add('  LEFT OUTER JOIN GENERICA UN');
      Add('    ON (UN.GENE_EMPR_ID              = PR.PROD_GENE_EMPR_ID_UNID');
      Add('   AND UN.GENE_TGEN_ID               = PR.PROD_GENE_TGEN_ID_UNID');
      Add('   AND UN.GENE_ID                    = PR.PROD_GENE_ID_UNID)');
      Add('  LEFT OUTER JOIN GENERICA MC');
      Add('    ON (PR.PROD_GENE_EMPR_ID_MARCA   = MC.GENE_EMPR_ID');
      Add('   AND PR.PROD_GENE_TGEN_ID_MARCA    = MC.GENE_TGEN_ID');
      Add('   AND PR.PROD_GENE_ID_MARCA         = MC.GENE_ID)');
      Add('  LEFT OUTER JOIN GENERICA MD');
      Add('    ON (PR.PROD_GENE_EMPR_ID_MODELO = MD.GENE_EMPR_ID');
      Add('   AND PR.PROD_GENE_TGEN_ID_MODELO  = MD.GENE_TGEN_ID');
      Add('   AND PR.PROD_GENE_ID_MODELO       = MD.GENE_ID)');
      Add('  LEFT OUTER JOIN FORNECEDORES FN');
      Add('    ON (OS.ORDS_FORN_ID_EQUIP       = FN.FORN_ID)');
      Add('  LEFT OUTER JOIN USUARIO UC');
      Add('    ON (OS.ORDS_USER_ID_CANC        = UC.USER_ID)');
      Add('  LEFT OUTER JOIN GENERICA ST');
      Add('    ON (ST.GENE_EMPR_ID             = OS.ORDS_GENE_EMPR_ID_STATUS_OS');
      Add('   AND ST.GENE_TGEN_ID              = OS.ORDS_GENE_TGEN_ID_STATUS_OS');
      Add('   AND ST.GENE_ID                   = OS.ORDS_GENE_ID_STATUS_OS)');
      Add('  LEFT OUTER JOIN GENERICA TA');
      Add('    ON (TA.GENE_EMPR_ID             = OS.ORDS_GENE_EMPR_ID_TP_AGEND');
      Add('   AND TA.GENE_TGEN_ID              = OS.ORDS_GENE_TGEN_ID_TP_AGEND');
      Add('   AND TA.GENE_ID                   = OS.ORDS_GENE_ID_TP_AGEND)');
      Add(' WHERE OS.ORDS_EMPR_ID              = ' + IntToStr(Empr_ID));
    end;
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

function TFuncoes.GetTabPrecoPadrao: Integer;
begin
  Result := FTabPrecoPadrao;
end;

function TFuncoes.getTaxaCredito: Real;
begin
  Result := FTaxaCredito;
end;

function TFuncoes.getTaxaDebito: Real;
begin
  Result := FTaxaDebito;
end;

function TFuncoes.getTecnico: String;
begin
  Result := Se((FTecnico <> ''),FTecnico,'Técnico');
end;

function TFuncoes.GetTempDirectory: String;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

function TFuncoes.getTipoEmpresa: Integer;
begin
  Result := FTipoEmpresa;
end;

function TFuncoes.getTipoMenu: Integer;
begin
  Result := FTipoMenu;
end;

function TFuncoes.getTrabNrPedido: Boolean;
begin
  Result := FTrabNrPedido;
end;

function TFuncoes.getTrabStatusOS: Boolean;
begin
  Result := FTrabStatusOS;
end;

function TFuncoes.getTrabTipoAgendamento: Boolean;
begin
  Result := FTrabTipoAgendamento;
end;

function TFuncoes.getUnidade: String;
begin
  Result := Se((FUnidade <> ''),FUnidade,'Unid.');
end;

function TFuncoes.getValorMetaAno: Real;
begin
  Result := FValorMetaAno;
end;

function TFuncoes.GetVersionSystem: Integer;
begin
  Result := FVersionSystem;
end;

function TFuncoes.getVinculaCartaoCredito: Boolean;
begin
  Result := FVinculaCartaoCredito;
end;

function TFuncoes.GetVisualFinanc: Boolean;
begin
  Result := FVisualFinanc;
end;

function TFuncoes.InGrid(lbTMP: TListBox; rdTMP: TRadioGroup; ckPlano : TCheckBox): String;
var
  intI   : Integer;
  strTMP : String;
begin
  strTMP := '';
  for intI := 0 to lbTMP.Count - 1 do begin
    case ckPlano.Visible of
      true : begin
        case ckPlano.Checked of
          true : strTMP := strTMP + RetornaFilhosPlanoContas( Copy(lbTMP.Items[intI],1,6) );
          false: strTMP := strTMP + Copy(lbTMP.Items[intI],1,6) + ',';
        end;
      end;
      false: strTMP := strTMP + Copy(lbTMP.Items[intI],1,6) + ',';
    end;
  end;
  strTMP   := Copy(strTMP,1,Length(strTMP)-1);
  case rdTMP.ItemIndex of
    0 : Result := ' NOT IN (' + strTMP + ')';
    1 : Result := ' IN (' + strTMP + ')';
  end;
end;

function TFuncoes.InGrid(edtTMP: TEdit; ckTMP : TCheckBox; ckPlano : TCheckBox): String;
var
  lbTMP     : TListBox;
  rdTMP     : TRadioGroup;
begin
  if edtTMP.Text = '' then Exit;
  if ckTMP.Visible then begin
    case ckTMP.Checked of
      true  : Result := ' <> ' + edtTMP.Text;
      false : Result := ' = '  + edtTMP.Text;
    end;
  end else Result := edtTMP.Text;

  case ckPlano.Visible of
    true : begin
      try
        lbTMP := TListBox.Create(nil);
        rdTMP := TRadioGroup.Create(nil);
        lbTMP.ParentWindow := Application.MainFormHandle;
        rdTMP.ParentWindow := Application.MainFormHandle;

        lbTMP.Items.Clear;
        rdTMP.Items.Add('(Sim) Omitir Registros');
        rdTMP.Items.Add('(Não) Omitir Registros');

        lbTMP.Items.Add(FormatFloat('000000',StrToFloat(edtTMP.Text)));
        rdTMP.ItemIndex := Se(ckTMP.Checked,0,1);

        Result := InGrid(lbTMP,rdTMP,ckPlano);

      finally
        FreeAndNil(lbTMP);
        FreeAndNil(rdTMP);
      end;
    end;
  end;
end;

function TFuncoes.RetiraEspaco(sNome: String): String;
begin
  Result := StringReplace(sNome,' ','',[rfReplaceAll]);
end;

function TFuncoes.RetornaCartaoCredito(intTipoCartao : Integer = 4; fltValorCompra : Real = 0; strTipoTransacao : String = 'C'): String;
begin
  Result := '';
  try
    if not (intTipoCartao in [4,5]) then Exit;
    try
      fListCartoesCredito := TfListCartoesCredito.Create(nil);
      fListCartoesCredito.ValorCompra   := fltValorCompra;
      fListCartoesCredito.TipoTransacao := strTipoTransacao;
      fListCartoesCredito.TipoCartao    := intTipoCartao;
      fListCartoesCredito.ShowModal;
      Result := fListCartoesCredito.DadosCartao;
    finally
      FreeAndNil(fListCartoesCredito);
    end;
  except
  end;
end;

function TFuncoes.RetornaFilhosPlanoContas(strPLCT_ID : String; intAtivo: Integer = 0; intTipo : Integer = 3) : String;
var
  qryConsTMP : TSQLQuery;
begin
  try
    qryConsTMP := TSQLQuery.Create(nil);
    qryConsTMP.SQLConnection := Conexao;
    Result := strPLCT_ID + ',';
    try
      with qryConsTMP do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      PLCT_ID');
        sql.Add('FROM  PLANO_CONTAS');
        sql.Add('WHERE PLCT_EMPR_ID      = 0');
        sql.Add('AND   PLCT_SISTEMA      = 0');
        sql.Add('AND   PLCT_PLCT_ID      = ' + strPLCT_ID);
        case intAtivo of
          0 : SQL.Add('AND PLCT_ATIVO = 1');
          1 : sql.Add('AND PLCT_ATIVO = 0');
        end;
        case intTipo of
          0 : sql.Add('AND PLCT_TIPO = ' + QuotedStr('C'));
          1 : sql.Add('AND PLCT_TIPO = ' + QuotedStr('D'));
        end;
        Open;
        First;
        while not eof do begin
          Result := Result + RetornaFilhosPlanoContas(qryConsTMP.FieldByName('PLCT_ID').AsString,intAtivo,intTipo);
          Next;
        end;
      end;
    except on e: exception do
      ShowMessage(e.Message);
    end;
  finally
    qryConsTMP.Close;
    FreeAndNil(qryConsTMP);
  end;
end;

procedure TFuncoes.InicializationSystem(strEmpr_ID : String = '');
begin
  if strEmpr_ID = '' then begin
    strEmpr_ID := IntToStr(Empr_ID);
  end;
  ConfiguracoesSystem(strEmpr_ID);
end;

procedure TFuncoes.ConfiguracoesSystem(strEmpr_ID : String = '');
var
  qryCons : TSQLQuery;
begin
  try
    if strEmpr_ID = '' then begin
      strEmpr_ID := IntToStr(Empr_ID);
    end;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(CS.CSIS_REPORTA_ERROS,0)             AS CSIS_REPORTA_ERROS,');
        sql.Add('      COALESCE(CS.CSIS_VISUAL_FINANCEIRO,0)         AS CSIS_VISUAL_FINANCEIRO,');
        sql.Add('      CS.CSIS_JURO,');
        sql.Add('      CS.CSIS_MORA,');
        sql.Add('      COALESCE(CS.CSIS_PERCENTE_RENDA,0)            AS CSIS_PERCENTE_RENDA,');
        sql.Add('      COALESCE(CS.CSIS_ESTOQUE_NEGATIVO,0)          AS CSIS_ESTOQUE_NEGATIVO,');
        sql.Add('      COALESCE(CS.CSIS_VERSION_SYSTEM,0)            AS CSIS_VERSION_SYSTEM,');
        sql.Add('      CS.CSIS_TPRC_ID,');
        sql.Add('      CS.CSIS_CLIE_ID,');
        sql.Add('      COALESCE(CS.CSIS_REAGENDAR_OS,0)              AS CSIS_REAGENDAR_OS,');
        sql.Add('      COALESCE(CS.CSIS_FORCAR_REAGENDA,0)           AS CSIS_FORCAR_REAGENDA,');
        sql.Add('      COALESCE(CS.CSIS_INTEGRAR_PRODUTOS,0)         AS CSIS_INTEGRAR_PRODUTOS,');
        sql.Add('      COALESCE(CS.CSIS_INTEGRAR_CLIENTES,0)         AS CSIS_INTEGRAR_CLIENTES,');
        sql.Add('      COALESCE(CS.CSIS_VLR_META_ANO,0)              AS CSIS_VLR_META_ANO,');
        sql.Add('      COALESCE(CS.CSIS_CONTROLA_LIMITE_CREDITO,0)   AS CSIS_CONTROLA_LIMITE_CREDITO,');
        sql.Add('      1                                             AS CSIS_TIPO_MENU,');
        sql.Add('      COALESCE(CS.CSIS_TIPO_EMPRESA,0)              AS CSIS_TIPO_EMPRESA,');
        sql.Add('      COALESCE(CS.CSIS_OPTANTE_SIMPLES,0)           AS CSIS_OPTANTE_SIMPLES,');
        sql.Add('      COALESCE(CS.CSIS_EMPRESA_MATRIZ,1)            AS CSIS_EMPRESA_MATRIZ,');
        sql.Add('      COALESCE(CS.CSIS_ALIQUOTA_PADRAO_PIS,0)       AS CSIS_ALIQUOTA_PADRAO_PIS,');
        sql.Add('      COALESCE(CS.CSIS_ALIQUOTA_PADRAO_COFINS,0)    AS CSIS_ALIQUOTA_PADRAO_COFINS,');
        sql.Add('      COALESCE(CS.CSIS_SEPARAR_TELEATENDIMENTO,0)   AS CSIS_SEPARAR_TELEATENDIMENTO,');
        sql.Add('      COALESCE(CS.CSIS_TRAB_TIPO_AGENDAMENTO,0)     AS CSIS_TRAB_TIPO_AGENDAMENTO,');
        sql.Add('      COALESCE(CS.CSIS_USAR_PADRAO_TELEFONE,0)      AS CSIS_USAR_PADRAO_TELEFONE,');
        sql.Add('      COALESCE(CS.CSIS_INFORMA_NR_PEDIDO,0)         AS CSIS_INFORMA_NR_PEDIDO,');
        sql.Add('      COALESCE(CS.CSIS_TRAB_FORNEC_EQUIP,0)         AS CSIS_TRAB_FORNEC_EQUIP,');
        sql.Add('      COALESCE(CS.CSIS_TRAB_STATUS_OS,0)            AS CSIS_TRAB_STATUS_OS,');
        sql.Add('      COALESCE(CS.CSIS_FILTRAR_PLANO_CONTAS_PAI,0)  AS CSIS_FILTRAR_PLANO_CONTAS_PAI,');
        sql.Add('      COALESCE(CS.CSIS_VINCULAR_CARTAO_CREDITO,0)   AS CSIS_VINCULAR_CARTAO_CREDITO,');
        sql.Add('      COALESCE(CS.CSIS_PERC_FUNDO_RESERVA,0)        AS CSIS_PERC_FUNDO_RESERVA,');
        sql.Add('      COALESCE(CS.CSIS_APLICA_FDR_VLR_LIQUIDO,0)    AS CSIS_APLICA_FDR_VLR_LIQUIDO,');
        sql.Add('      COALESCE(CS.CSIS_PERC_RESERVA_LUCRO,0)        AS CSIS_PERC_RESERVA_LUCRO,');
        sql.Add('      COALESCE(CS.CSIS_PERC_RESERVA_LEGAL,0)        AS CSIS_PERC_RESERVA_LEGAL,');
        sql.Add('      COALESCE(CS.CSIS_PERC_RESERVA_ESTATUTARIAS,0) AS CSIS_PERC_RESERVA_ESTATUTARIAS,');
        sql.Add('      COALESCE(CS.CSIS_APLICA_FDE_VLR_LIQUIDO,0)    AS CSIS_APLICA_FDE_VLR_LIQUIDO,');
        sql.Add('      COALESCE(CS.CSIS_REPLICA_CLIENTE_FORNECEDOR,0)AS CSIS_REPLICA_CLIENTE_FORNECEDOR,');
        sql.Add('      COALESCE(CS.CSIS_INICIO_TRABALHO,''08:00'')   AS CSIS_INICIO_TRABALHO,');
        sql.Add('      COALESCE(CS.CSIS_FINAL_TRABALHO,''20:00'')    AS CSIS_FINAL_TRABALHO,');
        sql.Add('      COALESCE(CS.CSIS_INTERVALO_HORARIO,''00:15'') AS CSIS_INTERVALO_HORARIO,');
        sql.Add('      COALESCE(CS.CSIS_HR_ALMOCO_INICIO,''00:00'')  AS CSIS_HR_ALMOCO_INICIO,');
        sql.Add('      COALESCE(CS.CSIS_HR_ALMOCO_FIM,''00:00'')     AS CSIS_HR_ALMOCO_FIM,');
        sql.Add('      COALESCE(CS.CSIS_OCULTA_CLIENTES,0)           AS CSIS_OCULTA_CLIENTES,');
        sql.Add('      COALESCE(CS.CSIS_TX_CREDITO,0)                AS CSIS_TX_CREDITO,');
        sql.Add('      COALESCE(CS.CSIS_TX_DEBITO,0)                 AS CSIS_TX_DEBITO,');
        sql.Add('      COALESCE(CS.CSIS_DIAS_DEP_CREDITO,0)          AS CSIS_DIAS_DEP_CREDITO,');
        sql.Add('      COALESCE(CS.CSIS_DIAS_DEP_DEBITO,0)           AS CSIS_DIAS_DEP_DEBITO,');
        sql.Add('      COALESCE(CS.CSIS_RECIBO_PGTOPARCIAL,0)        AS CSIS_RECIBO_PGTOPARCIAL,');
        sql.Add('      COALESCE(CS.CSIS_CBCO_ID_CREDITO,0)           AS CSIS_CBCO_ID_CREDITO,');
        sql.Add('      COALESCE(CS.CSIS_CBCO_ID_DEBITO,0)            AS CSIS_CBCO_ID_DEBITO,');
        sql.Add('      COALESCE(CS.CSIS_FORN_ID_CARTAO_CRED,0)       AS CSIS_FORN_ID_CARTAO_CRED,');
        sql.Add('      COALESCE(CS.CSIS_FORN_ID_CARTAO_DEB,0)        AS CSIS_FORN_ID_CARTAO_DEB,');
        sql.Add('      COALESCE(CS.CSIS_SOLICITA_NR_TRANSACAO,0)     AS CSIS_SOLICITA_NR_TRANSACAO,');
        sql.Add('      COALESCE(CS.CSIS_BKP_SEGUNDA,0)               AS CSIS_BKP_SEGUNDA,');
        sql.Add('      COALESCE(CS.CSIS_BKP_TERCA,0)                 AS CSIS_BKP_TERCA,');
        sql.Add('      COALESCE(CS.CSIS_BKP_QUARTA,0)                AS CSIS_BKP_QUARTA,');
        sql.Add('      COALESCE(CS.CSIS_BKP_QUINTA,0)                AS CSIS_BKP_QUINTA,');
        sql.Add('      COALESCE(CS.CSIS_BKP_SEXTA,0)                 AS CSIS_BKP_SEXTA,');
        sql.Add('      COALESCE(CS.CSIS_BKP_SABADO,0)                AS CSIS_BKP_SABADO,');
        sql.Add('      COALESCE(CS.CSIS_BKP_DOMINGO,0)               AS CSIS_BKP_DOMINGO,');
        sql.Add('      COALESCE(CS.CSIS_BKP_HORA1,''00:00'')         AS CSIS_BKP_HORA1,');
        sql.Add('      COALESCE(CS.CSIS_BKP_HORA2,''00:00'')         AS CSIS_BKP_HORA2,');
        sql.Add('      COALESCE(CS.CSIS_BKP_HORA3,''00:00'')         AS CSIS_BKP_HORA3');
        sql.Add('FROM  CONF_SISTEMA CS');
        sql.Add('WHERE CSIS_EMPR_ID = ' + strEmpr_ID);
        Open;
      end;
      setReportaErro            ( qryCons.FieldByName('CSIS_REPORTA_ERROS').AsInteger);
      setVisualFinanc           ( qryCons.FieldByName('CSIS_VISUAL_FINANCEIRO').AsInteger);
      setJuro                   ( qryCons.FieldByName('CSIS_JURO').AsFloat);
      setMora                   ( qryCons.FieldByName('CSIS_MORA').AsFloat);
      setPercentRenda           ( qryCons.FieldByName('CSIS_PERCENTE_RENDA').AsFloat);
      setEstoqueNegativo        ( qryCons.FieldByName('CSIS_ESTOQUE_NEGATIVO').AsInteger);
      setVersionSystem          ( qryCons.FieldByName('CSIS_VERSION_SYSTEM').AsInteger);
      setTabPrecoPadrao         ( qryCons.FieldByName('CSIS_TPRC_ID').AsInteger);
      setClientePadrao          ( qryCons.FieldByName('CSIS_CLIE_ID').AsInteger);
      setReagendaOS             ( qryCons.FieldByName('CSIS_REAGENDAR_OS').AsInteger);
      setForcaReagenda          ( qryCons.FieldByName('CSIS_FORCAR_REAGENDA').AsInteger);
      setIntegraProdutos        ( qryCons.FieldByName('CSIS_INTEGRAR_PRODUTOS').AsInteger = 1);
      setIntegraClientes        ( qryCons.FieldByName('CSIS_INTEGRAR_CLIENTES').AsInteger = 1);
      setVlrMetaAno             ( qryCons.FieldByName('CSIS_VLR_META_ANO').AsFloat);
      setControlaLimite         ( qryCons.FieldByName('CSIS_CONTROLA_LIMITE_CREDITO').AsInteger = 1);
      setTipoMenu               ( 1 );
      setTipoEmpresa            ( qryCons.FieldByName('CSIS_TIPO_EMPRESA').AsInteger);
      setOptanteSimples         ( qryCons.FieldByName('CSIS_OPTANTE_SIMPLES').AsInteger = 1);
      setEmpresaMatriz          ( qryCons.FieldByName('CSIS_EMPRESA_MATRIZ').AsInteger = 1);
      setAliquotaPIS            ( qryCons.FieldByName('CSIS_ALIQUOTA_PADRAO_PIS').AsFloat);
      setAliquotaCOFINS         ( qryCons.FieldByName('CSIS_ALIQUOTA_PADRAO_COFINS').AsFloat);
      setSepararTeleAtendimento ( qryCons.FieldByName('CSIS_SEPARAR_TELEATENDIMENTO').AsInteger = 1);
      setTrabTipoAgendamento    ( qryCons.FieldByName('CSIS_TRAB_TIPO_AGENDAMENTO').AsInteger = 1);
      setNovoPadraoTelefone     ( qryCons.FieldByName('CSIS_USAR_PADRAO_TELEFONE').AsInteger = 1 );
      setTrabNrPedido           ( qryCons.FieldByName('CSIS_INFORMA_NR_PEDIDO').AsInteger = 1 );
      setInformeFornecEquip     ( qryCons.FieldByName('CSIS_TRAB_FORNEC_EQUIP').AsInteger = 1 );
      setTrabStatusOS           ( qryCons.FieldByName('CSIS_TRAB_STATUS_OS').AsInteger = 1 );
      setFiltrarPlanoContasPAI  ( qryCons.FieldByName('CSIS_FILTRAR_PLANO_CONTAS_PAI').AsInteger = 1 );
      setVinculaCartaoCredito   ( qryCons.FieldByName('CSIS_VINCULAR_CARTAO_CREDITO').AsInteger = 1 );
      setPercFundoReserva       ( qryCons.FieldByName('CSIS_PERC_FUNDO_RESERVA').AsFloat);
      setAplicFundoReservaRecLiq( qryCons.FieldByName('CSIS_APLICA_FDR_VLR_LIQUIDO').AsInteger = 1);
      setPercReservaLucro       ( qryCons.FieldByName('CSIS_PERC_RESERVA_LUCRO').AsFloat);
      setPercReservaLegal       ( qryCons.FieldByName('CSIS_PERC_RESERVA_LEGAL').AsFloat);
      setPercReservaEstatutarias( qryCons.FieldByName('CSIS_PERC_RESERVA_ESTATUTARIAS').AsFloat);
      setAplicFDERecLiq         ( qryCons.FieldByName('CSIS_APLICA_FDE_VLR_LIQUIDO').AsInteger = 1);
      setReplicClienteFornecedor( qryCons.FieldByName('CSIS_REPLICA_CLIENTE_FORNECEDOR').AsInteger = 1);
      setHr_Inicio              ( qryCons.FieldByName('CSIS_INICIO_TRABALHO').AsString );
      setHr_Termino             ( qryCons.FieldByName('CSIS_FINAL_TRABALHO').AsString );
      setHr_Intervalo           ( qryCons.FieldByName('CSIS_INTERVALO_HORARIO').AsString );
      setHr_Almoco_Fim          ( qryCons.FieldByName('CSIS_HR_ALMOCO_FIM').AsString );
      setHr_Almoco_Inicio       ( qryCons.FieldByName('CSIS_HR_ALMOCO_INICIO').AsString );
      setOcultarClientes        ( qryCons.FieldByName('CSIS_OCULTA_CLIENTES').AsInteger = 1);
      setTaxaCredito            ( qryCons.FieldByName('CSIS_TX_CREDITO').AsFloat);
      setTaxaDebito             ( qryCons.FieldByName('CSIS_TX_DEBITO').AsFloat);
      setDiasDepositoCredito    ( qryCons.FieldByName('CSIS_DIAS_DEP_CREDITO').AsInteger);
      setDiasDepositoDebito     ( qryCons.FieldByName('CSIS_DIAS_DEP_DEBITO').AsInteger);
      setEmiteReciboPagtoParc   ( qryCons.FieldByName('CSIS_RECIBO_PGTOPARCIAL').AsInteger =1);
      setContaBcoCredito        ( qryCons.FieldByName('CSIS_CBCO_ID_CREDITO').AsInteger);
      setContaBcoDebito         ( qryCons.FieldByName('CSIS_CBCO_ID_DEBITO').AsInteger);
      setFornecCartaoCred       ( qryCons.FieldByName('CSIS_FORN_ID_CARTAO_CRED').AsInteger);
      setFornecCartaoDeb        ( qryCons.FieldByName('CSIS_FORN_ID_CARTAO_DEB').AsInteger);
      setSolicitaNrTransCartao  ( qryCons.FieldByName('CSIS_SOLICITA_NR_TRANSACAO').AsInteger>0);
      setBackupDomingo          ( qryCons.FieldByName('CSIS_BKP_DOMINGO').AsInteger = 1);
      setBackupSegunda          ( qryCons.FieldByName('CSIS_BKP_SEGUNDA').AsInteger = 1);
      setBackupTerca            ( qryCons.FieldByName('CSIS_BKP_TERCA').AsInteger = 1);
      setBackupQuarta           ( qryCons.FieldByName('CSIS_BKP_QUARTA').AsInteger = 1);
      setBackupQuinta           ( qryCons.FieldByName('CSIS_BKP_QUINTA').AsInteger = 1);
      setBackupSexta            ( qryCons.FieldByName('CSIS_BKP_SEXTA').AsInteger = 1);
      setBackupSabado           ( qryCons.FieldByName('CSIS_BKP_SABADO').AsInteger = 1);
      setBackupHora1            ( qryCons.FieldByName('CSIS_BKP_HORA1').AsString );
      setBackupHora2            ( qryCons.FieldByName('CSIS_BKP_HORA2').AsString );
      setBackupHora3            ( qryCons.FieldByName('CSIS_BKP_HORA3').AsString );

      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT COUNT(*) AS QTDE');
        sql.Add('  FROM USUARIO_PROFISSIONAIS');
        sql.Add(' WHERE USPR_USER_ID_USUARIO = :USER_ID');
        Params.ParamByName('USER_ID').AsInteger := User_ID;
        Open;
      end;

      setLimitadoListaDeProf    ( qryCons.Fields[0].AsInteger > 0 );

      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT COALESCE(USER_LIMITAR_PROFISSIONAIS,0) AS USER_LIMITAR_PROFISSIONAIS');
        sql.Add('  FROM USUARIO');
        sql.Add(' WHERE USER_ID = :USER_ID');
        Params.ParamByName('USER_ID').AsInteger := User_ID;
        Open;
      end;

      setLimitarProfNoSistema( qryCons.FieldByName('USER_LIMITAR_PROFISSIONAIS').AsInteger = 1);

    except on e: exception do
      ReportaErro('TFuncoes','ConfiguracoesSystem',e.Message);
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.TemInternet: Boolean;
var
  strTMP : String;
begin
  DeleteIECache;
  strTMP := GetTempDirectory;
  Result := (URLDownloadToFile(nil,PChar('http://www.arsistemaseconsultoria.com.br/licencas/teste.txt'),PChar(strTMP),0,nil) > 0);
end;

function TFuncoes.TemPermissao(strMenu_ID: String): Boolean;
begin
//  ShowMessage('');
  Result := GetPermissao(StrToInt(strMenu_ID));
end;

function TFuncoes.TemRegistros(edtCodigo, edtDescricao : TEdit): Boolean;
begin
  Result := ((edtCodigo.Text <> '') and (edtDescricao.Text <> ''));
end;

function TFuncoes.TemRegistros(lbTMP: TListBox): Boolean;
begin
  Result := (lbTMP.Count > 0);
end;

function TFuncoes.MacAddress(): string;
var
  Lib: Cardinal;
  Func: function(GUID: PGUID): Longint; stdcall;
  GUID1, GUID2: TGUID;
begin
  Result := '';
  Lib := LoadLibrary('rpcrt4.dll');
  if Lib <> 0 then begin
    @Func := GetProcAddress(Lib, 'UuidCreateSequential');
    if Assigned(Func) then begin
       if (Func(@GUID1) = 0) and
       (Func(@GUID2) = 0) and
       (GUID1.D4[2] = GUID2.D4[2]) and
       (GUID1.D4[3] = GUID2.D4[3]) and
       (GUID1.D4[4] = GUID2.D4[4]) and
       (GUID1.D4[5] = GUID2.D4[5]) and
       (GUID1.D4[6] = GUID2.D4[6]) and
       (GUID1.D4[7] = GUID2.D4[7]) then begin
         Result :=
         IntToHex(GUID1.D4[2], 2) + '-' +
         IntToHex(GUID1.D4[3], 2) + '-' +
         IntToHex(GUID1.D4[4], 2) + '-' +
         IntToHex(GUID1.D4[5], 2) + '-' +
         IntToHex(GUID1.D4[6], 2) + '-' +
         IntToHex(GUID1.D4[7], 2);
       end;
    end;
  end;
end;

procedure TFuncoes.EstornaAcertos(Codigo,
                                 sOrigem        : String);
var
  qryCons : TSQLQuery;
  S       : String;
begin
  case sOrigem[1] of
    'A' : S := 'UPDATE ACERTOS                      '+
               '   SET ACER_STATUS         = ''C''  '+
               ' WHERE ACER_EMPR_ID        = %D     '+
               '   AND ACER_ORIGEM         = ''%S'' '+
               '   AND ACER_ID_ORIGEM      = %S     '+
               '   AND ACER_EMPR_ID_ORIGEM = %D     ';
  end;
  S := Format(S,[Empr_ID,
                 sOrigem,
                 Codigo ,
                 Empr_ID]);
  try
    FormatSettings.DecimalSeparator := '.';
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          StartCommit;
        except
        end;
        sql.Add(S);
        ExecSQL;
        try
          Commit;
        except
        end;
      end;
    except on e: exception do begin
      RollBack;
      ReportaErro('TFuncoes','RegistraAcertos',e.Message);
      Alerta('Erro no processo de registro do título.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

function TFuncoes.RegistraAcerto(sOrigem       : String;
                                  IdOrigem,
                                  IdClieForn    : Integer;
                                  sEmprClieForn : String;
                                  IdTpDoc       : Integer;
                                  dtVcto        : TDate;
                                  VlrDoc        : Real) : String;
var
  qryCons    : TSQLQuery;
  S          : String;
  strACER_ID : String;
begin
  if VlrDoc <= 0 then Exit;

  S := 'INSERT INTO ACERTOS(ACER_ID,                                        '+  //1
       '                    ACER_EMPR_ID,                                   '+  //2
       '                    ACER_ORIGEM,                                    '+  //3
       '                    ACER_ID_ORIGEM,                                 '+  //4
       '                    ACER_EMPR_ID_ORIGEM,                            '+  //5
       '                    ACER_ID_CLIE_FORN,                              '+  //6
       '                    ACER_EMPR_ID_CLIE_FORN,                         '+  //7
       '                    ACER_GENE_EMPR_ID_TP_DOC,                       '+  //8
       '                    ACER_GENE_TGEN_ID_TP_DOC,                       '+  //9
       '                    ACER_GENE_ID_TP_DOC,                            '+  //10
       '                    ACER_DTA_VCTO,                                  '+  //11
       '                    ACER_VLR_DOC,                                   '+  //12
       '                    ACER_STATUS,                                    '+  //13
       '                    ACER_DTA_CADASTRO,                              '+  //14
       '                    ACER_USER_ID)                                   '+  //15
       '             VALUES (%s,                                            '+  //1
       '                     %d,                                            '+  //2
       '                     ''%s'',                                        '+  //3
       '                     %d,                                            '+  //4
       '                     %d,                                            '+  //5
       '                     %d,                                            '+  //6
       '                     %s,                                            '+  //7
       '                     0,                                             '+  //8
       '                     5,                                             '+  //9
       '                     %d,                                            '+  //10
       '                     ''%s'',                                        '+  //11
       '                     %s,                                            '+  //12
       '                     ''A'',                                         '+  //13
       '                     (SELECT CURRENT_TIMESTAMP FROM RDB$DATABASE),  '+  //14
       '                     %d)                                            ';  //15

  strACER_ID := ObterSequencia('ACERTOS',IntToStr(Empr_ID));
  S := Format(S,[strACER_ID,
                 Empr_ID,
                 sOrigem,
                 IdOrigem,
                 Empr_ID,
                 IdClieForn,
                 sEmprClieForn,
                 IdTpDoc,
                 FormatDateTime('mm/dd/yyyy',dtVcto),
                 StringReplace( StringReplace(FormatFloat('###,###,##0.0000',VlrDoc),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]),
                 User_ID]);
  try
    FormatSettings.DecimalSeparator := '.';
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          StartCommit;
        except
        end;
        sql.Add(S);
        ExecSQL;
        try
          Commit;
        except
        end;
      end;
    except on e: exception do begin
      RollBack;
      ReportaErro('TFuncoes','RegistraAcertos',e.Message);
      Alerta('Erro no processo de registro do título.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TFuncoes.RegistraAcesso(intRotina: Integer);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    with qryCons do begin
      Close;
      sql.Add(Format('INSERT INTO ACESSO_ROTINAS(ACRO_MENU_ID, ACRO_USER_ID) VALUES( %d, %d)',[intRotina, User_ID]));
      ExecSQL();
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.RegistraAuditoria(sRotina, sCampo, sValorAnt, sValorAtual : String): Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('INSERT INTO AUDITORIA(AUDI_ROTINA,');
      sql.Add('                      AUDI_DADO,');
      sql.Add('                      AUDI_VALOR_ANTER,');
      sql.Add('                      AUDI_VALOR_ATUAL,');
      sql.Add('                      AUDI_USER_ID)');
      sql.Add('               VALUES(:AUDI_ROTINA,');
      sql.Add('                      :AUDI_DADO,');
      sql.Add('                      :AUDI_VALOR_ANTER,');
      sql.Add('                      :AUDI_VALOR_ATUAL,');
      sql.Add('                      :AUDI_USER_ID)');
      Params.ParamByName('AUDI_ROTINA').Value       := sRotina;
      Params.ParamByName('AUDI_DADO').Value         := sCampo;
      Params.ParamByName('AUDI_VALOR_ANTER').Value  := sValorAnt;
      Params.ParamByName('AUDI_VALOR_ATUAL').Value  := sValorAtual;
      Params.ParamByName('AUDI_USER_ID').Value      := User_ID;
      ExecSQL();
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

{*******************************************************************************
Descrição:  Procedure para lançamento e cadastro de título no contas a pagar de
            forma automática
Data:       17/03/2010
Parametros:
  - strNrDoc        = Nº do Documento
  - strProveniente  = Proveniencia do documento a ser cadastrado (Breve Historia)
  - strFORN_ID      = Código do Fornecedor
  - strPLCT_ID      = Código do Plano de contas a ser lançado
  - dtDtEmissao     = Data de emissão do título
  - dtDtVcto        = Data de Vencimento do Título
  - floatVlrDoc     = Valor do Documento
  - floatJuro       = Valor do Juro
  - floatMora       = Valor da Mora
  - strTP_Doc       = Tipo do Documento (Dinheiro, Cheque e etc.)
  - strViaBanco     = Flag informando se o pagamento será ou não via banco
  - strCBCO_ID      = Código do Banco
*******************************************************************************}
function TFuncoes.RegistraContasPagar(strNrDoc,
                                       strProveniente,
                                       strFORN_ID,
                                       strPLCT_ID,
                                       strTP_DOC   : String;
                                       dtDtEmissao,
                                       dtDtVcto    : TDateTime;
                                       floatVlrDoc : Real = 0;
                                       floatJuro   : Real = 0;
                                       floatMora   : Real = 0;
                                       strNFAC_ID  : String = 'Null';
                                       strNFEN_ID  : String = 'Null';
                                       strViaBanco : String = 'Null';
                                       strCBCO_ID  : String = 'Null';
                                       strCodOrigem : String  = 'Null';
                                       strOrigem    : String  = 'O') : String;
var
  qryCons : TSQLQuery;
  strCPAG_ID,
  S : String;
begin
  try
    FormatSettings.DecimalSeparator := '.';
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          StartCommit;
        except
        end;
        strCPAG_ID := ObterSequencia('CONTAS_PAGAR',IntToStr(Empr_ID),false);
        Result := strCPAG_ID;
        S := 'INSERT INTO CONTAS_PAGAR(CPAG_ID,                                           '+#13+ //0
             '                         CPAG_EMPR_ID,                                      '+#13+ //1
             '                         CPAG_NR_DOC,                                       '+#13+ //2
             '                         CPAG_PROVENIENTE,                                  '+#13+ //3
             '                         CPAG_FORN_ID,                                      '+#13+ //4
             '                         CPAG_PLCT_ID,                                      '+#13+ //5
             '                         CPAG_PLCT_EMPR_ID,                                 '+#13+ //6
             '                         CPAG_DTA_EMISSAO,                                  '+#13+ //7
             '                         CPAG_DTA_VCTO,                                     '+#13+ //8
             '                         CPAG_VALOR_DOC,                                    '+#13+ //9
             '                         CPAG_VALOR_JUROS,                                  '+#13+ //10
             '                         CPAG_VALOR_MORA,                                   '+#13+ //11
             '                         CPAG_STATUS,                                       '+#13+ //12
             '                         CPAG_VALOR_PAGO,                                   '+#13+ //13
             '                         CPAG_GENE_EMPR_ID_TIPO_DOC,                        '+#13+ //14
             '                         CPAG_GENE_TGEN_ID_TIPO_DOC,                        '+#13+ //15
             '                         CPAG_GENE_ID_TIPO_DOC,                             '+#13+ //16
             '                         CPAG_DTA_CADASTRO,                                 '+#13+ //17
             '                         CPAG_USER_ID,                                      '+#13+ //18
             '                         CPAG_VIA_BANCO,                                    '+#13+ //19
             '                         CPAG_CBCO_ID,                                      '+#13+ //20
             '                         CPAG_CBCO_EMPR_ID,                                 '+#13+ //21
             '                         CPAG_NFAC_ID,                                      '+#13+ //22
             '                         CPAG_NFAC_EMPR_ID,                                 '+#13+ //23
             '                         CPAG_NFAC_NFEN_ID,                                 '+#13+ //24
             '                         CPAG_NFAC_NFEN_EMPR_ID,                            '+#13+ //25
             '                         CPAG_PREVISAO,                                     '+#13+ //26
             '                         CPAG_AGEN_ID,                                      '+#13+ //27
             '                         CPAG_AGEN_EMPR_ID)                                 '+#13+ //28
             'VALUES(' + strCPAG_ID                                                    +','+#13 //0
                       + IntToStr(Empr_ID)                                             +','+#13 //1
                       + QuotedStr(strNrDoc)                                           +','+#13 //2
                       + QuotedStr(strProveniente)                                     +','+#13 //3
                       + strFORN_ID                                                    +','+#13 //4
                       + strPLCT_ID                                                    +','+#13 //5
                       + '0'                                                           +','+#13 //6
                       + QuotedStr(FormatDateTime('mm/dd/yyyy',dtDtEmissao))           +','+#13 //7
                       + QuotedStr(FormatDateTime('mm/dd/yyyy',dtDtVcto))              +','+#13 //8
                       + FormatFloat('0.0000',floatVlrDoc)                             +','+#13 //9
                       + FormatFloat('0.0000',floatJuro)                               +','+#13 //10
                       + FormatFloat('0.0000',floatMora)                               +','+#13 //11
                       + QuotedStr('A')                                                +','+#13 //12
                       + '0,0'                                                         +','+#13 //13,14
                       + '5'                                                           +','+#13 //15
                       + strTP_Doc                                                     +','+#13 //16
                       + QuotedStr(FormatDateTime('mm/dd/yyyy',DataServidor(Conexao))) +','+#13 //17
                       + IntToStr(User_ID)                                             +','+#13 //18
                       + strViaBanco                                                   +','+#13 //19
                       + strCBCO_ID                                                    +','+#13 //20
                       + IntToStr(Empr_ID)                                             +','+#13 //21
                       + strNFAC_ID                                                    +','+#13 //22
                       + IntToStr(Empr_ID)                                             +','+#13 //23
                       + strNFEN_ID                                                    +','+#13 //24
                       + IntToStr(Empr_ID)                                             +','+#13 //25
                       + '0'                                                           +','+#13 //26
                       + Se(strOrigem[1]='A',strCodOrigem,'Null')                      +','+#13 //27
                       + IntToStr(Empr_ID)                                             +')';    //28;
        SQL.Add(S);
        ExecSQL;
        try
          Commit;
        except
        end;
      end;
    except on e: exception do begin
      RollBack;
      ReportaErro('TFuncoes','RegistraContasPagar',e.Message);
      Alerta('Erro no processo de registro do título no contas a pagar.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

{*******************************************************************************
Data:       01/08/2010
Autor:      Alex Itamar Gomes
Descrição:  Metodo para lançamento e cadastro de título no contas a receber de
            forma automática

Historico
Data          Autor                 Descrição
01/08/2010    Alex Itamar Gomes     Inclusão do cabeçalho
07/08/2010    Alex Itamar Gomes     Alteração na passagem de parametros para a função
                                    passando tambem o ID da tabela de Acertos da
                                    ordem de serviço
*******************************************************************************}
function TFuncoes.RegistraContasReceber(strNr_Doc,
                                         strProveniente,
                                         strClie_ID,
                                         strPLCT_ID,
                                         strTipoDoc   : String;
                                         dtDtEmissao,
                                         dtDtVcto     : TDateTime;
                                         fltValor_Doc : Real    = 0;
                                         fltJuro      : Real    = 0;
                                         fltMora      : Real    = 0;
                                         fltPago      : Real    = 0;
                                         strStatus    : String  = 'A';
                                         strObs       : String  = 'Null';
                                         strViaBanco  : String  = 'Null';
                                         strCBCO_ID   : String  = 'Null';
                                         strODAC_ID   : String  = 'Null';
                                         strCodOrigem : String  = 'Null';
                                         strOrigem    : String  = 'O') : String;
var
  qryCons : TSQLQuery;
  strCREC_ID : String;
begin
  try
    FormatSettings.DecimalSeparator := '.';
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          StartCommit;
        except
        end;
        strCREC_ID := ObterSequencia('CONTAS_RECEBER',IntToStr(Empr_ID),false);
        Result := strCREC_ID;
        sql.Add('INSERT INTO CONTAS_RECEBER(CREC_ID,');                         //0
        sql.Add('                           CREC_EMPR_ID,');                    //1
        sql.Add('                           CREC_NR_DOC,');                     //2
        sql.Add('                           CREC_PROVENIENTE,');                //3
        sql.Add('                           CREC_CLIE_ID,');                    //4
        sql.Add('                           CREC_CLIE_EMPR_ID,');               //5
        sql.Add('                           CREC_PLCT_ID,');                    //6
        sql.Add('                           CREC_PLCT_EMPR_ID,');               //7
        sql.Add('                           CREC_DTA_EMISSAO,');                //8
        sql.Add('                           CREC_DTA_VCTO,');                   //9
        sql.Add('                           CREC_VALOR_DOC,');                  //10
        sql.Add('                           CREC_VALOR_JUROS,');                //11
        sql.Add('                           CREC_VALOR_MORA,');                 //12
        sql.Add('                           CREC_STATUS,');                     //13
        sql.Add('                           CREC_VALOR_PAGO,');                 //14
        sql.Add('                           CREC_GENE_EMPR_ID_TIPO_DOC,');      //15
        sql.Add('                           CREC_GENE_TGEN_ID_TIPO_DOC,');      //16
        sql.Add('                           CREC_GENE_ID_TIPO_DOC,');           //17
        sql.Add('                           CREC_OBS,');                        //18
        sql.Add('                           CREC_VIA_BANCO,');                  //19
        sql.Add('                           CREC_CBCO_ID,');                    //20
        sql.Add('                           CREC_CBCO_EMPR_ID,');               //21
        SQL.Add('                           CREC_ODAC_ID,');                    //22
        SQL.Add('                           CREC_ODAC_EMPR_ID,');               //23
        SQL.Add('                           CREC_ODAC_ORDS_ID,');               //24
        SQL.Add('                           CREC_ODAC_ORDS_EMPR_ID,');          //25
        SQL.Add('                           CREC_ODAC_ORDS_CLIE_ID,');          //26
        SQL.Add('                           CREC_ODAC_ORDS_CLIE_EMPR_ID,');     //27
        SQL.Add('                           CREC_PREVISAO,');
        sql.Add('                           CREC_AGEN_ID,');
        sql.Add('                           CREC_AGEN_EMPR_ID,');
        sql.Add('                           CREC_DTA_CADASTRO,');               //28
        sql.Add('                           CREC_USER_ID)');                    //29
        sql.Add('VALUES(' + strCREC_ID                                          + ',' //0
                          + IntToStr(Empr_ID)                                   + ',' //1
                          + QuotedStr(strNr_Doc)                                + ',' //2
                          + QuotedStr(strProveniente)                           + ',' //3
                          + strClie_ID                                          + ',' //4
                          + IntToStr(Empr_ID)                                   + ',' //5
                          + strPLCT_ID                                          + ',' //6
                          + IntToStr(Empr_ID)                                   + ',' //7
                          + QuotedStr(FormatDateTime('mm/dd/yyyy',dtDtEmissao)) + ',' //8
                          + QuotedStr(FormatDateTime('mm/dd/yyyy',dtDtVcto))    + ',' //9
                          + FormatFloat('0.00',fltValor_Doc)                    + ',' //10
                          + FormatFloat('0.00',fltJuro)                         + ',' //11
                          + FormatFloat('0.00',fltMora)                         + ',' //12
                          + QuotedStr(strStatus)                                + ',' //13
                          + FormatFloat('0.00',fltPago)                         + ',' //14
                          + '0,5'                                               + ',' //15,16
                          + strTipoDoc                                          + ',' //17
                          + QuotedStr(strObs)                                   + ',' //18
                          + strViaBanco                                         + ',' //19
                          + strCBCO_ID                                          + ',' //20
                          + IntToStr(Empr_ID)                                   + ',' //21
                          + strODAC_ID                                          + ',' //22
                          + IntToStr(Empr_ID)                                   + ',' //23
                          + Se(strOrigem[1]='O',strCodOrigem,'Null')            + ',' //24
                          + IntToStr(Empr_ID)                                   + ',' //25
                          + strClie_ID                                          + ',' //26
                          + IntToStr(Empr_ID)                                   + ',' //27
                          + '0'                                                 + ',' //28
                          + Se(strOrigem[1]='A',strCodOrigem,'Null')            + ',' //29
                          + IntToStr(Empr_ID)                                   + ',' //30
                          + QuotedStr(FormatDateTime('mm/dd/yyyy',DataServidor(Conexao))) + ',' //31
                          + IntToStr(User_ID)                                   + ')'); //32
        ExecSQL;
        try
          Commit;
        except
        end;
        if fltPago > 0 then begin
          sql.Clear;
          try
            StartCommit;
          except
          end;
          sql.Add('INSERT INTO CONTAS_RECEBER_ACERTOS(ACRE_ID,');
          sql.Add('                                   ACRE_EMPR_ID,');
          sql.Add('                                   ACRE_CREC_ID,');
          sql.Add('                                   ACRE_CREC_EMPR_ID,');
          sql.Add('                                   ACRE_GENE_EMPR_ID_TIPO_PGTO,');
          sql.Add('                                   ACRE_GENE_TGEN_ID_TIPO_PGTO,');
          sql.Add('                                   ACRE_GENE_ID_TIPO_PGTO,');
          sql.Add('                                   ACRE_VALOR_DOC,');
          sql.Add('                                   ACRE_DTA_CADASTRO,');
          sql.Add('                                   ACRE_USER_ID)');
          sql.Add('VALUES(' + ObterSequencia('CONTAS_RECEBER_ACERTOS',IntToStr(Empr_ID)) + ','
                            + IntToStr(Empr_ID)                                 + ','
                            + strCREC_ID                                        + ','
                            + IntToStr(Empr_ID)                                 + ','
                            + '0,5'                                             + ','
                            + strTipoDoc                                        + ','
                            + FormatFloat('0.00',fltPago)                       + ','
                            + QuotedStr(FormatDateTime('mm/dd/yyyy',DataServidor(Conexao))) + ','
                            + IntToStr(User_ID)                                 + ')');
          ExecSQL;
          try
            Commit;
          except
          end;
        end;
      end;
    except on e: exception do begin
      RollBack;
      ReportaErro('TFuncoes','RegistraContasReceber',e.Message);
      Alerta('Erro no processo de registro do título no contas a receber.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

{*******************************************************************************
Descrição:  Procedure para criar o estoque do produto e registrar a movimentação
            para o estoque lançado.
Data:       03/03/2010
Parametros:
  intTipo -     1 - Registra Movimentação do Estoque (Estoque Atual e Disponivel)
                2 - Registra Movimentação do Estoque (Estoque Disponível)
                3 - Registra Movimentação do Estoque (Estoque Atual)

  strGene_ID -  1 - Entrada Avulsa
                2 - Entrada Nota Fiscal
                3 - Saida Avulsa
                4 - Saída Ordem de Serviço
                5 - Estorno Ordem Serviço
                6 - Saida por Construção
*******************************************************************************}
procedure TFuncoes.MovimentaEstoque(strPROD_ID : String; floatQtde : Real = 0;
  intTipo : Integer = 1; strGene_ID : String = '1');
var
  qryCons     : TSQLQuery;
  strEstq_ID  : String;
begin
  try
    FormatSettings.DecimalSeparator := '.';
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      {verificando se já existe o registro do produto no estoque}
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(*)');
        sql.Add('FROM  ESTOQUE');
        sql.Add('WHERE ESTQ_EMPR_ID      = ' + IntToStr(Empr_ID));
        sql.Add('AND   ESTQ_PROD_ID      = ' + strPROD_ID);
        sql.Add('AND   ESTQ_PROD_EMPR_ID = ' + IntToStr(Empr_ID));
        Open;

        {Caso não exista o registro, ele e criado.}
        if ((qryCons.IsEmpty) or (qryCons.Fields[0].AsInteger = 0)) then begin
          sql.Clear;
          try
            StartCommit;
          except
          end;
          sql.Add('INSERT INTO ESTOQUE(');
          sql.Add('                    ESTQ_ID,');
          sql.Add('                    ESTQ_EMPR_ID,');
          sql.Add('                    ESTQ_PROD_ID,');
          sql.Add('                    ESTQ_PROD_EMPR_ID,');
          sql.Add('                    ESTQ_EST_ATUAL,');
          sql.Add('                    ESTQ_EST_DISP,');
          sql.Add('                    ESTQ_DTA_CADASTRO,');
          sql.Add('                    ESTQ_USER_ID');
          sql.Add('                    )');
          strEstq_ID := ObterSequencia('ESTOQUE',IntToStr(Empr_ID));
          sql.Add('VALUES(' + strEstq_ID                                                    + ','
                            + IntToStr(Empr_ID)                                             + ','
                            + strPROD_ID                                                    + ','
                            + IntToStr(Empr_ID)                                             + ','
                            + '0'                                                           + ','
                            + '0'                                                           + ','
                            + QuotedStr(FormatDateTime('mm/dd/yyyy',DataServidor(Conexao))) + ','
                            + IntToStr(User_ID)                                             + ')');
          ExecSQL;
          try
            Commit;
          except
          end;
        ///Se o registro existir, faz a select para retornar o Id
        end else begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      ESTQ_ID');
          sql.Add('FROM  ESTOQUE');
          sql.Add('WHERE ESTQ_EMPR_ID      = ' + IntToStr(Empr_ID));
          sql.Add('AND   ESTQ_PROD_ID      = ' + strPROD_ID);
          sql.Add('AND   ESTQ_PROD_EMPR_ID = ' + IntToStr(Empr_ID));
          Open;
          strEstq_ID := qryCons.Fields[0].AsString;
        end;
      end;
      {Atualiza o estoque e registro o movimento}
      RegistraMovimentoEstoque(intTipo,strPROD_ID,strEstq_ID,floatQtde,strGene_ID);
    except on e: exception do begin
      RollBack;
      Alerta('Erro no processo de criação do estoque para o produto informado.'+#13+'['+e.Message+']',1);
      ReportaErro('TFuncoes','MovimentaEstoque',e.Message);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

{*******************************************************************************
Descrição:  Procedimento para registrar movimentação do estoque
Data:       03/03/2010
Parametros:
  intTipo -     1 - Registra Movimentação do Estoque (Estoque Atual e Disponivel)
                2 - Registra Movimentação do Estoque (Estoque Disponível)
                3 - Registra Movimentação do Estoque (Estoque Atual)

  strGene_ID -  1 - Entrada Avulsa
                2 - Entrada Nota Fiscal
                3 - Saida Avulsa
                4 - Saída Ordem de Serviço
                5 - Estorno Ordem de Serviço
*******************************************************************************}
procedure TFuncoes.RegistraMovimentoEstoque(intTipo : Integer; strPROD_ID, strEstq_ID : String;
  floatQtde : Real; strGene_ID : String);
var
  qryCons     : TSQLQuery;
  boolMovEstq : Boolean;
begin
  try
    boolMovEstq := true;
    if ProdMovimentaEstoque(boolMovEstq, strPROD_ID) then begin
      try
        {Registra a movimentação do produto}
        FormatSettings.DecimalSeparator := '.';
        qryCons := TSQLQuery.Create(nil);
        qryCons.SQLConnection := Conexao;
        try
          if boolMovEstq then begin
            with qryCons do begin
              Close;
              sql.Clear;
              try
                StartCommit
              except
              end;
              ///Registra a movimentação do estoque
              sql.Add('INSERT INTO ESTOQUE_MOV(');
              sql.Add('                        ESTM_ID,');
              sql.Add('                        ESTM_EMPR_ID,');
              sql.Add('                        ESTM_ESTQ_ID,');
              sql.Add('                        ESTM_ESTQ_EMPR_ID,');
              sql.Add('                        ESTM_GENE_EMPR_ID_ORIGEM,');
              sql.Add('                        ESTM_GENE_TGEN_ID_ORIGEM,');
              sql.Add('                        ESTM_GENE_ID_ORIGEM,');
              sql.Add('                        ESTM_QTDE_MOV,');
              sql.Add('                        ESTM_DTA_CADASTRO,');
              sql.Add('                        ESTM_USER_ID');
              sql.Add('                        )');
              sql.Add('VALUES(' + ObterSequencia('ESTOQUE_MOV',IntToStr(Empr_ID))               + ','
                                + IntToStr(Empr_ID)                                             + ','
                                + strEstq_ID                                                    + ','
                                + IntToStr(Empr_ID)                                             + ','
                                + '0'                                                           + ','
                                + '4'                                                           + ','
                                + strGene_ID                                                    + ','
                                + FormatFloat('###,###,##0.0000',floatQtde)                     + ','
                                + QuotedStr(FormatDateTime('mm/dd/yyyy',DataServidor(Conexao))) + ','
                                + IntToStr(User_ID)                                             + ')');
      //        ShowMessage(qryCons.Text);
              ExecSQL;
              try
                Commit;
              except
              end;
              {Atualiza o estoque do produto na tabela ESTOQUE}
              sql.Clear;
              try
                StartCommit
              except
              end;
              case intTipo of
                ///Estoque Atual e Disponivel
                1 : begin
                  sql.Add('UPDATE ESTOQUE');
                  sql.Add('SET    ESTQ_EST_ATUAL    = ESTQ_EST_ATUAL + ' + FormatFloat('###,###,##0.0000',floatQtde));
                  sql.Add('      ,ESTQ_EST_DISP     = ESTQ_EST_DISP + ' + FormatFloat('###,###,##0.0000',floatQtde));
                  sql.Add('WHERE  ESTQ_ID           = ' + strEstq_ID);
                  sql.Add('AND    ESTQ_EMPR_ID      = ' + (IntToStr(Empr_ID)));
                  sql.Add('AND    ESTQ_PROD_ID      = ' + strPROD_ID);
                  sql.Add('AND    ESTQ_PROD_EMPR_ID = ' + (IntToStr(Empr_ID)));
                end;
                ///Estoque Disponivel
                2 : begin
                  sql.Add('UPDATE ESTOQUE');
                  sql.Add('SET    ESTQ_EST_DISP     = ESTQ_EST_DISP + ' + FormatFloat('###,###,##0.0000',floatQtde));
                  sql.Add('WHERE  ESTQ_ID           = ' + strEstq_ID);
                  sql.Add('AND    ESTQ_EMPR_ID      = ' + (IntToStr(Empr_ID)));
                  sql.Add('AND    ESTQ_PROD_ID      = ' + strPROD_ID);
                  sql.Add('AND    ESTQ_PROD_EMPR_ID = ' + (IntToStr(Empr_ID)));
                end;
                ///Estoque Atual
                3 : begin
                  sql.Add('UPDATE ESTOQUE');
                  sql.Add('SET    ESTQ_EST_ATUAL    = ESTQ_EST_ATUAL + ' + FormatFloat('###,###,##0.0000',floatQtde));
                  sql.Add('WHERE  ESTQ_ID           = ' + strEstq_ID);
                  sql.Add('AND    ESTQ_EMPR_ID      = ' + (IntToStr(Empr_ID)));
                  sql.Add('AND    ESTQ_PROD_ID      = ' + strPROD_ID);
                  sql.Add('AND    ESTQ_PROD_EMPR_ID = ' + (IntToStr(Empr_ID)));
                end;
              end;
    //          ShowMessage(qryCons.Text);
              ExecSQL;
              try
                Commit;
              except
              end;
            end;
          end;
        except on e: exception do begin
          RollBack;
          Alerta('Erro ao registrar a movimentação do estoque do produto.'+#13+'['+e.Message+']',1);
          ReportaErro('TFuncoes','RegistraMovimentoEstoque',e.Message);
        end; end;
      finally
        qryCons.Close;
        FreeAndNil(qryCons);
      end;
    end;
    MovimentaComposicao(intTipo,strPROD_ID, strEstq_ID,floatQtde,strGene_ID);
  finally
    FormatSettings.DecimalSeparator := ',';
  end;
end;

{*******************************************************************************
Descrição:  Procedimento para verificar se produto informado possui composição
Data:       19/07/2010
Parametros:
  intTipo -     1 - Registra Movimentação do Estoque (Estoque Atual e Disponivel)
                2 - Registra Movimentação do Estoque (Estoque Disponível)
                3 - Registra Movimentação do Estoque (Estoque Atual)

  strGene_ID -  1 - Entrada Avulsa
                2 - Entrada Nota Fiscal
                3 - Saida Avulsa
                4 - Saída Ordem de Serviço
                5 - Estorno Ordem de Serviço
*******************************************************************************}
procedure TFuncoes.MovimentaComposicao(intTipo : Integer; strPROD_ID, strEstq_ID : String;
  floatQtde : Real; strGene_ID : String);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      ///Verifica se o produto tem composição, se tiver movimenta o estoque do mesmo.
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      PRCP_PROD_ID_COMP,');
        sql.Add('      PRCP_QTDE');
        sql.Add('FROM  PRODUTOS_COMP PC');
        sql.Add('WHERE PRCP_EMPR_ID      = ' + IntToStr(Empr_ID));
        sql.Add('AND   PRCP_PROD_ID      = ' + strPROD_ID);
        sql.Add('AND   PRCP_PROD_EMPR_ID = ' + IntToStr(Empr_ID));
        Open;
        if not IsEmpty then begin
          First;
          while not eof do begin
            MovimentaEstoque(qryCons.Fields[0].AsString,(qryCons.Fields[1].AsFloat * floatQtde),intTipo,strGene_ID);
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      ReportaErro('TFuncoes','MovimentaComposição',e.Message);
      Alerta('Erro no processo de movimentação do estoque do produto.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

{*******************************************************************************
Descrição:  Procedimento verificar se o produto informado realiza controle de estoque
Data:       19/07/2010

Historico
Data          Autor                 Descrição
19/07/2010    Alex Itamar Gomes     Inclusão do Cabeçalho
*******************************************************************************}
function TFuncoes.ProdMovimentaEstoque(out boolMovEstq : Boolean; strProd_ID : String) : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      PROD_FLG_ESTOQUE');
        sql.Add('FROM  PRODUTOS');
        sql.Add('WHERE PROD_ID      = ' + strProd_ID);
        sql.Add('AND   PROD_EMPR_ID = ' + IntToStr(Empr_ID));
        Open;
      end;
      Result := (qryCons.Fields[0].AsInteger = 1);
      boolMovEstq := Result;
    except on e: exception do begin
      ReportaErro('TFuncoes','ProdMovimentaEstoque',e.Message);
      Alerta('Erro no processo de movimentação do produto.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.Crypt(Action, Src: String; boolCrpt : Boolean = False): String;

const
  Codes64 = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/';

{$REGION 'Codic'}
  function Codic(S: string): string;
  var
    i: Integer;
    a: Integer;
    x: Integer;
    b: Integer;
  begin
    Result := '';
    a := 0;
    b := 0;
    for i := 1 to Length(s) do begin
      x := Ord(s[i]);
      b := b * 256 + x;
      a := a + 8;
      while a >= 6 do begin
        a := a - 6;
        x := b div (1 shl a);
        b := b mod (1 shl a);
        Result := Result + Codes64[x + 1];
      end;
    end;
    if a > 0 then begin
      x := b shl (6 - a);
      Result := Result + Codes64[x + 1];
    end;
  end;
{$ENDREGION}

{$REGION 'Coding'}
  function Coding(S: string): string;
  var
    i: Integer;
    a: Integer;
    x: Integer;
    b: Integer;
  begin
    Result := '';
    a := 0;
    b := 0;
    for i := 1 to Length(s) do begin
      x := Pos(s[i], codes64) - 1;
      if x >= 0 then begin
        b := b * 64 + x;
        a := a + 6;
        if a >= 8 then begin
          a := a - 8;
          x := b shr a;
          b := b mod (1 shl a);
          x := x mod 256;
          Result := Result + chr(x);
        end;
      end else Exit;
    end;
  end;
{$ENDREGION}

var
  KeyLen,
  KeyPos,
  OffSet,
  SrcPos,
  SrcAsc,
  TmpSrcAsc,
  Range     : Integer;
  Dest,
  Key       : String;
begin
  result := '';
  if Src <> '' then begin
    Key    := 'ANONIMUS';
    Dest   := '';
    KeyLen := Length(Key);
    KeyPos := 0;
    Range  := 256;
    if (Action = UpperCase('C')) then begin
      Randomize;
      OffSet := Random(Range);
      Dest   := Format('%1.2x',[OffSet]);
      for SrcPos := 1 to Length(Src) do begin
        Application.ProcessMessages;
        SrcAsc   := (Ord(Src[SrcPos]) + OffSet) Mod 255;
        if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
          SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
          Dest   := Dest + Format('%1.2x',[SrcAsc]);
          OffSet := SrcAsc;
      end;
      if boolCrpt then
        Dest := Codic(Dest);
    end else if (Action = UpperCase('D')) then begin
      if boolCrpt then
        Src    := Coding(Src);
      OffSet := StrToInt('$'+ copy(Src,1,2));
      SrcPos := 3;
      repeat
      SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));
      if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
             TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
      else TmpSrcAsc := TmpSrcAsc - OffSet;
      Dest   := Dest + Chr(TmpSrcAsc);
      OffSet := SrcAsc;
      SrcPos := SrcPos + 2;
      until (SrcPos >= Length(Src));
    end;
    Result   := Dest;
  end;
end;

procedure TFuncoes.InserirSQL(strTabela          : String;
                              arrayCamposInsert  : Array of String;
                              arrayValoresInsert : Array of Variant);
var
  qryCons : TSQLQuery;
  intI    : Integer;
  boolPri : Boolean;
begin
  try
    boolPri := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    FormatSettings.DecimalSeparator := '.';
    try
      StartCommit;
      with qryCons do begin
        Close;
        sql.Clear;
        ///Cabeçalho da Instrução SQL
        sql.Add('INSERT INTO ' + strTabela + '(');

        ///Campos da Tabela
        for intI  := Low(arrayCamposInsert) to High(arrayCamposInsert) do begin
          sql.Add(Se(boolPri,'',',') + arrayCamposInsert[intI]);
          boolPri := false;
        end;
        SQL.Add(')');
        ///Fim dos Campos da Tabela

        boolPri   := true;

        ///Passando os parametros
        sql.Add('VALUES (');
        for intI  := Low(arrayCamposInsert) to High(arrayCamposInsert) do begin
          sql.Add(Se(boolPri,'',',') + ':'+arrayCamposInsert[intI]);
          boolPri := false;
        end;
        sql.Add(')');
        ///Fim da passagem dos parametros

        ///Passagem dos valores para cada campo
        for intI := Low(arrayValoresInsert) to High(arrayValoresInsert) do begin
          ParamByName(arrayCamposInsert[intI]).Value := arrayValoresInsert[intI];
        end;
        ///Fim da passagem dos valores

        ExecSQL();
      end;
      Commit;
    except on e: exception do begin
      Alerta('Erro no processo de Inserção automática!'+#13+#13+'['+e.Message+']',1);
      ReportaErro('TFuncoes','InserirSQL:'+strTabela,e.Message);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TFuncoes.InstrucaoSQL;
begin

end;

procedure TFuncoes.RealizaPesquisa(strSQL: String);
begin
  if FqryConsulta = nil then
    FqryConsulta := TSQLQuery.Create(nil);
  FqryConsulta.SQLConnection := Conexao;
  with FqryConsulta do begin
    Close;
    sql.Clear;
    sql.Add(strSQL);
    Open;
  end;
end;

procedure TFuncoes.RecalcularLivroCaixa(dtTMP : TDateTime; intTipo : Integer; strPLCT_ID, strTit_ID : String);
//var
//  qryCons : TSQLQuery;
begin
  {try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        SQL.Add('UPDATE LIVRO_CAIXA');
        SQL.Add('   SET LCAX_DTA_LANCAMENTO     = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtPagto.Date)));
        SQL.Add('      ,LCAX_DTA_CADASTRO       = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtPagto.Date)));
        SQL.Add('WHERE LCAX_EMPR_ID             = ' + IntToStr(Empr_ID));
        SQL.Add('  AND LCAX_PLCT_EMPR_ID        = ' + IntToStr(Empr_ID));
        SQL.Add('  AND LCAX_PLCT_ID             = ' + strPLCT_ID);
        SQL.Add('  AND LCAX_GENE_EMPR_ID_TP_MOV = 0');
        SQL.Add('  AND LCAX_GENE_TGEN_ID_TP_MOV = 6');
        SQL.Add('  AND LCAX_GENE_ID_TP_MOV      = ' + IntToStr(intTipo));
        SQL.Add('  AND LCAX_CAMPO1_TAB_MOV      = ' + strTit_ID);
        SQL.Add('  AND LCAX_CAMPO2_TAB_MOV      = ' + IntToStr(Empr_ID));
        SQL.Add('  AND LCAX_CAMPO3_TAB_MOV      = 0');
        ExecSQL();
      end;
    except
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;}
end;

function TFuncoes.InstructionSQL(strSQL: String; chErro : Char = 'N'; chTipo : Char = 'E') : Variant;
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add(strSQL);
        case chTipo of
          'O' : begin
            Open;
          end;
          'E' : begin
            try
              StartCommit;
            except
            end;
            try
              ExecSQL;
              try
                Commit;
              except
              end;
            except
              RollBack;
            end;
          end;
        end;
      end;
    except on e: exception do begin
      case chErro of
        'S' : begin
          ReportaErro('TFuncoes','InstructionSQL',e.Message);
          Alerta('Erro no processo de execução de alguns procedimentos internos do sistema.'+#13+'['+e.Message+']',1)
        end;
      end;
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TFuncoes.ValorPlanejado(strPLCT_ID : String; out edtVlrPlanejado, edtVlrComprometido : TRxCalcEdit; dtData : TDate);
var
  qryCons : TSQLQuery;
  Dia, Mes, Ano : Word;
begin
  try
    edtVlrPlanejado.Value    := 0;
    edtVlrComprometido.Value := 0;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection    := Conexao;
    if strPLCT_ID = '' then Exit;
    DecodeDate(dtData,Ano,Mes,Dia);
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(PCPJ_MES_'+FormatFloat('00',Mes)+',0) VALOR');
        sql.Add('FROM  PLANO_CONTAS_PLANEJAMENTO');
        sql.Add('WHERE PCPJ_EMPR_ID      = ' + IntToStr(Empr_ID));
        sql.Add('AND   PCPJ_PLCT_ID      = ' + strPLCT_ID);
        sql.Add('AND   PCPJ_PLCT_EMPR_ID = 0');
        sql.Add('AND   PCPJ_ANO          = ' + IntToStr(Ano));
        Open;
        edtVlrPlanejado.Value := qryCons.FieldByName('VALOR').AsFloat;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(SUM(CPAG_VALOR_DOC),0) VALOR');
        sql.Add('FROM  CONTAS_PAGAR');
        sql.Add('WHERE CPAG_EMPR_ID                      = ' + IntToStr(Empr_ID));
        sql.Add('AND   CPAG_STATUS                      <> ' + QuotedStr('C'));
        sql.Add('AND   EXTRACT(YEAR FROM CPAG_DTA_VCTO)  = ' + IntToStr(Ano));
        sql.Add('AND   CPAG_PLCT_ID                      = ' + strPLCT_ID);
        sql.Add('AND   EXTRACT(MONTH FROM CPAG_DTA_VCTO) = ' + FormatFloat('00',Mes));
        Open;
        edtVlrComprometido.Value := qryCons.FieldByName('VALOR').AsFloat;
      end;
    except on e: exception do
      showmessage(e.Message);
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TFuncoes.ValorPorExtenso(fltValor: Real): String;
Const
  Unidades: Array[1..9] of String = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
  Dez     : Array[1..9] of String = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
  Dezenas : Array[1..9] of String = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
  Centenas: Array[1..9] of String = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
  MoedaSigular  = 'Real';
  MoedaPlural   = 'Reais';
  CentSingular  = 'Centavo';
  CentPlural    = 'Centavos';
  Zero          = 'Zero';

var
  Texto,
  Milhar,
  Centena,
  Centavos,
  msg       : String;

  function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
  begin
    if Expressao then
      Result := CasoVerdadeiro
    else
      Result := CasoFalso;
  end;

  function MiniExtenso (trio: string): string;
  var
    Unidade,
    Dezena,
    Centena : String;
  begin
    Unidade := '';
    Dezena  := '';
    Centena := '';
    if (trio[2] = '1') and (trio[3]<>'0') then begin
      Unidade:=Dez[strtoint(trio[3])];
      Dezena:='';
    end else begin
      if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
      if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
    end;
    if (trio[1]='1') and (Unidade='') and (Dezena='') then
      Centena:='Cem'
    else if trio[1]<>'0' then
      Centena:=Centenas[strtoint(trio[1])]
    else Centena:='';
    Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '') + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
  end;

begin
  if fltValor<0 then fltValor := fltValor*-1;  
  if (fltValor>999999.99) or (fltValor<0) then begin
    msg := 'O valor está fora do intervalo permitido.';
    msg := msg+'O número deve ser maior ou igual a zero e menor que 999.999,99.';
    msg := msg+' Se não for corrigido o número não será escrito por extenso.';
    ShowMessage(msg);
    Result:='';
    Exit;
  end;
  if fltValor=0 then begin
    Result:='';
    Exit;
  end;
  Texto   := FormatFloat('000000.00',fltValor);
  Milhar  := MiniExtenso(Copy(Texto,1,3));
  Centena := MiniExtenso(Copy(Texto,4,3));
  Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
  Result:=Milhar;
  if Milhar<>'' then begin
    if copy(texto,4,3)='000' then
      Result:=Result+' Mil Reais'
    else
      Result:=Result+' Mil, ';
  end;
  if (((copy(texto,4,2)='00') and (Milhar<>'') and (copy(texto,6,1)<>'0')))or (centavos='') and (milhar<>'')  then
    Result:=Result+' e ';
  if (Milhar+Centena <>'') then
    Result:=Result+Centena;
  if (Milhar='') and (copy(texto,4,3)='001') then
    Result:=Result+' Real'
  else
  if (copy(texto,4,3)<>'000') then
    Result:=Result+' Reais';
  if Centavos='' then begin
    Result:=Result+'.';
    Exit;
  end else begin
    if Milhar+Centena='' then
      Result:=Centavos
    else
      Result:=Result+', e '+Centavos;
  end;
  if (copy(texto,8,2)='01') and (Centavos<>'') then
    Result:=Result+' Centavo.'
  else
    Result:=Result+' Centavos.';
end;

function TFuncoes.RetornaInicioSemana(dtData : TDate) : TDate;
var
  intI : Integer;
begin
  intI := DayOfWeek(dtData);
  intI := intI - 2;
  Result := dtData-intI;
end;

function TFuncoes.RetornaFimSemana(dtData : TDate) : TDate;
var
  intI : Integer;
begin
  intI := DayOfWeek(dtData);
  intI := 7 - intI;
  Result := dtData+intI;
end;

function TFuncoes.BuscarAtendente(strNome : String) : Integer;
var
  qryCons : TSQLQuery;
begin
  Result := 0;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT USER_ID FROM USUARIO WHERE USER_NOME_COMPLETO = '+QuotedStr(strNome));
      Open;
      Result := FieldByName('USER_ID').AsInteger;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

end.


