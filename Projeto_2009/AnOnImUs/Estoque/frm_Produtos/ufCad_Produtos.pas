unit ufCad_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit, SQLExpr,
  RXDBCtrl, Mask, DBCtrls, Grids, DBGrids, ExtDlgs, DB, rxCurrEdit,
  uFrPesqIndividual, RxSpin;

type
  TfCad_Produtos = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label3: TLabel;
    edtDescricao: TDBEdit;
    Label5: TLabel;
    edtAbrev: TDBEdit;
    Label6: TLabel;
    edtCodTipo: TDBEdit;
    Label7: TLabel;
    edtCodGrupo: TDBEdit;
    Label8: TLabel;
    edtCodMarca: TDBEdit;
    Label9: TLabel;
    edtCodModelo: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    edtCodFornec: TDBEdit;
    btnPesqFornec: TSpeedButton;
    btnPesqTipo: TSpeedButton;
    btnPesqGrupo: TSpeedButton;
    btnPesqMarca: TSpeedButton;
    btnPesqModelo: TSpeedButton;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    DBEdit15: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBImage1: TDBImage;
    grdBarras: TDBGrid;
    SpeedButton1: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    btnPesqProd: TSpeedButton;
    GroupBox6: TGroupBox;
    grdComposicao: TDBGrid;
    Label26: TLabel;
    edtCodProd: TDBEdit;
    Label27: TLabel;
    DBEdit4: TDBEdit;
    Label28: TLabel;
    edtQtde: TDBEdit;
    Label29: TLabel;
    DBEdit6: TDBEdit;
    Label30: TLabel;
    DBEdit7: TDBEdit;
    Label31: TLabel;
    DBEdit8: TDBEdit;
    Label32: TLabel;
    DBEdit9: TDBEdit;
    btnAdic: TBitBtn;
    BitBtn2: TBitBtn;
    DBRadioGroup4: TDBRadioGroup;
    GroupBox7: TGroupBox;
    DBRadioGroup5: TDBRadioGroup;
    Label33: TLabel;
    DBEdit3: TDBEdit;
    Label34: TLabel;
    DBEdit5: TDBEdit;
    Label35: TLabel;
    DBEdit11: TDBEdit;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    TabSheet3: TTabSheet;
    GroupBox8: TGroupBox;
    DBGrid1: TDBGrid;
    Label19: TLabel;
    edtEstMinimo: TDBEdit;
    Label22: TLabel;
    edtGarantia: TDBEdit;
    GroupBox1: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label18: TLabel;
    DBEdit20: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBDateEdit2: TDBDateEdit;
    edtMedLucro: TEdit;
    frPesqUnidade: TfrPesqIndividual;
    GroupBox9: TGroupBox;
    Label17: TLabel;
    Label25: TLabel;
    DBEdit2: TDBEdit;
    DBEdit16: TDBEdit;
    Label4: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label10: TLabel;
    Label36: TLabel;
    DBEdit19: TDBEdit;
    btnContador: TRxSpinButton;
    edtPeriodoRetorno: TDBEdit;
    Label37: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtCodFornecExit(Sender: TObject);
    procedure btnPesqFornecClick(Sender: TObject);
    procedure edtCodTipoExit(Sender: TObject);
    procedure btnPesqTipoClick(Sender: TObject);
    procedure edtCodGrupoExit(Sender: TObject);
    procedure btnPesqGrupoClick(Sender: TObject);
    procedure edtCodMarcaExit(Sender: TObject);
    procedure btnPesqMarcaClick(Sender: TObject);
    procedure edtCodModeloExit(Sender: TObject);
    procedure btnPesqModeloClick(Sender: TObject);
    procedure btnPesqAliqClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure edtEstMinimoKeyPress(Sender: TObject; var Key: Char);
    procedure edtEstInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodProdKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodProdExit(Sender: TObject);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure btnPesqProdClick(Sender: TObject);
    procedure btnAdicEnter(Sender: TObject);
    procedure btnAdicClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure grdComposicaoCellClick(Column: TColumn);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure edtCodNCMKeyPress(Sender: TObject; var Key: Char);
    procedure grdComposicaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtAbrevEnter(Sender: TObject);
    procedure DBEdit21KeyPress(Sender: TObject; var Key: Char);
    procedure btnContadorBottomClick(Sender: TObject);
    procedure btnContadorTopClick(Sender: TObject);
    procedure frPesqUnidadebtnInserirClick(Sender: TObject);
    procedure edtPeriodoRetornoEnter(Sender: TObject);
    procedure edtPeriodoRetornoExit(Sender: TObject);
  private
    procedure OpenClientDataSet(intPos: Integer = 99);
    function ValidaDados: Boolean;
    function JaExiste: Boolean;
    function RetornaLucroMedio(strPROD_ID: String): Real;
    procedure SetaValoresFrames;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Produtos: TfCad_Produtos;

