unit ufCad_Empresas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, Mask,
  rxToolEdit, RXDBCtrl, ExtDlgs, DB, SQLExpr, uFrPesqIndividual;

type
  TfCad_Empresas = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtRazao: TDBEdit;
    Label4: TLabel;
    edtFantasia: TDBEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    edtEndereco: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    edtBairro: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    GroupBox2: TGroupBox;
    DBImage1: TDBImage;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    edtCNPJ: TDBEdit;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label17: TLabel;
    edtTelefone: TDBEdit;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    OpenPictureDialog: TOpenPictureDialog;
    frPesqPraca: TfrPesqIndividual;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBImage1DblClick(Sender: TObject);
    procedure edtCod_PracaKeyPress(Sender: TObject; var Key: Char);
    procedure edtTelefoneExit(Sender: TObject);
  private
    function  ValidaDados: Boolean;
    procedure ConfigSystem(strEmpr_ID: String);
    function  NaoTemConfig: Boolean;
    procedure PreencheFrames;
    procedure TratandoFrames;
    function JaExisteCNPJ(strCNPJ: String): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Empresas: TfCad_Empresas;

implementation

uses udmEmpresas;

{$R *.dfm}

procedure TfCad_Empresas.btnOkClick(Sender: TObject);
var
  boolInsert : Boolean;
  strEmpr_ID : String;
begin
  if ValidaDados then begin
    boolInsert := (cdsLocal.State = dsInsert);
    strEmpr_ID := cdsLocal.FieldByName('EMPR_ID').AsString;
    TratandoFrames;
    inherited;
    if (boolInsert) or (not NaoTemConfig) then begin
      ConfigSystem(strEmpr_ID);
    end;
  end else IsValidData;
end;

procedure TfCad_Empresas.TratandoFrames;
begin
  cdsLocal.Edit;
  cdsLocal.FieldByName('EMPR_GENE_ID_PRACA').AsString := frPesqPraca.InGrid;
end;

