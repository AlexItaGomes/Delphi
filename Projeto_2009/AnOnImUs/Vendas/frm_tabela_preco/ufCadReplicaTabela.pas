unit ufCadReplicaTabela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufCadastro, Vcl.StdCtrls, Vcl.Buttons, SQLExpr,
  Vcl.ExtCtrls, Vcl.ComCtrls, RxCurrEdit, RxDBCtrl, Vcl.Mask, RxToolEdit, Funcoes,
  uFrPesqIndividual;

type
  TfCadReplicaTabela = class(TfCadastro)
    frPesqTabPrecos: TfrPesqIndividual;
    rdAplicacao: TRadioGroup;
    Label11: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    edtVlrAtacado: TRxCalcEdit;
    edtVlrEspecial: TRxCalcEdit;
    edtVlrGondola: TRxCalcEdit;
    edtVlrMinimo: TRxCalcEdit;
    Label3: TLabel;
    edtTabela: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure rdAplicacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function ValidaDados: Boolean;
    procedure ReplicaTabela;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadReplicaTabela: TfCadReplicaTabela;

implementation

{$R *.dfm}

procedure TfCadReplicaTabela.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfCadReplicaTabela.btnOKClick(Sender: TObject);
begin
  if not ValidaDados() then Exit;
  try
    funcLocal.MSGAguarde();
    ReplicaTabela();
    Self.Close;
  finally
    funcLocal.MSGAguarde(false);
  end;
end;

procedure TfCadReplicaTabela.ReplicaTabela();
var
  sGondola,
  sMinimo,
  sEspecial,
  sAtacado,
  S,
  sPK     : String;
  qryCons : TSQLQuery;
  fltGondola,
  fltMinimo,
  fltEspecial,
  fltAtacado  : Real;
