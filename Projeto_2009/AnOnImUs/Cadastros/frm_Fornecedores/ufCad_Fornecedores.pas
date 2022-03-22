unit ufCad_Fornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, DB,
  rxToolEdit, RXDBCtrl, Mask, SQLExpr;

type
  TfCad_Fornecedores = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    rdAtivo: TDBRadioGroup;
    Label3: TLabel;
    edtRazao: TDBEdit;
    Label4: TLabel;
    edtFantasia: TDBEdit;
    Label7: TLabel;
    edtCEP: TDBEdit;
    Label8: TLabel;
    edtEndereco: TDBEdit;
    Label9: TLabel;
    edtBairro: TDBEdit;
    Label10: TLabel;
    edtCod_Praca: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    btnPesq_Praca: TSpeedButton;
    Label15: TLabel;
    Label14: TLabel;
    edtTelefone: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    rdTipo: TDBRadioGroup;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    edtCNPJ: TDBEdit;
    edtIncricao: TDBEdit;
    DBEdit12: TDBEdit;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    btnImportar: TSpeedButton;
    procedure rdTipoClick(Sender: TObject);
    procedure edtCNPJEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtCod_PracaKeyPress(Sender: TObject; var Key: Char);
    procedure edtCod_PracaExit(Sender: TObject);
    procedure btnPesq_PracaClick(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure edtFantasiaEnter(Sender: TObject);
    procedure edtTelefoneExit(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
  private
    procedure OpcoesRadio;
    function ValidaDados: Boolean;
    procedure OpenClientDataSet;
    function JaExiste: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Fornecedores: TfCad_Fornecedores;

implementation

uses udmFornecedores;

{$R *.dfm}

procedure TfCad_Fornecedores.btnImportarClick(Sender: TObject);
var
  qryCons : TSQLQuery;
begin
  inherited;
  if (cdsLocal.State in [dsInsert]) then Exit;
  if funcLocal.Alerta('Confirma a importação do registro selecionado?',1,true) = 6 then begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT COUNT(*) AS QTDE');
        sql.Add('  FROM CLIENTES');
        sql.Add(' WHERE CLIE_CNPJ_CPF = ' + QuotedStr(cdsLocal.FieldByName('FORN_CNPJ_CPF').AsString));
        Open;
        if qryCons.Fields[0].AsInteger > 0 then begin
          if not (funcLocal.Alerta('Registro já existente para o CPF/CNPJ informado, deseja importa-lo assim mesmo?',1,true) = 6) then begin
            Exit;
          end;
        end;
        try
          Close;
          sql.Clear;
          sql.Add('INSERT INTO CLIENTES(');
          sql.Add('                     CLIE_ID,');
          sql.Add('                     CLIE_EMPR_ID,');
          sql.Add('                     CLIE_RAZAO_SOCIAL,');
          sql.Add('                     CLIE_FANTASIA,');
          sql.Add('                     CLIE_CNPJ_CPF,');
          sql.Add('                     CLIE_RG,');
          sql.Add('                     CLIE_CEP,');
          sql.Add('                     CLIE_ENDERECO,');
          sql.Add('                     CLIE_BAIRRO,');
          sql.Add('                     CLIE_GENE_EMPR_ID_PRACA,');
          sql.Add('                     CLIE_GENE_TGEN_ID_PRACA,');
          sql.Add('                     CLIE_GENE_ID_PRACA,');
          sql.Add('                     CLIE_TELEFONE1,');
          sql.Add('                     CLIE_TELEFONE2,');
          sql.Add('                     CLIE_SITE,');
          sql.Add('                     CLIE_EMAIL,');
          sql.Add('                     CLIE_ATIVO,');
          sql.Add('                     CLIE_TIPO,');
          sql.Add('                     CLIE_OBS,');
          sql.Add('                     CLIE_DTA_CADASTRO,');
          sql.Add('                     CLIE_USER_ID)');
          sql.Add('              SELECT '+funcLocal.ObterSequencia('CLIENTES',IntToStr(funcLocal.Empr_ID))+',');
          SQL.Add(                      IntToStr(funcLocal.Empr_ID)+',');
          sql.Add('                     FORN_RAZAO_SOCIAL,');
          sql.Add('                     FORN_NOME_FANTASIA,');
          sql.Add('                     FORN_CNPJ_CPF,');
          sql.Add('                     FORN_IE,');
          sql.Add('                     FORN_CEP,');
          sql.Add('                     FORN_ENDERECO,');
          sql.Add('                     FORN_BAIRRO,');
          sql.Add('                     FORN_GENE_EMPR_ID_PRACA,');
          sql.Add('                     FORN_GENE_TGEN_ID_PRACA,');
          sql.Add('                     FORN_GENE_ID_PRACA,');
          sql.Add('                     FORN_TELEFONE,');
          sql.Add('                     FORN_FAX,');
          sql.Add('                     FORN_SITE,');
          sql.Add('                     FORN_EMAIL,');
          sql.Add('                     FORN_ATIVO,');
          sql.Add('                     FORN_TIPO,');
          sql.Add('                     FORN_OBS,');
          sql.Add('                     FORN_DTA_CADASTRO,');
          sql.Add('                     FORN_USER_ID');
          sql.Add('                FROM FORNECEDORES');
          sql.Add('               WHERE FORN_ID      = ' + cdsLocal.FieldByName('FORN_ID').AsString);
          ExecSQL();
        except on e: exception do begin
          funcLocal.Alerta('Erro na importação!'+#13+#13+
                           E.Message ,0);
          Exit;
        end; end;
        funcLocal.Alerta('I N F O R M A Ç Ã O ! ! !'+#13+#13+
                         'Importação realizadas com sucesso!',1);
      end;
    finally
      FreeAndNil(qryCons);
    end;
  end;
end;

procedure TfCad_Fornecedores.btnOkClick(Sender: TObject);
begin
  if ValidaDados then begin
    funcLocal.ReplicaCadastro(cdsLocal);
    inherited;
    edtCNPJ.SetFocus;
  end else IsValidData;
end;

function TfCad_Fornecedores.JaExiste : Boolean;
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
        sql.Add('      COUNT(FORN_ID)');
        sql.Add('FROM  FORNECEDORES');
        sql.Add('WHERE FORN_CNPJ_CPF = ' + QuotedStr(cdsLocal.FieldByName('FORN_CNPJ_CPF').AsString));
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

function TfCad_Fornecedores.ValidaDados : Boolean;
var
  strFone : String;
begin
  Result := true;
  if (Trim(edtCNPJ.Text) = '.   .   -') and (Trim(edtCNPJ.Text) = '.   .   /    -') then begin
    funcLocal.Alerta('Informe o CPF/CNPJ do fornecedor antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtCNPJ.SetFocus;
    Result := false;
    Exit;
  end;
  if edtRazao.Text = '' then begin
    funcLocal.Alerta('Informe a razão social do fornecedor antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtRazao.SetFocus;
    Result := false;
    Exit;
  end;
  if edtFantasia.Text = '' then begin
    funcLocal.Alerta('Informe o nome fantasia do fornecedor antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtFantasia.SetFocus;
    Result := false;
    Exit;
  end;
  if (edtCNPJ.Text = '  .   .   /    -  ') or (edtCNPJ.Text = '   .   .   -  ') then begin
    funcLocal.Alerta('Informe o CPF/CNPJ do fornecedor antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtCNPJ.SetFocus;
    Result := false;
    Exit;
  end;
  if edtEndereco.Text = '' then begin
    funcLocal.Alerta('Informe o endereço do fornecedor antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtEndereco.SetFocus;
    Result := false;
    Exit;
  end;
  if edtBairro.Text = '' then begin
    funcLocal.Alerta('Informe o bairro antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtBairro.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCEP.Text = '  .   -   ' then begin
    funcLocal.Alerta('Informe o Cep antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtCEP.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCod_Praca.Text = '' then begin
    funcLocal.Alerta('Informe a praça antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtCod_Praca.SetFocus;
    Result := false;
    Exit;
  end;

  strFone := Trim(cdsLocal.FieldByName('FORN_TELEFONE').AsString);

  if Length(strFone) < 13 then begin
    funcLocal.Alerta('Informe o telefone de contato antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtTelefone.SetFocus;
    Result := false;
    Exit;
  end;
  if cdsLocal.State = dsInsert then begin
    if JaExiste then begin
      funcLocal.Alerta('Já consta um fornecedor para o CNPJ/CPF informado.',1);
      pageCadastro.Pages[0].Show;
    end;
  end;
end;

procedure TfCad_Fornecedores.btnPesq_PracaClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet;
  with dmFornecedores do begin
    strTMP := funcLocal.Busca_Registro(cdsPesq_Praca,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1','');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('FORN_GENE_ID_PRACA').AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('CIDADE').AsString             := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('UF').AsString                 := funcLocal.Buscar_Coluna(strTMP,3);
      edtCod_Praca.Modified := true;
    end else begin
      cdsLocal.FieldByName('FORN_GENE_ID_PRACA').AsString := '';
      cdsLocal.FieldByName('CIDADE').AsString             := '';
      cdsLocal.FieldByName('UF').AsString                 := '';
    end;
  end;
  edtCod_Praca.SetFocus;
end;

procedure TfCad_Fornecedores.edtCNPJEnter(Sender: TObject);
begin
  inherited;
  OpcoesRadio;
end;

procedure TfCad_Fornecedores.edtCNPJExit(Sender: TObject);
begin
  inherited;
  if cdsLocal.State = dsInsert then begin
    if JaExiste then begin
      funcLocal.Alerta('Já consta um fornecedor para o CNPJ/CPF informado.',1);
    end;
  end;
end;

procedure TfCad_Fornecedores.edtCod_PracaExit(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet;
  if not edtCod_Praca.Modified then Exit;
  with dmFornecedores do begin
    if edtCod_Praca.Text <> '' then begin
      strTMP := funcLocal.Busca_Registro(cdsPesq_Praca,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1','GENE_ID = ' + edtCod_Praca.Text);
      if strTMP <> '' then begin
        cdsLocal.FieldByName('FORN_GENE_ID_PRACA').AsString := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('CIDADE').AsString             := funcLocal.Buscar_Coluna(strTMP,2);
        cdsLocal.FieldByName('UF').AsString                 := funcLocal.Buscar_Coluna(strTMP,3);
      end else begin
        cdsLocal.FieldByName('FORN_GENE_ID_PRACA').AsString := '';
        cdsLocal.FieldByName('CIDADE').AsString             := '';
        cdsLocal.FieldByName('UF').AsString                 := '';
      end;
    end else begin
      cdsLocal.FieldByName('FORN_GENE_ID_PRACA').AsString := '';
      cdsLocal.FieldByName('CIDADE').AsString             := '';
      cdsLocal.FieldByName('UF').AsString                 := '';
    end;
  end;
end;

procedure TfCad_Fornecedores.edtCod_PracaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then begin
    try
      if Trim(edtCod_Praca.Text) = '' then begin
        if Key = #27 then Exit;
        funcLocal.VlrPesq := Key;
        Key := #0;
        btnPesq_Praca.Click;
      end else Key := #0;
    except
    end;
  end;
end;

procedure TfCad_Fornecedores.edtFantasiaEnter(Sender: TObject);
begin
  inherited;
  if (edtRazao.Text <> '') and (edtFantasia.Text = '') then
    cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := cdsLocal.FieldByName('FORN_RAZAO_SOCIAL').AsString;
end;

procedure TfCad_Fornecedores.edtTelefoneExit(Sender: TObject);
begin
  inherited;
  cdsLocal.FieldByName( (Sender as TDBEdit).DataField ).AsString := funcLocal.TrataTelefone( cdsLocal.FieldByName( (Sender as TDBEdit).DataField ).AsString );
end;

procedure TfCad_Fornecedores.FormShow(Sender: TObject);
begin
  inherited;
  edtCNPJ.SetFocus;
  OpcoesRadio;
  btnImportar.Enabled := not (cdsLocal.State in [dsInsert]);
end;

procedure TfCad_Fornecedores.OpenClientDataSet;
begin
  with dmFornecedores do begin
    with cdsPesq_Praca do begin
      Close;
      Open;
    end;
  end;
end;

procedure TfCad_Fornecedores.Label10Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(153);
end;

procedure TfCad_Fornecedores.rdTipoClick(Sender: TObject);
begin
  inherited;
  OpcoesRadio;
end;

procedure TfCad_Fornecedores.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Label10Click(Sender);
  edtCod_Praca.SetFocus;
end;

procedure TfCad_Fornecedores.OpcoesRadio;
begin
  case rdTipo.ItemIndex of
    0 : cdsLocal.FieldByName('FORN_CNPJ_CPF').EditMask := '###.###.###-##';
    1 : cdsLocal.FieldByName('FORN_CNPJ_CPF').EditMask := '##.###.###/####-##';
  end;
end;

initialization
  if fCad_Fornecedores = nil then  
    fCad_Fornecedores := TfCad_Fornecedores.Create(nil);
finalization
  FreeAndNil(fCad_Fornecedores);

end.
