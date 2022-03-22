unit ufCad_Menus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, SQLExpr, Mask,
  DBCtrls, ExtDlgs;

type
  TfCad_Menus = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtCodigo: TDBEdit;
    Label3: TLabel;
    edtDescricao: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    edtParametro: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label7: TLabel;
    edtCod_Hier: TDBEdit;
    btnPesq: TSpeedButton;
    Label8: TLabel;
    edtMenu: TDBEdit;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnLocalizar: TSpeedButton;
    btnImprimir: TSpeedButton;
    GroupBox2: TGroupBox;
    OpenPictureDialog1: TOpenPictureDialog;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure edtCod_HierKeyPress(Sender: TObject; var Key: Char);
    procedure edtCod_HierExit(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure DBImage1DblClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure GroupBox2DblClick(Sender: TObject);
  private
    function ValidaDados: Boolean;
    procedure OpenClientDataSet;
  public
    { Public declarations }
  end;

var
  fCad_Menus: TfCad_Menus;

implementation

uses udmMenus, DB;

{$R *.dfm}

procedure TfCad_Menus.btnNovoClick(Sender: TObject);
var
  qryCons : TSQLQuery;
  strTMP  : String;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          funcLocal.StartCommit;
        except
        end;
        sql.Add('INSERT INTO MENU (MENU_ID, MENU_GENE_EMPR_ID_TP, MENU_GENE_TGEN_ID_TP, MENU_GENE_ID_TP, MENU_CODIGO, MENU_DESCRICAO, MENU_ATIVO, MENU_NOME_BPL, MENU_CLASSE_FORM_BPL, MENU_PARAMETRO_ABERTURA, MENU_MENU_ID)');
        strTMP := funcLocal.ObterSequencia('MENU','0');
        sql.Add('VALUES (' + strTMP + ','
                           + '0'    + ','
                           + '1'    + ','
                           + '1'    + ','
                           + QuotedStr('0')             + ','
                           + QuotedStr('Novo(Alt + N)') + ','
                           + '1'    + ','
                           + QuotedStr('')              + ','
                           + QuotedStr('btnNovo')       + ','
                           + strTMP + ','
                           + cdsLocal.FieldByName('MENU_ID').AsString+')');
//        ShowMessage(qryCons.Text);
        ExecSQL;
        try
          funcLocal.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcLocal.RollBack;
      funcLocal.Alerta('Erro ao tentar incluir sub-menu.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Menus.btnOkClick(Sender: TObject);
begin
  if ValidaDados then begin
    try
    cdsLocal.FieldByName('MENU_IMAGE1').Assign(Image1.Picture.Icon);
    except
    end;
    inherited;
    OpenClientDataSet;
    edtCodigo.SetFocus;
  end else IsValidData;
end;

function TfCad_Menus.ValidaDados : Boolean;
begin
  Result := true;
  if edtCodigo.Text = '' then begin
    funcLocal.Alerta('Informe um código para este menu antes de continuar.',1);
    edtCodigo.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDescricao.Text = '' then begin
    funcLocal.Alerta('Informe uma descrição para o menu antes de continuar.',1);
    edtDescricao.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfCad_Menus.btnPesqClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmMenus do begin
    strTMP := funcLocal.Busca_Registro(cdsPesq_Menu,'MENU_DESCRICAO','MENU_ID;MENU_CODIGO;MENU_DESCRICAO','');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('MENU_MENU_ID').AsString    := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('MENU_DESCRICAO_1').AsString := funcLocal.Buscar_Coluna(strTMP,3);
    end else begin
      cdsLocal.FieldByName('MENU_MENU_ID').AsString    := '';
      cdsLocal.FieldByName('MENU_DESCRICAO_1').AsString := '';
    end;
  end;
  edtCod_Hier.SetFocus;
end;

procedure TfCad_Menus.DBImage1DblClick(Sender: TObject);
begin
  try
    if OpenPictureDialog1.Execute then begin
      (cdsLocal.FieldByName('MENU_IMAGE1') as TBlobField).LoadFromFile(OpenPictureDialog1.FileName);
    end;
  except
  end;
end;

procedure TfCad_Menus.edtCod_HierExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Hier.Modified then Exit;
  with dmMenus do begin
    if edtCod_Hier.Text <> '' then begin
      strTMP := funcLocal.Busca_Registro(cdsPesq_Menu,'MENU_DESCRICAO','MENU_ID;MENU_CODIGO;MENU_DESCRICAO','MENU_ID = ' + edtCod_Hier.Text);
      if strTMP <> '' then begin
        cdsLocal.FieldByName('MENU_MENU_ID').AsString    := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('MENU_DESCRICAO_1').AsString := funcLocal.Buscar_Coluna(strTMP,3);
      end else begin
        cdsLocal.FieldByName('MENU_MENU_ID').AsString    := '';
        cdsLocal.FieldByName('MENU_DESCRICAO_1').AsString := '';
      end;
    end else begin
      cdsLocal.FieldByName('MENU_MENU_ID').AsString    := '';
      cdsLocal.FieldByName('MENU_DESCRICAO_1').AsString := '';
    end;
  end;
end;

procedure TfCad_Menus.edtCod_HierKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then begin
    try
      if Trim(edtCodigo.Text) = '' then begin
        if Key = #27 then Exit;
        funcLocal.VlrPesq := Key;
        Key := #0;
        btnPesq.Click;
      end else Key := #0;
    except
    end;
  end;
end;

procedure TfCad_Menus.FormShow(Sender: TObject);
var
  imgTMP : TStream;
begin
  inherited;
  OpenClientDataSet;
  edtCodigo.SetFocus;
  imgTMP := cdsLocal.CreateBlobStream((cdsLocal.FieldByName('MENU_IMAGE1') as TBlobField),bmRead);
  if imgTMP.Size > 0 then begin
    Image1.Visible := true;
    Image1.Picture.Icon.LoadFromStream(imgTMP)
  end else Image1.Visible := false;
  btnNovo.Enabled       := (cdsLocal.State = dsEdit);
  btnEditar.Enabled     := (cdsLocal.State = dsEdit);
  btnExcluir.Enabled    := (cdsLocal.State = dsEdit);
  btnLocalizar.Enabled  := (cdsLocal.State = dsEdit);
end;

procedure TfCad_Menus.GroupBox2DblClick(Sender: TObject);
begin
  OpenPictureDialog1.Execute;
  if OpenPictureDialog1.FileName <> '' then begin
    try
      Image1.Visible := true;
      Image1.Picture.Icon.LoadFromFile(OpenPictureDialog1.FileName);
      cdsLocal.Edit;
    except
    end;
  end;
end;

procedure TfCad_Menus.Image1DblClick(Sender: TObject);
begin
  OpenPictureDialog1.Execute;
  if OpenPictureDialog1.FileName <> '' then begin
    try
      Image1.Visible := true;
      Image1.Picture.Icon.LoadFromFile(OpenPictureDialog1.FileName);
      cdsLocal.Edit;
    except
    end;
  end;
end;

procedure TfCad_Menus.OpenClientDataSet;
begin
  with dmMenus do begin
    with cdsPesq_Menu do begin
      Close;
      Open;
    end;
  end;
end;

procedure TfCad_Menus.btnEditarClick(Sender: TObject);
var
  qryCons : TSQLQuery;
  strTMP  : String;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          funcLocal.StartCommit;
        except
        end;
        sql.Add('INSERT INTO MENU (MENU_ID, MENU_GENE_EMPR_ID_TP, MENU_GENE_TGEN_ID_TP, MENU_GENE_ID_TP, MENU_CODIGO, MENU_DESCRICAO, MENU_ATIVO, MENU_NOME_BPL, MENU_CLASSE_FORM_BPL, MENU_PARAMETRO_ABERTURA, MENU_MENU_ID)');
        strTMP := funcLocal.ObterSequencia('MENU','0');
        sql.Add('VALUES (' + strTMP + ','
                           + '0'    + ','
                           + '1'    + ','
                           + '1'    + ','
                           + QuotedStr('0')             + ','
                           + QuotedStr('Editar(Alt + E)') + ','
                           + '1'    + ','
                           + QuotedStr('')              + ','
                           + QuotedStr('btnEditar')       + ','
                           + strTMP + ','
                           + cdsLocal.FieldByName('MENU_ID').AsString+')');
//        ShowMessage(qryCons.Text);
        ExecSQL;
        try
          funcLocal.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcLocal.RollBack;
      funcLocal.Alerta('Erro ao tentar incluir sub-menu.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Menus.btnExcluirClick(Sender: TObject);
var
  qryCons : TSQLQuery;
  strTMP  : String;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          funcLocal.StartCommit;
        except
        end;
        sql.Add('INSERT INTO MENU (MENU_ID, MENU_GENE_EMPR_ID_TP, MENU_GENE_TGEN_ID_TP, MENU_GENE_ID_TP, MENU_CODIGO, MENU_DESCRICAO, MENU_ATIVO, MENU_NOME_BPL, MENU_CLASSE_FORM_BPL, MENU_PARAMETRO_ABERTURA, MENU_MENU_ID)');
        strTMP := funcLocal.ObterSequencia('MENU','0');
        sql.Add('VALUES (' + strTMP + ','
                           + '0'    + ','
                           + '1'    + ','
                           + '1'    + ','
                           + QuotedStr('0')             + ','
                           + QuotedStr('Excluir(Alt + X)') + ','
                           + '1'    + ','
                           + QuotedStr('')              + ','
                           + QuotedStr('btnExcluir')       + ','
                           + strTMP + ','
                           + cdsLocal.FieldByName('MENU_ID').AsString+')');
//        ShowMessage(qryCons.Text);
        ExecSQL;
        try
          funcLocal.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcLocal.RollBack;
      funcLocal.Alerta('Erro ao tentar incluir sub-menu.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Menus.btnLocalizarClick(Sender: TObject);
var
  qryCons : TSQLQuery;
  strTMP  : String;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          funcLocal.StartCommit;
        except
        end;
        sql.Add('INSERT INTO MENU (MENU_ID, MENU_GENE_EMPR_ID_TP, MENU_GENE_TGEN_ID_TP, MENU_GENE_ID_TP, MENU_CODIGO, MENU_DESCRICAO, MENU_ATIVO, MENU_NOME_BPL, MENU_CLASSE_FORM_BPL, MENU_PARAMETRO_ABERTURA, MENU_MENU_ID)');
        strTMP := funcLocal.ObterSequencia('MENU','0');
        sql.Add('VALUES (' + strTMP + ','
                           + '0'    + ','
                           + '1'    + ','
                           + '1'    + ','
                           + QuotedStr('0')             + ','
                           + QuotedStr('Localizar(Alt + L)') + ','
                           + '1'    + ','
                           + QuotedStr('')              + ','
                           + QuotedStr('btnLocalizar')       + ','
                           + strTMP + ','
                           + cdsLocal.FieldByName('MENU_ID').AsString+')');
//        ShowMessage(qryCons.Text);
        ExecSQL;
        try
          funcLocal.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcLocal.RollBack;
      funcLocal.Alerta('Erro ao tentar incluir sub-menu.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Menus.btnImprimirClick(Sender: TObject);
var
  qryCons : TSQLQuery;
  strTMP  : String;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          funcLocal.StartCommit;
        except
        end;
        sql.Add('INSERT INTO MENU (MENU_ID, MENU_GENE_EMPR_ID_TP, MENU_GENE_TGEN_ID_TP, MENU_GENE_ID_TP, MENU_CODIGO, MENU_DESCRICAO, MENU_ATIVO, MENU_NOME_BPL, MENU_CLASSE_FORM_BPL, MENU_PARAMETRO_ABERTURA, MENU_MENU_ID)');
        strTMP := funcLocal.ObterSequencia('MENU','0');
        sql.Add('VALUES (' + strTMP + ','
                           + '0'    + ','
                           + '1'    + ','
                           + '1'    + ','
                           + QuotedStr('0')             + ','
                           + QuotedStr('Imprimir(Alt + P)') + ','
                           + '1'    + ','
                           + QuotedStr('')              + ','
                           + QuotedStr('btnImprimir')       + ','
                           + strTMP + ','
                           + cdsLocal.FieldByName('MENU_ID').AsString+')');
//        ShowMessage(qryCons.Text);
        ExecSQL;
        try
          funcLocal.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcLocal.RollBack;
      funcLocal.Alerta('Erro ao tentar incluir sub-menu.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

initialization
  if fCad_Menus = nil then
    fCad_Menus := TfCad_Menus.Create(nil);
finalization
  FreeAndNil(fCad_Menus);

end.
