unit udmFrPesquisa;

interface

uses
  System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr, Datasnap.DBClient,
  Datasnap.Provider, Funcoes;

type
  TdmFrPesquisa = class(TDataModule)
    dspPesqCliente: TDataSetProvider;
    cdsPesqCliente: TClientDataSet;
    cdsPesqClienteCLIE_ID: TIntegerField;
    cdsPesqClienteCLIE_FANTASIA: TStringField;
    cdsPesqClienteCLIE_RAZAO_SOCIAL: TStringField;
    cdsPesqClienteCLIE_TIPO: TStringField;
    qryPesqCliente: TSQLQuery;
    qryPesqPraca: TSQLQuery;
    dspPesqPraca: TDataSetProvider;
    cdsPesqPraca: TClientDataSet;
    cdsPesqPracaGENE_ID: TIntegerField;
    cdsPesqPracaGENE_DESCR: TStringField;
    cdsPesqPracaGENE_PAR1: TStringField;
    qryPesqFornec: TSQLQuery;
    dspPesqFornec: TDataSetProvider;
    cdsPesqFornec: TClientDataSet;
    cdsPesqFornecFORN_ID: TIntegerField;
    cdsPesqFornecFORN_RAZAO_SOCIAL: TStringField;
    cdsPesqFornecFORN_NOME_FANTASIA: TStringField;
    cdsPesqFornecFORN_CNPJ_CPF: TStringField;
    qryPesqContaPagar: TSQLQuery;
    dspPesqContaPagar: TDataSetProvider;
    cdsPesqContaPagar: TClientDataSet;
    cdsPesqContaPagarCPAG_ID: TIntegerField;
    cdsPesqContaPagarCPAG_PROVENIENTE: TStringField;
    cdsPesqContaPagarCPAG_DTA_VCTO: TDateField;
    qryPesqPlanoContas: TSQLQuery;
    dspPesqPlanoContas: TDataSetProvider;
    cdsPesqPlanoContas: TClientDataSet;
    cdsPesqPlanoContasPLCT_ID: TIntegerField;
    cdsPesqPlanoContasPLCT_COD_SIMPLIFICADO: TStringField;
    cdsPesqPlanoContasPLCT_DESCRICAO: TStringField;
    cdsPesqPlanoContasPLCT_TIPO: TStringField;
    qryPesqTipo: TSQLQuery;
    dspPesqTipo: TDataSetProvider;
    cdsPesqTipo: TClientDataSet;
    cdsPesqTipoGENE_ID: TIntegerField;
    cdsPesqTipoGENE_DESCR: TStringField;
    cdsPesqContaReceber: TClientDataSet;
    cdsPesqContaReceberCREC_ID: TIntegerField;
    cdsPesqContaReceberCREC_PROVENIENTE: TStringField;
    cdsPesqContaReceberCREC_DTA_VCTO: TDateField;
    dspPesqContaReceber: TDataSetProvider;
    qryPesqContaReceber: TSQLQuery;
    qryPesqPlanoContasGeral: TSQLQuery;
    dspPesqPlanoContasGeral: TDataSetProvider;
    cdsPesqPlanoContasGeral: TClientDataSet;
    cdsPesqPlanoContasGeralPLCT_ID: TIntegerField;
    cdsPesqPlanoContasGeralPLCT_COD_SIMPLIFICADO: TStringField;
    cdsPesqPlanoContasGeralPLCT_DESCRICAO: TStringField;
    cdsPesqPlanoContasGeralPLCT_TIPO: TStringField;
    dspPesqContaBancaria: TDataSetProvider;
    cdsPesqContaBancaria: TClientDataSet;
    cdsPesqContaBancariaCBCO_ID: TIntegerField;
    cdsPesqContaBancariaGENE_DESCR: TStringField;
    cdsPesqContaBancariaCBCO_DESCRICAO: TStringField;
    qryPesqContaBancaria: TSQLQuery;
    cdsPesqClienteCLIE_CNPJ_CPF: TStringField;
    qryPesqPrc: TSQLQuery;
    dspPesqPrc: TDataSetProvider;
    cdsPesqPrc: TClientDataSet;
    cdsPesqPrcTPRC_ID: TIntegerField;
    cdsPesqPrcTPRC_DESCRICAO: TStringField;
    qryPesqEquipamento: TSQLQuery;
    dspPesqEquipamento: TDataSetProvider;
    cdsPesqEquipamento: TClientDataSet;
    cdsPesqEquipamentoPROD_ID: TIntegerField;
    cdsPesqEquipamentoPROD_DESCRICAO: TStringField;
    cdsPesqEquipamentoPROD_UNIDADE: TStringField;
    cdsPesqEquipamentoPROD_GARANTIA: TIntegerField;
    cdsPesqEquipamentoMARCA_PROD: TStringField;
    cdsPesqEquipamentoMODELO_PROD: TStringField;
    qryPesqTecnico: TSQLQuery;
    dspPesqTecnico: TDataSetProvider;
    cdsPesqTecnico: TClientDataSet;
    cdsPesqTecnicoUSER_ID: TIntegerField;
    cdsPesqTecnicoUSER_NOME_COMPLETO: TStringField;
    cdsPesqTecnicoUSER_LOGIN: TStringField;
    qryPesqTipoProd: TSQLQuery;
    dspPesqTipoProd: TDataSetProvider;
    cdsPesqTipoProd: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    qryPesqGrupoProd: TSQLQuery;
    dspPesqGrupoProd: TDataSetProvider;
    cdsPesqGrupoProd: TClientDataSet;
    cdsPesqGrupoProdGENE_ID: TIntegerField;
    cdsPesqGrupoProdGENE_DESCR: TStringField;
    qryPesqMarcaProd: TSQLQuery;
    dspPesqMarcaProd: TDataSetProvider;
    cdsPesqMarcaProd: TClientDataSet;
    cdsPesqMarcaProdGENE_ID: TIntegerField;
    cdsPesqMarcaProdGENE_DESCR: TStringField;
    qryPesqModeloProd: TSQLQuery;
    dspPesqModeloProd: TDataSetProvider;
    cdsPesqModeloProd: TClientDataSet;
    cdsPesqModeloProdGENE_ID: TIntegerField;
    cdsPesqModeloProdGENE_DESCR: TStringField;
    qryPesqProd: TSQLQuery;
    dspPesqProd: TDataSetProvider;
    cdsPesqProd: TClientDataSet;
    cdsPesqProdPROD_ID: TIntegerField;
    cdsPesqProdPROD_DESCRICAO: TStringField;
    cdsPesqProdPROD_UNIDADE: TStringField;
    cdsPesqProdMARCA_PROD: TStringField;
    cdsPesqProdMODELO_PROD: TStringField;
    cdsPesqProdGRUPO_PROD: TStringField;
    qryPesqNotaFiscal: TSQLQuery;
    dspPesqNotaFiscal: TDataSetProvider;
    cdsPesqNotaFiscal: TClientDataSet;
    cdsPesqNotaFiscalNFEN_ID: TIntegerField;
    cdsPesqNotaFiscalNFEN_NR_NOTA: TIntegerField;
    cdsPesqNotaFiscalFORN_NOME_FANTASIA: TStringField;
    cdsPesqNotaFiscalNFEN_DTA_ENTRADA: TDateField;
    cdsPesqNotaFiscalNFEN_VLR_TOTAL_NOTA: TFMTBCDField;
    qryPesqSaida: TSQLQuery;
    dspPesqSaida: TDataSetProvider;
    cdsPesqSaida: TClientDataSet;
    cdsPesqSaidaSAAV_ID: TIntegerField;
    cdsPesqSaidaSAAV_NR_DOCUMENTO: TStringField;
    qryPesqEntrada: TSQLQuery;
    dspPesqEntrada: TDataSetProvider;
    cdsPesqEntrada: TClientDataSet;
    cdsPesqEntradaENAV_ID: TIntegerField;
    cdsPesqEntradaENAV_NR_DOCUMENTO: TStringField;
    qryPesqSaidaAvaria: TSQLQuery;
    dspPesqSaidaAvaria: TDataSetProvider;
    cdsPesqSaidaAvaria: TClientDataSet;
    cdsPesqSaidaAvariaSIAV_ID: TIntegerField;
    cdsPesqSaidaAvariaSIAV_NR_DOCUMENTO: TStringField;
    qryPesqTipoOS: TSQLQuery;
    dspPesqTipoOS: TDataSetProvider;
    cdsPesqTipoOS: TClientDataSet;
    cdsPesqTipoOSGENE_ID: TIntegerField;
    cdsPesqTipoOSGENE_DESCR: TStringField;
    qryPesqUsuario: TSQLQuery;
    dspPesqUsuario: TDataSetProvider;
    cdsPesqUsuario: TClientDataSet;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    qryPesqVendedor: TSQLQuery;
    dspPesqVendedor: TDataSetProvider;
    cdsPesqVendedor: TClientDataSet;
    IntegerField3: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    qryPesqRegiao: TSQLQuery;
    dspPesqRegiao: TDataSetProvider;
    cdsPesqRegiao: TClientDataSet;
    IntegerField4: TIntegerField;
    StringField6: TStringField;
    qryPesqRota: TSQLQuery;
    dspPesqRota: TDataSetProvider;
    cdsPesqRota: TClientDataSet;
    IntegerField5: TIntegerField;
    StringField7: TStringField;
    qryPesqGrupoCliente: TSQLQuery;
    dspPesqGrupoCliente: TDataSetProvider;
    cdsPesqGrupoCliente: TClientDataSet;
    IntegerField6: TIntegerField;
    StringField8: TStringField;
    cdsPesqRegiaoGENE_PAR1: TStringField;
    cdsPesqRotaGENE_PAR1: TStringField;
    cdsPesqRotaGENE_NUMERIC1: TFMTBCDField;
    qryPesqTipoMov: TSQLQuery;
    dspPesqTipoMov: TDataSetProvider;
    cdsPesqTipoMov: TClientDataSet;
    cdsPesqTipoMovGENE_ID: TIntegerField;
    cdsPesqTipoMovGENE_DESCR: TStringField;
    cdsPesqTipoMovGENE_PAR1: TStringField;
    cdsPesqTipoMovGENE_PAR2: TStringField;
    cdsPesqClienteCLIE_ENDERECO: TStringField;
    cdsPesqClienteCLIE_BAIRRO: TStringField;
    cdsPesqClienteCLIE_CEP: TStringField;
    cdsPesqClienteCIDADE: TStringField;
    cdsPesqClienteUF: TStringField;
    cdsPesqClienteCLIE_REFERENCIA: TStringField;
    cdsPesqClienteCLIE_TELEFONE1: TStringField;
    cdsPesqClienteCLIE_TELEFONE2: TStringField;
    cdsPesqClienteCLIE_TELEFONE3: TStringField;
    cdsPesqClienteCLIE_TELEFONE4: TStringField;
    qryStatusAtendimento: TSQLQuery;
    dspStatusAtendimento: TDataSetProvider;
    cdsStatusAtendimento: TClientDataSet;
    IntegerField7: TIntegerField;
    StringField9: TStringField;
    cdsStatusAtendimentoGENE_NUMBER1: TIntegerField;
    cdsPesqRotaGENE_GENE_ID_PROD: TIntegerField;
    qryStatusOS: TSQLQuery;
    dspStatusOS: TDataSetProvider;
    cdsStatusOS: TClientDataSet;
    IntegerField8: TIntegerField;
    StringField10: TStringField;
    dspPesq_Bancos: TDataSetProvider;
    cdsPesq_Bancos: TClientDataSet;
    cdsPesq_BancosGENE_ID: TIntegerField;
    cdsPesq_BancosGENE_DESCR: TStringField;
    cdsPesq_BancosGENE_PAR1: TStringField;
    qryPesq_Bancos: TSQLQuery;
    cdsPesqContaBancariaCBCO_AGENCIA: TStringField;
    cdsPesqContaBancariaCBCO_CONTA: TStringField;
    cdsPesqContaBancariaCBCO_TIPO: TStringField;
    cdsPesqContaBancariaCBCO_SALDO_ATUAL: TFMTBCDField;
    cdsPesqContaBancariaCBCO_LIMITE: TFMTBCDField;
    dspPesqPatrimonio: TDataSetProvider;
    cdsPesqPatrimonio: TClientDataSet;
    qryPesqPatrimonio: TSQLQuery;
    cdsPesqPatrimonioPATR_ID: TIntegerField;
    cdsPesqPatrimonioPATR_DESCRICAO: TStringField;
    qryTipoAgendamento: TSQLQuery;
    dspTipoAgendamento: TDataSetProvider;
    cdsTipoAgendamento: TClientDataSet;
    IntegerField9: TIntegerField;
    StringField11: TStringField;
    qryPedidoOrcamento: TSQLQuery;
    dspPedidoOrcamento: TDataSetProvider;
    cdsPedidoOrcamento: TClientDataSet;
    cdsPedidoOrcamentoPEDV_ID: TIntegerField;
    cdsPedidoOrcamentoPEDV_CLIE_ID: TIntegerField;
    cdsPedidoOrcamentoPEDV_VLR_PEDIDO: TFMTBCDField;
    cdsPedidoOrcamentoPEDV_DTA_CADASTRO: TDateField;
    cdsPedidoOrcamentoCLIE_FANTASIA: TStringField;
    cdsPedidoOrcamentoCLIE_CNPJ_CPF: TStringField;
    cdsPedidoOrcamentoTPRC_DESCRICAO: TStringField;
    qryPesqUnidade: TSQLQuery;
    dspPesqUnidade: TDataSetProvider;
    cdsPesqUnidade: TClientDataSet;
    IntegerField10: TIntegerField;
    StringField12: TStringField;
    cdsPesqUnidadeGENE_PAR1: TStringField;
    cdsPesqFornecFORN_TIPO: TStringField;
    cdsPesqFornecFORN_CEP: TStringField;
    cdsPesqFornecFORN_ENDERECO: TStringField;
    cdsPesqFornecFORN_BAIRRO: TStringField;
    cdsPesqFornecFORN_CONTATO: TStringField;
    cdsPesqFornecFORN_TELEFONE: TStringField;
    cdsPesqFornecFORN_FAX: TStringField;
    cdsPesqFornecCIDADE: TStringField;
    cdsPesqFornecUF: TStringField;
    qryPesqFiltro: TSQLQuery;
    dspPesqFiltro: TDataSetProvider;
    cdsPesqFiltro: TClientDataSet;
    IntegerField11: TIntegerField;
    StringField13: TStringField;
    qryPesqBandeira: TSQLQuery;
    dspPesqBandeira: TDataSetProvider;
    cdsPesqBandeira: TClientDataSet;
    IntegerField12: TIntegerField;
    StringField14: TStringField;
    cdsPesqProdCOD_FORNEC1: TIntegerField;
    cdsPesqProdCOD_FORNEC2: TIntegerField;
    cdsPesqProdCOD_FORNEC3: TIntegerField;
    cdsPesqProdCOD_FORNEC4: TIntegerField;
    qryAgendamentos: TSQLQuery;
    dspAgendamentos: TDataSetProvider;
    cdsAgendamentos: TClientDataSet;
    cdsAgendamentosAGEN_ID: TIntegerField;
    cdsAgendamentosAGEN_DATA: TDateField;
    AGEN_HORA: TStringField;
    cdsAgendamentosCLIE_FANTASIA: TStringField;
    cdsAgendamentosCLIE_TELEFONE1: TStringField;
    cdsAgendamentosCLIE_TELEFONE2: TStringField;
    cdsAgendamentosCLIE_TELEFONE3: TStringField;
    cdsAgendamentosCLIE_TELEFONE4: TStringField;
    cdsPesqClienteCLIE_OBS: TBlobField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsPesqClienteCLIE_OBSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    funcLocal : TFuncoes;
    procedure CreateFunction;
  public
    procedure OpenClientDataSet(intTipo : Integer; strTMP : String = '');
  end;

