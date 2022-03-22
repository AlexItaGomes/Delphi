unit ufCad_Saida_Avaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, Grids,
  DBGrids, rxToolEdit, RXDBCtrl, Mask, SQLExpr, DB;

type
  TfCad_Saida_Avaria = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtNrDocumento: TDBEdit;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    btnPesqProd: TSpeedButton;
    Label13: TLabel;
    Label15: TLabel;
    edtCodProd: TDBEdit;
    DBEdit4: TDBEdit;
    edtQtde: TDBEdit;
    btnAdic: TBitBtn;
    btnRet: TBitBtn;
    GroupBox2: TGroupBox;
    grdItens: TDBGrid;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox4: TGroupBox;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    mmObs: TDBMemo;
    DBEdit6: TDBEdit;
    Label14: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    SpeedButton3: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnRetClick(Sender: TObject);
    procedure btnPesqProdClick(Sender: TObject);
    procedure edtCodProdExit(Sender: TObject);
    procedure edtCodProdKeyPress(Sender: TObject; var Key: Char);
    procedure btnAdicClick(Sender: TObject);
    procedure btnAdicEnter(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure grdItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdItensCellClick(Column: TColumn);
    procedure DBRadioGroup1Enter(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    procedure OpenClientDataSet(intPos: Integer = 99);
    function ValidaDados: Boolean;
    function RegistraConciliacao(strSIAV_ID: String): Boolean;
    function ProdutosTemEstoque: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Saida_Avaria: TfCad_Saida_Avaria;

implementation

uses udmSaida_Avaria;

{$R *.dfm}

procedure TfCad_Saida_Avaria.btnAdicClick(Sender: TObject);
begin
  inherited;
  if not (dmSaida_Avaria.cdsItensSaidaAvaria.State in [dsInsert,dsEdit]) then
    dmSaida_Avaria.cdsItensSaidaAvaria.Edit;
  with dmSaida_Avaria.cdsItensSaidaAvaria do begin
    if (edtCodProd.Text <> '') and (StrToFloat(edtQtde.Text) > 0) then begin
      FieldByName('SIIT_VLR_TOTAL').AsFloat := FieldByName('SIIT_QTDE').AsFloat * FieldByName('SIIT_VLR_CUSTO').AsFloat;
      Post;
      Append;
      edtCodProd.SetFocus;
    end else begin
      funcLocal.Alerta('Informe os dados do produto corretamente antes de continuar.',1);
      edtCodProd.SetFocus;
    end;
  end;
end;

procedure TfCad_Saida_Avaria.btnAdicEnter(Sender: TObject);
begin
  inherited;
  if (edtCodProd.Text <> '') or (StrToFloat(edtQtde.Text) > 0) then begin
    btnAdic.Click;
  end else begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfCad_Saida_Avaria.btnOkClick(Sender: TObject);
var
  boolInsert : Boolean;
  strSIAV_ID : String;
begin
  if ValidaDados then begin
    boolInsert := (cdsLocal.FieldByName('SIAV_CONCILIADO').AsInteger = 0);
    strSIAV_ID := cdsLocal.FieldByName('SIAV_ID').AsString;
    inherited;
    dmSaida_Avaria.cdsItensSaidaAvaria.Cancel;
    dmSaida_Avaria.cdsItensSaidaAvaria.ApplyUpdates(-1);
    try
      edtNrDocumento.SetFocus;
    except
    end;
    if boolInsert then begin
      if funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                          'Registro ainda não conciliado, deseja realizar a conciliação '+
                          'do(s) produto(s) informado(s)?',1,true) = 6 then begin
        if not RegistraConciliacao(strSIAV_ID) then begin
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

{*******************************************************************************
Data:       30/03/2010
Autor:      Alex Itamar Gomes
Descrição   Metodo para a realização do registro de movimentação dos produtos
            informado, lançando as quantidas no Estoque do produto.

Parametros:
  strENAV_ID = ID da tabela SAIDA_AVARIA para a reabertura do tabela de itens
               da saida por avaria dos produtos.

Historico
Data          Autor                 Descrição
30/03/2010    Alex I. Gomes         Inclusão do cabeçalho
*******************************************************************************}
function TfCad_Saida_Avaria.RegistraConciliacao(strSIAV_ID : String) : Boolean;
var
  qryCons : TSQLQuery;
  boolInco: Boolean;
begin
  Result   := true;
  boolInco := true;
  try
    try
      boolInco := false;
      with dmSaida_Avaria,cdsItensSaidaAvaria do begin
        Close;
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Params.ParamByName('SIAV_ID').AsInteger := StrToInt(strSIAV_ID);
        Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
        Open;
        First;
        DisableControls;
        while not eof do begin
          if (cdsItensSaidaAvariaSIIT_PROD_ID.AsString <> '') and (cdsItensSaidaAvariaSIIT_QTDE.AsFloat > 0) then begin
            if not funcLocal.ProdutoTemEstoque(cdsItensSaidaAvariaSIIT_PROD_ID.AsString,cdsItensSaidaAvariaSIIT_QTDE.AsFloat) then begin
              Result := false;
              Exit;
            end;
          end else boolInco := true;
          Next;
        end;
        First;
        while not eof do begin
          if (cdsItensSaidaAvariaSIIT_PROD_ID.AsString <> '') and (cdsItensSaidaAvariaSIIT_QTDE.AsFloat > 0) then begin
            funcLocal.MovimentaEstoque(cdsItensSaidaAvariaSIIT_PROD_ID.AsString,(cdsItensSaidaAvariaSIIT_QTDE.AsFloat * -1),1,'3');
          end else boolInco := true;
          Next;
        end;
  //      EnableControls;
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
          sql.Add('UPDATE SAIDA_AVARIA');
          sql.Add('SET    SIAV_CONCILIADO = 1');
          sql.Add('WHERE  SIAV_ID         = ' + strSIAV_ID);
          sql.Add('AND    SIAV_EMPR_ID    = ' + IntToStr(funcLocal.Empr_ID));
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
    dmSaida_Avaria.cdsItensSaidaAvaria.EnableControls;
    if boolInco then begin
      funcLocal.Alerta('Foi(ram) encontrado(s) inconsistência(s) no lançamento de algum(ns) produto(s), por favor! Verifique.',0);
    end;
  end;
end;

procedure TfCad_Saida_Avaria.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  dmSaida_Avaria.cdsItensSaidaAvaria.Cancel;
  Label12Click(Sender);
  edtCodProd.SetFocus;
end;

function TfCad_Saida_Avaria.ValidaDados : Boolean;
begin
  Result := true;
  if edtNrDocumento.Text = '' then begin
    funcLocal.Alerta('Informe o número do documento antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtNrDocumento.SetFocus;
    Result := false;
    Exit;
  end;
  dmSaida_Avaria.cdsItensSaidaAvaria.Cancel;
  if dmSaida_Avaria.cdsItensSaidaAvaria.IsEmpty then begin
    funcLocal.Alerta('Registro de produto por avaria se item(ns) a ser(em) lançado(s).',1);
    pageCadastro.Pages[0].Show;
    edtCodProd.SetFocus;
    Result := false;
    Exit;
  end;
  if cdsLocal.FieldByName('SIAV_CONCILIADO').AsInteger = 0 then begin
    if not ProdutosTemEstoque then begin
      funcLocal.Alerta('Não consta estoque suficiente para a baixa de todos os produtos, verifique o estoque disponível para baixa antes de continuar.',1);
      pageCadastro.Pages[0].Show;
      edtCodProd.SetFocus;
      Result := false;
      Exit;
    end;
  end;
end;

function TfCad_Saida_Avaria.ProdutosTemEstoque : Boolean;
begin
  Result := true;
  try
    with dmSaida_Avaria.cdsItensSaidaAvaria do begin
      First;
      while not Eof do begin
        Result := funcLocal.ProdutoTemEstoque(FieldByName('SIIT_PROD_ID').AsString,(FieldByName('SIIT_QTDE').AsFloat));
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

procedure TfCad_Saida_Avaria.btnPesqProdClick(Sender: TObject);
var
  strTMP     : String;
begin
  with dmSaida_Avaria do begin
    OpenClientDataSet(2);
    cdsItensSaidaAvaria.Edit;
    strTMP := funcLocal.Busca_Registro(dmSaida_Avaria.cdsPesqProdutos,'PROD_DESCRICAO',
                                       'PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;PROD_GRUPO;PROD_MARCA;PROD_MODELO;PROD_VLR_CUSTO','');
    if strTMP <> '' then begin
      cdsItensSaidaAvaria.FieldByName('SIIT_PROD_ID').AsString   := funcLocal.Buscar_Coluna(strTMP,1);
      cdsItensSaidaAvaria.FieldByName('PROD_DESCRICAO').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      cdsItensSaidaAvaria.FieldByName('PROD_UNIDADE').AsString   := funcLocal.Buscar_Coluna(strTMP,3);
      cdsItensSaidaAvaria.FieldByName('PROD_GRUPO').AsString     := funcLocal.Buscar_Coluna(strTMP,4);
      cdsItensSaidaAvaria.FieldByName('PROD_MARCA').AsString     := funcLocal.Buscar_Coluna(strTMP,5);
      cdsItensSaidaAvaria.FieldByName('PROD_MODELO').AsString    := funcLocal.Buscar_Coluna(strTMP,6);
      cdsItensSaidaAvaria.FieldByName('SIIT_VLR_CUSTO').AsString := funcLocal.Buscar_Coluna(strTMP,7);
      edtCodProd.Modified := true;
    end else begin
      cdsItensSaidaAvaria.FieldByName('SIIT_PROD_ID').AsString   := '';
      cdsItensSaidaAvaria.FieldByName('PROD_DESCRICAO').AsString := '';
      cdsItensSaidaAvaria.FieldByName('PROD_UNIDADE').AsString   := '';
      cdsItensSaidaAvaria.FieldByName('PROD_GRUPO').AsString     := '';
      cdsItensSaidaAvaria.FieldByName('PROD_MARCA').AsString     := '';
      cdsItensSaidaAvaria.FieldByName('PROD_MODELO').AsString    := '';
      cdsItensSaidaAvaria.FieldByName('SIIT_VLR_CUSTO').AsString := '';
    end;
  end;
  edtCodProd.SetFocus;
end;

procedure TfCad_Saida_Avaria.btnRetClick(Sender: TObject);
begin
  inherited;
  if not (dmSaida_Avaria.cdsItensSaidaAvaria.State in [dsInsert,dsEdit]) then
    dmSaida_Avaria.cdsItensSaidaAvaria.Edit;
  if not dmSaida_Avaria.cdsItensSaidaAvaria.IsEmpty then
    dmSaida_Avaria.cdsItensSaidaAvaria.Delete;
end;

procedure TfCad_Saida_Avaria.DBRadioGroup1Enter(Sender: TObject);
begin
  inherited;
  Perform(WM_NEXTDLGCTL,0,0)
end;

procedure TfCad_Saida_Avaria.edtCodProdExit(Sender: TObject);
var
  strTMP     : String;
  strPROD_ID : String;
begin
  if not edtCodProd.Modified then Exit;
  with dmSaida_Avaria do begin
    try
      cdsItensSaidaAvaria.Edit;
      cdsItensSaidaAvaria.DisableControls;
      if edtCodProd.Text <> '' then begin
        strPROD_ID := edtCodProd.Text;
        OpenClientDataSet(2);
        cdsItensSaidaAvaria.Cancel;
        if not cdsItensSaidaAvaria.Locate('SIIT_PROD_ID',strPROD_ID,[]) then begin
          cdsItensSaidaAvaria.Append;
          strTMP := funcLocal.Busca_Registro(dmSaida_Avaria.cdsPesqProdutos,'PROD_DESCRICAO',
                                             'PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;PROD_GRUPO;PROD_MARCA;PROD_MODELO;PROD_FLG_FRACIONADO;PROD_VLR_CUSTO',
                                             'PROD_ID = ' + strProd_ID);
          if strTMP <> '' then begin
            cdsItensSaidaAvaria.FieldByName('SIIT_PROD_ID').AsString         := funcLocal.Buscar_Coluna(strTMP,1);
            cdsItensSaidaAvaria.FieldByName('PROD_DESCRICAO').AsString       := funcLocal.Buscar_Coluna(strTMP,2);
            cdsItensSaidaAvaria.FieldByName('PROD_UNIDADE').AsString         := funcLocal.Buscar_Coluna(strTMP,3);
            cdsItensSaidaAvaria.FieldByName('PROD_FLG_FRACIONADO').AsString  := funcLocal.Buscar_Coluna(strTMP,7);
            cdsItensSaidaAvaria.FieldByName('PROD_GRUPO').AsString           := funcLocal.Buscar_Coluna(strTMP,4);
            cdsItensSaidaAvaria.FieldByName('PROD_MARCA').AsString           := funcLocal.Buscar_Coluna(strTMP,5);
            cdsItensSaidaAvaria.FieldByName('PROD_MODELO').AsString          := funcLocal.Buscar_Coluna(strTMP,6);
            cdsItensSaidaAvaria.FieldByName('SIIT_VLR_CUSTO').AsString       := funcLocal.Buscar_Coluna(strTMP,8);
          end else begin
            cdsItensSaidaAvaria.FieldByName('SIIT_PROD_ID').AsString         := '';
            cdsItensSaidaAvaria.FieldByName('PROD_DESCRICAO').AsString       := '';
            cdsItensSaidaAvaria.FieldByName('PROD_UNIDADE').AsString         := '';
            cdsItensSaidaAvaria.FieldByName('PROD_FLG_FRACIONADO').AsString  := '';
            cdsItensSaidaAvaria.FieldByName('PROD_GRUPO').AsString           := '';
            cdsItensSaidaAvaria.FieldByName('PROD_MARCA').AsString           := '';
            cdsItensSaidaAvaria.FieldByName('PROD_MODELO').AsString          := '';
            cdsItensSaidaAvaria.FieldByName('SIIT_VLR_CUSTO').AsString       := '';
          end;
        end else begin
          cdsItensSaidaAvaria.Edit;
        end;
      end else begin
        cdsItensSaidaAvaria.FieldByName('SIIT_PROD_ID').AsString         := '';
        cdsItensSaidaAvaria.FieldByName('PROD_DESCRICAO').AsString       := '';
        cdsItensSaidaAvaria.FieldByName('PROD_UNIDADE').AsString         := '';
        cdsItensSaidaAvaria.FieldByName('PROD_FLG_FRACIONADO').AsString  := '';
        cdsItensSaidaAvaria.FieldByName('PROD_GRUPO').AsString           := '';
        cdsItensSaidaAvaria.FieldByName('PROD_MARCA').AsString           := '';
        cdsItensSaidaAvaria.FieldByName('PROD_MODELO').AsString          := '';
        cdsItensSaidaAvaria.FieldByName('SIIT_VLR_CUSTO').AsString       := '';
      end;
    finally
      cdsItensSaidaAvaria.EnableControls;
      grdItens.Refresh;
    end;
  end;
end;

procedure TfCad_Saida_Avaria.edtCodProdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
end;

procedure TfCad_Saida_Avaria.FormShow(Sender: TObject);
begin
  inherited;
  OpenClientDataSet(1);
  try
    edtNrDocumento.SetFocus;
  except
  end;
  if cdsLocal.FieldByName('SIAV_CONCILIADO').AsInteger <> 0 then begin
    pageCadastro.Pages[0].Enabled := false;
    pageCadastro.Pages[1].Enabled := false;
  end else begin
    pageCadastro.Pages[0].Enabled := true;
    pageCadastro.Pages[1].Enabled := true;
  end;
end;

procedure TfCad_Saida_Avaria.grdItensCellClick(Column: TColumn);
begin
  inherited;
  try
    dmSaida_Avaria.cdsItensSaidaAvaria.Cancel;
  except
  end;
end;

procedure TfCad_Saida_Avaria.grdItensDrawColumnCell(Sender: TObject;
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

procedure TfCad_Saida_Avaria.Label12Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(356);
end;

procedure TfCad_Saida_Avaria.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmSaida_Avaria do begin
    case intPos of
      1 : begin
        with cdsItensSaidaAvaria do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('SIAV_ID').AsInteger := cdsLocal.FieldByName('SIAV_ID').AsInteger;
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
      end;
      else begin
        OpenClientDataSet(1);
        OpenClientDataSet(2);
      end;
    end;
  end;
end;

initialization
  if fCad_Saida_Avaria = nil then
    fCad_Saida_Avaria := TfCad_Saida_Avaria.Create(nil);
finalization
  FreeAndNil(fCad_Saida_Avaria);

end.
