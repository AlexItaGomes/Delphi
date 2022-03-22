unit udmRel_Contas_Bancarias;

interface

uses
  SysUtils, Classes, Funcoes, Forms, SQLExpr, FMTBcd, DB, DBClient, Provider, Dialogs;

type
  TdmRel_Contas_Bancarias = class(TDataModule)
    qryContas_Bancarias: TSQLQuery;
    dspContas_Bancarias: TDataSetProvider;
    cdsContas_Bancarias: TClientDataSet;
    dsContas_Bancarias: TDataSource;
    cdsContas_BancariasCBCO_ID: TIntegerField;
    cdsContas_BancariasCBCO_EMPR_ID: TIntegerField;
    cdsContas_BancariasCBCO_GENE_EMPR_ID_BCO: TIntegerField;
    cdsContas_BancariasCBCO_GENE_TGEN_ID_BCO: TIntegerField;
    cdsContas_BancariasCBCO_GENE_ID_BCO: TIntegerField;
    cdsContas_BancariasCBCO_AGENCIA: TStringField;
    cdsContas_BancariasCBCO_CONTA: TStringField;
    cdsContas_BancariasCBCO_TIPO: TStringField;
    cdsContas_BancariasTIPO: TStringField;
    cdsContas_BancariasCBCO_GERENTE: TStringField;
    cdsContas_BancariasCBCO_VALOR_INICIAL: TFMTBCDField;
    cdsContas_BancariasCBCO_SALDO_ATUAL: TFMTBCDField;
    cdsContas_BancariasCBCO_ATIVO: TIntegerField;
    cdsContas_BancariasATIVO: TStringField;
    cdsContas_BancariasCBCO_DTA_CADASTRO: TDateField;
    cdsContas_BancariasCBCO_USER_ID: TIntegerField;
    cdsContas_BancariasCBCO_LIMITE: TFMTBCDField;
    cdsContas_BancariasBANCO: TStringField;
    cdsContas_BancariasCOD_BANCO: TStringField;
    qryMovimentacao_Bancaria: TSQLQuery;
    dspMovimentacao_Bancaria: TDataSetProvider;
    cdsMovimentacao_Bancaria: TClientDataSet;
    cdsMovimentacao_BancariaCBMV_ID: TIntegerField;
    cdsMovimentacao_BancariaMOVIMENTACAO: TStringField;
    cdsMovimentacao_BancariaTIPO_MOV: TStringField;
    cdsMovimentacao_BancariaDEDUTIVEL: TStringField;
    cdsMovimentacao_BancariaCBMV_VALOR_MOV: TFMTBCDField;
    cdsMovimentacao_BancariaCBMV_SALDO_DISP: TFMTBCDField;
    cdsMovimentacao_BancariaCBCO_SALDO_ATUAL: TFMTBCDField;
    cdsMovimentacao_BancariaCBMV_DTA_CADASTRO: TDateField;
    cdsMovimentacao_BancariaCBMV_EMPR_ID: TIntegerField;
    cdsMovimentacao_BancariaCBMV_CBCO_ID: TIntegerField;
    cdsMovimentacao_BancariaCBMV_CBCO_EMPR_ID: TIntegerField;
    cdsMovimentacao_BancariaCBMV_GENE_EMPR_ID_TIPO_MOV: TIntegerField;
    cdsMovimentacao_BancariaCBMV_GENE_TGEN_ID_TIPO_MOV: TIntegerField;
    cdsMovimentacao_BancariaCBMV_GENE_ID_TIPO_MOV: TIntegerField;
    cdsMovimentacao_BancariaCBMV_USER_ID: TIntegerField;
    cdsMovimentacao_BancariaBANCO: TStringField;
    cdsMovimentacao_BancariaCOD_BANCO: TStringField;
    cdsMovimentacao_BancariaCBCO_LIMITE: TFMTBCDField;
    dsMovimentacao_Bancaria: TDataSource;
    cdsContas_BancariasCBCO_DESCRICAO: TStringField;
    cdsContas_BancariasCBCO_DIA_LIMITE: TIntegerField;
    cdsMovimentacao_BancariaORIGEM_DOCUMENTO: TStringField;
    cdsMovimentacao_BancariaNR_DOCUMENTO: TStringField;
    cdsMovimentacao_BancariaCLIENTE_FORNECEDOR: TStringField;
    cdsMovimentacao_BancariaPROVENIENTE: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dsContas_BancariasDataChange(Sender: TObject; Field: TField);
  private
    FInGrid   : String;
    FDtInicio,
    FDtFim    : TDateTime;
    funcLocal : TFuncoes;
    function GeraSQL: String;
  public
    property DtInicio   : TDateTime   read FDtInicio write FDtInicio;
    property DtFim      : TDateTime   read FDtFim    write FDtFim;
    property InGrid     : String      read FInGrid   write FInGrid;
  end;

