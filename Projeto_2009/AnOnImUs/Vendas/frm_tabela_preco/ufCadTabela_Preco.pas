unit ufCadTabela_Preco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids,
  rxCurrEdit, RXDBCtrl, DBCtrls, rxToolEdit, Mask, SQLExpr;

type
  TTabelaPreco = class
    protected
      FVlrGond,
      FVlrMin,
      FVlrEsp,
      FVlrAtac    : Real;
      FDtVigencia,
      FDtValidade : TDateTime;
      procedure SetVlrGond(const Value : Real = 0);
      procedure SetVlrMin(const  Value : Real = 0);
      procedure SetVlrEsp(const  Value : Real = 0);
      procedure SetVlrAtac(const Value : Real = 0);
      procedure SetDtVigencia(const Value : TDateTime = 0);
      procedure SetDtValidade(const Value : TDateTime = 0);
    private
      function  GetVlrGond : Real;
      function  GetVlrMin  : Real;
      function  GetVlrEsp  : Real;
      function  GetVlrAtac : Real;
      function  GetDtVigencia : TDateTime;
      function  GetDtValidade : TDateTime;
    public
      constructor create;
      procedure  SetValueTable(vlrGond, vlrMin, VlrEsp, vlrAtac : Real; dtVigencia,
        dtValidade : TDateTime);
  end;
  TfCadTabelaPreco = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    edtTabela: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    edtCodProd: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    btnPesqProd: TSpeedButton;
    edtDtVigencia: TDBDateEdit;
    edtDtValidade: TDBDateEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtVlrGondola: TRxDBCalcEdit;
    edtVlrMinimo: TRxDBCalcEdit;
    edtVlrEspecial: TRxDBCalcEdit;
    edtVlrAtacado: TRxDBCalcEdit;
    Label11: TLabel;
    Label12: TLabel;
    grdItens: TDBGrid;
    btnAdic: TBitBtn;
    btnRet: TBitBtn;
    SpeedButton3: TSpeedButton;
    procedure grdItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtCodProdKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodProdExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label4MouseLeave(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure btnPesqProdClick(Sender: TObject);
    procedure btnAdicClick(Sender: TObject);
    procedure btnRetClick(Sender: TObject);
    procedure grdItensCellClick(Column: TColumn);
    procedure grdItensEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure edtVlrGondolaExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure grdItensTitleClick(Column: TColumn);
  private
    TabelaPreco : TTabelaPreco;
    procedure OpenClientDataSet(intPos: Integer = 99);
    function ValidaDados(intPos : Integer = 1): Boolean;
    function JaExiste: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadTabelaPreco: TfCadTabelaPreco;

implementation

uses udmTabela_Preco, DB;

{$R *.dfm}

procedure TfCadTabelaPreco.btnAdicClick(Sender: TObject);
begin
  if ValidaDados then begin
    with dmTabelaPreco.cdsItensTabelaPreco do begin
      TabelaPreco.SetValueTable(FieldByName('TPIT_VLR_GONDOLA').AsFloat,
                                FieldByName('TPIT_VLR_MINIMO').AsFloat,
                                FieldByName('TPIT_VLR_ESPECIAL').AsFloat,
                                FieldByName('TPIT_VLR_ATACADO').AsFloat,
                                edtDtVigencia.Date,
                                edtDtValidade.Date);
    end;
    dmTabelaPreco.cdsItensTabelaPreco.Append;
    edtCodProd.SetFocus;
  end else IsValidData;
end;

function TfCadTabelaPreco.ValidaDados(intPos : Integer = 1) : Boolean;
begin
  Result := true;
  case intPos of 
    1 : begin
      if edtCodProd.Text = '' then begin
        funcLocal.Alerta('Informe o produto antes de continuar.',1);
        edtCodProd.SetFocus;
        Result := false;
        Exit;
      end;
      if edtDtVigencia.Date <= 0 then begin
        funcLocal.Alerta('Informe a data de vigência antes de continuar.',1);
        edtDtVigencia.SetFocus;
        Result := false;
        Exit;
      end;
      if edtDtValidade.Date <= 0 then begin
        funcLocal.Alerta('Informe a data de validade antes de continuar.',1);
        edtDtValidade.SetFocus;
        Result := false;
        Exit;
      end;
      if edtDtVigencia.Date > edtDtValidade.Date then begin
        funcLocal.Alerta('A data de vigência não pode ser superior a data de validade.',1);
        edtDtVigencia.SetFocus;
        Result := false;
        Exit;
      end;
      if edtVlrMinimo.Value > edtVlrGondola.Value then begin
        funcLocal.Alerta('O valor minimo de venda do produto não pode ser superior ao seu valor de venda.',1);
        edtVlrMinimo.SetFocus;
        Result := false;
        Exit;
      end;
      if (edtVlrEspecial.Value > edtVlrGondola.Value) or (edtVlrEspecial.Value > edtVlrMinimo.Value) then begin
        funcLocal.Alerta('O valor especial de venda não poder ser superior ao valor de venda e minimo.',1);
        edtVlrEspecial.SetFocus;
        Result := false;
        Exit;
      end;
    end;
    2 : begin
      if edtTabela.Text = '' then begin
        funcLocal.Alerta('Informe uma descrição para a tabela de preço antes de continuar.',1);
        edtTabela.SetFocus;
        Result := false;
        Exit;
      end;
      if JaExiste then begin
        funcLocal.Alerta('Já consta uma tabela de preço com a descrição informada, verifique a descrição para a tabela de preço antes de continuar.',1);
        edtTabela.SetFocus;
        Result := false;
        Exit;
      end;
      if dmTabelaPreco.cdsItensTabelaPreco.IsEmpty then begin
        funcLocal.Alerta('Tabela de preço sem itens, verifique a inclusão de itens antes de continuar.',1);
        edtCodProd.SetFocus;
        Result := false;
        Exit;
      end;
    end;
  end;
end;

function TfCadTabelaPreco.JaExiste : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(*)');
        sql.Add('FROM  TABELA_PRECO');
        sql.Add('WHERE TPRC_ID       <> ' + dmTabelaPreco.cdsTabelaPrecoTPRC_ID.AsString);
        sql.Add('AND   TPRC_EMPR_ID   = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   TPRC_DESCRICAO = ' + QuotedStr(dmTabelaPreco.cdsTabelaPrecoTPRC_DESCRICAO.AsString));
        Open;
      end;
      Result := (qryCons.Fields[0].AsInteger = 1);
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'JaExiste',e.Message);
      funcLocal.Alerta('Erro no processo de validação das informações.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadTabelaPreco.btnOkClick(Sender: TObject);
begin
  if ValidaDados(2) then begin
    inherited;
    dmTabelaPreco.cdsItensTabelaPreco.Cancel;
    dmTabelaPreco.cdsItensTabelaPreco.ApplyUpdates(-1);
    OpenClientDataSet(2);
    edtTabela.SetFocus;
  end else IsValidData;
end;

procedure TfCadTabelaPreco.btnPesqProdClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmTabelaPreco,cdsItensTabelaPreco do begin
    OpenClientDataSet(1);
    Edit;
    strTMP := funcLocal.Busca_Registro(dmTabelaPreco.cdsPesqProd,'PROD_DESCRICAO','PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;GRUPO_PROD;MARCA_PROD;MODELO_PROD','');
    if strTMP <> '' then begin
      FieldByName('TPIT_PROD_ID').AsString        := funcLocal.Buscar_Coluna(strTMP,1);
      FieldByName('PROD_DESCRICAO').AsString      := funcLocal.Buscar_Coluna(strTMP,2);
      FieldByName('PROD_UNIDADE').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
      FieldByName('GRUPO_PROD').AsString          := funcLocal.Buscar_Coluna(strTMP,4);
      FieldByName('MARCA_PROD').AsString          := funcLocal.Buscar_Coluna(strTMP,5);
      FieldByName('MODELO_PROD').AsString         := funcLocal.Buscar_Coluna(strTMP,6);
      FieldByName('TPIT_VLR_GONDOLA').AsFloat     := 0;
      FieldByName('TPIT_VLR_MINIMO').AsFloat      := 0;
      FieldByName('TPIT_VLR_ESPECIAL').AsFloat    := 0;
      FieldByName('TPIT_VLR_ATACADO').AsFloat     := 0;
      FieldByName('TPIT_DTA_VIGENCIA').AsDateTime := 0;
      FieldByName('TPIT_DTA_VALIDADE').AsDateTime := 0;
      edtCodProd.Modified := true;
    end else begin
      FieldByName('TPIT_PROD_ID').AsString        := '';
      FieldByName('PROD_DESCRICAO').AsString      := '';
      FieldByName('PROD_UNIDADE').AsString        := '';
      FieldByName('GRUPO_PROD').AsString          := '';
      FieldByName('MARCA_PROD').AsString          := '';
      FieldByName('MODELO_PROD').AsString         := '';
      FieldByName('TPIT_VLR_GONDOLA').AsFloat     := 0;
      FieldByName('TPIT_VLR_MINIMO').AsFloat      := 0;
      FieldByName('TPIT_VLR_ESPECIAL').AsFloat    := 0;
      FieldByName('TPIT_VLR_ATACADO').AsFloat     := 0;
      FieldByName('TPIT_DTA_VIGENCIA').AsDateTime := 0;
      FieldByName('TPIT_DTA_VALIDADE').AsDateTime := 0;
    end;
  end;
  edtCodProd.SetFocus;
end;

procedure TfCadTabelaPreco.btnRetClick(Sender: TObject);
begin
  inherited;
  if not dmTabelaPreco.cdsItensTabelaPreco.IsEmpty then begin
    dmTabelaPreco.cdsItensTabelaPreco.Delete;
    edtCodProd.SetFocus;
  end;
end;

procedure TfCadTabelaPreco.edtCodProdExit(Sender: TObject);
var
  strTMP  : String;
  strPROD : String;
begin
  if not edtCodProd.Modified then Exit;
  with dmTabelaPreco,cdsItensTabelaPreco,TabelaPreco do begin
    Edit;
    if edtCodProd.Text <> '' then begin
      OpenClientDataSet(1);
      strPROD := edtCodProd.Text;
      Cancel;
      if not cdsItensTabelaPreco.Locate('TPIT_TPRC_ID;TPIT_PROD_ID',VarArrayOf([cdsTabelaPrecoTPRC_ID.AsInteger,StrToInt(strPROD)]),[]) then begin
        cdsItensTabelaPreco.Append;
        strTMP := funcLocal.Busca_Registro(dmTabelaPreco.cdsPesqProd,'PROD_DESCRICAO','PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;GRUPO_PROD;MARCA_PROD;MODELO_PROD','PROD_ID = ' + strPROD);
        if strTMP <> '' then begin
          FieldByName('TPIT_PROD_ID').AsString        := funcLocal.Buscar_Coluna(strTMP,1);
          FieldByName('PROD_DESCRICAO').AsString      := funcLocal.Buscar_Coluna(strTMP,2);
          FieldByName('PROD_UNIDADE').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
          FieldByName('GRUPO_PROD').AsString          := funcLocal.Buscar_Coluna(strTMP,4);
          FieldByName('MARCA_PROD').AsString          := funcLocal.Buscar_Coluna(strTMP,5);
          FieldByName('MODELO_PROD').AsString         := funcLocal.Buscar_Coluna(strTMP,6);
          FieldByName('TPIT_VLR_GONDOLA').AsFloat     := GetVlrGond;
          FieldByName('TPIT_VLR_MINIMO').AsFloat      := GetVlrMin;
          FieldByName('TPIT_VLR_ESPECIAL').AsFloat    := GetVlrEsp;
          FieldByName('TPIT_VLR_ATACADO').AsFloat     := GetVlrAtac;
          FieldByName('TPIT_DTA_VIGENCIA').AsDateTime := GetDtVigencia;
          FieldByName('TPIT_DTA_VALIDADE').AsDateTime := GetDtValidade;
        end else begin
          FieldByName('TPIT_PROD_ID').AsString        := '';
          FieldByName('PROD_DESCRICAO').AsString      := '';
          FieldByName('PROD_UNIDADE').AsString        := '';
          FieldByName('GRUPO_PROD').AsString          := '';
          FieldByName('MARCA_PROD').AsString          := '';
          FieldByName('MODELO_PROD').AsString         := '';
          FieldByName('TPIT_VLR_GONDOLA').AsFloat     := 0;
          FieldByName('TPIT_VLR_MINIMO').AsFloat      := 0;
          FieldByName('TPIT_VLR_ESPECIAL').AsFloat    := 0;
          FieldByName('TPIT_VLR_ATACADO').AsFloat     := 0;
          FieldByName('TPIT_DTA_VIGENCIA').AsDateTime := 0;
          FieldByName('TPIT_DTA_VALIDADE').AsDateTime := 0;
        end;
      end else begin
        cdsItensTabelaPreco.Edit;
      end;
    end else begin
      FieldByName('TPIT_PROD_ID').AsString        := '';
      FieldByName('PROD_DESCRICAO').AsString      := '';
      FieldByName('PROD_UNIDADE').AsString        := '';
      FieldByName('GRUPO_PROD').AsString          := '';
      FieldByName('MARCA_PROD').AsString          := '';
      FieldByName('MODELO_PROD').AsString         := '';
      FieldByName('TPIT_VLR_GONDOLA').AsFloat     := 0;
      FieldByName('TPIT_VLR_MINIMO').AsFloat      := 0;
      FieldByName('TPIT_VLR_ESPECIAL').AsFloat    := 0;
      FieldByName('TPIT_VLR_ATACADO').AsFloat     := 0;
      FieldByName('TPIT_DTA_VIGENCIA').AsDateTime := 0;
      FieldByName('TPIT_DTA_VALIDADE').AsDateTime := 0;
    end;
  end;
end;

procedure TfCadTabelaPreco.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmTabelaPreco do begin
    case intPos of
      1 : begin
        with cdsPesqProd do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      2 : begin
        with cdsItensTabelaPreco do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('TPRC_ID').AsInteger := cdsTabelaPrecoTPRC_ID.AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end
      else begin
        OpenClientDataSet(1);
        OpenClientDataSet(2);
      end;
    end;
  end;
end;

procedure TfCadTabelaPreco.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Label4Click(Sender);
  edtCodProd.SetFocus;
end;

procedure TfCadTabelaPreco.edtCodProdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
end;

procedure TfCadTabelaPreco.edtVlrGondolaExit(Sender: TObject);
begin
  inherited;
  if (edtVlrMinimo.Value = 0) or (edtVlrMinimo.Value > edtVlrGondola.Value) then
    edtVlrMinimo.Value   := edtVlrGondola.Value;

  if (edtVlrEspecial.Value = 0) or (edtVlrEspecial.Value > edtVlrMinimo.Value) then
    edtVlrEspecial.Value := edtVlrMinimo.Value;

  if (edtVlrAtacado.Value = 0) or (edtVlrAtacado.Value > edtVlrEspecial.Value) then
    edtVlrAtacado.Value := edtVlrEspecial.Value
end;

procedure TfCadTabelaPreco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(TabelaPreco);
end;

procedure TfCadTabelaPreco.FormShow(Sender: TObject);
begin
  inherited;
  TabelaPreco := TTabelaPreco.create;
  edtTabela.SetFocus;
  OpenClientDataSet(2);
  dmTabelaPreco.boolAlter := False;
  dmTabelaPreco.cdsItensTabelaPreco.Append;
end;

procedure TfCadTabelaPreco.grdItensCellClick(Column: TColumn);
begin
  inherited;
  dmTabelaPreco.cdsItensTabelaPreco.Cancel;
end;

procedure TfCadTabelaPreco.grdItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(grdItens.DataSource.DataSet.RecNo) then begin
      grdItens.Canvas.Font.Color  := clBlack;
      grdItens.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      grdItens.Canvas.Font.Color  := clBlack;
      grdItens.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      grdItens.Canvas.Brush.Color := clSilver;
      grdItens.Canvas.Font.Style  := [fsBold];
    end;
     grdItens.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
end;

procedure TfCadTabelaPreco.grdItensEnter(Sender: TObject);
begin
  inherited;
  dmTabelaPreco.cdsItensTabelaPreco.Cancel;
end;

procedure TfCadTabelaPreco.grdItensTitleClick(Column: TColumn);
begin
  inherited;
  try
    dmTabelaPreco.cdsItensTabelaPreco.IndexFieldNames := Column.Field.FieldName;
  except
  end;

end;

procedure TfCadTabelaPreco.Label4Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(356);
end;

procedure TfCadTabelaPreco.Label4MouseLeave(Sender: TObject);
begin
  inherited;
  funcLocal.UnPrintLabel(Sender);
end;

procedure TfCadTabelaPreco.Label4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
  funcLocal.PrintLabel(Sender);
end;

{ TTabelaPreco }

constructor TTabelaPreco.create;
begin
  SetVlrGond(0);
  SetVlrMin(0);
  SetVlrEsp(0);
  SetVlrAtac(0);
  SetDtVigencia(0);
  SetDtValidade(0);
end;

function TTabelaPreco.GetDtValidade: TDateTime;
begin
  Result := FDtValidade;
end;

function TTabelaPreco.GetDtVigencia: TDateTime;
begin
  Result := FDtVigencia;
end;

function TTabelaPreco.GetVlrAtac: Real;
begin
  Result := FVlrAtac;
end;

function TTabelaPreco.GetVlrEsp: Real;
begin
  Result := FVlrEsp;
end;

function TTabelaPreco.GetVlrGond: Real;
begin
  Result := FVlrGond;
end;

function TTabelaPreco.GetVlrMin: Real;
begin
  Result := FVlrMin;
end;

procedure TTabelaPreco.SetDtValidade(const Value: TDateTime);
begin
  FDtValidade := Value;
end;

procedure TTabelaPreco.SetDtVigencia(const Value: TDateTime);
begin
  FDtVigencia := Value;
end;

procedure TTabelaPreco.SetValueTable(vlrGond, vlrMin, VlrEsp, vlrAtac: Real;
  dtVigencia, dtValidade: TDateTime);
begin
  SetVlrGond(vlrGond);
  SetVlrMin(vlrMin);
  SetVlrEsp(VlrEsp);
  SetVlrAtac(vlrAtac);
  SetDtVigencia(dtVigencia);
  SetDtValidade(dtValidade);
end;

procedure TTabelaPreco.SetVlrAtac(const Value: Real);
begin
  FVlrAtac := Value;
end;

procedure TTabelaPreco.SetVlrEsp(const Value: Real);
begin
  FVlrEsp := Value;
end;

procedure TTabelaPreco.SetVlrGond(const Value: Real);
begin
  FVlrGond := Value;
end;

procedure TTabelaPreco.SetVlrMin(const Value: Real);
begin
  FVlrMin := Value;
end;

initialization
  if fCadTabelaPreco = nil then
    fCadTabelaPreco := TfCadTabelaPreco.Create(nil);
finalization
  FreeAndNil(fCadTabelaPreco);

end.