function TfCad_Empresas.NaoTemConfig : Boolean;
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
        sql.Add('      COUNT(*)');
        sql.Add('FROM  CONF_SISTEMA');
        sql.Add('WHERE CSIS_EMPR_ID = ' + cdsLocal.FieldByName('EMPR_ID').AsString);
        Open;
        Result := (qryCons.Fields[0].AsInteger > 0);
      end;
    except on e: exception do begin
      funcLocal.ReportaErro('TfCad_Empresas','NaoTemConfig',E.Message);
      funcLocal.Alerta('Erro no processo de validação das configurações da empresa selecionada.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Empresas.ConfigSystem(strEmpr_ID : String);
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
        sql.Add('INSERT INTO CONF_SISTEMA(CSIS_EMPR_ID,');
        sql.Add('                         CSIS_REPORTA_ERROS,');
        sql.Add('                         CSIS_VISUAL_FINANCEIRO,');
        sql.Add('                         CSIS_USER_ID,');
        sql.Add('                         CSIS_DTA_CADASTRO,');
        sql.Add('                         CSIS_JURO,');
        sql.Add('                         CSIS_MORA,');
        sql.Add('                         CSIS_PERCENTE_RENDA,');
        SQL.Add('                         CSIS_ESTOQUE_NEGATIVO,');
        sql.Add('                         CSIS_REAGENDAR_OS,');
        sql.Add('                         CSIS_FORCAR_REAGENDA,');
        sql.Add('                         CSIS_INTEGRAR_PRODUTOS,');
        sql.Add('                         CSIS_INTEGRAR_CLIENTES,');
        sql.Add('                         CSIS_TIPO_MENU)');
        sql.Add('VALUES(' + strEmpr_ID + ','
                          + '0'        + ','
                          + '1'        + ','
                          + IntToStr(funcLocal.User_ID) + ','
                          + QuotedStr(FormatDateTime('mm/dd/yyyy',funcLocal.DataServidor(funcLocal.Conexao))) + ','
                          + '0'        + ','
                          + '0'        + ','
                          + '70'       + ','
                          + '0'        + ','
                          + '0'        + ','
                          + '0'        + ','
                          + '0'        + ','
                          + '0'        + ','
                          + '1'        + ')');
        ExecSQL;
        try
          funcLocal.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcLocal.RollBack;
      funcLocal.ReportaErro(Caption,'ConfigSystem',e.Message);
      funcLocal.Alerta('Erro no processo de criação da empresa.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfCad_Empresas.ValidaDados : Boolean;
begin
  Result := true;
  if edtRazao.Text = '' then begin
    funcLocal.Alerta('Informe a razão social da empresa antes de continuar.',1);
    edtRazao.SetFocus;
    Result := false;
    Exit;
  end;
  if edtFantasia.Text = '' then begin
    funcLocal.Alerta('Informe o nome fantasia da empresa antes de continuar.',1);
    edtFantasia.SetFocus;
    Result := false;
    Exit;
  end;
  if edtEndereco.Text = '' then begin
    funcLocal.Alerta('Informe o endereço antes de continuar.',1);
    edtEndereco.SetFocus;
    Result := false;
    Exit;
  end;
  if edtBairro.Text = '' then begin
    funcLocal.Alerta('Informe o bairro antes de continuar.',1);
    edtBairro.SetFocus;
    Result := false;
    Exit;
  end;
  if not frPesqPraca.TemRegistro then begin
    funcLocal.Alerta('Informe a praça antes de continuar.',1);
    frPesqPraca.SetFocus;
    Result := false;
    Exit;
  end;
  if Length(edtCNPJ.Text) <> 18 then begin
    funcLocal.Alerta('Informe o CNPJ antes de continuar.',1);
    edtCNPJ.SetFocus;
    Result := false;
    Exit;
  end;
  if JaExisteCNPJ(edtCNPJ.Text) then begin
    funcLocal.Alerta('Já consta uma empresa cadastrada para o CNPJ informado.',1);
    edtCNPJ.SetFocus;
    Result := false;
    Exit;
  end;
  if Length(edtTelefone.Text) < 13 then begin
    funcLocal.Alerta('Informe o telefone antes de continuar.',1);
    edtTelefone.SetFocus;
    Result := false;
    Exit;
  end;
end;

function TfCad_Empresas.JaExisteCNPJ(strCNPJ : String) : Boolean;
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
        sql.Add('      COUNT(*)');
        sql.Add('FROM  EMPRESAS');
        sql.Add('WHERE EMPR_CNPJ =  ' + QuotedStr(strCNPJ));
        sql.Add('  AND EMPR_ID  <>  ' + dmEmpresas.cdsEmpresasEMPR_ID.AsString);
        Open;
        Result := (qryCons.Fields[0].AsInteger > 0);
      end;
    except on e: exception do begin
      funcLocal.ReportaErro('TfCad_Empresas','JaExisteCNPJ',E.Message);
      funcLocal.Alerta('Erro no processo de validação das configurações da empresa selecionada.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Empresas.DBImage1DblClick(Sender: TObject);
var
  imgLogo : TBitmap;
begin
  try
    imgLogo := TBitmap.Create;
    if OpenPictureDialog.Execute then begin
      imgLogo.LoadFromFile(OpenPictureDialog.FileName);
      cdsLocal.FieldByName('EMPR_LOGOTIPO').Assign(imgLogo);
    end;
  except on e: exception do begin
    funcLocal.ReportaErro(Caption,(Sender as TComponent).Name,funcLocal.User_Login,e.Message);
    funcLocal.Alerta(e.Message,1);
  end; end;
end;

procedure TfCad_Empresas.edtCod_PracaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
end;

procedure TfCad_Empresas.edtTelefoneExit(Sender: TObject);
begin
  inherited;
  cdsLocal.FieldByName( (Sender as TDBEdit).DataField ).AsString := funcLocal.TrataTelefone( cdsLocal.FieldByName( (Sender as TDBEdit).DataField ).AsString );
end;

procedure TfCad_Empresas.FormShow(Sender: TObject);
begin
  inherited;
  edtRazao.SetFocus;
  PreencheFrames;
end;

procedure TfCad_Empresas.PreencheFrames;
begin
  frPesqPraca.BuscarRegistro(cdsLocal.FieldByName('EMPR_GENE_ID_PRACA').AsString);
end;

initialization
  if fCad_Empresas = nil then  
    fCad_Empresas := TfCad_Empresas.Create(nil);
finalization
  FreeAndNil(fCad_Empresas);

end.
