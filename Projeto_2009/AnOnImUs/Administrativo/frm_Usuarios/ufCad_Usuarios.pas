 unit ufCad_Usuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, Buttons, ExtCtrls, ComCtrls, StdCtrls, DBCtrls, Mask,
  sqlexpr, ImgList, Funcoes, uFrPesquisa;

type
  TfCad_Usuario = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label3: TLabel;
    edtNome: TDBEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edtLogin: TDBEdit;
    Label5: TLabel;
    edtSenha: TDBEdit;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    treeEmpr_Disp: TTreeView;
    treeEmpr_Perm: TTreeView;
    btnAtrib_Empr: TSpeedButton;
    btnRet_Empr: TSpeedButton;
    treePerm_Disp: TTreeView;
    treePerm_Usuario: TTreeView;
    btnAtribuirPermissao: TSpeedButton;
    btnRetiraPermissao: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ImageList1: TImageList;
    Label10: TLabel;
    Label11: TLabel;
    edtConfirma: TEdit;
    cmbEmpresa: TComboBox;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    Label13: TLabel;
    DBEdit4: TDBEdit;
    Label14: TLabel;
    DBEdit5: TDBEdit;
    Label15: TLabel;
    edtCodigo: TDBEdit;
    Label16: TLabel;
    DBEdit7: TDBEdit;
    Label17: TLabel;
    DBEdit8: TDBEdit;
    Label18: TLabel;
    DBEdit9: TDBEdit;
    Label19: TLabel;
    edtTelefone2: TDBEdit;
    Label20: TLabel;
    edtTelefone3: TDBEdit;
    Label21: TLabel;
    edtTelefone4: TDBEdit;
    Label22: TLabel;
    edtTelefone1: TDBEdit;
    btnPesq: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBRadioGroup2: TDBRadioGroup;
    TabSheet3: TTabSheet;
    frPesqTecnico: TfrPesquisa;
    DBCheckBox1: TDBCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure treeEmpr_DispDblClick(Sender: TObject);
    procedure treeEmpr_PermDblClick(Sender: TObject);
    procedure btnAtrib_EmprClick(Sender: TObject);
    procedure btnRet_EmprClick(Sender: TObject);
    procedure cmbEmpresaClick(Sender: TObject);
    procedure btnAtribuirPermissaoClick(Sender: TObject);
    procedure btnRetiraPermissaoClick(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoExit(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
    procedure treeEmpr_DispKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure treeEmpr_PermKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure treePerm_DispKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure treePerm_UsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtTelefone2Exit(Sender: TObject);
  private
    LimitarProfissionais : Boolean;
    function  ValidaDados(intPos : Integer = 99): Boolean;
    procedure OpenClientDataSet;
    procedure MenusEmpresasDisponiveis;
    procedure MenusEmpresasPermissao;
    function  JaExiste(strEmpr_ID, strUser_ID: String): Boolean;
    procedure AdicionaEmpresa(strEmpr_ID, strUser_ID: String);
    procedure RetiraEmpresa(strEmpr_ID, strUser_ID: String);
    procedure MenusPermissoesDisponiveis;
    procedure MenusPermissoesAtribuidas(strEmpr_ID : String);
    procedure AdicionaSubMenus(treeItem: TTreeNode; strMenu_ID: String);
    procedure AdicionaSubPermissoes(treeItem: TTreeNode; strMenu_ID, strEmpr_ID : String);
    procedure AdicionaPermissao(strMenu_ID: String);
    procedure AdicionaFilhosPermissao(strMenu_ID: String);
    function  ExistePermissao(strMenu_ID : String): Boolean;
    procedure AdicionaPermissaoPai(strMenu_ID: String);
    procedure DeletaFilhosMenu(strMenu_ID, strEmpr_Id: String);
    procedure DeletaMenu(strMenu_ID, strEmpr_Id: String);
    procedure SalvarTecnicosVisiveis;
    procedure CarregarTecnicosVisiveis;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Usuario: TfCad_Usuario;

implementation

uses udmUsuarios, DB;

{$R *.dfm}

procedure TfCad_Usuario.btnAtribuirPermissaoClick(Sender: TObject);
var
  intI : Integer;
begin
  if cmbEmpresa.Text <> '' then begin
    try
      funcLocal.MSGAguarde();
      try
        if treePerm_Disp.Selected <> nil then begin
          for intI := 0 to treePerm_Disp.Items.Count - 1 do begin
            AdicionaPermissaoPai(IntToStr(Integer(treePerm_Disp.Selections[intI].Data)));
            AdicionaPermissao(IntToStr(Integer(treePerm_Disp.Selections[intI].Data)));
            AdicionaFilhosPermissao(IntToStr(Integer(treePerm_Disp.Selections[intI].Data)));
          end;
        end;
      except
      end;
    finally
      MenusPermissoesAtribuidas(IntToStr(integer(cmbEmpresa.Items.Objects[cmbEmpresa.ItemIndex])));
      funcLocal.MSGAguarde(false);
    end;
  end else funcLocal.Alerta('Selecione uma empresa antes de tentar atribuir as permissões para este usuário.',1);
end;

procedure TfCad_Usuario.AdicionaPermissaoPai(strMenu_ID : String);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      MENU_MENU_ID');
        sql.Add('FROM  MENU');
        sql.Add('WHERE MENU_ID = ' + strMenu_ID);
        Open;
        if qryCons.Fields[0].AsString <> '' then begin
          AdicionaPermissao(qryCons.Fields[0].AsString);
          AdicionaPermissaoPai(qryCons.Fields[0].AsString);
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'AdicionaPermissaoPai',funcLocal.User_Login,e.Message);
      funcLocal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Usuario.AdicionaPermissao(strMenu_ID : String);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    if dmUsuarios.cdsUsuario.State in [dsEdit,dsInsert] then begin
      dmUsuarios.cdsUsuario.ApplyUpdates(-1);
    end;
    dmUsuarios.cdsUsuario.Edit;
    try
      if not ExistePermissao(strMenu_ID) then begin
        with qryCons do begin
          Close;
          sql.Clear;
          try
            funcLocal.StartCommit;
          except
          end;
          sql.Add('INSERT INTO USUARIO_M VALUES(' + funcLocal.ObterSequencia('USUARIO_M',IntToStr(funcLocal.Empr_ID)) + ','
                                                  + cdsLocal.FieldByName('USER_ID').AsString + ','
                                                  + IntToStr(integer(cmbEmpresa.Items.Objects[cmbEmpresa.ItemIndex])) + ','
                                                  + strMenu_ID + ')');
          ExecSQL;
          try
            funcLocal.Commit;
          except
          end;
        end;
      end;
    except
      funcLocal.RollBack;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfCad_Usuario.ExistePermissao(strMenu_ID : String) : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      USRM_ID');
        sql.Add('FROM  USUARIO_M');
        sql.Add('WHERE USRM_USER_ID = ' + cdsLocal.FieldByName('USER_ID').AsString);
        sql.Add('AND   USRM_EMPR_ID = ' + IntToStr(integer(cmbEmpresa.Items.Objects[cmbEmpresa.ItemIndex])));
        sql.Add('AND   USRM_MENU_ID = ' + strMenu_ID);
        Open;
        if not IsEmpty then
          Result    := true
        else Result := false;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'ExistePermissao',funcLocal.User_Login,e.Message);
      funcLocal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Usuario.AdicionaFilhosPermissao(strMenu_ID : String);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      MENU_ID,');
        sql.Add('      MENU_CODIGO,');
        sql.Add('      MENU_DESCRICAO');
        sql.Add('FROM  MENU');
        sql.Add('WHERE MENU_GENE_EMPR_ID_TP = 0');
        sql.Add('AND   MENU_GENE_TGEN_ID_TP = 1');
        sql.Add('AND   MENU_GENE_ID_TP      = 1');
        sql.Add('AND   MENU_MENU_ID         = ' + strMenu_ID);
        sql.Add('ORDER BY 2');
        Open;
        if not IsEmpty then begin
          while not eof do begin
            AdicionaPermissao(qryCons.Fields[0].AsString);
            AdicionaFilhosPermissao(qryCons.Fields[0].AsString);
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'AdicionaFilhosPermissao',funcLocal.User_Login,e.Message);
      funcLocal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Usuario.btnAtrib_EmprClick(Sender: TObject);