implementation

uses udmProdutos;

{$R *.dfm}

procedure TfCad_Produtos.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if not dmProdutos.cdsComposicaoProd.IsEmpty then begin
    dmProdutos.cdsComposicaoProd.Delete;
    edtCodProd.SetFocus;
  end;
end;

procedure TfCad_Produtos.btnAdicClick(Sender: TObject);
begin
  inherited;
  if (edtCodProd.Text <> '') and (StrToFloat(edtQtde.Text) > 0) then begin
    with dmProdutos.cdsComposicaoProd do begin
      try
        Post;
      except
      end;
      Append;
      edtCodProd.SetFocus;
    end;
  end else Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfCad_Produtos.btnAdicEnter(Sender: TObject);
begin
  inherited;
  btnAdic.Click;
end;

procedure TfCad_Produtos.btnOkClick(Sender: TObject);
var
  strProd_ID : String;
  floatEstq  : Real;
begin
  floatEstq := 0;
  if ValidaDados then begin
    if cdsLocal.State = dsInsert then begin
      strProd_ID := cdsLocal.FieldByName('PROD_ID').AsString;
      floatEstq  := cdsLocal.FieldByName('PROD_ESTQ_INICIAL').Value;
    end;
    inherited;
    SetaValoresFrames;
    with dmProdutos do begin
      try
        cdsCodBarras.Cancel;
        cdsCodBarras.ApplyUpdates(-1);
      except
      end;
      try
        cdsComposicaoProd.Cancel;
        cdsComposicaoProd.ApplyUpdates(-1);
      except
      end;
    end;
    if strProd_ID <> '' then begin
      funcLocal.MovimentaEstoque(strProd_ID,floatEstq);
    end;
    OpenClientDataSet(8);
    edtDescricao.SetFocus;
  end else IsValidData;
end;

