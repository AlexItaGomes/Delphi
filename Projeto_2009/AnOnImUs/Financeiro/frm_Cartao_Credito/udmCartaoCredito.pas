unit udmCartaoCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TdmCartaoCredito = class(TdmBasico)
    qryCartaoCredito: TSQLQuery;
    dspCartaoCredito: TDataSetProvider;
    cdsCartaoCredito: TClientDataSet;
    dsCartaoCredito: TDataSource;
    qryCartaoCreditoCCRE_ID: TIntegerField;
    qryCartaoCreditoCCRE_EMPR_ID: TIntegerField;
    qryCartaoCreditoCCRE_NUMERO_CARTAO: TStringField;
    qryCartaoCreditoCCRE_TITULAR: TStringField;
    qryCartaoCreditoCCRE_VENCIMENTO: TStringField;
    qryCartaoCreditoCCRE_CBCO_ID: TIntegerField;
    qryCartaoCreditoCCRE_CBCO_EMPR_ID: TIntegerField;
    qryCartaoCreditoCCRE_LIMITE_SAQUE: TFMTBCDField;
    qryCartaoCreditoCCRE_LIMITE_COMPRAS: TFMTBCDField;
    qryCartaoCreditoCCRE_DIA_VCTO_FATURA: TIntegerField;
    qryCartaoCreditoCCRE_DIA_FECHAMENTO_FATURA: TIntegerField;
    qryCartaoCreditoCCRE_ENCARGOS_CONTRATUAIS: TFMTBCDField;
    qryCartaoCreditoCCRE_ENCARGOS_CASH: TFMTBCDField;
    qryCartaoCreditoCCRE_DTA_CADASTRO: TDateField;
    qryCartaoCreditoCCRE_USER_ID: TIntegerField;
    qryCartaoCreditoCBCO_AGENCIA: TStringField;
    qryCartaoCreditoCBCO_CONTA: TStringField;
    qryCartaoCreditoCBCO_DESCRICAO: TStringField;
    qryCartaoCreditoCBCO_SALDO_ATUAL: TFMTBCDField;
    qryCartaoCreditoNR_BANCO: TStringField;
    qryCartaoCreditoBANCO: TStringField;
    cdsCartaoCreditoCCRE_ID: TIntegerField;
    cdsCartaoCreditoCCRE_EMPR_ID: TIntegerField;
    cdsCartaoCreditoCCRE_NUMERO_CARTAO: TStringField;
    cdsCartaoCreditoCCRE_TITULAR: TStringField;
    cdsCartaoCreditoCCRE_VENCIMENTO: TStringField;
    cdsCartaoCreditoCCRE_CBCO_ID: TIntegerField;
    cdsCartaoCreditoCCRE_CBCO_EMPR_ID: TIntegerField;
    cdsCartaoCreditoCCRE_LIMITE_SAQUE: TFMTBCDField;
    cdsCartaoCreditoCCRE_LIMITE_COMPRAS: TFMTBCDField;
    cdsCartaoCreditoCCRE_DIA_VCTO_FATURA: TIntegerField;
    cdsCartaoCreditoCCRE_DIA_FECHAMENTO_FATURA: TIntegerField;
    cdsCartaoCreditoCCRE_ENCARGOS_CONTRATUAIS: TFMTBCDField;
    cdsCartaoCreditoCCRE_ENCARGOS_CASH: TFMTBCDField;
    cdsCartaoCreditoCCRE_DTA_CADASTRO: TDateField;
    cdsCartaoCreditoCCRE_USER_ID: TIntegerField;
    cdsCartaoCreditoCBCO_AGENCIA: TStringField;
    cdsCartaoCreditoCBCO_CONTA: TStringField;
    cdsCartaoCreditoCBCO_DESCRICAO: TStringField;
    cdsCartaoCreditoCBCO_SALDO_ATUAL: TFMTBCDField;
    cdsCartaoCreditoNR_BANCO: TStringField;
    cdsCartaoCreditoBANCO: TStringField;
    qryCartaoCreditoCCRE_ATIVO: TIntegerField;
    cdsCartaoCreditoCCRE_ATIVO: TIntegerField;
    qryCartaoCreditoSTATUS: TStringField;
    cdsCartaoCreditoSTATUS: TStringField;
    qryCartaoCreditoCCRE_IMAGE: TBlobField;
    cdsCartaoCreditoCCRE_IMAGE: TBlobField;
    qryCartaoCreditoCCRE_TIPO_CARTAO: TStringField;
    cdsCartaoCreditoCCRE_TIPO_CARTAO: TStringField;
    qryCartaoCreditoTIPO_CARTAO: TStringField;
    cdsCartaoCreditoTIPO_CARTAO: TStringField;
    procedure cdsCartaoCreditoBeforeDelete(DataSet: TDataSet);
    procedure cdsCartaoCreditoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsCartaoCreditoNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCartaoCredito: TdmCartaoCredito;

implementation

{$R *.dfm}

procedure TdmCartaoCredito.cdsCartaoCreditoBeforeDelete(DataSet: TDataSet);
begin
  if funcLocal.DeletaRegistro('CARTAO_CREDITO',cdsCartaoCreditoCCRE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmCartaoCredito.cdsCartaoCreditoNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('CCRE_ID').AsString := funcLocal.ObterSequencia('CARTAO_CREDITO',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('CCRE_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('CCRE_CBCO_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('CCRE_LIMITE_SAQUE').AsFloat := 0;
  DataSet.FieldByName('CCRE_LIMITE_COMPRAS').AsFloat := 0;
  DataSet.FieldByName('CCRE_ENCARGOS_CONTRATUAIS').AsFloat := 0;
  DataSet.FieldByName('CCRE_ENCARGOS_CASH').AsFloat := 0;
  DataSet.FieldByName('CCRE_ATIVO').AsInteger := 1;
  DataSet.FieldByName('CCRE_TIPO_CARTAO').AsString := 'C';
  DataSet.FieldByName('CCRE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor();
  DataSet.FieldByName('CCRE_USER_ID').AsInteger := funcLocal.User_ID;
end;

procedure TdmCartaoCredito.cdsCartaoCreditoReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.Alerta('Erro ao tentar salvar os dados.'+#13+'['+e.Message+']',1)
end;

initialization
  dmCartaoCredito := TdmCartaoCredito.Create(nil);
finalization
  FreeAndNil(dmCartaoCredito);

end.