var
  intI : Integer;
  strUser : String;
begin
  try
    try
      strUser := cdsLocal.FieldByName('USER_ID').AsString;
      if cdsLocal.State in [dsinsert,dsedit] then
        if ValidaDados(1) then
          cdsLocal.ApplyUpdates(-1)
        else begin
          IsValidData;
          Exit;
        end;
      if treeEmpr_Disp.Selected <> nil then begin
        for intI := 0 to treeEmpr_Disp.Items.Count - 1 do begin
          if not JaExiste(IntToStr(Integer(treeEmpr_Disp.Selections[intI].Data)),cdsLocal.FieldByName('USER_ID').AsString) then begin
            AdicionaEmpresa(IntToStr(Integer(treeEmpr_Disp.Selections[intI].Data)),strUser);
          end;
        end;
      end;
    except
    end;
  finally
    MenusEmpresasPermissao;
  end;
end;

procedure TfCad_Usuario.AdicionaEmpresa(strEmpr_ID, strUser_ID : String);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    if dmUsuarios.cdsUsuario.State in [dsEdit,dsInsert] then
      dmUsuarios.cdsUsuario.ApplyUpdates(-1);
    dmUsuarios.cdsUsuario.Edit;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          funcLocal.StartCommit;
        except
        end;
        sql.Add('INSERT INTO USUARIO_EMPR VALUES( ' + funcLocal.ObterSequencia('USUARIO_EMPR',IntToStr(funcLocal.Empr_ID)) + ','
                                                    + strUser_ID + ','
                                                    + strEmpr_ID + ')');
        ExecSQL;
        try
          funcLocal.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcLocal.RollBack;
      funcLocal.ReportaErro(Caption,'AdicionaEmpresa',funcLocal.User_Login,e.Message);
      funcLocal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfCad_Usuario.JaExiste(strEmpr_ID, strUser_ID : String) : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      USEP_ID');
        sql.Add('FROM  USUARIO_EMPR');
        sql.Add('WHERE USEP_USER_ID = ' + strUser_ID);
        sql.Add('AND   USEP_EMPR_ID = ' + strEmpr_ID);
        Open;
        if not IsEmpty then
          Result    := true
        else Result := false;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'JaExiste',funcLocal.User_Login,e.Message);
      funcLocal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Usuario.Label15Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(153);
