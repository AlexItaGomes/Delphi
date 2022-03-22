unit ufParcelamentoRecebimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids;

type
  TfParcelaRecebimento = class(TfCadastro)
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
  fParcelaRecebimento: TfParcelaRecebimento;

implementation

uses udmContas_Receber, ufCad_Contas_Receber, ufContas_Receber;

{$R *.dfm}

procedure TfParcelaRecebimento.btnOkClick(Sender: TObject);
begin
  inherited;
  boolConf := True;
end;

procedure TfParcelaRecebimento.FormShow(Sender: TObject);
begin
  inherited;
  OpenClientDataSet;
  boolConf := false;
  inc(intI);
  while intI <= StrToInt(strParc) do begin
    LoadDados;
    inc(intI);
  end;
  dmContas_Receber.cdsParcelamento.FieldByName('CREC_PROVENIENTE').ReadOnly := True;
end;

procedure TfParcelaRecebimento.OpenClientDataSet;
begin
  dmContas_Receber.cdsParcelamento.FieldByName('CREC_PROVENIENTE').ReadOnly := false;
  with dmContas_Receber.cdsParcelamento do begin
    Close;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Open;
  end;
end;

procedure TfParcelaRecebimento.LoadDados;
begin
  with cdsLocal do begin
    Append;
    FieldByName('CREC_NR_DOC').AsString           := fCad_Contas_Receber.ContaReceber.strNr_Doc;
    FieldByName('CREC_PROVENIENTE').AsString      := Trim(fCad_Contas_Receber.ContaReceber.strProv + ' ' + FormatFloat('000',intI) + ' / ' + FormatFloat('000',StrToFloat(strParc)));
    FieldByName('CREC_CLIE_ID').AsString          := fCad_Contas_Receber.ContaReceber.strCod_Clie;
    FieldByName('CLIE_RAZAO_SOCIAL').AsString     := fCad_Contas_Receber.ContaReceber.strCliente;
    FieldByName('CREC_PLCT_ID').AsString          := fCad_Contas_Receber.ContaReceber.strCod_Plct;
    FieldByName('PLCT_COD_SIMPLIFICADO').AsString := funcLocal.Buscar_Coluna(fCad_Contas_Receber.ContaReceber.strPlano,1);
    FieldByName('PLCT_DESCRICAO').AsString        := funcLocal.Buscar_Coluna(fCad_Contas_Receber.ContaReceber.strPlano,2);
    FieldByName('CREC_GENE_ID_TIPO_DOC').AsString := fCad_Contas_Receber.ContaReceber.strCod_Doc;
    FieldByName('TIPO_DOC').AsString              := fCad_Contas_Receber.ContaReceber.strDoc;
    FieldByName('CREC_OBS').AsString              := fCad_Contas_Receber.ContaReceber.strObs;
    FieldByName('CREC_DTA_EMISSAO').AsDateTime    := fCad_Contas_Receber.ContaReceber.dtEmissao;
    FieldByName('CREC_DTA_VCTO').AsDateTime       := IncMonth(fCad_Contas_Receber.ContaReceber.dtVecto);
    fCad_Contas_Receber.ContaReceber.dtVecto      := FieldByName('CREC_DTA_VCTO').AsDateTime;
    FieldByName('CREC_VALOR_DOC').AsFloat         := fCad_Contas_Receber.ContaReceber.floatVlr;
    FieldByName('CREC_VALOR_JUROS').AsFloat       := fCad_Contas_Receber.ContaReceber.floatJuro;
    FieldByName('CREC_VALOR_MORA').AsFloat        := fCad_Contas_Receber.ContaReceber.floatMora;
    FieldByName('CREC_VIA_BANCO').AsInteger       := fCad_Contas_Receber.ContaReceber.intBanco;
    FieldByName('CREC_CBCO_ID').AsString          := fCad_Contas_Receber.ContaReceber.strCod_Bco;
    FieldByName('CREC_PREVISAO').AsInteger        := fCad_Contas_Receber.ContaReceber.intPrevisao;
    FieldByName('CREC_CCRE_ID').AsString          := fCad_Contas_Receber.ContaReceber.strCCRE_ID;
    Post;
  end;
end;

initialization
  if fParcelaRecebimento = nil then
    fParcelaRecebimento := TfParcelaRecebimento.Create(nil);
finalization
  FreeAndNil(fParcelaRecebimento);

end.
