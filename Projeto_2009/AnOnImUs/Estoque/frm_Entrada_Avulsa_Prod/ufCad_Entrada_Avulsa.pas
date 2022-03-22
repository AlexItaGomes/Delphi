unit ufCad_Entrada_Avulsa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, DBCtrls,
  Grids, DBGrids, rxToolEdit, RXDBCtrl, DB, SQLExpr, DBClient;

type
  TfCad_EntradaAvulsa = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtNrDocumento: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox1: TGroupBox;
    mmObs: TDBMemo;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    btnPesqProd: TSpeedButton;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtCodProd: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    edtQtde: TDBEdit;
    btnAdic: TBitBtn;
    btnRet: TBitBtn;
    grdItens: TDBGrid;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    SpeedButton3: TSpeedButton;
    procedure grdItensCellClick(Column: TColumn);
    procedure btnRetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure btnPesqProdClick(Sender: TObject);
    procedure edtCodProdExit(Sender: TObject);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodProdKeyPress(Sender: TObject; var Key: Char);
    procedure btnAdicEnter(Sender: TObject);
    procedure btnAdicClick(Sender: TObject);
    procedure grdItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnOkClick(Sender: TObject);
    procedure DBRadioGroup1Enter(Sender: TObject);
    procedure grdItensColEnter(Sender: TObject);
    procedure grdItensEnter(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    procedure OpenClientDataSet(intTipo: Integer = 99);
    function ValidaDados: Boolean;
    procedure RegistraConciliacao(strENAV_ID: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_EntradaAvulsa: TfCad_EntradaAvulsa;

implementation

uses udmEntrada_Avulsa;

{$R *.dfm}

procedure TfCad_EntradaAvulsa.btnAdicClick(Sender: TObject);
begin
  inherited;
  if not (dmEntradaAvulsa.cdsItensEntradaAvulsa.State in [dsInsert,dsEdit]) then
    dmEntradaAvulsa.cdsItensEntradaAvulsa.Edit;
  with dmEntradaAvulsa.cdsItensEntradaAvulsa do begin
    if (edtCodProd.Text <> '') and (StrToFloat(edtQtde.Text) > 0) then begin
      Post;
      Append;
      edtCodProd.SetFocus;
    end else begin
      funcLocal.Alerta('Informe os dados do produto corretamente antes de continuar.',1);
      edtCodProd.SetFocus;
    end;
  end;
end;

procedure TfCad_EntradaAvulsa.btnAdicEnter(Sender: TObject);
begin
  inherited;
  if (edtCodProd.Text <> '') or (StrToFloat(edtQtde.Text) > 0) then begin
    btnAdic.Click;
  end else begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfCad_EntradaAvulsa.btnOkClick(Sender: TObject);
var
  boolInsert : Boolean;
  strENAV_ID : String;
begin
  if ValidaDados then begin
    boolInsert := (cdsLocal.FieldByName('ENAV_CONCILIADO').AsInteger = 0);
    strENAV_ID := cdsLocal.FieldByName('ENAV_ID').AsString;
    inherited;
    dmEntradaAvulsa.cdsItensEntradaAvulsa.Cancel;
    dmEntradaAvulsa.cdsItensEntradaAvulsa.ApplyUpdates(-1);
    try
      edtNrDocumento.SetFocus;
    except
    end;
    if boolInsert then begin
      if funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                          'Registro ainda não conciliado, deseja realizar a conciliação '+
                          'do(s) produto(s) informado(s)?',1,true) = 6 then begin
        RegistraConciliacao(strENAV_ID);
      end else begin
        funcLocal.Alerta('Você optou por não realizar a conciliação do(s) produto(s) '+
                         'informado(s), não foi feita nenhuma alimentação do estoque '+
                         'do(s) produto(s) informado, caso queira realizar a conciliação, '+
                         'basta editar o registro e salva-lo novamente.',1);
      end;
    end;
    OpenClientDataSet(1);
  end else IsValidData;
end;

{*******************************************************************************
Data:       23/03/2010
Autor:      Alex Itamar Gomes
Descrição   Metodo para a realização do registro de movimentação dos produtos
            informado, lançando as quantidas no Estoque do produto.

Parametros:
  strENAV_ID = ID da tabela ENTRADA_AVULSA para a reabertura do tabela de itens
               da entrada avulsa de produtos.

Historico
Data          Autor                 Descrição
23/03/2010    Alex I. Gomes         Inclusão do cabeçalho
*******************************************************************************}
procedure TfCad_EntradaAvulsa.RegistraConciliacao(strENAV_ID : String);
var
  qryCons : TSQLQuery;
  boolInco: Boolean;
begin
  boolInco := false;
  try
    try
      with dmEntradaAvulsa,cdsItensEntradaAvulsa do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Params.ParamByName('ENAV_ID').AsInteger := StrToInt(strENAV_ID);
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
        First;
        DisableControls;
        while not eof do begin
          if (cdsItensEntradaAvulsaENIT_PROD_ID.AsString <> '') and (cdsItensEntradaAvulsaENIT_QTDE.AsFloat > 0) then begin
            funcLocal.MovimentaEstoque(cdsItensEntradaAvulsaENIT_PROD_ID.AsString,cdsItensEntradaAvulsaENIT_QTDE.AsFloat);
          end else boolInco := true;
          Next;
        end;
        EnableControls;
      end;
      try
        qryCons := TSQLQuery.Create(nil);
        qryCons.SQLConnection := funcLocal.Conexao;
        with qryCons do begin
          Close;
          sql.Clear;
          try
            funcLocal.StartCommit;
          except
          end;
          sql.Add('UPDATE ENTRADA_AVULSA');
          sql.Add('SET    ENAV_CONCILIADO = 1');
          sql.Add('WHERE  ENAV_ID         = ' + strENAV_ID);
          sql.Add('AND    ENAV_EMPR_ID    = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL;
          try
            funcLocal.Commit;
          except
          end;
        end;
      finally
        qryCons.Close;
        FreeAndNil(qryCons);
      end;
    except on e: exception do begin
      funcLocal.RollBack;
      funcLocal.ReportaErro(Caption,'RegistraConciliacao',e.Message);
      funcLocal.Alerta('Erro durante o processo de conciliação do(s) produto(s) lançado(s).'+#13+'['+e.Message+']',1);
    end; end;
  finally
    if boolInco then begin
      funcLocal.Alerta('Foi(ram) encontrado(s) inconsistência(s) no lançamento de algum(ns) produto(s), por favor! Verifique.',0);
    end;
  end;
end;

procedure TfCad_EntradaAvulsa.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  dmEntradaAvulsa.cdsItensEntradaAvulsa.Cancel;
  Label12Click(Sender);
  edtCodProd.SetFocus;
end;

function TfCad_EntradaAvulsa.ValidaDados : Boolean;
begin
  Result := true;
  dmEntradaAvulsa.cdsItensEntradaAvulsa.Cancel;
  if edtNrDocumento.Text = '' then begin
    funcLocal.Alerta('Informe o número do documento antes de continuar.',1);
    edtNrDocumento.SetFocus;
    Result := false;
    Exit;
  end;
  if dmEntradaAvulsa.cdsItensEntradaAvulsa.IsEmpty then begin
    funcLocal.Alerta('Registro de Entrada Avulsa de produto se item(ns) a ser(em) lançado(s).',1);
    edtCodProd.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfCad_EntradaAvulsa.btnPesqProdClick(Sender: TObject);
var
  strTMP     : String;
begin
  with dmEntradaAvulsa do begin
    OpenClientDataSet(2);
    strTMP := funcLocal.Busca_Registro(dmEntradaAvulsa.cdsPesqProdutos,'PROD_DESCRICAO','PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;GRUPO_PROD;MARCA_PROD;MODELO_PROD','');
    cdsItensEntradaAvulsa.Edit;
    if strTMP <> '' then begin
      cdsItensEntradaAvulsa.FieldByName('ENIT_PROD_ID').AsString   := funcLocal.Buscar_Coluna(strTMP,1);
      cdsItensEntradaAvulsa.FieldByName('PROD_DESCRICAO').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      cdsItensEntradaAvulsa.FieldByName('PROD_UNIDADE').AsString   := funcLocal.Buscar_Coluna(strTMP,3);
      cdsItensEntradaAvulsa.FieldByName('GRUPO_PROD').AsString     := funcLocal.Buscar_Coluna(strTMP,4);
      cdsItensEntradaAvulsa.FieldByName('MARCA_PROD').AsString     := funcLocal.Buscar_Coluna(strTMP,5);
      cdsItensEntradaAvulsa.FieldByName('MODELO_PROD').AsString    := funcLocal.Buscar_Coluna(strTMP,6);
      edtCodProd.Modified := true;
    end else begin
      cdsItensEntradaAvulsa.FieldByName('ENIT_PROD_ID').AsString   := '';
      cdsItensEntradaAvulsa.FieldByName('PROD_DESCRICAO').AsString := '';
      cdsItensEntradaAvulsa.FieldByName('PROD_UNIDADE').AsString   := '';
      cdsItensEntradaAvulsa.FieldByName('GRUPO_PROD').AsString     := '';
      cdsItensEntradaAvulsa.FieldByName('MARCA_PROD').AsString     := '';
      cdsItensEntradaAvulsa.FieldByName('MODELO_PROD').AsString    := '';
    end;
  end;
  edtCodProd.SetFocus;
end;

procedure TfCad_EntradaAvulsa.btnRetClick(Sender: TObject);
begin
  inherited;
  try
    if not (dmEntradaAvulsa.cdsItensEntradaAvulsa.State in [dsInsert,dsEdit]) then
      dmEntradaAvulsa.cdsItensEntradaAvulsa.Edit;
    if not dmEntradaAvulsa.cdsItensEntradaAvulsa.IsEmpty then begin
      dmEntradaAvulsa.cdsItensEntradaAvulsa.Delete;
    end;
  except
  end;
end;

procedure TfCad_EntradaAvulsa.DBRadioGroup1Enter(Sender: TObject);
begin
  inherited;
  Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfCad_EntradaAvulsa.grdItensCellClick(Column: TColumn);
begin
  inherited;
  try
    dmEntradaAvulsa.cdsItensEntradaAvulsa.Cancel;
  except
  end;
end;

procedure TfCad_EntradaAvulsa.grdItensColEnter(Sender: TObject);
begin
  inherited;
  try
    dmEntradaAvulsa.cdsItensEntradaAvulsa.Cancel;
  except
  end;
end;

procedure TfCad_EntradaAvulsa.grdItensDrawColumnCell(Sender: TObject;
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

procedure TfCad_EntradaAvulsa.grdItensEnter(Sender: TObject);
begin
  inherited;
  try
    dmEntradaAvulsa.cdsItensEntradaAvulsa.Cancel;
  except
  end;
end;

procedure TfCad_EntradaAvulsa.edtCodProdExit(Sender: TObject);
var
  strTMP     : String;
  strPROD_ID : String;
begin
  if not edtCodProd.Modified then Exit;
  with dmEntradaAvulsa do begin
    try
      cdsItensEntradaAvulsa.Edit;
      cdsItensEntradaAvulsa.DisableControls;
      if edtCodProd.Text <> '' then begin
        strPROD_ID := edtCodProd.Text;
        OpenClientDataSet(2);
        cdsItensEntradaAvulsa.Cancel;
        if not cdsItensEntradaAvulsa.Locate('ENIT_PROD_ID',strPROD_ID,[]) then begin
          cdsItensEntradaAvulsa.Append;
          strTMP := funcLocal.Busca_Registro(dmEntradaAvulsa.cdsPesqProdutos,'PROD_DESCRICAO',
                                             'PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;GRUPO_PROD;MARCA_PROD;MODELO_PROD;PROD_FLG_FRACIONADO',
                                             'PROD_ID = ' + strProd_ID);
          if strTMP <> '' then begin
            cdsItensEntradaAvulsa.FieldByName('ENIT_PROD_ID').AsString         := funcLocal.Buscar_Coluna(strTMP,1);
            cdsItensEntradaAvulsa.FieldByName('PROD_DESCRICAO').AsString       := funcLocal.Buscar_Coluna(strTMP,2);
            cdsItensEntradaAvulsa.FieldByName('PROD_UNIDADE').AsString         := funcLocal.Buscar_Coluna(strTMP,3);
            cdsItensEntradaAvulsa.FieldByName('PROD_FLG_FRACIONADO').AsString  := funcLocal.Buscar_Coluna(strTMP,7);
            cdsItensEntradaAvulsa.FieldByName('GRUPO_PROD').AsString           := funcLocal.Buscar_Coluna(strTMP,4);
            cdsItensEntradaAvulsa.FieldByName('MARCA_PROD').AsString           := funcLocal.Buscar_Coluna(strTMP,5);
            cdsItensEntradaAvulsa.FieldByName('MODELO_PROD').AsString          := funcLocal.Buscar_Coluna(strTMP,6);
          end else begin
            cdsItensEntradaAvulsa.FieldByName('ENIT_PROD_ID').AsString         := '';
            cdsItensEntradaAvulsa.FieldByName('PROD_DESCRICAO').AsString       := '';
            cdsItensEntradaAvulsa.FieldByName('PROD_UNIDADE').AsString         := '';
            cdsItensEntradaAvulsa.FieldByName('PROD_FLG_FRACIONADO').AsString  := '';
            cdsItensEntradaAvulsa.FieldByName('GRUPO_PROD').AsString           := '';
            cdsItensEntradaAvulsa.FieldByName('MARCA_PROD').AsString           := '';
            cdsItensEntradaAvulsa.FieldByName('MODELO_PROD').AsString          := '';
          end;
        end else begin
          cdsItensEntradaAvulsa.Edit;
        end;
      end else begin
        cdsItensEntradaAvulsa.FieldByName('ENIT_PROD_ID').AsString         := '';
        cdsItensEntradaAvulsa.FieldByName('PROD_DESCRICAO').AsString       := '';
        cdsItensEntradaAvulsa.FieldByName('PROD_UNIDADE').AsString         := '';
        cdsItensEntradaAvulsa.FieldByName('PROD_FLG_FRACIONADO').AsString  := '';
        cdsItensEntradaAvulsa.FieldByName('GRUPO_PROD').AsString           := '';
        cdsItensEntradaAvulsa.FieldByName('MARCA_PROD').AsString           := '';
        cdsItensEntradaAvulsa.FieldByName('MODELO_PROD').AsString          := '';
      end;
    finally
      cdsItensEntradaAvulsa.EnableControls;
      grdItens.Refresh;
    end;
  end;
end;

procedure TfCad_EntradaAvulsa.edtCodProdKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
end;

procedure TfCad_EntradaAvulsa.edtQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (dmEntradaAvulsa.cdsItensEntradaAvulsaPROD_FLG_FRACIONADO.AsInteger = 1) then begin
  if not (CharInSet(key,['0'..'9',',',#8])) then key := #0;
  end else begin
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
  end
end;

procedure TfCad_EntradaAvulsa.FormShow(Sender: TObject);
begin
  inherited;
  OpenClientDataSet(1);
  try
    edtNrDocumento.SetFocus;
  except
  end;
  if cdsLocal.FieldByName('ENAV_CONCILIADO').AsInteger = 0 then begin
    pageCadastro.Pages[0].Enabled := true;
  end else begin
    pageCadastro.Pages[0].Enabled := false;
  end;
end;

procedure TfCad_EntradaAvulsa.Label12Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(356);
end;

procedure TfCad_EntradaAvulsa.OpenClientDataSet(intTipo : Integer = 99);
begin
  with dmEntradaAvulsa do begin
    case intTipo of
      1 : begin
        with cdsItensEntradaAvulsa do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('ENAV_ID').AsInteger := cdsEntradaAvulsaENAV_ID.AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      2 : begin
        with cdsPesqProdutos do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end else begin
        OpenClientDataSet(1);
        OpenClientDataSet(2);
      end;
    end;
  end;
end;

initialization
  if fCad_EntradaAvulsa = nil then
    fCad_EntradaAvulsa := TfCad_EntradaAvulsa.Create(nil);
finalization
  FreeAndNil(fCad_EntradaAvulsa);

end.