function TfCad_Produtos.ValidaDados : Boolean;
begin
  Result := true;
  if edtCodTipo.Text = '2' then begin
    cdsLocal.FieldByName('PROD_FLG_ESTOQUE').AsInteger    := 0;
    cdsLocal.FieldByName('PROD_GRADE').AsInteger          := 0;
    cdsLocal.FieldByName('PROD_FLG_FRACIONADO').AsInteger := 0;
  end;
  if edtDescricao.Text = '' then begin
    funcLocal.Alerta('Informe a descrição do produto antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtDescricao.SetFocus;
    Result := false;
    Exit;
  end;
  if edtAbrev.Text = '' then begin
    funcLocal.Alerta('Informe a abreviação do produto antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtAbrev.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCodTipo.Text = '' then begin
    funcLocal.Alerta('Informe o tipo do produto antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtCodTipo.SetFocus;
    Result := false;
    Exit;
  end;
  if (not frPesqUnidade.TemRegistro) then begin
    funcLocal.Alerta('Informe a unidade de medida do produto antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    frPesqUnidade.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCodGrupo.Text = '' then begin
    funcLocal.Alerta('Informe o grupo do produto antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtCodGrupo.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCodMarca.Text = '' then begin
    funcLocal.Alerta('Informe a marca do produto antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtCodMarca.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCodModelo.Text = '' then begin
    funcLocal.Alerta('Informe o modelo do produto antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtCodModelo.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCodFornec.Text = '' then begin
    funcLocal.Alerta('Informe o fornecedor antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtCodFornec.SetFocus;
    Result := false;
    Exit;
  end;
  if JaExiste then begin
    funcLocal.Alerta('Já constam lançado no sistema um produto com as mesmas características aqui informadas.',1);
    pageCadastro.Pages[0].Show;
    edtDescricao.SetFocus;
    Result := false;
    Exit;
  end;
end;

function TfCad_Produtos.JaExiste : Boolean;
var
  qryCons : TSQLQuery;
begin
  Result    := true;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(*)');
        sql.Add('FROM  PRODUTOS');
        sql.Add('WHERE PROD_ID               <> ' + cdsLocal.FieldByName('PROD_ID').AsString);
        sql.Add('AND   PROD_EMPR_ID           = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   PROD_FORN_ID           = ' + edtCodFornec.Text);
        sql.Add('AND   PROD_DESCRICAO         = ' + QuotedStr(edtDescricao.Text));
        sql.Add('AND   PROD_ABREVIACAO        = ' + QuotedStr(edtAbrev.Text));
        sql.Add('AND   PROD_GENE_EMPR_ID_UNID = 0');
        sql.Add('AND   PROD_GENE_TGEN_ID_UNID = 519');
        sql.Add('AND   PROD_GENE_ID_UNID      = ' + QuotedStr(frPesqUnidade.InGrid()));
        sql.Add('AND   PROD_GENE_ID_TP_PROD   = ' + edtCodTipo.Text);
        sql.Add('AND   PROD_GENE_ID_GRUPO     = ' + edtCodGrupo.Text);
        sql.Add('AND   PROD_GENE_ID_MARCA     = ' + edtCodMarca.Text);
        sql.Add('AND   PROD_GENE_ID_MODELO    = ' + edtCodModelo.Text);
        Open;
      end;
      Result := (qryCons.Fields[0].AsInteger > 0)
    except on e: exception do begin
      funcLocal.Alerta('Erro no processo de validação do registro informado.'+#13+'['+e.Message+']',1);
      funcLocal.ReportaErro(Caption,'JaExiste',e.Message);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Produtos.Label10Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(361);
end;

procedure TfCad_Produtos.Label11Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(144);
end;

procedure TfCad_Produtos.Label7Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(357);
end;

procedure TfCad_Produtos.Label8Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(359);
end;

procedure TfCad_Produtos.Label9Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(360);
end;

procedure TfCad_Produtos.btnPesqAliqClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet(7);
  strTMP := funcLocal.Busca_Registro(dmProdutos.cdsPesqAliq,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('PROD_GENE_ID_ALQ_ECF').AsString := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('ALIQUOTA').AsString             := funcLocal.Buscar_Coluna(strTMP,2);
    cdsLocal.FieldByName('ICMS').AsString                 := funcLocal.Buscar_Coluna(strTMP,3);
  end else begin
    cdsLocal.FieldByName('PROD_GENE_ID_ALQ_ECF').AsString := '';
    cdsLocal.FieldByName('ALIQUOTA').AsString             := '';
    cdsLocal.FieldByName('ICMS').AsString                 := '';
  end;
end;

procedure TfCad_Produtos.btnPesqFornecClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet(2);
  strTMP := funcLocal.Busca_Registro(dmProdutos.cdsPesqFornec,'FORN_NOME_FANTASIA','FORN_ID;FORN_NOME_FANTASIA','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('PROD_FORN_ID').AsString       := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := funcLocal.Buscar_Coluna(strTMP,2);
    edtCodFornec.Modified := true;
  end else begin
    cdsLocal.FieldByName('PROD_FORN_ID').AsString       := '';
    cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := '';
  end;
  edtCodFornec.SetFocus;
end;

procedure TfCad_Produtos.btnPesqGrupoClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet(4);
  strTMP := funcLocal.Busca_Registro(dmProdutos.cdsPesqGrupo,'GENE_DESCR','GENE_ID;GENE_DESCR','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('PROD_GENE_ID_GRUPO').AsString := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('GRUPO_PROD').AsString := funcLocal.Buscar_Coluna(strTMP,2);
    edtCodGrupo.Modified := true;
  end else begin
    cdsLocal.FieldByName('PROD_GENE_ID_GRUPO').AsString := '';
    cdsLocal.FieldByName('GRUPO_PROD').AsString := '';
  end;
  edtCodGrupo.SetFocus;
end;

procedure TfCad_Produtos.btnPesqMarcaClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet(5);
  strTMP := funcLocal.Busca_Registro(dmProdutos.cdsPesqMarca,'GENE_DESCR','GENE_ID;GENE_DESCR','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('PROD_GENE_ID_MARCA').AsString := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('MARCA_PROD').AsString         := funcLocal.Buscar_Coluna(strTMP,2);
    edtCodMarca.Modified := true;
  end else begin
    cdsLocal.FieldByName('PROD_GENE_ID_MARCA').AsString := '';
    cdsLocal.FieldByName('MARCA_PROD').AsString         := '';
  end;
  edtCodMarca.SetFocus;
end;

procedure TfCad_Produtos.btnPesqModeloClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet(6);
  strTMP := funcLocal.Busca_Registro(dmProdutos.cdsPesqModelo,'GENE_DESCR','GENE_ID;GENE_DESCR','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('PROD_GENE_ID_MODELO').AsString := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('MODELO_PROD').AsString         := funcLocal.Buscar_Coluna(strTMP,2);
    edtCodModelo.Modified := true;
  end else begin
    cdsLocal.FieldByName('PROD_GENE_ID_MODELO').AsString := '';
    cdsLocal.FieldByName('MODELO_PROD').AsString         := '';
  end;
  edtCodModelo.SetFocus;
end;

procedure TfCad_Produtos.btnPesqProdClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmProdutos do begin
    cdsComposicaoProd.Edit;
    OpenClientDataSet(9);
    strTMP := funcLocal.Busca_Registro(dmProdutos.cdsPesqProdutos,'PROD_DESCRICAO','PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;GRUPO_PROD;MARCA_PROD;MODELO_PROD','');
    if strTMP <> '' then begin
      cdsComposicaoProd.FieldByName('PRCP_PROD_ID_COMP').AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsComposicaoProd.FieldByName('PROD_DESCRICAO').AsString    := funcLocal.Buscar_Coluna(strTMP,2);
      cdsComposicaoProd.FieldByName('PROD_UNIDADE').AsString      := funcLocal.Buscar_Coluna(strTMP,3);
      cdsComposicaoProd.FieldByName('GRUPO_PROD').AsString        := funcLocal.Buscar_Coluna(strTMP,4);
      cdsComposicaoProd.FieldByName('MARCA_PROD').AsString        := funcLocal.Buscar_Coluna(strTMP,5);
      cdsComposicaoProd.FieldByName('MODELO_PROD').AsString       := funcLocal.Buscar_Coluna(strTMP,6);
      edtCodProd.Modified := true;
    end else begin
      cdsComposicaoProd.Edit;
      cdsComposicaoProd.FieldByName('PRCP_PROD_ID_COMP').AsString := '';
      cdsComposicaoProd.FieldByName('PROD_DESCRICAO').AsString    := '';
      cdsComposicaoProd.FieldByName('PROD_UNIDADE').AsString      := '';
      cdsComposicaoProd.FieldByName('GRUPO_PROD').AsString        := '';
      cdsComposicaoProd.FieldByName('MARCA_PROD').AsString        := '';
      cdsComposicaoProd.FieldByName('MODELO_PROD').AsString       := '';
    end;
  end;
  edtCodProd.SetFocus;
end;

procedure TfCad_Produtos.btnPesqTipoClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet(3);
  strTMP := funcLocal.Busca_Registro(dmProdutos.cdsPesqTipo,'GENE_DESCR','GENE_ID;GENE_DESCR','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('PROD_GENE_ID_TP_PROD').AsString := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('TIPO_PROD').AsString            := funcLocal.Buscar_Coluna(strTMP,2);
    edtCodTipo.Modified := true;
  end else begin
    cdsLocal.FieldByName('PROD_GENE_ID_TP_PROD').AsString := '';
    cdsLocal.FieldByName('TIPO_PROD').AsString            := '';
  end;
  edtCodTipo.SetFocus;
end;

procedure TfCad_Produtos.edtCodNCMKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0
end;

procedure TfCad_Produtos.edtPeriodoRetornoEnter(Sender: TObject);
begin
  inherited;
  edtPeriodoRetorno.Enabled := cdsLocal.FieldByName('PROD_GENE_ID_TP_PROD').AsInteger = 2;
  if not edtPeriodoRetorno.Enabled then begin
    edtPeriodoRetorno.Clear;
  end;
end;

procedure TfCad_Produtos.edtPeriodoRetornoExit(Sender: TObject);
begin
  inherited;
  edtPeriodoRetorno.Enabled := true;
end;

procedure TfCad_Produtos.DBEdit21KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',',',#8])) then key := #0
end;

procedure TfCad_Produtos.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0
end;

procedure TfCad_Produtos.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0
end;

procedure TfCad_Produtos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(DBGrid1.DataSource.DataSet.RecNo) then begin
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

procedure TfCad_Produtos.grdComposicaoCellClick(Column: TColumn);
begin
  inherited;
  dmProdutos.cdsComposicaoProd.Cancel;
end;

procedure TfCad_Produtos.grdComposicaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(grdComposicao.DataSource.DataSet.RecNo) then begin
      grdComposicao.Canvas.Font.Color  := clBlack;
      grdComposicao.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      grdComposicao.Canvas.Font.Color  := clBlack;
      grdComposicao.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      grdComposicao.Canvas.Brush.Color := clSilver;
      grdComposicao.Canvas.Font.Style  := [fsBold];
    end;
     grdComposicao.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
end;

procedure TfCad_Produtos.edtCodProdExit(Sender: TObject);
var
  strTMP     : String;
  strProd_ID : String;
begin
  if not edtCodProd.Modified then Exit;
  with dmProdutos do begin
    try
      cdsComposicaoProd.Edit;
      cdsComposicaoProd.DisableControls;
      if edtCodProd.Text <> '' then begin
        strProd_ID := edtCodProd.Text;
        OpenClientDataSet(9);
        cdsComposicaoProd.Cancel;
        if not cdsComposicaoProd.Locate('PRCP_PROD_ID_COMP',strProd_ID,[]) then begin
          cdsComposicaoProd.Append;
          strTMP := funcLocal.Busca_Registro(dmProdutos.cdsPesqProdutos,'PROD_DESCRICAO','PROD_ID;PROD_DESCRICAO;PROD_UNIDADE;GRUPO_PROD;MARCA_PROD;MODELO_PROD','PROD_ID = ' + strProd_ID);
          if strTMP <> '' then begin
            cdsComposicaoProd.FieldByName('PRCP_PROD_ID_COMP').AsString := funcLocal.Buscar_Coluna(strTMP,1);
            cdsComposicaoProd.FieldByName('PROD_DESCRICAO').AsString    := funcLocal.Buscar_Coluna(strTMP,2);
            cdsComposicaoProd.FieldByName('PROD_UNIDADE').AsString      := funcLocal.Buscar_Coluna(strTMP,3);
            cdsComposicaoProd.FieldByName('GRUPO_PROD').AsString        := funcLocal.Buscar_Coluna(strTMP,4);
            cdsComposicaoProd.FieldByName('MARCA_PROD').AsString        := funcLocal.Buscar_Coluna(strTMP,5);
            cdsComposicaoProd.FieldByName('MODELO_PROD').AsString       := funcLocal.Buscar_Coluna(strTMP,6);
          end else begin
            cdsComposicaoProd.FieldByName('PRCP_PROD_ID_COMP').AsString := '';
            cdsComposicaoProd.FieldByName('PROD_DESCRICAO').AsString    := '';
            cdsComposicaoProd.FieldByName('PROD_UNIDADE').AsString      := '';
            cdsComposicaoProd.FieldByName('GRUPO_PROD').AsString        := '';
            cdsComposicaoProd.FieldByName('MARCA_PROD').AsString        := '';
            cdsComposicaoProd.FieldByName('MODELO_PROD').AsString       := '';
          end;
        end else begin
          cdsComposicaoProd.Edit;
        end;
      end else begin
        cdsComposicaoProd.FieldByName('PRCP_PROD_ID_COMP').AsString := '';
        cdsComposicaoProd.FieldByName('PROD_DESCRICAO').AsString    := '';
        cdsComposicaoProd.FieldByName('PROD_UNIDADE').AsString      := '';
        cdsComposicaoProd.FieldByName('GRUPO_PROD').AsString        := '';
        cdsComposicaoProd.FieldByName('MARCA_PROD').AsString        := '';
        cdsComposicaoProd.FieldByName('MODELO_PROD').AsString       := '';
      end;
    finally
      cdsComposicaoProd.EnableControls;
      grdComposicao.Refresh;
    end;
  end;
end;

procedure TfCad_Produtos.edtCodProdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0
end;

procedure TfCad_Produtos.edtQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0
end;

procedure TfCad_Produtos.edtAbrevEnter(Sender: TObject);
begin
  inherited;
  if (edtAbrev.Text = '') and (edtDescricao.Text <> '') then
    cdsLocal.FieldByName('PROD_ABREVIACAO').AsString := cdsLocal.FieldByName('PROD_DESCRICAO').AsString;
end;

procedure TfCad_Produtos.edtCodFornecExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCodFornec.Modified then Exit;
  if edtCodFornec.Text <> '' then begin
    OpenClientDataSet(2);
    strTMP := funcLocal.Busca_Registro(dmProdutos.cdsPesqFornec,'FORN_NOME_FANTASIA','FORN_ID;FORN_NOME_FANTASIA','FORN_ID = ' + edtCodFornec.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('PROD_FORN_ID').AsString       := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := funcLocal.Buscar_Coluna(strTMP,2);
    end else begin
      cdsLocal.FieldByName('PROD_FORN_ID').AsString       := '';
      cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := '';
    end;
  end else begin
    cdsLocal.FieldByName('PROD_FORN_ID').AsString       := '';
    cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := '';
  end;
end;

procedure TfCad_Produtos.edtCodGrupoExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCodGrupo.Modified then Exit;
  if edtCodGrupo.Text <> '' then begin
    OpenClientDataSet(4);
    strTMP := funcLocal.Busca_Registro(dmProdutos.cdsPesqGrupo,'GENE_DESCR','GENE_ID;GENE_DESCR','GENE_ID = ' + edtCodGrupo.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('PROD_GENE_ID_GRUPO').AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('GRUPO_PROD').AsString := funcLocal.Buscar_Coluna(strTMP,2);
    end else begin
      cdsLocal.FieldByName('PROD_GENE_ID_GRUPO').AsString := '';
      cdsLocal.FieldByName('GRUPO_PROD').AsString := '';
    end;
  end else begin
    cdsLocal.FieldByName('PROD_GENE_ID_GRUPO').AsString := '';
    cdsLocal.FieldByName('GRUPO_PROD').AsString := '';
  end;
end;

procedure TfCad_Produtos.edtCodMarcaExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCodMarca.Modified then Exit;
  if edtCodMarca.Text <> '' then begin
    OpenClientDataSet(5);
    strTMP := funcLocal.Busca_Registro(dmProdutos.cdsPesqMarca,'GENE_DESCR','GENE_ID;GENE_DESCR','GENE_ID = ' + edtCodMarca.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('PROD_GENE_ID_MARCA').AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('MARCA_PROD').AsString         := funcLocal.Buscar_Coluna(strTMP,2);
    end else begin
      cdsLocal.FieldByName('PROD_GENE_ID_MARCA').AsString := '';
      cdsLocal.FieldByName('MARCA_PROD').AsString         := '';
    end;
  end else begin
    cdsLocal.FieldByName('PROD_GENE_ID_MARCA').AsString := '';
    cdsLocal.FieldByName('MARCA_PROD').AsString         := '';
  end;
end;

procedure TfCad_Produtos.edtCodModeloExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCodModelo.Modified then Exit;
  if edtCodModelo.Text <> '' then begin
    OpenClientDataSet(6);
    strTMP := funcLocal.Busca_Registro(dmProdutos.cdsPesqModelo,'GENE_DESCR','GENE_ID;GENE_DESCR','GENE_ID = ' + edtCodModelo.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('PROD_GENE_ID_MODELO').AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('MODELO_PROD').AsString := funcLocal.Buscar_Coluna(strTMP,2);
    end else begin
      cdsLocal.FieldByName('PROD_GENE_ID_MODELO').AsString := '';
      cdsLocal.FieldByName('MODELO_PROD').AsString := '';
    end;
  end else begin
    cdsLocal.FieldByName('PROD_GENE_ID_MODELO').AsString := '';
    cdsLocal.FieldByName('MODELO_PROD').AsString := '';
  end;
end;

procedure TfCad_Produtos.edtCodTipoExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCodTipo.Modified then Exit;
  if edtCodTipo.Text <> '' then begin
    OpenClientDataSet(3);
    strTMP := funcLocal.Busca_Registro(dmProdutos.cdsPesqTipo,'GENE_DESCR','GENE_ID;GENE_DESCR','GENE_ID = ' + edtCodTipo.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('PROD_GENE_ID_TP_PROD').AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('TIPO_PROD').AsString            := funcLocal.Buscar_Coluna(strTMP,2);
    end else begin
      cdsLocal.FieldByName('PROD_GENE_ID_TP_PROD').AsString := '';
      cdsLocal.FieldByName('TIPO_PROD').AsString            := '';
    end;
  end else begin
    cdsLocal.FieldByName('PROD_GENE_ID_TP_PROD').AsString := '';
    cdsLocal.FieldByName('TIPO_PROD').AsString            := '';
  end;
end;

procedure TfCad_Produtos.edtEstInicialKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0
end;

procedure TfCad_Produtos.edtEstMinimoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0
end;

procedure TfCad_Produtos.FormShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
  OpenClientDataSet(8);
  OpenClientDataSet(10);
  OpenClientDataSet(11);
  edtMedLucro.Text := FormatFloat('0.00',RetornaLucroMedio(cdsLocal.FieldByName('PROD_ID').AsString));
  SetaValoresFrames;
end;

procedure TfCad_Produtos.frPesqUnidadebtnInserirClick(Sender: TObject);
begin
  inherited;
  frPesqUnidade.btnInserirClick(Sender);
end;

procedure TfCad_Produtos.SetaValoresFrames;
var
  intI  : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TfrPesqIndividual) then begin
      (Components[intI] as TfrPesqIndividual).Limpar;
    end;
  end;

  frPesqUnidade.cdsLocal                  := Self.cdsLocal;
  frPesqUnidade.cdsField1                 := 'PROD_GENE_ID_UNID';
  frPesqUnidade.cdsField2                 := 'UNIDADE';
  frPesqUnidade.cdsField3                 := 'UNID';
  try
    if not (cdsLocal.State = dsInsert) then begin
      frPesqUnidade.BuscarRegistro(cdsLocal.FieldByName('PROD_GENE_ID_UNID').AsString);
    end;
  except
  end;
end;

function TfCad_Produtos.RetornaLucroMedio(strPROD_ID : String) : Real;
var
  qryCons  : TSQLQuery;
  intI     : Integer;
begin
  try
    Result  := 0;
    intI    := 0;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      TP.TPIT_VLR_GONDOLA - PR.PROD_VLR_CUSTO');
        sql.Add('FROM  PRODUTOS PR');
        sql.Add('INNER JOIN TABELA_PRECO_ITENS TP');
        sql.Add('ON (TP.TPIT_PROD_ID           = PR.PROD_ID');
        sql.Add('AND TP.TPIT_PROD_EMPR_ID      = PR.PROD_EMPR_ID)');
        sql.Add('WHERE PR.PROD_ID              = ' + strPROD_ID);
        sql.Add('AND   PR.PROD_EMPR_ID         = ' + IntToStr(funcLocal.Empr_ID));
        Open;
        if not IsEmpty then begin
          First;
          while not eof do begin
            inc(intI);
            Result := (Result + qryCons.Fields[0].AsFloat) / intI;
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro('TfCad_Produtos','RetornaLucroMedio',e.Message);
      funcLocal.Alerta('Erro no processo de calculo de lucro médio do produto.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Produtos.btnContadorBottomClick(Sender: TObject);
begin
  inherited;
  cdsLocal.FieldByName('PROD_DURACAO').AsInteger := cdsLocal.FieldByName('PROD_DURACAO').AsInteger-15;
  if cdsLocal.FieldByName('PROD_DURACAO').AsInteger<0 then
    cdsLocal.FieldByName('PROD_DURACAO').AsInteger:=0;
end;

procedure TfCad_Produtos.btnContadorTopClick(Sender: TObject);
begin
  inherited;
  cdsLocal.FieldByName('PROD_DURACAO').AsInteger := cdsLocal.FieldByName('PROD_DURACAO').AsInteger+15;
end;

procedure TfCad_Produtos.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmProdutos do begin
    case intPos of
      2 : begin
        with cdsPesqFornec do begin
          Close;
          Open;
        end;
      end;
      3 : begin
        with cdsPesqTipo do begin
          Close;
          Open;
        end;
      end;
      4 : begin
        with cdsPesqGrupo do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      5 : begin
        with cdsPesqMarca do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      6 : begin
        with cdsPesqModelo do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      7 : begin
        with cdsPesqAliq do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      8 : begin
        with cdsCodBarras do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('PROD_ID').AsInteger := cdsLocal.FieldByName('PROD_ID').AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      9 : begin
        with cdsPesqProdutos do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('PROD_ID').AsInteger := cdsLocal.FieldByName('PROD_ID').AsInteger;
          Open;
        end;
      end;
      10 : begin
        with cdsComposicaoProd do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('PROD_ID').AsInteger := cdsLocal.FieldByName('PROD_ID').AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
          Edit;
        end;
      end;
      11 : begin
        with cdsTabelasPreco do begin
          Close;
          Params.ParamByName('PROD_ID').AsInteger := cdsLocal.FieldByName('PROD_ID').AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end
      else begin
        OpenClientDataSet(2);
        OpenClientDataSet(3);
        OpenClientDataSet(4);
        OpenClientDataSet(5);
        OpenClientDataSet(6);
        OpenClientDataSet(7);
        OpenClientDataSet(8);
        OpenClientDataSet(9);
        OpenClientDataSet(10);
        OpenClientDataSet(11);
      end;
    end;
  end;
end;

procedure TfCad_Produtos.SpeedButton1Click(Sender: TObject);
var
  imgTMP : TImage;
begin
  OpenPictureDialog1.Execute;
  if OpenPictureDialog1.FileName <> '' then begin
    try
      imgTMP := TImage.Create(nil);
      imgTMP.Picture.LoadFromFile(OpenPictureDialog1.FileName);
      cdsLocal.FieldByName('PROD_IMAGEM').Assign(imgTMP.Picture);
    except
    end;
  end;
end;

procedure TfCad_Produtos.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Label7Click(Sender);
  edtCodGrupo.SetFocus;
end;

procedure TfCad_Produtos.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Label8Click(Sender);
  edtCodMarca.SetFocus;
end;

procedure TfCad_Produtos.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  Label11Click(Sender);
  edtCodFornec.SetFocus;
end;

procedure TfCad_Produtos.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  Label9Click(Sender);
  edtCodModelo.SetFocus;
end;

procedure TfCad_Produtos.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  Label10Click(Sender);
end;

initialization
  if fCad_Produtos = nil then
    fCad_Produtos := TfCad_Produtos.Create(nil);
finalization
  FreeAndNil(fCad_Produtos);

end.