end;

procedure TfCad_Usuario.btnOkClick(Sender: TObject);
begin
  if ValidaDados then begin
    try
      cdsLocal.Edit;
      cdsLocal.FieldByName('USER_SENHA').AsString := funcLocal.Criptografar(Trim(cdsLocal.FieldByName('USER_SENHA').AsString));
      inherited;
      SalvarTecnicosVisiveis();
      edtConfirma.Clear;
    except on e: exception do
      funcLocal.ReportaErro(Caption,'btnOK',e.Message);
    end;
  end else IsValidData;
end;

procedure TfCad_Usuario.CarregarTecnicosVisiveis();
begin
  try
    frPesqTecnico.Limpar;
    with dmUsuarios.cdsProfissionais do begin
      First;
      while not Eof do begin
        frPesqTecnico.edtCodigo.Text := (FieldByName('USPR_USER_ID_PROFISSIONAL').AsString);
        frPesqTecnico.edtCodigo.Modified := true;
        frPesqTecnico.edtCodigoExit(Self);
        Next;
      end;
    end;
  except
  end;
end;

procedure TfCad_Usuario.SalvarTecnicosVisiveis();
var
  strTMP : String;
  strID  : String;
  qryCons : TSQLQuery;
  SQL     : String;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('DELETE FROM USUARIO_PROFISSIONAIS WHERE USPR_USER_ID_USUARIO = :USER_ID');
      Params.ParamByName('USER_ID').AsInteger := cdsLocal.FieldByName('USER_ID').AsInteger;
      ExecSQL();
      if not frPesqTecnico.TemRegistros then Exit;
      strTMP := frPesqTecnico.InGrid();
      strTMP := Copy(strTMP,6,Length(strTMP));
      strTMP := Copy(strTMP,1,Length(strTMP)-1);
      while Length(strTMP)>0 do begin
        strID := Copy(strTMP,1,6);
        qryCons.sql.Clear;
        qryCons.sql.Add('INSERT INTO USUARIO_PROFISSIONAIS(USPR_ID,USPR_USER_ID_USUARIO,USPR_USER_ID_PROFISSIONAL,USPR_DTA_CADASTRO,USPR_USER_ID)');
        qryCons.SQL.Add('VALUES(:USPR_ID,:USPR_USER_ID_USUARIO,:USPR_USER_ID_PROFISSIONAL,:USPR_DTA_CADASTRO,:USPR_USER_ID)');
        qryCons.Params.ParamByName('USPR_ID').AsInteger := funcLocal.ObterSequencia('USUARIO_PROFISSIONAIS',funcLocal.Empr_ID);
        qryCons.Params.ParamByName('USPR_USER_ID_USUARIO').AsInteger := cdsLocal.FieldByName('USER_ID').AsInteger;
        qryCons.Params.ParamByName('USPR_USER_ID_PROFISSIONAL').AsString := strID;
        qryCons.Params.ParamByName('USPR_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor;
        qryCons.Params.ParamByName('USPR_USER_ID').AsInteger := funcLocal.User_ID;
        qryCons.ExecSQL();
        System.Delete(strTMP,1,7);
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;

end;

procedure TfCad_Usuario.btnPesqClick(Sender: TObject);
var
  strTMP : String;
begin
  strTMP := funcLocal.Busca_Registro(dmUsuarios.cdsPesq_Praca,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('USER_GENE_ID_PRACA').AsString := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('GENE_DESCR').AsString := funcLocal.Buscar_Coluna(strTMP,2);
    cdsLocal.FieldByName('GENE_PAR1').AsString := funcLocal.Buscar_Coluna(strTMP,3);
    dmUsuarios.cdsPesq_Praca.Close;
    dmUsuarios.cdsPesq_Praca.Open;
    edtCodigo.Modified := true;
  end else begin
    cdsLocal.FieldByName('USER_GENE_ID_PRACA').AsString := '';
    cdsLocal.FieldByName('GENE_DESCR').AsString := '';
    cdsLocal.FieldByName('GENE_PAR1').AsString := '';
  end;
  edtCodigo.SetFocus;
end;

procedure TfCad_Usuario.btnRetiraPermissaoClick(Sender: TObject);
var
  intI : Integer;
begin
  try
    try
      if treePerm_Usuario.Selected <> nil then begin
        for intI := 0 to treePerm_Usuario.Items.Count - 1 do begin
          DeletaFilhosMenu(IntToStr(Integer(treePerm_Usuario.Selections[intI].Data)),IntToStr(integer(cmbEmpresa.Items.Objects[cmbEmpresa.ItemIndex])));
          DeletaMenu(IntToStr(Integer(treePerm_Usuario.Selections[intI].Data)),IntToStr(integer(cmbEmpresa.Items.Objects[cmbEmpresa.ItemIndex])));
        end;
      end;
    except
    end;
  finally
    MenusPermissoesAtribuidas(IntToStr(integer(cmbEmpresa.Items.Objects[cmbEmpresa.ItemIndex])));
  end;
end;

procedure TfCad_Usuario.DeletaMenu(strMenu_ID, strEmpr_Id : String);
var
  qryCons : TSQLQuery;
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
        sql.Add('DELETE FROM USUARIO_M');
        sql.Add('WHERE  USRM_EMPR_ID = ' + strEmpr_Id);
        sql.Add('AND    USRM_USER_ID = ' + cdsLocal.FieldByName('USER_ID').AsString);
        sql.Add('AND    USRM_MENU_ID = ' + strMenu_ID);
        ExecSQL;
        try
          funcLocal.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcLocal.RollBack;
      funcLocal.ReportaErro(Caption,'DeletaMenu',funcLocal.User_Login,e.Message);
      funcLocal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Usuario.edtCodigoExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCodigo.Modified then Exit;
  dmUsuarios.cdsPesq_Praca.Close;
  dmUsuarios.cdsPesq_Praca.Open;
  if edtCodigo.Text <> '' then begin
    strTMP := funcLocal.Busca_Registro(dmUsuarios.cdsPesq_Praca,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1','GENE_ID = ' + edtCodigo.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('USER_GENE_ID_PRACA').AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('GENE_DESCR').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('GENE_PAR1').AsString := funcLocal.Buscar_Coluna(strTMP,3);
    end else begin
      cdsLocal.FieldByName('USER_GENE_ID_PRACA').AsString := '';
      cdsLocal.FieldByName('GENE_DESCR').AsString := '';
      cdsLocal.FieldByName('GENE_PAR1').AsString := '';
    end;
  end else begin
    cdsLocal.FieldByName('USER_GENE_ID_PRACA').AsString := '';
    cdsLocal.FieldByName('GENE_DESCR').AsString := '';
    cdsLocal.FieldByName('GENE_PAR1').AsString := '';
  end;
end;

procedure TfCad_Usuario.edtCodigoKeyPress(Sender: TObject; var Key: Char);
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

procedure TfCad_Usuario.edtTelefone2Exit(Sender: TObject);
begin
  inherited;
  cdsLocal.FieldByName( (Sender as TDBEdit).DataField ).AsString := funcLocal.TrataTelefone( cdsLocal.FieldByName( (Sender as TDBEdit).DataField ).AsString );
end;

procedure TfCad_Usuario.DeletaFilhosMenu(strMenu_ID, strEmpr_Id : String);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      M.MENU_ID');
        sql.Add('FROM  MENU M');
        sql.Add('INNER JOIN USUARIO_M U');
        sql.Add('ON (M.MENU_ID = U.USRM_MENU_ID)');
        sql.Add('WHERE U.USRM_EMPR_ID = ' + strEmpr_Id);
        sql.Add('AND   U.USRM_USER_ID = ' + cdsLocal.FieldByName('USER_ID').AsString);
        sql.Add('AND   M.MENU_MENU_ID = ' + strMenu_ID);
        Open;
        if not IsEmpty then begin
          while not eof do begin
            DeletaFilhosMenu(qryCons.Fields[0].AsString,strEmpr_Id);
            DeletaMenu(qryCons.Fields[0].AsString,strMenu_ID);
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'DeletaFilhosMenu',funcLocal.User_Login,e.Message);
      funcLocal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Usuario.btnRet_EmprClick(Sender: TObject);
var
  intI : Integer;
begin
  try
    try
      if treeEmpr_Perm.Selected <> nil then begin
        for intI := 0 to treeEmpr_Perm.Items.Count - 1 do begin
          RetiraEmpresa(IntToStr(Integer(treeEmpr_Perm.Selections[intI].Data)),cdsLocal.FieldByName('USER_ID').AsString)
        end;
      end;
    except
    end;
  finally
    MenusEmpresasPermissao;
  end;
end;

procedure TfCad_Usuario.cmbEmpresaClick(Sender: TObject);
begin
  try
    funcLocal.MSGAguarde();
    MenusPermissoesAtribuidas(IntToStr(integer(cmbEmpresa.Items.Objects[cmbEmpresa.ItemIndex])));
  finally
    funcLocal.MSGAguarde(false);
  end;
end;

procedure TfCad_Usuario.RetiraEmpresa(strEmpr_ID, strUser_ID : String);
var
  qryCons : TSQLQuery;
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
        sql.Add('DELETE FROM USUARIO_EMPR');
        sql.Add('WHERE USEP_USER_ID = ' + strUser_ID);
        sql.Add('AND   USEP_EMPR_ID = ' + strEmpr_ID);
        ExecSQL;
        try
          funcLocal.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcLocal.RollBack;
      funcLocal.ReportaErro(Caption,'RetiraEmpresa',funcLocal.User_Login,e.Message);
      funcLocal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Usuario.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Label15Click(Sender);
  edtCodigo.SetFocus;
end;

function TfCad_Usuario.ValidaDados(intPos : Integer = 99) : Boolean;
var
  strFone : Array[0..3] of String;

function JaExiste : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(USER_ID)');
        sql.Add('FROM  USUARIO');
        sql.Add('WHERE USER_LOGIN = ' + QuotedStr(cdsLocal.FieldByName('USER_LOGIN').AsString));
        sql.Add('AND   USER_ID   <> ' + cdsLocal.FieldByName('USER_ID').AsString);
        Open;
        Result := (qryCons.Fields[0].AsInteger > 0)
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'JaExiste',e.Message);
      funcLocal.Alerta('Erro no processo de validação do registro.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

begin
  Result := true;
  try
    if edtNome.Text = '' then begin
      funcLocal.Alerta('Informe o nome do usuário antes de continuar.',1);
      pageCadastro.Pages[0].Show;
      edtNome.SetFocus;
      Result := false;
      Exit;
    end;
    if edtCodigo.Text = '' then begin
      funcLocal.Alerta('Informe a praça do usuário antes de continuar.',1);
      pageCadastro.Pages[0].Show;
      edtCodigo.SetFocus;
      Result := false;
      Exit;
    end;

    strFone[0] := cdsLocal.FieldByName('USER_TELEFONE1').AsString;
    strFone[1] := cdsLocal.FieldByName('USER_TELEFONE2').AsString;
    strFone[2] := cdsLocal.FieldByName('USER_TELEFONE3').AsString;
    strFone[3] := cdsLocal.FieldByName('USER_TELEFONE4').AsString;

    if (Length(strFone[0]) < 13) and
       (Length(strFone[1]) < 13) and
       (Length(strFone[2]) < 13) and
       (Length(strFone[3]) < 13) then begin
      funcLocal.Alerta('Informe pelo menos um telefone de contato deste usuário antes de continuar.',1);
      pageCadastro.Pages[0].Show;
      edtTelefone1.SetFocus;
      Result := false;
      Exit;
    end;
    if edtLogin.Text = '' then begin
      funcLocal.Alerta('Informe o login de acesso antes de continuar.',1);
      pageCadastro.Pages[0].Show;
      edtLogin.SetFocus;
      Result := false;
      Exit;
    end;
    if edtSenha.Text = '' then begin
      funcLocal.Alerta('Informe a senha de acesso antes de continuar.',1);
      pageCadastro.Pages[0].Show;
      edtSenha.SetFocus;
      Result := false;
      Exit;
    end;
    if edtConfirma.Text = '' then begin
      funcLocal.Alerta('Confirme a senha de acesso antes de continuar.',1);
      pageCadastro.Pages[0].Show;
      edtConfirma.SetFocus;
      Result := false;
      Exit;
    end;
    if Trim(edtSenha.Text) <> Trim(edtSenha.Text) then begin
      funcLocal.Alerta('A senha informada não confere, tente novamente.',1);
      pageCadastro.Pages[0].Show;
      edtSenha.SetFocus;
      Result := false;
      Exit;
    end;
    if JaExiste then begin
      funcLocal.Alerta('Já consta um usuário cadastrado para o login informado, verifique a possibilidade de outro login antes de continuar.',1);
      Result := false;
      Exit;
    end;
    if intPos = 99 then begin
      if treeEmpr_Perm.Items.Count <= 0 then begin
        funcLocal.Alerta('Atribua pelo menos uma empresa ao usuário antes de continuar.',1);
        pageCadastro.Pages[1].Show;
        Result := false;
        Exit;
      end;
    end;
  except
  end;
end;

procedure TfCad_Usuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseClientDataSet(dmUsuarios,'cdsUsuario');
  inherited;
  funcLocal.LimitarProfNoSistema := LimitarProfissionais;
end;

procedure TfCad_Usuario.FormShow(Sender: TObject);
begin
  inherited;
  OpenClientDataSet;
  edtNome.SetFocus;
  try
    cdsLocal.FieldByName('USER_SENHA').AsString := Trim(funcLocal.Criptografar(cdsLocal.FieldByName('USER_SENHA').AsString));
    edtConfirma.Text := Trim(cdsLocal.FieldByName('USER_SENHA').AsString);
  except
  end;
  LimitarProfissionais := funcLocal.LimitarProfNoSistema;
  funcLocal.LimitarProfNoSistema := false;
  CarregarTecnicosVisiveis();
end;

procedure TfCad_Usuario.OpenClientDataSet;
begin
  try
    MenusEmpresasDisponiveis;
    MenusEmpresasPermissao;
    MenusPermissoesDisponiveis;
    treePerm_Usuario.Items.Clear;
  except on e: exception do
    funcLocal.ReportaErro(Caption,'OpenClientDataSet',funcLocal.User_Login,e.Message);
  end;
end;

procedure TfCad_Usuario.MenusPermissoesAtribuidas(strEmpr_ID : String);
var
  qryCons  : TSQLQuery;
  treeItem : TTreeNode;
begin
  try
    treePerm_Usuario.Items.Clear;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      M.MENU_ID,');
        sql.Add('      M.MENU_CODIGO,');
        sql.Add('      M.MENU_DESCRICAO');
        sql.Add('FROM  MENU M');
        sql.Add('INNER JOIN USUARIO_M U');
        sql.Add('ON (M.MENU_ID = U.USRM_MENU_ID)');
        sql.Add('WHERE M.MENU_ATIVO           = 1');
        sql.Add('AND   M.MENU_GENE_EMPR_ID_TP = 0');
        sql.Add('AND   M.MENU_GENE_TGEN_ID_TP = 1');
        sql.Add('AND   M.MENU_GENE_ID_TP      = 1');
        sql.Add('AND   M.MENU_MENU_ID         IS NULL');
        sql.Add('AND   U.USRM_USER_ID         = ' + cdsLocal.FieldByName('USER_ID').AsString);
        sql.Add('AND   U.USRM_EMPR_ID         = ' + strEmpr_ID);
        sql.Add('ORDER BY 2');
        Open;
        if not IsEmpty then begin
          while not eof do begin
            treeItem := treePerm_Usuario.Items.Add(nil,qryCons.Fields[1].AsString + ' - ' + qryCons.Fields[2].AsString);
            with treeItem do begin
              SelectedIndex := 1;
              StateIndex    := 2;
              ImageIndex    := 2;
            end;
            treeItem.Data := Pointer(qryCons.Fields[0].AsInteger);
            AdicionaSubPermissoes(treeItem,qryCons.Fields[0].AsString,strEmpr_ID);
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'MenusPermissoesAtribuidas',funcLocal.User_Login,e.Message);
      funcLocal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Usuario.AdicionaSubPermissoes(treeItem : TTreeNode; strMenu_ID, strEmpr_ID : String);
var
  qryCons : TSQLQuery;
  treeNew : TTreeNode;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      M.MENU_ID,');
        sql.Add('      M.MENU_CODIGO,');
        sql.Add('      M.MENU_DESCRICAO');
        sql.Add('FROM  MENU M');
        sql.Add('INNER JOIN USUARIO_M U');
        sql.Add('ON (M.MENU_ID = U.USRM_MENU_ID)');
        sql.Add('WHERE M.MENU_ATIVO           = 1');
        sql.Add('AND   M.MENU_GENE_EMPR_ID_TP = 0');
        sql.Add('AND   M.MENU_GENE_TGEN_ID_TP = 1');
        sql.Add('AND   M.MENU_GENE_ID_TP      = 1');
        sql.Add('AND   M.MENU_MENU_ID         = ' + strMenu_ID);
        sql.Add('AND   U.USRM_USER_ID         = ' + cdsLocal.FieldByName('USER_ID').AsString);
        sql.Add('AND   U.USRM_EMPR_ID         = ' + strEmpr_ID);
        sql.Add('ORDER BY 2');
        Open;
        if not IsEmpty then begin
          while not eof do begin
            treeNew := treePerm_Usuario.Items.AddChild(treeItem,qryCons.Fields[1].AsString + ' - ' + qryCons.Fields[2].AsString);
            with treeNew do begin
              SelectedIndex := 1;
              StateIndex    := 2;
              ImageIndex    := 2;
            end;
            treeNew.Data := Pointer(qryCons.Fields[0].AsInteger);
            AdicionaSubPermissoes(treeNew,qryCons.Fields[0].AsString,strEmpr_ID);
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'AdicionaSubPermissoes',funcLocal.User_Login,e.Message);
      funcLocal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Usuario.MenusPermissoesDisponiveis;
