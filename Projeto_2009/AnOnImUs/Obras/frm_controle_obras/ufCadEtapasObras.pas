unit ufCadEtapasObras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids,
  rxCurrEdit, RXDBCtrl, rxToolEdit, Mask, DBCtrls, DBClient, SQLExpr;

type
  TfCadEtapasObras = class(TfCadastro)
    Label1: TLabel;
    edtSequencia: TDBEdit;
    Label2: TLabel;
    edtDescricao: TDBEdit;
    edtDtPrevInicio: TDBDateEdit;
    edtDtPrevFim: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    DBDateEdit5: TDBDateEdit;
    Label4: TLabel;
    edtSeqAnt: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    edtCodProd: TDBEdit;
    DBEdit5: TDBEdit;
    btnAdicionar: TBitBtn;
    btnRetirar: TBitBtn;
    edtQtde: TRxDBCalcEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    btnPesqProd: TSpeedButton;
    btnAdicProd: TSpeedButton;
    rdStatus: TDBRadioGroup;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    Label15: TLabel;
    DBEdit3: TDBEdit;
    Label16: TLabel;
    DBEdit4: TDBEdit;
    edtVlrUnit: TRxDBCalcEdit;
    Label14: TLabel;
    DBEdit2: TDBEdit;
    btnSeq: TSpeedButton;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnPesqProdClick(Sender: TObject);
    procedure Label10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label10MouseLeave(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure btnAdicProdClick(Sender: TObject);
    procedure edtCodProdKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodProdExit(Sender: TObject);
    procedure btnRetirarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1Enter(Sender: TObject);
    procedure btnSeqClick(Sender: TObject);
  private
    function  ObterSequencia: Integer;
    function  ValidaDados: Boolean;
    function  JaExiste: Boolean;
    procedure OpenClientDataSet(intPos : Integer = 99);
    function  ValidaProduto: Boolean;
    procedure SomaItens;
    procedure MovimentaEstoque(intPos: Integer = 1);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadEtapasObras: TfCadEtapasObras;

implementation

uses udmControle_Obras, DB;

{$R *.dfm}

procedure TfCadEtapasObras.btnAdicionarClick(Sender: TObject);
begin
  if ValidaProduto then begin
    dmControle_Obras.cdsItensEtapas.Post;
    dmControle_Obras.cdsItensEtapas.Append;
    edtCodProd.SetFocus;
  end;
end;

procedure TfCadEtapasObras.SomaItens;
begin
  with dmControle_Obras do begin
    cdsItensEtapas.First;
    cdsEtapas_Obras.Edit;
    cdsEtapas_ObrasOBET_VLR_PREVISAO.AsFloat := 0;
    while not cdsItensEtapas.Eof do begin
      cdsEtapas_ObrasOBET_VLR_PREVISAO.AsFloat := cdsEtapas_ObrasOBET_VLR_PREVISAO.AsFloat +
                                                 (cdsItensEtapasOBEI_VLR_UNIT.AsFloat * cdsItensEtapasOBEI_QTDE.AsFloat);
      cdsItensEtapas.Next;
    end;
  end;
end;

function TfCadEtapasObras.ValidaProduto : Boolean;
begin
  Result := true;
  if edtCodProd.Text = '' then begin
    funcLocal.Alerta('Informe um produto antes de continuar.',0);
    edtCodProd.SetFocus;
    Result := false;
    Exit;
  end;
  if edtQtde.Value <= 0 then begin
    funcLocal.Alerta('Informe a quantidade antes de continuar.',0);
    edtQtde.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfCadEtapasObras.btnAdicProdClick(Sender: TObject);
begin
  inherited;
  Label10Click(Sender);
end;

procedure TfCadEtapasObras.btnOkClick(Sender: TObject);
begin
  dmControle_Obras.cdsItensEtapas.Cancel;
  if ValidaDados then begin
    SomaItens;
    case rdStatus.ItemIndex of
      0 : begin
        cdsLocal.FieldByName('OBET_DTA_INICIO').AsString    := '';
        cdsLocal.FieldByName('OBET_DTA_FIM').AsString       := '';
      end;
      1,2 : begin
        cdsLocal.FieldByName('OBET_DTA_INICIO').AsDateTime  := funcLocal.DataServidor(funcLocal.Conexao);
        cdsLocal.FieldByName('OBET_DTA_FIM').AsString       := '';
      end;
      3 : begin
        cdsLocal.FieldByName('OBET_DTA_FIM').AsDateTime     := funcLocal.DataServidor(funcLocal.Conexao);
      end;
    end;
    dmControle_Obras.cdsEtapas_Obras.Post;
    dmControle_Obras.cdsEtapas_Obras.ApplyUpdates(-1);
    dmControle_Obras.cdsItensEtapas.ApplyUpdates(-1);
    case cdsLocal.FieldByName('OBET_STATUS').AsInteger of
      3 : begin
        MovimentaEstoque;
      end;
    end;
    Self.Close;
  end;
end;

procedure TfCadEtapasObras.MovimentaEstoque(intPos : Integer = 1);
begin
  with dmControle_Obras do begin
    with cdsItensEtapas do begin
      First;
      while not Eof do begin
        case intPos of
          ///Baixa do Estoque
          1 : begin
            funcLocal.MovimentaEstoque(FieldByName('OBEI_PROD_ID').AsString,
                                       FieldByName('OBEI_QTDE').AsFloat,
                                       1,'6');
          end;
          2 : begin
            funcLocal.MovimentaEstoque(FieldByName('OBEI_PROD_ID').AsString,
                                       (FieldByName('OBEI_QTDE').AsFloat * -1),
                                       1,'6');
          end;
        end;
        Next;
      end;
    end;
  end;
end;

function TfCadEtapasObras.ValidaDados : Boolean;
begin
  Result := true;
  if edtSequencia.Text = '' then begin
    funcLocal.Alerta('Informe um número sequêncial para esta etapa antes de continuar.',0);
    edtSequencia.SetFocus;
    Result := false;
    Exit;
  end;
  if JaExiste then begin
    funcLocal.Alerta('Já consta um etapa com este número sequência, selecione outro número antes de continuar.',0);
    edtSequencia.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDescricao.Text = '' then begin
    funcLocal.Alerta('Informe a descrição da etapa antes de continuar.',0);
    edtDescricao.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDtPrevInicio.Date = 0 then begin
    funcLocal.Alerta('Informe a data de previsão de inicio antes de continuar.',0);
    edtDtPrevInicio.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDtPrevFim.Date = 0 then begin
    funcLocal.Alerta('Informe a data de previsão de fim antes de continuar.',0);
    edtDtPrevFim.SetFocus;
    Result := false;
    Exit;
  end;
  if (edtDtPrevFim.Date < edtDtPrevInicio.Date) then begin
    funcLocal.Alerta('Data de inicio inferior a data de fim.',0);
    edtDtPrevInicio.SetFocus;
    Result := false;
    Exit;
  end;
end;

function TfCadEtapasObras.JaExiste : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(*)');
        sql.Add('FROM  OBRAS_ETAPAS');
        sql.Add('WHERE OBET_ID          <> ' + dmControle_Obras.cdsEtapas_ObrasOBET_ID.AsString);
        sql.Add('AND   OBET_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   OBET_OBRA_ID      = ' + dmControle_Obras.cdsControle_ObrasOBRA_ID.AsString);
        sql.Add('AND   OBET_OBRA_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   OBET_SEQUENCIA    = ' + edtSequencia.Text);
        Open;
      end;
      Result := (qryCons.Fields[0].AsInteger > 0);
    except on e: exception do begin
      funcLocal.ReportaErro('TfCadEtapasObras','JaExiste',e.Message);
      funcLocal.Alerta('Erro no processo de validação do número sequêncial informado.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadEtapasObras.Label10Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(356);
end;

procedure TfCadEtapasObras.Label10MouseLeave(Sender: TObject);
begin
  inherited;
  funcLocal.UnPrintLabel(Sender);
end;

procedure TfCadEtapasObras.Label10MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
  funcLocal.PrintLabel(Sender);
end;

procedure TfCadEtapasObras.btnPesqProdClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet(2);
  with dmControle_Obras do begin
    strTMP := funcLocal.Busca_Registro(cdsPesqProdutos,'','PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;PROD_FLG_FRACIONADO;GRUPO_PROD;MARCA_PROD;MODELO_PROD','');
    cdsItensEtapas.Edit;
    if strTMP <> '' then begin
      cdsItensEtapas.FieldByName('OBEI_PROD_ID').AsString         := funcLocal.Buscar_Coluna(strTMP,1);
      cdsItensEtapas.FieldByName('PROD_DESCRICAO').AsString       := funcLocal.Buscar_Coluna(strTMP,2);
      cdsItensEtapas.FieldByName('PROD_UNIDADE').AsString         := funcLocal.Buscar_Coluna(strTMP,3);
      cdsItensEtapas.FieldByName('PROD_FLG_FRACIONADO').AsString  := funcLocal.Buscar_Coluna(strTMP,4);
      cdsItensEtapas.FieldByName('GRUPO_PROD').AsString           := funcLocal.Buscar_Coluna(strTMP,4);
      cdsItensEtapas.FieldByName('MARCA_PROD').AsString           := funcLocal.Buscar_Coluna(strTMP,5);
      cdsItensEtapas.FieldByName('MODELO_PROD').AsString          := funcLocal.Buscar_Coluna(strTMP,6);
      edtCodProd.Modified := TRUE;
    end else begin
      cdsItensEtapas.FieldByName('OBEI_PROD_ID').AsString         := '';
      cdsItensEtapas.FieldByName('PROD_DESCRICAO').AsString       := '';
      cdsItensEtapas.FieldByName('PROD_UNIDADE').AsString         := '';
      cdsItensEtapas.FieldByName('PROD_FLG_FRACIONADO').AsString  := '';
      cdsItensEtapas.FieldByName('GRUPO_PROD').AsString           := '';
      cdsItensEtapas.FieldByName('MARCA_PROD').AsString           := '';
      cdsItensEtapas.FieldByName('MODELO_PROD').AsString          := '';
    end;
  end;
  edtCodProd.SetFocus;
end;

procedure TfCadEtapasObras.btnRetirarClick(Sender: TObject);
begin
  inherited;
  if not dmControle_Obras.cdsItensEtapas.IsEmpty then begin
    dmControle_Obras.cdsItensEtapas.Delete;
  end;
  edtCodProd.SetFocus;
end;

procedure TfCadEtapasObras.btnSeqClick(Sender: TObject);
var
  strTMP : String;
begin
  strTMP := funcLocal.Busca_Registro(dmControle_Obras.cdsPesqSeq,'','OBET_SEQUENCIA;OBET_DTA_PREV_INICIO;OBET_DTA_PREV_FIM','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('OBET_SEQUENCIA_ANTERIOR').AsString := funcLocal.Buscar_Coluna(strTMP,1);
    if edtDtPrevInicio.Date = 0 then
      cdsLocal.FieldByName('OBET_DTA_PREV_INICIO').AsString  := funcLocal.Buscar_Coluna(strTMP,2);
    if edtDtPrevFim.Date = 0 then
      cdsLocal.FieldByName('OBET_DTA_PREV_FIM').AsString     := funcLocal.Buscar_Coluna(strTMP,3);
    edtSeqAnt.Modified := true;
  end else begin
    cdsLocal.FieldByName('OBET_SEQUENCIA_ANTERIOR').AsString := '';
  end;
  edtSeqAnt.SetFocus;
end;

procedure TfCadEtapasObras.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    if odd(DBGrid1.DataSource.DataSet.RecNo) then begin
      DBGrid1.Canvas.Font.Color  := clBlack;
      DBGrid1.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      DBGrid1.Canvas.Font.Color  := clBlack;
      DBGrid1.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      DBGrid1.Canvas.Brush.Color := clSilver;
      DBGrid1.Canvas.Font.Style  := [fsBold];
    end;
     DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
end;

procedure TfCadEtapasObras.DBGrid1Enter(Sender: TObject);
begin
  inherited;
  dmControle_Obras.cdsItensEtapas.Cancel;
end;

procedure TfCadEtapasObras.edtCodProdExit(Sender: TObject);
var
  strTMP : String;
  strCodProd : String;
begin
  if not edtCodProd.Modified then Exit;
  OpenClientDataSet(2);
  with dmControle_Obras do begin
    if edtCodProd.Text <> '' then begin
      strCodProd := edtCodProd.Text;
      cdsItensEtapas.Cancel;
      if not (cdsItensEtapas.Locate('OBEI_PROD_ID',strCodProd,[])) then begin
        cdsItensEtapas.Append;
        strTMP := funcLocal.Busca_Registro(cdsPesqProdutos,'','PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;PROD_FLG_FRACIONADO;GRUPO_PROD;MARCA_PROD;MODELO_PROD','PROD_ID = ' + strCodProd);
        if strTMP <> '' then begin
          cdsItensEtapas.FieldByName('OBEI_PROD_ID').AsString         := funcLocal.Buscar_Coluna(strTMP,1);
          cdsItensEtapas.FieldByName('PROD_DESCRICAO').AsString       := funcLocal.Buscar_Coluna(strTMP,2);
          cdsItensEtapas.FieldByName('PROD_UNIDADE').AsString         := funcLocal.Buscar_Coluna(strTMP,3);
          cdsItensEtapas.FieldByName('PROD_FLG_FRACIONADO').AsString  := funcLocal.Buscar_Coluna(strTMP,4);
          cdsItensEtapas.FieldByName('GRUPO_PROD').AsString           := funcLocal.Buscar_Coluna(strTMP,5);
          cdsItensEtapas.FieldByName('MARCA_PROD').AsString           := funcLocal.Buscar_Coluna(strTMP,6);
          cdsItensEtapas.FieldByName('MODELO_PROD').AsString          := funcLocal.Buscar_Coluna(strTMP,7);
        end else begin
          cdsItensEtapas.FieldByName('OBEI_PROD_ID').AsString         := '';
          cdsItensEtapas.FieldByName('PROD_DESCRICAO').AsString       := '';
          cdsItensEtapas.FieldByName('PROD_UNIDADE').AsString         := '';
          cdsItensEtapas.FieldByName('PROD_FLG_FRACIONADO').AsString  := '';
          cdsItensEtapas.FieldByName('GRUPO_PROD').AsString           := '';
          cdsItensEtapas.FieldByName('MARCA_PROD').AsString           := '';
          cdsItensEtapas.FieldByName('MODELO_PROD').AsString          := '';
        end;
      end else begin
        cdsItensEtapas.Edit;
      end;
    end else begin
      cdsItensEtapas.Edit;
      cdsItensEtapas.FieldByName('OBEI_PROD_ID').AsString         := '';
      cdsItensEtapas.FieldByName('PROD_DESCRICAO').AsString       := '';
      cdsItensEtapas.FieldByName('PROD_UNIDADE').AsString         := '';
      cdsItensEtapas.FieldByName('PROD_FLG_FRACIONADO').AsString  := '';
      cdsItensEtapas.FieldByName('GRUPO_PROD').AsString           := '';
      cdsItensEtapas.FieldByName('MARCA_PROD').AsString           := '';
      cdsItensEtapas.FieldByName('MODELO_PROD').AsString          := '';
    end;
  end;
end;

procedure TfCadEtapasObras.edtCodProdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key,['0'..'9',#8]) then key := #0;
end;

procedure TfCadEtapasObras.edtQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  case dmControle_Obras.cdsItensEtapasPROD_FLG_FRACIONADO.AsInteger of
    0 : if not CharInSet(key,['0'..'9',#8]) then     Key := #0;
    1 : if not CharInSet(key,['0'..'9',#8,',']) then Key := #0;
  end;
end;

procedure TfCadEtapasObras.FormShow(Sender: TObject);
begin
  inherited;
  edtSequencia.SetFocus;
  if (cdsLocal.State in [dsInsert]) then begin
    cdsLocal.FieldByName('OBET_SEQUENCIA').AsInteger := ObterSequencia;
  end;
  OpenClientDataSet;
end;

procedure TfCadEtapasObras.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmControle_Obras do begin
    case intPos of
      1 : begin
        with cdsItensEtapas do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('OBET_ID').AsInteger := cdsLocal.FieldByName('OBET_ID').AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('OBRA_ID').AsInteger := cdsControle_ObrasOBRA_ID.AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
          Edit;
        end;
      end;
      2 : begin
        with cdsPesqProdutos do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      3 : begin
        with cdsPesqSeq do begin
          Close;
          Params.ParamByName('OBET_ID').AsInteger := cdsLocal.FieldByName('OBET_ID').AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('OBRA_ID').AsInteger := cdsLocal.FieldByName('OBET_OBRA_ID').AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end
      else begin
        OpenClientDataSet(1);
        OpenClientDataSet(2);
        OpenClientDataSet(3);
      end;
    end;
  end;
end;

function TfCadEtapasObras.ObterSequencia : Integer;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := 1;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(MAX(OBET_SEQUENCIA),0)');
        sql.Add('FROM  OBRAS_ETAPAS');
        sql.Add('WHERE OBET_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   OBET_OBRA_ID      = ' + dmControle_Obras.cdsControle_ObrasOBRA_ID.AsString);
        sql.Add('AND   OBET_OBRA_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   OBET_STATUS       = 1');
        Open;
      end;
      if not qryCons.IsEmpty then
        Result := (qryCons.Fields[0].AsInteger + 1);
    except on e: exception do begin
      funcLocal.ReportaErro('TfCadEtapasObras','ObterSequencia',e.Message);
      funcLocal.Alerta('Erro no processo de sequenciamento das etapas da obra.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

initialization
  if fCadEtapasObras = nil then
    fCadEtapasObras := TfCadEtapasObras.Create(nil);

finalization
  FreeAndNil(fCadEtapasObras);

end.