var
  dmFrPesquisa: TdmFrPesquisa;

implementation

uses
  Vcl.Forms, System.SysUtils;

{$R *.dfm}

procedure TdmFrPesquisa.cdsPesqClienteCLIE_OBSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := cdsPesqClienteCLIE_OBS.AsString;
end;

procedure TdmFrPesquisa.CreateFunction;
var
  formPrinc : TForm;
begin
  if funcLocal = nil then begin
    formPrinc := Application.MainForm;
    funcLocal := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
  end;
end;

procedure TdmFrPesquisa.DataModuleDestroy(Sender: TObject);
var
  intI : Integer;
begin
  try
    for intI := 0 to ComponentCount -1 do begin
      if (Components[intI] is TClientDataSet) then
        (Components[intI] as TClientDataSet).Close;
      if (Components[intI] is TSQLQuery) then
        (Components[intI] as TSQLQuery).Close;
    end;
  except
  end;
end;

procedure TdmFrPesquisa.OpenClientDataSet(intTipo: Integer; strTMP : String = '');
var
  sql : String;
begin
  CreateFunction;
  case intTipo of
    0 : begin ///Clientes
      with cdsPesqCliente do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    1 : begin ///Fornecedores
      with cdsPesqFornec do begin
        Close;
        Open;
      end;
    end;
    2 : begin ///Praças
      with cdsPesqPraca do begin
        Close;
        Open;
      end;
    end;
    3 : begin ///Tipo de Doc.
      with cdsPesqTipo do begin
        Close;
        Open;
      end;
    end;
    4 : begin ///Contas a Pagar
      with cdsPesqContaPagar do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    5 : begin ///Contas a Receber
      with cdsPesqContaReceber do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    6 : begin ///Plano de Contas
        with cdsPesqPlanoContas do begin
          Close;
          Params.ParamByName('TIPO').AsString := strTMP;
          Open;
        end;
    end;
    7 : begin ///Plano de Contas Geral
      with cdsPesqPlanoContasGeral do begin
        Close;
        Open;
      end;
    end;
    8 : begin ///Conta Bancaria
      with cdsPesqContaBancaria do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    9 : begin ///Tabela de Preço
      with cdsPesqPrc do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    10 : begin ///Equipamentos (O.S)
      with cdsPesqEquipamento do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    11 : begin ///Tecnicos
      with cdsPesqTecnico do begin
        Close;
        sql := 'SELECT                        '+
               '      USER_ID,                '+
               '      USER_LOGIN,             '+
               '      USER_NOME_COMPLETO      '+
               'FROM  USUARIO                 '+
               'INNER JOIN USUARIO_EMPR       '+
               'ON (USER_ID = USEP_USER_ID)   '+
               'WHERE USEP_EMPR_ID = :EMPR_ID '+
               'AND  USER_ATIVO = 1           '+
               'AND  USER_ID   <> 0           ';
        if (funcLocal.LimitarProfNoSistema) then begin
          sql := sql + 'AND  USER_ID   NOT IN (%S)    ';
          sql := Format(sql,[funcLocal.RetornaListadeProfissionaisBloqueados()]);
        end;
        sql := sql + 'ORDER BY                      '+
                     '      USER_NOME_COMPLETO      ';
        CommandText := sql;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    12 : begin ///Tipo de Produto
      with cdsPesqTipoProd do begin
        Close;
        Open;
      end;
    end;
    13 : begin ///Grupo Produto
      with cdsPesqGrupoProd do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    14 : begin ///Marca Produto
      with cdsPesqMarcaProd do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    15 : begin ///Modelo Produto
      with cdsPesqModeloProd do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    16 : begin ///Produtos
      with cdsPesqProd do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    17 : begin ///Nota Fiscal
      with cdsPesqNotaFiscal do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    18 : begin ///Saida Avulsa
      with cdsPesqSaida do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    19 : begin ///Entrada Avulsa
      with cdsPesqEntrada do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    20 : begin ///Saida Avaria
      with cdsPesqSaidaAvaria do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    21 : begin ///Tipo O.S.
      with cdsPesqTipoOS do begin
        Close;
        Open;
      end;
    end;
    22 : begin ///Usuario
      with cdsPesqUsuario do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    23 : begin ///Vendedor
      with cdsPesqVendedor do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    24 : begin ///Região
      with cdsPesqRegiao do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    25 : begin ///Rota
      with cdsPesqRota do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    26 : begin ///Grupo Cliente
      with cdsPesqGrupoCliente do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    27 : begin
      with cdsPesqTipoMov do begin
        Close;
        Open;
      end;
    end;
    28 : begin
      with cdsStatusAtendimento do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    29 : begin
      with cdsStatusOS do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    30 : begin
      with cdsPesq_Bancos do begin
        Close;
        Open;
      end;
    end;
    31 : begin
      with cdsPesqPatrimonio do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    32 : begin
      with cdsTipoAgendamento do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    33 : begin
      with cdsPedidoOrcamento do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    34 : begin
      with cdsPesqUnidade do begin
        Close;
        Open;
      end;
    end;
    35 : begin
      with cdsPesqFiltro do begin ///Filtro OS
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
    36 : begin
      with cdsPesqBandeira do begin
        Close;
        Open;
      end;
    end;
    37 : begin //Agendamentos
      with cdsAgendamentos do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
      end;
    end;
  end;
end;

initialization
  if dmFrPesquisa = nil then
    dmFrPesquisa := TdmFrPesquisa.Create(nil);
finalization
  FreeAndNil(dmFrPesquisa);

end.