var
  qryCons  : TSQLQuery;
  treeItem : TTreeNode;
begin
  try
    treePerm_Disp.Items.Clear;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      MENU_ID,');
        sql.Add('      MENU_CODIGO,');
        sql.Add('      MENU_DESCRICAO');
        sql.Add('FROM  MENU');
        sql.Add('WHERE MENU_ATIVO           = 1');
        sql.Add('AND   MENU_GENE_EMPR_ID_TP = 0');
        sql.Add('AND   MENU_GENE_TGEN_ID_TP = 1');
        sql.Add('AND   MENU_GENE_ID_TP      = 1');
        sql.Add('AND   MENU_MENU_ID         IS NULL');
        sql.Add('ORDER BY 2');
        Open;
        if not IsEmpty then begin
          while not eof do begin
            treeItem := treePerm_Disp.Items.Add(nil,qryCons.Fields[1].AsString + ' - ' + qryCons.Fields[2].AsString);
            with treeItem do begin
              SelectedIndex := 0;
              ImageIndex    := 2;
              StateIndex    := 2;
            end;
            treeItem.Data := Pointer(qryCons.Fields[0].AsInteger);
            AdicionaSubMenus(treeItem,qryCons.Fields[0].AsString);
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'MenusPermissoesDisponiveis',funcLocal.User_Login,e.Message);
      funcLocal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Usuario.AdicionaSubMenus(treeItem : TTreeNode; strMenu_ID : String);
