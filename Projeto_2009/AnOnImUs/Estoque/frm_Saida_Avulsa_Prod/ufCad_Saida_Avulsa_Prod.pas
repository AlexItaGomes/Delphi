unit ufCad_Saida_Avulsa_Prod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids,
  DBCtrls, rxToolEdit, RXDBCtrl, Mask, SQLExpr, DBClient;

type
  TfCad_Saida_Avulsa_Prod = class(TfCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    edtNrDocumento: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox1: TGroupBox;
    mmObs: TDBMemo;
    GroupBox2: TGroupBox;
    grdItens: TDBGrid;
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
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    SpeedButton3: TSpeedButton;
    procedure btnAdicClick(Sender: TObject);
    procedure btnAdicEnter(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnPesqProdClick(Sender: TObject);
    procedure btnRetClick(Sender: TObject);
    procedure grdItensCellClick(Column: TColumn);
    procedure grdItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtCodProdExit(Sender: TObject);
    procedure edtCodProdKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Label12MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label12Click(Sender: TObject);
    procedure DBRadioGroup1Enter(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    function  RegistraConciliacao(strSAAV_ID: String) : Boolean;
    function  ValidaDados: Boolean;
    procedure OpenClientDataSet(intTipo: Integer = 99);
    function ProdutosTemEstoque: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Saida_Avulsa_Prod: TfCad_Saida_Avulsa_Prod;

implementation

uses udmSaida_Avulsa_Prod, DB;

{$R *.dfm}

procedure TfCad_Saida_Avulsa_Prod.btnAdicClick(Sender: TObject);
begin
  inherited;
  with dmSaida_Avulsa_Prod.cdsItensSaidasAvulsa do begin
    if (edtCodProd.Text <> '') and (StrToFloat(edtQtde.Text) > 0) then begin
      if not (dmSaida_Avulsa_Prod.cdsItensSaidasAvulsa.State in [dsInsert,dsEdit]) then
        dmSaida_Avulsa_Prod.cdsItensSaidasAvulsa.Edit;
      Post;
      Append;
      edtCodProd.SetFocus;
    end else begin
      funcLocal.Alerta('Informe os dados do produto corretamente antes de continuar.',1);
      edtCodProd.Modified := true;
      edtCodProd.SetFocus;
    end;
  end;
end;

procedure TfCad_Saida_Avulsa_Prod.btnAdicEnter(Sender: TObject);
begin
  inherited;
  if (edtCodProd.Text <> '') or (StrToFloat(edtQtde.Text) > 0) then begin
    btnAdic.Click;
  end else begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfCad_Saida_Avulsa_Prod.btnOkClick(Sender: TObject);
var
  boolInsert : Boolean;
  strSAAV_ID : String;
begin
  if ValidaDados then begin
    boolInsert := (cdsLocal.FieldByName('SAAV_CONCILIADO').AsInteger = 0);
    strSAAV_ID := cdsLocal.FieldByName('SAAV_ID').AsString;
    inherited;
    dmSaida_Avulsa_Prod.cdsItensSaidasAvulsa.Cancel;
    dmSaida_Avulsa_Prod.cdsItensSaidasAvulsa.ApplyUpdates(-1);
    try
      edtNrDocumento.SetFocus;
    except
    end;
    if boolInsert then begin
      if funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                          'Registro ainda não conciliado, deseja realizar a conciliação '+
                          'do(s) produto(s) informado(s)?',1,true) = 6 then begin
        if not RegistraConciliacao(strSAAV_ID) then begin
          funcLocal.Alerta('Não foi possível concluir o processo de conciliação do '+
                            'registro informado, você não possui estoque suficiente '+
                            'para a movimentação de todos os produtos informado.',1);
        end;
      end else begin
        funcLocal.Alerta('Você optou por não realizar a conciliação do(s) produto(s) '+
                         'informado(s), não foi feita nenhuma alteração do estoque '+
                         'do(s) produto(s) informado, caso queira realizar a conciliação, '+
                         'basta editar o registro e salva-lo novamente.',1);
      end;
    end;
    OpenClientDataSet(1);
  end else IsValidData;
  grdItens.Refresh;
end;

procedure TfCad_Saida_Avulsa_Prod.btnPesqProdClick(Sender: TObject);
var
  strTMP     : String;
begin
  with dmSaida_Avulsa_Prod do begin
    OpenClientDataSet(2);
    cdsItensSaidasAvulsa.Edit;
    strTMP := funcLocal.Busca_Registro(dmSaida_Avulsa_Prod.cdsPesqProdutos,'PROD_DESCRICAO',
                                       'PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;GRUPO_PROD;MARCA_PROD;MODELO_PROD','');
    if strTMP <> '' then begin
      cdsItensSaidasAvulsa.FieldByName('SAIT_PROD_ID').AsString   := funcLocal.Buscar_Coluna(strTMP,1);
      cdsItensSaidasAvulsa.FieldByName('PROD_DESCRICAO').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      cdsItensSaidasAvulsa.FieldByName('PROD_UNIDADE').AsString   := funcLocal.Buscar_Coluna(strTMP,3);
      cdsItensSaidasAvulsa.FieldByName('GRUPO_PROD').AsString     := funcLocal.Buscar_Coluna(strTMP,4);
      cdsItensSaidasAvulsa.FieldByName('MARCA_PROD').AsString     := funcLocal.Buscar_Coluna(strTMP,5);
      cdsItensSaidasAvulsa.FieldByName('MODELO_PROD').AsString    := funcLocal.Buscar_Coluna(strTMP,6);
      edtCodProd.Modified := true;
    end else begin
      cdsItensSaidasAvulsa.FieldByName('SAIT_PROD_ID').AsString   := '';
      cdsItensSaidasAvulsa.FieldByName('PROD_DESCRICAO').AsString := '';
      cdsItensSaidasAvulsa.FieldByName('PROD_UNIDADE').AsString   := '';
      cdsItensSaidasAvulsa.FieldByName('GRUPO_PROD').AsString     := '';
      cdsItensSaidasAvulsa.FieldByName('MARCA_PROD').AsString     := '';
      cdsItensSaidasAvulsa.FieldByName('MODELO_PROD').AsString    := '';
    end;
  end;
  edtCodProd.SetFocus;
end;

procedure TfCad_Saida_Avulsa_Prod.btnRetClick(Sender: TObject);
begin
  inherited;
  try
    if not (dmSaida_Avulsa_Prod.cdsItensSaidasAvulsa.State in [dsInsert,dsEdit]) then
      dmSaida_Avulsa_Prod.cdsItensSaidasAvulsa.Edit;
    if not dmSaida_Avulsa_Prod.cdsItensSaidasAvulsa.IsEmpty then begin
      dmSaida_Avulsa_Prod.cdsItensSaidasAvulsa.Delete;
    end;
  except
  end;
end;

procedure TfCad_Saida_Avulsa_Prod.DBRadioGroup1Enter(Sender: TObject);
begin
  inherited;
  Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfCad_Saida_Avulsa_Prod.edtCodProdExit(Sender: TObject);
var
  strTMP     : String;
  strPROD_ID : String;
begin
  if not edtCodProd.Modified then Exit;
  with dmSaida_Avulsa_Prod do begin
    try
      cdsItensSaidasAvulsa.Edit;
      cdsItensSaidasAvulsa.DisableControls;
      if edtCodProd.Text <> '' then begin
        strPROD_ID := edtCodProd.Text;
        OpenClientDataSet(2);
        cdsItensSaidasAvulsa.Cancel;
        if not cdsItensSaidasAvulsa.Locate('SAIT_PROD_ID',strPROD_ID,[]) then begin
          cdsItensSaidasAvulsa.Append;
          strTMP := funcLocal.Busca_Registro(dmSaida_Avulsa_Prod.cdsPesqProdutos,'PROD_DESCRICAO',
                                             'PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;GRUPO_PROD;MARCA_PROD;MODELO_PROD;PROD_FLG_FRACIONADO',
                                             'PROD_ID = ' + strProd_ID);
          if strTMP <> '' then begin
            cdsItensSaidasAvulsa.FieldByName('SAIT_PROD_ID').AsString         := funcLocal.Buscar_Coluna(strTMP,1);
            cdsItensSaidasAvulsa.FieldByName('PROD_DESCRICAO').AsString       := funcLocal.Buscar_Coluna(strTMP,2);
            cdsItensSaidasAvulsa.FieldByName('PROD_UNIDADE').AsString         := funcLocal.Buscar_Coluna(strTMP,3);
            cdsItensSaidasAvulsa.FieldByName('PROD_FLG_FRACIONADO').AsString  := funcLocal.Buscar_Coluna(strTMP,7);
            cdsItensSaidasAvulsa.FieldByName('GRUPO_PROD').AsString           := funcLocal.Buscar_Coluna(strTMP,4);
            cdsItensSaidasAvulsa.FieldByName('MARCA_PROD').AsString           := funcLocal.Buscar_Coluna(strTMP,5);
            cdsItensSaidasAvulsa.FieldByName('MODELO_PROD').AsString          := funcLocal.Buscar_Coluna(strTMP,6);
          end else begin
            cdsItensSaidasAvulsa.FieldByName('SAIT_PROD_ID').AsString         := '';
            cdsItensSaidasAvulsa.FieldByName('PROD_DESCRICAO').AsString       := '';
            cdsItensSaidasAvulsa.FieldByName('PROD_UNIDADE').AsString         := '';
            cdsItensSaidasAvulsa.FieldByName('PROD_FLG_FRACIONADO').AsString  := '';
            cdsItensSaidasAvulsa.FieldByName('GRUPO_PROD').AsString           := '';
            cdsItensSaidasAvulsa.FieldByName('MARCA_PROD').AsString           := '';
            cdsItensSaidasAvulsa.FieldByName('MODELO_PROD').AsString          := '';
          end;
        end else begin
          cdsItensSaidasAvulsa.Edit;
        end;
      end else begin
        cdsItensSaidasAvulsa.FieldByName('SAIT_PROD_ID').AsString         := '';
        cdsItensSaidasAvulsa.FieldByName('PROD_DESCRICAO').AsString       := '';
        cdsItensSaidasAvulsa.FieldByName('PROD_UNIDADE').AsString         := '';
        cdsItensSaidasAvulsa.FieldByName('PROD_FLG_FRACIONADO').AsString  := '';
        cdsItensSaidasAvulsa.FieldByName('GRUPO_PROD').AsString           := '';
        cdsItensSaidasAvulsa.FieldByName('MARCA_PROD').AsString           := '';
        cdsItensSaidasAvulsa.FieldByName('MODELO_PROD').AsString          := '';
      end;
    finally
      cdsItensSaidasAvulsa.EnableControls;
      grdItens.Refresh;
    end;
  end;
end;

procedure TfCad_Saida_Avulsa_Prod.edtCodProdKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
end;

procedure TfCad_Saida_Avulsa_Prod.edtQtdeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (dmSaida_Avulsa_Prod.cdsItensSaidasAvulsaPROD_FLG_FRACIONADO.AsInteger = 1) then begin
  if not (CharInSet(key,['0'..'9',',',#8])) then key := #0;
  end else begin
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
  end;
end;

procedure TfCad_Saida_Avulsa_Prod.FormShow(Sender: TObject);
begin
  inherited;
  try
    edtNrDocumento.SetFocus;
  except
  end;
  if cdsLocal.FieldByName('SAAV_CONCILIADO').AsInteger = 0 then begin
    pageCadastro.Pages[0].Enabled := true;
  end else begin
    pageCadastro.Pages[0].Enabled := false;
  end;
  OpenClientDataSet(1);
end;

procedure TfCad_Saida_Avulsa_Prod.grdItensCellClick(Column: TColumn);
begin
  inherited;
  try
    dmSaida_Avulsa_Prod.cdsItensSaidasAvulsa.Cancel;
  except
  end;
end;

procedure TfCad_Saida_Avulsa_Prod.grdItensDrawColumnCell(Sender: TObject;
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

procedure TfCad_Saida_Avulsa_Prod.Label12Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(356);
end;

procedure TfCad_Saida_Avulsa_Prod.Label12MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
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
function TfCad_Saida_Avulsa_Prod.RegistraConciliacao(strSAAV_ID : String) : Boolean;
var
  qryCons : TSQLQuery;
  boolInco: Boolean;
begin
  Result   := true;
  boolInco := false;
  try
    try
      with dmSaida_Avulsa_Prod,cdsItensSaidasAvulsa do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Params.ParamByName('SAAV_ID').AsInteger := StrToInt(strSAAV_ID);
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
        First;
        DisableControls;
        while not eof do begin
          if (cdsItensSaidasAvulsaSAIT_PROD_ID.AsString <> '') and (cdsItensSaidasAvulsaSAIT_QTDE.AsFloat > 0) then begin
            if not funcLocal.ProdutoTemEstoque(cdsItensSaidasAvulsaSAIT_PROD_ID.AsString,cdsItensSaidasAvulsaSAIT_QTDE.AsFloat) then begin
              Result := false;
              Exit;
            end;
          end else boolInco := true;
          Next;
        end;
        First;
        while not eof do begin
          if (cdsItensSaidasAvulsaSAIT_PROD_ID.AsString <> '') and (cdsItensSaidasAvulsaSAIT_QTDE.AsFloat > 0) then begin
            funcLocal.MovimentaEstoque(cdsItensSaidasAvulsaSAIT_PROD_ID.AsString,(cdsItensSaidasAvulsaSAIT_QTDE.AsFloat * -1),1,'3');
          end else boolInco := true;
          Next;
        end;
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
          sql.Add('UPDATE SAIDA_AVULSA');
          sql.Add('SET    SAAV_CONCILIADO = 1');
          sql.Add('WHERE  SAAV_ID         = ' + strSAAV_ID);
          sql.Add('AND    SAAV_EMPR_ID    = ' + IntToStr(funcLocal.Empr_ID));
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
    dmSaida_Avulsa_Prod.cdsItensSaidasAvulsa.EnableControls;
    if boolInco then begin
      funcLocal.Alerta('Foi(ram) encontrado(s) inconsistência(s) no lançamento de algum(ns) produto(s), por favor! Verifique.',0);
    end;
  end;
end;

procedure TfCad_Saida_Avulsa_Prod.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  dmSaida_Avulsa_Prod.cdsItensSaidasAvulsa.Cancel;
  Label12Click(Sender);
  edtCodProd.SetFocus;
end;

function TfCad_Saida_Avulsa_Prod.ValidaDados : Boolean;
begin
  Result := true;
  if edtNrDocumento.Text = '' then begin
    funcLocal.Alerta('Informe o número do documento antes de continuar.',1);
    edtNrDocumento.SetFocus;
    Result := false;
    Exit;
  end;
  dmSaida_Avulsa_Prod.cdsItensSaidasAvulsa.Cancel;
  if dmSaida_Avulsa_Prod.cdsItensSaidasAvulsa.IsEmpty then begin
    funcLocal.Alerta('Registro de Saída Avulsa de produto se item(ns) a ser(em) lançado(s).',1);
    edtCodProd.SetFocus;
    Result := false;
    Exit;
  end;
  if cdsLocal.FieldByName('SAAV_CONCILIADO').AsInteger = 0 then begin
    if not ProdutosTemEstoque then begin
      funcLocal.Alerta('Não consta estoque suficiente para a baixa de todos os produtos, verifique o estoque disponível para baixa antes de continuar.',1);
      edtCodProd.SetFocus;
      Result := false;
      Exit;
    end;
  end;
end;

function TfCad_Saida_Avulsa_Prod.ProdutosTemEstoque : Boolean;
begin
  Result := true;
  try
    with dmSaida_Avulsa_Prod.cdsItensSaidasAvulsa do begin
      First;
      while not Eof do begin
        Result := funcLocal.ProdutoTemEstoque(FieldByName('SAIT_PROD_ID').AsString,(FieldByName('SAIT_QTDE').AsFloat));
        if not Result then begin
          Exit;
        end;
        Next;
      end;
    end;
  except on e: exception do begin
    funcLocal.ReportaErro('TfCad_Saida_Avulsa_Prod','ProdutosTemEstoque',e.Message);
    funcLocal.Alerta('Erro no processo de baixa dos produtos informados.'+#13+'['+e.Message+']',1);
  end; end;
end;

procedure TfCad_Saida_Avulsa_Prod.OpenClientDataSet(intTipo : Integer = 99);
begin
  with dmSaida_Avulsa_Prod do begin
    case intTipo of
      1 : begin
        with cdsItensSaidasAvulsa do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('SAAV_ID').AsInteger := cdsSaidaAvulsaSAAV_ID.AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
          Append;
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
  if fCad_Saida_Avulsa_Prod = nil then  
    fCad_Saida_Avulsa_Prod := TfCad_Saida_Avulsa_Prod.Create(nil);
finalization
  FreeAndNil(fCad_Saida_Avulsa_Prod);

end.
