unit ufParcelasContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids;

type
  TfParcelamento = class(TfCadastro)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    procedure LoadDados;
    procedure OpenClientDataSet;
    { Private declarations }
  public
    boolConf : Boolean;
    intI     : Integer;
    strParc  : String;
  end;

var
  fParcelamento: TfParcelamento;

implementation

uses udmContas_Pagar, ufCad_Contas_Pagar, ufContas_Pagar, ufMensagem;

{$R *.dfm}

procedure TfParcelamento.btnOkClick(Sender: TObject);
begin
  inherited;
  boolConf := true;
end;

procedure TfParcelamento.FormShow(Sender: TObject);
begin
  inherited;
  OpenClientDataSet;
  boolConf := false;
  inc(intI);
  while intI <= StrToInt(strParc) do begin
    LoadDados;
    inc(intI);
  end;
  dmContas_Pagar.cdsContasPagarParcela.FieldByName('CPAG_PROVENIENTE').ReadOnly := True;
end;

procedure TfParcelamento.OpenClientDataSet;
begin
  dmContas_Pagar.cdsContasPagarParcela.FieldByName('CPAG_PROVENIENTE').ReadOnly := false;
  with dmContas_Pagar.cdsContasPagarParcela do begin
    Close;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Open;
  end;
end;

procedure TfParcelamento.LoadDados;
begin
  with cdsLocal do begin
    Append;
    FieldByName('CPAG_NR_DOC').AsString           := fCad_Contas_Pagar.ContaPagar.strNr_Doc;
    FieldByName('CPAG_PROVENIENTE').AsString      := Trim(fCad_Contas_Pagar.ContaPagar.strProv + ' ' + FormatFloat('000',intI) + ' / ' + FormatFloat('000',StrToFloat(strParc)));
    FieldByName('CPAG_FORN_ID').AsString          := fCad_Contas_Pagar.ContaPagar.strCod_Forn;
    FieldByName('FORN_NOME_FANTASIA').AsString    := fCad_Contas_Pagar.ContaPagar.strFornec;
    FieldByName('CPAG_PLCT_ID').AsString          := fCad_Contas_Pagar.ContaPagar.strCod_Plct;
    FieldByName('PLCT_COD_SIMPLIFICADO').AsString := funcLocal.Buscar_Coluna(fCad_Contas_Pagar.ContaPagar.strPlano,1);
    FieldByName('PLCT_DESCRICAO').AsString        := funcLocal.Buscar_Coluna(fCad_Contas_Pagar.ContaPagar.strPlano,2);
    FieldByName('CPAG_GENE_ID_TIPO_DOC').AsString := fCad_Contas_Pagar.ContaPagar.strCod_Doc;
    FieldByName('TIPO_DOC').AsString              := fCad_Contas_Pagar.ContaPagar.strDoc;
    FieldByName('CPAG_OBS').AsString              := fCad_Contas_Pagar.ContaPagar.strObs;
    FieldByName('CPAG_DTA_EMISSAO').AsDateTime    := fCad_Contas_Pagar.ContaPagar.dtEmissao;
    FieldByName('CPAG_DTA_VCTO').AsDateTime       := IncMonth(fCad_Contas_Pagar.ContaPagar.dtVecto);
    fCad_Contas_Pagar.ContaPagar.dtVecto          := FieldByName('CPAG_DTA_VCTO').AsDateTime;
    FieldByName('CPAG_VALOR_DOC').AsFloat         := fCad_Contas_Pagar.ContaPagar.floatVlr;
    FieldByName('CPAG_VALOR_JUROS').AsFloat       := fCad_Contas_Pagar.ContaPagar.floatJuro;
    FieldByName('CPAG_VALOR_MORA').AsFloat        := fCad_Contas_Pagar.ContaPagar.floatMora;
    FieldByName('CPAG_VIA_BANCO').AsInteger       := fCad_Contas_Pagar.ContaPagar.intBanco;
    FieldByName('CPAG_CBCO_ID').AsString          := fCad_Contas_Pagar.ContaPagar.strCod_Bco;
    FieldByName('CPAG_PREVISAO').AsInteger        := fCad_Contas_Pagar.ContaPagar.intPrevisao;
    FieldByName('CPAG_CCRE_ID').AsString          := fCad_Contas_Pagar.ContaPagar.strCCRE_ID;
    FieldByName('CPAG_CCRE_EMPR_ID').AsInteger    := funcLocal.Empr_ID;
    Post;
  end;
end;

initialization
  if fParcelamento = nil then
    fParcelamento := TfParcelamento.Create(nil);
finalization
  FreeAndNil(fParcelamento);

end.