var
  qryCons : TSQLQuery;
  treeNew : TTreeNode;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      MENU_ID,');
        sql.Add('      MENU_CODIGO,');
        sql.Add('      MENU_DESCRICAO');
        sql.Add('FROM  MENU');
        sql.Add('WHERE MENU_ATIVO           = 1');
        sql.Add('AND   MENU_GENE_EMPR_ID_TP = 0');
        sql.Add('AND   MENU_GENE_TGEN_ID_TP = 1');
        sql.Add('AND   MENU_GENE_ID_TP      = 1');
        sql.Add('AND   MENU_MENU_ID         = ' + strMenu_ID);
        sql.Add('ORDER BY 2');
        Open;
        if not IsEmpty then begin
          while not eof do begin
            treeNew := treePerm_Disp.Items.AddChild(treeItem,qryCons.Fields[1].AsString + ' - ' + qryCons.Fields[2].AsString);
            with treeNew do begin
              SelectedIndex := 0;
              ImageIndex    := 2;
              StateIndex    := 2;
            end;
            treeNew.Data := Pointer(qryCons.Fields[0].AsInteger);
            AdicionaSubMenus(treeNew,qryCons.Fields[0].AsString);
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'AdicionaSubMenus',funcLocal.User_Login,e.Message);
      funcLocal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Usuario.treeEmpr_DispDblClick(Sender: TObject);