begin
  fltGondola  := edtVlrGondola.Value;
  fltMinimo   := edtVlrMinimo.Value;
  fltEspecial := edtVlrEspecial.Value;
  fltAtacado  := edtVlrAtacado.Value;

  case rdAplicacao.ItemIndex of
    0 : begin
      sGondola  := '0';
      sMinimo   := '0';
      sEspecial := '0';
      sAtacado  := '0';
    end;
    1 : begin
      sGondola  := funcLocal.Se(fltGondola<0 ,'-','') + '(TPIT_VLR_GONDOLA  * ('+ FormatFloat('0.00',(funcLocal.Se(fltGondola<0  ,fltGondola*-1 ,fltGondola)  /100)) +'))';
      sMinimo   := funcLocal.Se(fltMinimo<0  ,'-','') + '(TPIT_VLR_MINIMO   * ('+ FormatFloat('0.00',(funcLocal.Se(fltMinimo<0   ,fltMinimo*-1  , fltMinimo)  /100)) +'))';
      sEspecial := funcLocal.Se(fltEspecial<0,'-','') + '(TPIT_VLR_ESPECIAL * ('+ FormatFloat('0.00',(funcLocal.Se(fltEspecial<0 ,fltEspecial*-1, fltEspecial)/100)) +'))';
      sAtacado  := funcLocal.Se(fltAtacado<0 ,'-','') + '(TPIT_VLR_ATACADO  * ('+ FormatFloat('0.00',(funcLocal.Se(fltAtacado<0  ,fltAtacado*-1 , fltAtacado) /100)) +'))';
    end;
    2 : begin
      sGondola  := FormatFloat('0.00',(fltGondola));
      sMinimo   := FormatFloat('0.00',(fltMinimo));
      sEspecial := FormatFloat('0.00',(fltEspecial));
      sAtacado  := FormatFloat('0.00',(fltAtacado));
    end;
  end;

  sGondola  := StringReplace(StringReplace(sGondola,'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
  sMinimo   := StringReplace(StringReplace(sMinimo,'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
  sEspecial := StringReplace(StringReplace(sEspecial,'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
  sAtacado  := StringReplace(StringReplace(sAtacado,'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);


  S := 'INSERT INTO TABELA_PRECO(TPRC_ID,                   '+
       '                         TPRC_EMPR_ID,              '+
       '                         TPRC_DESCRICAO,            '+
       '                         TPRC_ATIVO,                '+
       '                         TPRC_DTA_CADASTRO,         '+
       '                         TPRC_USER_ID)              '+
       'SELECT %S,                                          '+
       '       TPRC_EMPR_ID,                                '+
       '       ''%S'',                                      '+
       '       TPRC_ATIVO,                                  '+
       '       TPRC_DTA_CADASTRO,                           '+
       '       TPRC_USER_ID                                 '+
       '  FROM TABELA_PRECO                                 '+
       ' WHERE TPRC_ID      = %S                            '+
       '   AND TPRC_EMPR_ID = %S                            ';

  sPK := funcLocal.ObterSequencia('TABELA_PRECO',IntToStr(funcLocal.Empr_ID));
  S := Format(S,[sPK,edtTabela.Text,frPesqTabPrecos.InGrid(),IntToStr(funcLocal.Empr_ID)]);

  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    qryCons.Close;
    qryCons.Sql.Clear;
    qryCons.Sql.Add(S);
    qryCons.ExecSQL();
    S := 'INSERT INTO TABELA_PRECO_ITENS(TPIT_ID,                 '+
         '                               TPIT_EMPR_ID,            '+
         '                               TPIT_TPRC_ID,            '+
         '                               TPIT_TPRC_EMPR_ID,       '+
         '                               TPIT_PROD_ID,            '+
         '                               TPIT_PROD_EMPR_ID,       '+
         '                               TPIT_DTA_VIGENCIA,       '+
         '                               TPIT_DTA_VALIDADE,       '+
         '                               TPIT_VLR_GONDOLA,        '+
         '                               TPIT_VLR_MINIMO,         '+
         '                               TPIT_VLR_ESPECIAL,       '+
         '                               TPIT_VLR_ATACADO,        '+
         '                               TPIT_DTA_CADASTRO,       '+
         '                               TPIT_USER_ID)            '+
         'SELECT (SELECT MAX(TPIT_ID)+1 FROM TABELA_PRECO_ITENS), '+
         '       TPIT_EMPR_ID,                                    '+
         '       %S,                                              '+
         '       TPIT_TPRC_EMPR_ID,                               '+
         '       TPIT_PROD_ID,                                    '+
         '       TPIT_PROD_EMPR_ID,                               '+
         '       ''%S'',                                          '+
         '       ''%S'',                                          '+
         '       TPIT_VLR_GONDOLA+(%S),                           '+
         '       TPIT_VLR_MINIMO+(%S),                            '+
         '       TPIT_VLR_ESPECIAL+(%S),                          '+
         '       TPIT_VLR_ATACADO+(%S),                           '+
         '       TPIT_DTA_CADASTRO,                               '+
         '       TPIT_USER_ID                                     '+
         '  FROM TABELA_PRECO_ITENS                               '+
         ' WHERE TPIT_TPRC_ID            = %S                     '+
         '   AND TPIT_TPRC_EMPR_ID       = %S                     ';

    S := Format(S,[sPK,
                   FormatDateTime('mm/dd/yyyy',edtDtInicio.Date),
                   FormatDateTime('mm/dd/yyyy',edtDtFim.Date),
                   sGondola,
                   sMinimo,
                   sEspecial,
                   sAtacado,
                   frPesqTabPrecos.InGrid(),
                   IntToStr(funcLocal.Empr_ID)]);
    qryCons.Close;
    qryCons.Sql.Clear;
    qryCons.Sql.Add(S);
    qryCons.ExecSQL();
    S := 'UPDATE TABELA_PRECO_ITENS    '+
         '   SET TPIT_VLR_GONDOLA  = 0 '+
         ' WHERE TPIT_VLR_GONDOLA  < 0 ';
    qryCons.Close;
    qryCons.Sql.Clear;
    qryCons.Sql.Add(S);
    qryCons.ExecSQL();

    S := 'UPDATE TABELA_PRECO_ITENS    '+
         '   SET TPIT_VLR_MINIMO   = 0 '+
         ' WHERE TPIT_VLR_MINIMO   < 0 ';
    qryCons.Close;
    qryCons.Sql.Clear;
    qryCons.Sql.Add(S);
    qryCons.ExecSQL();

    S := 'UPDATE TABELA_PRECO_ITENS    '+
         '   SET TPIT_VLR_ESPECIAL = 0 '+
         ' WHERE TPIT_VLR_ESPECIAL < 0 ';
    qryCons.Close;
    qryCons.Sql.Clear;
    qryCons.Sql.Add(S);
    qryCons.ExecSQL();

    S := 'UPDATE TABELA_PRECO_ITENS    '+
         '   SET TPIT_VLR_ATACADO  = 0 '+
         ' WHERE TPIT_VLR_ATACADO  < 0 ';
    qryCons.Close;
    qryCons.Sql.Clear;
    qryCons.Sql.Add(S);
    qryCons.ExecSQL();
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfCadReplicaTabela.ValidaDados() : Boolean;
begin
  Result := false;
  if not frPesqTabPrecos.TemRegistro() then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Necessário informar uma tabela de preço que será aplicado a replicação dos preços!',0);
    frPesqTabPrecos.SetFocus;
    Exit;
  end;
  if Trim(edtTabela.Text) = '' then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Necessário informar um nome a está nova Tabela de Preços antes de continuar!',0);
    edtTabela.SetFocus;
    Exit;
  end;
  if edtDtInicio.Date<=0 then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Necessário informar uma data de virgência Inicial antes de continuar!',0);
    edtTabela.SetFocus;
    Exit;
  end;
  if edtDtInicio.Date<funcLocal.DataServidor() then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Data Inicial não pode ser inferior a data atual!',0);
    edtTabela.SetFocus;
    Exit;
  end;
  if edtDtFim.Date<=0 then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Necessário informar uma data de virgência Final antes de continuar!',0);
    edtDtFim.SetFocus;
    Exit;
  end;
  if edtDtFim.Date<funcLocal.DataServidor() then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Data Final não pode ser inferior a data atual!',0);
    edtDtFim.SetFocus;
    Exit;
  end;
  if edtDtFim.Date<edtDtInicio.Date then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Data Final não pode ser inferior a data Inicial!',0);
    edtDtFim.SetFocus;
    Exit;
  end;
  case rdAplicacao.ItemIndex of
    1,2 : begin
      if (edtVlrGondola.Value = 0) and
         (edtVlrMinimo.Value  = 0) and
         (edtVlrEspecial.Value= 0) and
         (edtVlrAtacado.Value = 0) then begin
        funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Necessário informar valores aos novos preços antes de continuar!',0);
        edtVlrGondola.SetFocus;
        Exit;
      end;
    end;
  end;
  Result := true;
end;

procedure TfCadReplicaTabela.FormCreate(Sender: TObject);
var
  Princ   : TForm;
begin
  Princ := Application.MainForm;
  if Princ <> nil then
    funcLocal := TFuncoes(Princ.FindComponent('funcPrincipal'));
end;

procedure TfCadReplicaTabela.FormShow(Sender: TObject);
begin
  inherited;
  frPesqTabPrecos.SetFocus;
end;

procedure TfCadReplicaTabela.rdAplicacaoClick(Sender: TObject);
begin
  inherited;
  edtVlrAtacado.Enabled   := true;
  edtVlrEspecial.Enabled  := true;
  edtVlrGondola.Enabled   := true;
  edtVlrMinimo.Enabled    := true;
  edtVlrAtacado.MaxValue   := 100;
  edtVlrEspecial.MaxValue  := 100;
  edtVlrGondola.MaxValue   := 100;
  edtVlrMinimo.MaxValue    := 100;
  edtVlrAtacado.MinValue   := -100;
  edtVlrEspecial.MinValue  := -100;
  edtVlrGondola.MinValue   := -100;
  edtVlrMinimo.MinValue    := -100;

  case rdAplicacao.ItemIndex of
    0 : begin
      edtVlrAtacado.Enabled   := False;
      edtVlrEspecial.Enabled  := False;
      edtVlrGondola.Enabled   := False;
      edtVlrMinimo.Enabled    := False;
      edtVlrAtacado.Value     := 0;
      edtVlrEspecial.Value    := 0;
      edtVlrGondola.Value     := 0;
      edtVlrMinimo.Value      := 0;
    end;
    2 : begin
      edtVlrAtacado.MaxValue   := 0;
      edtVlrEspecial.MaxValue  := 0;
      edtVlrGondola.MaxValue   := 0;
      edtVlrMinimo.MaxValue    := 0;
      edtVlrAtacado.MinValue   := 0;
      edtVlrEspecial.MinValue  := 0;
      edtVlrGondola.MinValue   := 0;
      edtVlrMinimo.MinValue    := 0;
    end;
  end;

end;

end.