var
  dmRel_Contas_Bancarias: TdmRel_Contas_Bancarias;

implementation

uses ufRel_Contas_Bancarias;

{$R *.dfm}

procedure TdmRel_Contas_Bancarias.DataModuleCreate(Sender: TObject);
var
  formPrinc : TForm;
  intI      : Integer;
begin
  formPrinc := Application.MainForm;
  funcLocal := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
  for intI := 0 to Self.ComponentCount - 1 do begin
    if (Components[intI] is TSQLQuery) then begin
      (Components[intI] as TSQLQuery).SQLConnection := funcLocal.Conexao;
    end;
    if (Components[intI] is TClientDataSet) then begin
      (Components[intI] as TClientDataSet).PacketRecords := 50;
    end;
  end;
end;

procedure TdmRel_Contas_Bancarias.dsContas_BancariasDataChange(Sender: TObject;
  Field: TField);
begin
  try
    with cdsMovimentacao_Bancaria do begin
      Close;
      CommandText := GeraSQL;
      Open;
    end;
  except
  end;
end;

function TdmRel_Contas_Bancarias.GeraSQL : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    try
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      ORIGEM_DOCUMENTO,');
        Add('      NR_DOCUMENTO,');
        Add('      PROVENIENTE,');
        Add('      CBMV_ID,');
        Add('      CBMV_EMPR_ID,');
        Add('      CBMV_CBCO_ID,');
        Add('      CBMV_CBCO_EMPR_ID,');
        Add('      CBMV_GENE_EMPR_ID_TIPO_MOV,');
        Add('      CBMV_GENE_TGEN_ID_TIPO_MOV,');
        Add('      CBMV_GENE_ID_TIPO_MOV,');
        Add('      CBMV_VALOR_MOV,');
        Add('      CBMV_SALDO_DISP,');
        Add('      CBMV_DTA_CADASTRO,');
        Add('      CBMV_USER_ID,');
        Add('      MOVIMENTACAO,');
        Add('      TIPO_MOV,');
        Add('      DEDUTIVEL,');
        Add('      BANCO,');
        Add('      COD_BANCO,');
        Add('      CBCO_SALDO_ATUAL,');
        Add('      CBCO_LIMITE,');
        Add('      CLIENTE_FORNECEDOR');
        Add('FROM');
        Add('    (');
        Add('     SELECT');
        Add('           ' + QuotedStr('Contas Pagar') + '     AS ORIGEM_DOCUMENTO,');
        Add('           CP.CPAG_NR_DOC     AS NR_DOCUMENTO,');
        Add('           CP.CPAG_PROVENIENTE AS PROVENIENTE,');
        Add('           CM.CBMV_ID,');
        Add('           CM.CBMV_EMPR_ID,');
        Add('           CM.CBMV_CBCO_ID,');
        Add('           CM.CBMV_CBCO_EMPR_ID,');
        Add('           CM.CBMV_GENE_EMPR_ID_TIPO_MOV,');
        Add('           CM.CBMV_GENE_TGEN_ID_TIPO_MOV,');
        Add('           CM.CBMV_GENE_ID_TIPO_MOV,');
        Add('           CM.CBMV_VALOR_MOV,');
        Add('           CM.CBMV_SALDO_DISP,');
        Add('           CM.CBMV_DTA_CADASTRO,');
        Add('           CM.CBMV_USER_ID,');
        Add('           TP.GENE_DESCR MOVIMENTACAO,');
        Add('           TP.GENE_PAR1  TIPO_MOV,');
        Add('           TP.GENE_PAR2  DEDUTIVEL,');
        Add('           BC.GENE_DESCR BANCO,');
        Add('           BC.GENE_PAR1  COD_BANCO,');
        Add('           CB.CBCO_SALDO_ATUAL,');
        Add('           CB.CBCO_LIMITE,');
        Add('           FR.FORN_NOME_FANTASIA AS CLIENTE_FORNECEDOR');
        Add('     FROM  CONTAS_BANCARIAS_MOV CM');
        Add('     INNER JOIN CONTAS_BANCARIAS CB');
        Add('     ON (CB.CBCO_ID      = CM.CBMV_CBCO_ID');
        Add('     AND CB.CBCO_EMPR_ID = CM.CBMV_CBCO_EMPR_ID)');
        Add('     INNER JOIN GENERICA TP');
        Add('     ON (TP.GENE_EMPR_ID = CM.CBMV_GENE_EMPR_ID_TIPO_MOV');
        Add('     AND TP.GENE_TGEN_ID = CM.CBMV_GENE_TGEN_ID_TIPO_MOV');
        Add('     AND TP.GENE_ID      = CM.CBMV_GENE_ID_TIPO_MOV)');
        Add('     INNER JOIN GENERICA BC');
        Add('     ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO');
        Add('     AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO');
        Add('     AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)');
        Add('     INNER JOIN CONTAS_PAGAR CP');
        Add('     ON (CP.CPAG_ID      = CM.CBMV_CAMPO3_ID_ORIG');
        Add('     AND CP.CPAG_EMPR_ID = CM.CBMV_CAMPO1_EMPR_ID_ORIG)');
        Add('     INNER JOIN FORNECEDORES FR');
        Add('     ON (FR.FORN_ID      = CP.CPAG_FORN_ID)');
        Add('     WHERE CM.CBMV_GENE_EMPR_ID_ORIG = 0');
        Add('     AND   CM.CBMV_GENE_TGEN_ID_ORIG = 13');
        Add('     AND   CM.CBMV_GENE_ID_ORIG      = 1');
        Add('');
        Add('     UNION');
        Add('');
        Add('     SELECT');
        Add('           ' + QuotedStr('Contas Receber') + '   AS ORIGEM_DOCUMENTO,');
        Add('           CR.CREC_NR_DOC     AS NR_DOCUMENTO,');
        Add('           CR.CREC_PROVENIENTE AS PROVENIENTE,');
        Add('           CM.CBMV_ID,');
        Add('           CM.CBMV_EMPR_ID,');
        Add('           CM.CBMV_CBCO_ID,');
        Add('           CM.CBMV_CBCO_EMPR_ID,');
        Add('           CM.CBMV_GENE_EMPR_ID_TIPO_MOV,');
        Add('           CM.CBMV_GENE_TGEN_ID_TIPO_MOV,');
        Add('           CM.CBMV_GENE_ID_TIPO_MOV,');
        Add('           CM.CBMV_VALOR_MOV,');
        Add('           CM.CBMV_SALDO_DISP,');
        Add('           CM.CBMV_DTA_CADASTRO,');
        Add('           CM.CBMV_USER_ID,');
        Add('           TP.GENE_DESCR MOVIMENTACAO,');
        Add('           TP.GENE_PAR1  TIPO_MOV,');
        Add('           TP.GENE_PAR2  DEDUTIVEL,');
        Add('           BC.GENE_DESCR BANCO,');
        Add('           BC.GENE_PAR1  COD_BANCO,');
        Add('           CB.CBCO_SALDO_ATUAL,');
        Add('           CB.CBCO_LIMITE,');
        Add('           CL.CLIE_FANTASIA AS CLIENTE_FORNECEDOR');
        Add('     FROM  CONTAS_BANCARIAS_MOV CM');
        Add('     INNER JOIN CONTAS_BANCARIAS CB');
        Add('     ON (CB.CBCO_ID      = CM.CBMV_CBCO_ID');
        Add('     AND CB.CBCO_EMPR_ID = CM.CBMV_CBCO_EMPR_ID)');
        Add('     INNER JOIN GENERICA TP');
        Add('     ON (TP.GENE_EMPR_ID = CM.CBMV_GENE_EMPR_ID_TIPO_MOV');
        Add('     AND TP.GENE_TGEN_ID = CM.CBMV_GENE_TGEN_ID_TIPO_MOV');
        Add('     AND TP.GENE_ID      = CM.CBMV_GENE_ID_TIPO_MOV)');
        Add('     INNER JOIN GENERICA BC');
        Add('     ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO');
        Add('     AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO');
        Add('     AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)');
        Add('     INNER JOIN CONTAS_RECEBER CR');
        Add('     ON (CR.CREC_ID      = CM.CBMV_CAMPO3_ID_ORIG');
        Add('     AND CR.CREC_EMPR_ID = CM.CBMV_CAMPO1_EMPR_ID_ORIG)');
        Add('     INNER JOIN CLIENTES CL');
        Add('     ON (CL.CLIE_ID      = CR.CREC_CLIE_ID');
        Add('     AND CL.CLIE_EMPR_ID = CR.CREC_CLIE_EMPR_ID)');
        Add('     WHERE CM.CBMV_GENE_EMPR_ID_ORIG = 0');
        Add('     AND   CM.CBMV_GENE_TGEN_ID_ORIG = 13');
        Add('     AND   CM.CBMV_GENE_ID_ORIG      = 2');
        Add('');
        Add('     UNION');
        Add('');
        Add('     SELECT');
        Add('           ' + QuotedStr('Movimentação Bancária') + ' AS ORIGEM_DOCUMENTO,');
        Add('           CM.CBMV_ID              AS NR_DOCUMENTO,');
        Add('           BB.CBCO_DESCRICAO       AS PROVENIENTE,');
        Add('           CM.CBMV_ID,');
        Add('           CM.CBMV_EMPR_ID,');
        Add('           CM.CBMV_CBCO_ID,');
        Add('           CM.CBMV_CBCO_EMPR_ID,');
        Add('           CM.CBMV_GENE_EMPR_ID_TIPO_MOV,');
        Add('           CM.CBMV_GENE_TGEN_ID_TIPO_MOV,');
        Add('           CM.CBMV_GENE_ID_TIPO_MOV,');
        Add('           CM.CBMV_VALOR_MOV,');
        Add('           CM.CBMV_SALDO_DISP,');
        Add('           CM.CBMV_DTA_CADASTRO,');
        Add('           CM.CBMV_USER_ID,');
        Add('           TP.GENE_DESCR MOVIMENTACAO,');
        Add('           TP.GENE_PAR1  TIPO_MOV,');
        Add('           TP.GENE_PAR2  DEDUTIVEL,');
        Add('           BC.GENE_DESCR BANCO,');
        Add('           BC.GENE_PAR1  COD_BANCO,');
        Add('           CB.CBCO_SALDO_ATUAL,');
        Add('           CB.CBCO_LIMITE,');
        Add('           ''MOVIMENTAÇÃO ENTRE CONTAS'' AS CLIENTE_FORNECEDOR');
        Add('     FROM  CONTAS_BANCARIAS_MOV CM');
        Add('     INNER JOIN CONTAS_BANCARIAS CB');
        Add('     ON (CB.CBCO_ID      = CM.CBMV_CBCO_ID');
        Add('     AND CB.CBCO_EMPR_ID = CM.CBMV_CBCO_EMPR_ID)');
        Add('     INNER JOIN GENERICA TP');
        Add('     ON (TP.GENE_EMPR_ID = CM.CBMV_GENE_EMPR_ID_TIPO_MOV');
        Add('     AND TP.GENE_TGEN_ID = CM.CBMV_GENE_TGEN_ID_TIPO_MOV');
        Add('     AND TP.GENE_ID      = CM.CBMV_GENE_ID_TIPO_MOV)');
        Add('     INNER JOIN GENERICA BC');
        Add('     ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO');
        Add('     AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO');
        Add('     AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)');
        Add('     INNER JOIN CONTAS_BANCARIAS BB');
        Add('     ON (BB.CBCO_ID      = CM.CBMV_CAMPO3_ID_ORIG');
        Add('     AND BB.CBCO_EMPR_ID = CM.CBMV_CAMPO1_EMPR_ID_ORIG)');
        Add('     WHERE CM.CBMV_GENE_EMPR_ID_ORIG = 0');
        Add('     AND   CM.CBMV_GENE_TGEN_ID_ORIG = 13');
        Add('     AND   CM.CBMV_GENE_ID_ORIG      = 3');
        Add('     )');
        Add('WHERE CBMV_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
        Add('AND   CBMV_CBCO_ID      = ' + cdsContas_BancariasCBCO_ID.AsString);
        Add('AND   CBMV_CBCO_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        Add('AND   CBMV_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',DtInicio)));
        Add('AND   CBMV_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',DtFim)));
        if Trim(InGrid) <> '' then
          Add('AND CBMV_GENE_ID_TIPO_MOV ' + InGrid);
        Add('ORDER BY CBMV_DTA_CADASTRO DESC, CBMV_ID DESC');
      end;
      Result := sltTMP.Text;
    except on e: exception do begin
      SHOWMESSAGE(E.MESSAGE);
      funcLocal.ReportaErro('TdmRel_Contas_Bancarias','GeraSQL',e.Message);
    end; end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

end.