begin
  inherited;
  btnAtrib_Empr.Click;
end;

procedure TfCad_Usuario.treeEmpr_DispKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 32 then begin
    btnAtrib_Empr.Click;
    key := 0;
  end;
end;

procedure TfCad_Usuario.treeEmpr_PermDblClick(Sender: TObject);
begin
  inherited;
  btnRet_Empr.Click;
end;

procedure TfCad_Usuario.treeEmpr_PermKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 32 then begin
    btnRet_Empr.Click;
    key := 0;
  end;
end;

procedure TfCad_Usuario.treePerm_DispKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 32 then begin
    btnAtribuirPermissao.Click;
    key := 0;
  end;
end;

procedure TfCad_Usuario.treePerm_UsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 32 then begin
    btnRetiraPermissao.Click;
    key := 0;
  end;
end;

procedure TfCad_Usuario.MenusEmpresasPermissao;
var
  qryCons  : TSQLQuery;
  treeNew : TTreeNode;
begin
  try
    treeEmpr_Perm.Items.Clear;
    cmbEmpresa.Items.Clear;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      E.EMPR_ID,');
        sql.Add('      E.EMPR_RAZAO_SOCIAL');
        sql.Add('FROM  EMPRESAS E');
        sql.Add('INNER JOIN USUARIO_EMPR U');
        sql.Add('ON (E.EMPR_ID = U.USEP_EMPR_ID)');
        sql.Add('WHERE E.EMPR_ATIVO   = 1');
        sql.Add('AND   U.USEP_USER_ID = ' + cdsLocal.FieldByName('USER_ID').AsString);
        sql.Add('ORDER BY 1');
        Open;
        if not IsEmpty then begin
          while not Eof do begin
            treeNew := treeEmpr_Perm.Items.Add(nil,qryCons.Fields[0].AsString + ' - ' + qryCons.Fields[1].AsString);
            with treeNew do begin
              SelectedIndex := 1;
              ImageIndex    := 2;
              StateIndex    := 2;
            end;
            treeNew.Data := Pointer(qryCons.Fields[0].AsInteger);
            cmbEmpresa.Items.AddObject(qryCons.Fields[1].AsString,TObject(qryCons.Fields[0].AsInteger));
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'MenusEmpresasPermissao',funcLocal.User_Login,e.Message);
      funcLocal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Usuario.MenusEmpresasDisponiveis;
var
  qryCons  : TSQLQuery;
  treeItem : TTreeNode;
begin
  try
    treeEmpr_Disp.Items.Clear;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      EMPR_ID,');
        sql.Add('      EMPR_RAZAO_SOCIAL');
        sql.Add('FROM  EMPRESAS');
        sql.Add('WHERE EMPR_ATIVO = 1');
        sql.Add('ORDER BY 1');
        Open;
        if not IsEmpty then begin
          while not Eof do begin
            treeItem := treeEmpr_Disp.Items.Add(nil,qryCons.Fields[0].AsString + ' - ' + qryCons.Fields[1].AsString);
            with treeItem do begin
              SelectedIndex := 0;
              ImageIndex    := 2;
              StateIndex    := 2;
            end;
            treeItem.Data := Pointer(qryCons.Fields[0].AsInteger);
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'MenusEmpresasDisponiveis',funcLocal.User_Login,e.Message);
      funcLocal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

initialization
  if fCad_Usuario = nil then
    fCad_Usuario := TfCad_Usuario.Create(nil);
finalization
  FreeAndNil(fCad_Usuario);

end.
