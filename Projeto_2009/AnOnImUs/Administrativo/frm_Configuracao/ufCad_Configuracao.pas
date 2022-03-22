unit ufCad_Configuracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, DBCtrls,
  rxToolEdit, rxCurrEdit, RXDBCtrl, IniFiles, Funcoes, uFrPesqIndividual,
  uFrPesquisa, Vcl.Grids, Vcl.DBGrids;

type
  TfCad_Configuracao = class(TfCadastro)
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    RxDBCalcEdit1: TRxDBCalcEdit;
    RxDBCalcEdit2: TRxDBCalcEdit;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    edtVlrRenda: TRxDBCalcEdit;
    TabSheet2: TTabSheet;
    DBCheckBox3: TDBCheckBox;
    TabSheet3: TTabSheet;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    TabSheet4: TTabSheet;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    RxDBCalcEdit3: TRxDBCalcEdit;
    Label9: TLabel;
    GroupBox13: TGroupBox;
    RxDBCalcEdit4: TRxDBCalcEdit;
    frPesqCliente: TfrPesqIndividual;
    frPesqTabPrecos: TfrPesqIndividual;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    PageControl1: TPageControl;
    TabSheet5: TTabSheet;
    GroupBox10: TGroupBox;
    ckSim: TCheckBox;
    DBCheckBox1: TDBCheckBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtCod_Empr: TDBEdit;
    DBEdit2: TDBEdit;
    GroupBox11: TGroupBox;
    DBCheckBox2: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    TabSheet6: TTabSheet;
    DBRadioGroup2: TDBRadioGroup;
    GroupBox12: TGroupBox;
    frPesqTecnicoOS: TfrPesqIndividual;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    TabSheet7: TTabSheet;
    ctgpIRPF: TCategoryPanelGroup;
    CategoryPanel2: TCategoryPanel;
    CategoryPanel3: TCategoryPanel;
    CategoryPanel4: TCategoryPanel;
    CategoryPanel5: TCategoryPanel;
    CategoryPanel6: TCategoryPanel;
    CategoryPanel7: TCategoryPanel;
    CategoryPanel8: TCategoryPanel;
    CategoryPanel9: TCategoryPanel;
    CategoryPanel10: TCategoryPanel;
    CategoryPanel11: TCategoryPanel;
    CategoryPanel12: TCategoryPanel;
    CategoryPanel13: TCategoryPanel;
    frPesq_02_Rendimentos: TfrPesquisa;
    frPesq_02_Previdencia: TfrPesquisa;
    frPesq_02_RetidonaFonte: TfrPesquisa;
    frPesq_02_13Salario: TfrPesquisa;
    frPesq_03_RendimentoPF: TfrPesquisa;
    frPesq_03_RendimentoExterior: TfrPesquisa;
    frPesq_03_PrevidenciaOficial: TfrPesquisa;
    frPesq_03_PensaoAlimenticia: TfrPesquisa;
    frPesq_03_LivroCaixa: TfrPesquisa;
    frPesq_03_Darf: TfrPesquisa;
    frPesq_04_RendimentoIsento: TfrPesquisa;
    frPesq_05_RendimentoSujeitoTributacao: TfrPesquisa;
    frPesq_06_RendimentosTributaveisPJ: TfrPesquisa;
    frPesq_07_RendimentoRecebidosAcumuladamente: TfrPesquisa;
    frPesq_08_ImpostoPagoRetido: TfrPesquisa;
    frPesq_09_PagamentosEfetuados: TfrPesquisa;
    frPesq_10_DoacoesEfetuadas: TfrPesquisa;
    frPesq_11_BensDireito: TfrPesquisa;
    frPesq_12_DividasOnus: TfrPesquisa;
    frPesq_13_DoacoesPartidos: TfrPesquisa;
    frPesq_06_DepositosJudiciais: TfrPesquisa;
    frPesq_04_RendCardenetasPoupancas: TfrPesquisa;
    GroupBox6: TGroupBox;
    RxDBCalcEdit5: TRxDBCalcEdit;
    DBCheckBox14: TDBCheckBox;
    Label5: TLabel;
    RxDBCalcEdit6: TRxDBCalcEdit;
    Label8: TLabel;
    Label6: TLabel;
    RxDBCalcEdit7: TRxDBCalcEdit;
    Label10: TLabel;
    Label11: TLabel;
    RxDBCalcEdit8: TRxDBCalcEdit;
    DBCheckBox15: TDBCheckBox;
    Label12: TLabel;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    GroupBox9: TGroupBox;
    DBCheckBox18: TDBCheckBox;
    Label18: TLabel;
    Label19: TLabel;
    RxDBCalcEdit9: TRxDBCalcEdit;
    RxDBCalcEdit10: TRxDBCalcEdit;
    frPesqContaCredito: TfrPesqIndividual;
    GroupBox14: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    RxDBCalcEdit11: TRxDBCalcEdit;
    RxDBCalcEdit12: TRxDBCalcEdit;
    frPesqContaDebito: TfrPesqIndividual;
    TabSheet8: TTabSheet;
    GroupBox7: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    GroupBox8: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    frPesqCartaoCredito: TfrPesqIndividual;
    frPesqCartaoDebito: TfrPesqIndividual;
    DBCheckBox19: TDBCheckBox;
    TabSheet9: TTabSheet;
    GroupBox15: TGroupBox;
    GroupBox16: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBCheckBox20: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox23: TDBCheckBox;
    DBCheckBox24: TDBCheckBox;
    DBCheckBox25: TDBCheckBox;
    DBCheckBox26: TDBCheckBox;
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure edtVlrRendaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtCodClieKeyPress(Sender: TObject; var Key: Char);
    procedure DBCheckBox5Click(Sender: TObject);
    procedure DBCheckBox4Click(Sender: TObject);
    procedure frPesqClienteedtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure frPesqClienteedtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure frPesqClienteedtCodigoExit(Sender: TObject);
    procedure frPesqTabPrecosedtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure frPesqTabPrecosedtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure frPesqTabPrecosedtCodigoExit(Sender: TObject);
  private
    function  ValidaDados: Boolean;
    procedure OpenClientDataSet(intPOS: Integer = 99);
    procedure CarregaInformacoesOS;
    procedure PreencheFrames;
    procedure TratandoFrames;
    procedure CarregaInformacoesIRPF;
    procedure SalvarIRPF;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Configuracao: TfCad_Configuracao;

implementation

uses udmConfiguracao;

{$R *.dfm}

procedure TfCad_Configuracao.btnOkClick(Sender: TObject);
var
  iniTMP : TIniFile;
begin
  if not ValidaDados() then begin
    IsValidData;
    Exit;
  end;
  try
    iniTMP := TIniFile.Create(ExtractFilePath(Application.ExeName)+'AnOnImUs.ini');
    iniTMP.WriteBool('Version','Statistic',ckSim.Checked);
  finally
    FreeAndNil(iniTMP);
  end;

  SalvarIRPF();

  TratandoFrames;
  funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                   'Está é uma rotina destinada a manutenção e configuração '+
                   'de seu sistema. Reinicie o sistema para que as novas '+
                   'configurações entre em vigor!',0);
  inherited;
  dmConfiguracao.cdsConfOS.ApplyUpdates(-1);
  dmConfiguracao.cdsIRPF.ApplyUpdates(-1);
  Self.Close;
end;

procedure TfCad_Configuracao.SalvarIRPF();
var
  strTMP : String;

procedure Alimenta(frPesquisa : TfrPesquisa; strField : String);
begin
  dmConfiguracao.cdsIRPF.Edit;
  strTMP := '';
  try
    strTMP := frPesquisa.InGrid();
    strTMP := Copy(strTMP,6,Length(strTMP));
    strTMP := Copy(strTMP,1,Length(strTMP)-1);
  except
  end;
  dmConfiguracao.cdsIRPF.FieldByName(strField).AsString := strTMP;
  dmConfiguracao.cdsIRPF.Post;
end;

begin
  Alimenta(frPesq_02_Rendimentos,'IRPF_RENDIMENTOS_RECEBIDOS');
  Alimenta(frPesq_02_Previdencia,'IRPF_CONTRIBUICAO_PREVIDENCIA');
  Alimenta(frPesq_02_RetidonaFonte,'IRPF_IMPOSTO_RETIDO_FONTE');
  Alimenta(frPesq_02_13Salario,'IRPF_13_SALARIO');
  Alimenta(frPesq_03_RendimentoPF,'IRPF_RENDIMENTOS_PESSOA_FISICA');
  Alimenta(frPesq_03_RendimentoExterior,'IRPF_REDIMENTOS_EXTERIOR');
  Alimenta(frPesq_03_PrevidenciaOficial,'IRPF_PREVIDENCIA_OFICIAL');
  Alimenta(frPesq_03_PensaoAlimenticia,'IRPF_PENSAO_ALIMENTICIA');
  Alimenta(frPesq_03_LivroCaixa,'IRPF_LIVRO_CAIXA');
  Alimenta(frPesq_03_Darf,'IRPF_DARF_PAGO');
  Alimenta(frPesq_04_RendimentoIsento,'IRPF_RENDIMENTOS_ISENTOS');
  Alimenta(frPesq_04_RendCardenetasPoupancas,'IRPF_RENDIMENTOS_POUPANCA');
  Alimenta(frPesq_05_RendimentoSujeitoTributacao,'IRPF_RENDIMENTOS_SUJEITOS_TRIB');
  Alimenta(frPesq_06_RendimentosTributaveisPJ,'IRPF_RENDIMENTOS_TRIBUTAVEIS_PJ');
  Alimenta(frPesq_06_DepositosJudiciais,'IRPF_REND_TRIB_DEP_JUDICIAIS');
  Alimenta(frPesq_07_RendimentoRecebidosAcumuladamente,'IRPF_RENDIMENTOS_RECEB_ACUMUL');
  Alimenta(frPesq_08_ImpostoPagoRetido,'IRPF_IMPOSTO_PAGO_RETIDO');
  Alimenta(frPesq_09_PagamentosEfetuados,'IRPF_PAGAMENTOS_EFETUADOS');
  Alimenta(frPesq_10_DoacoesEfetuadas,'IRPF_DOACOES_EFETUADAS');
  Alimenta(frPesq_11_BensDireito,'IRPF_BENS_DIREITOS');
  Alimenta(frPesq_12_DividasOnus,'IRPF_DIVIDAS_ONUS');
  Alimenta(frPesq_13_DoacoesPartidos,'IRPF_DOACOES_PARTIDOS_POLITICOS');
end;

procedure TfCad_Configuracao.TratandoFrames;
begin
  cdsLocal.Edit;
  cdsLocal.FieldByName('CSIS_CLIE_ID').AsString             := frPesqCliente.InGrid();
  cdsLocal.FieldByName('CSIS_TPRC_ID').AsString             := frPesqTabPrecos.InGrid();
  cdsLocal.FieldByName('CSIS_CBCO_ID_CREDITO').AsString     := frPesqContaCredito.InGrid();
  cdsLocal.FieldByName('CSIS_CBCO_ID_DEBITO').AsString      := frPesqContaDebito.InGrid();
  cdsLocal.FieldByName('CSIS_FORN_ID_CARTAO_CRED').AsString := frPesqCartaoCredito.InGrid();
  cdsLocal.FieldByName('CSIS_FORN_ID_CARTAO_DEB').AsString  := frPesqCartaoDebito.InGrid();
end;

function TfCad_Configuracao.ValidaDados : Boolean;
begin
  Result := true;
  if edtCod_Empr.Text = '' then begin
    funcLocal.Alerta('Informe uma empresa antes de continuar.',0);
    pageCadastro.Pages[0].Show;
    Result := false;
    Exit;
  end;
  if (edtVlrRenda.Value < 0) or (edtVlrRenda.Value > 100) then begin
    funcLocal.Alerta('O valor de comprometimento não pode ser inferior a 0 (Zero) e nem superior a 100% da renda',1);
    Result := false;
    pageCadastro.Pages[1].Show;
    edtVlrRenda.SetFocus;
    Exit;
  end;

end;

procedure TfCad_Configuracao.edtCodClieKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
end;

procedure TfCad_Configuracao.DBCheckBox4Click(Sender: TObject);
begin
  inherited;
  try
    if not DBCheckBox4.Checked then
      cdsLocal.FieldByName('CSIS_FORCAR_REAGENDA').AsInteger := 0;
  except
  end;
end;

procedure TfCad_Configuracao.DBCheckBox5Click(Sender: TObject);
begin
  inherited;
  try
    if DBCheckBox5.Checked then
      cdsLocal.FieldByName('CSIS_REAGENDAR_OS').AsInteger := 1;
  except
  end;
end;

procedure TfCad_Configuracao.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
end;

procedure TfCad_Configuracao.edtVlrRendaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
end;

procedure TfCad_Configuracao.CarregaInformacoesOS;
var
  formPrinc : TForm;
begin
  formPrinc := Application.MainForm;
  funcLocal := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
  funcLocal.CarregaInfoOrdemServico(cdsLocal.FieldByName('CSIS_EMPR_ID').AsString);
end;

procedure TfCad_Configuracao.FormShow(Sender: TObject);
var
  iniTMP : TIniFile;
begin
  inherited;
  try
    iniTMP := TIniFile.Create(ExtractFilePath(Application.ExeName)+'AnOnImUs.ini');
    ckSim.Checked := iniTMP.ReadBool('Version','Statistic',true);
  finally
    FreeAndNil(iniTMP);
  end;
  OpenClientDataSet();
  CarregaInformacoesOS;
  PreencheFrames;
  CarregaInformacoesIRPF();
end;

procedure TfCad_Configuracao.frPesqClienteedtCodigoExit(Sender: TObject);
begin
  inherited;
  frPesqCliente.edtCodigoExit(Sender);

end;

procedure TfCad_Configuracao.frPesqClienteedtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  frPesqCliente.edtCodigoKeyDown(Sender, Key, Shift);

end;

procedure TfCad_Configuracao.frPesqClienteedtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  frPesqCliente.edtCodigoKeyPress(Sender, Key);

end;

procedure TfCad_Configuracao.frPesqTabPrecosedtCodigoExit(Sender: TObject);
begin
  inherited;
  frPesqTabPrecos.edtCodigoExit(Sender);

end;

procedure TfCad_Configuracao.frPesqTabPrecosedtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  frPesqTabPrecos.edtCodigoKeyDown(Sender, Key, Shift);

end;

procedure TfCad_Configuracao.frPesqTabPrecosedtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  frPesqTabPrecos.edtCodigoKeyPress(Sender, Key);

end;

procedure TfCad_Configuracao.CarregaInformacoesIRPF();
var
  strTMP : String;

procedure Alimenta(frPesquisa : TfrPesquisa; strField : String);
begin
  strTMP := dmConfiguracao.cdsIRPF.FieldByName(strField).AsString;
  while (Trim(strTMP) <> '') do begin
    frPesquisa.BuscarRegistro(Copy(strTMP,1,6));
    Delete(strTMP,1,7);
  end;
end;

begin
  Alimenta(frPesq_02_Rendimentos,'IRPF_RENDIMENTOS_RECEBIDOS');
  Alimenta(frPesq_02_Previdencia,'IRPF_CONTRIBUICAO_PREVIDENCIA');
  Alimenta(frPesq_02_RetidonaFonte,'IRPF_IMPOSTO_RETIDO_FONTE');
  Alimenta(frPesq_02_13Salario,'IRPF_13_SALARIO');
  Alimenta(frPesq_03_RendimentoPF,'IRPF_RENDIMENTOS_PESSOA_FISICA');
  Alimenta(frPesq_03_RendimentoExterior,'IRPF_REDIMENTOS_EXTERIOR');
  Alimenta(frPesq_03_PrevidenciaOficial,'IRPF_PREVIDENCIA_OFICIAL');
  Alimenta(frPesq_03_PensaoAlimenticia,'IRPF_PENSAO_ALIMENTICIA');
  Alimenta(frPesq_03_LivroCaixa,'IRPF_LIVRO_CAIXA');
  Alimenta(frPesq_03_Darf,'IRPF_DARF_PAGO');
  Alimenta(frPesq_04_RendimentoIsento,'IRPF_RENDIMENTOS_ISENTOS');
  Alimenta(frPesq_04_RendCardenetasPoupancas,'IRPF_RENDIMENTOS_POUPANCA');
  Alimenta(frPesq_05_RendimentoSujeitoTributacao,'IRPF_RENDIMENTOS_SUJEITOS_TRIB');
  Alimenta(frPesq_06_RendimentosTributaveisPJ,'IRPF_RENDIMENTOS_TRIBUTAVEIS_PJ');
  Alimenta(frPesq_06_DepositosJudiciais,'IRPF_REND_TRIB_DEP_JUDICIAIS');
  Alimenta(frPesq_07_RendimentoRecebidosAcumuladamente,'IRPF_RENDIMENTOS_RECEB_ACUMUL');
  Alimenta(frPesq_08_ImpostoPagoRetido,'IRPF_IMPOSTO_PAGO_RETIDO');
  Alimenta(frPesq_09_PagamentosEfetuados,'IRPF_PAGAMENTOS_EFETUADOS');
  Alimenta(frPesq_10_DoacoesEfetuadas,'IRPF_DOACOES_EFETUADAS');
  Alimenta(frPesq_11_BensDireito,'IRPF_BENS_DIREITOS');
  Alimenta(frPesq_12_DividasOnus,'IRPF_DIVIDAS_ONUS');
  Alimenta(frPesq_13_DoacoesPartidos,'IRPF_DOACOES_PARTIDOS_POLITICOS');
end;

procedure TfCad_Configuracao.PreencheFrames;
begin
  frPesqTecnicoOS.cdsLocal                  := dmConfiguracao.cdsConfOS;
  frPesqTecnicoOS.cdsField1                 := 'CFOS_USER_ID_TEC_OS';
  frPesqCliente.BuscarRegistro(cdsLocal.FieldByName('CSIS_CLIE_ID').AsString);
  frPesqTabPrecos.BuscarRegistro(cdsLocal.FieldByName('CSIS_TPRC_ID').AsString);
  frPesqTecnicoOS.BuscarRegistro(dmConfiguracao.cdsConfOSCFOS_USER_ID_TEC_OS.AsString);
  frPesqContaCredito.BuscarRegistro(cdsLocal.FieldByName('CSIS_CBCO_ID_CREDITO').AsString);
  frPesqContaDebito.BuscarRegistro(cdsLocal.FieldByName('CSIS_CBCO_ID_DEBITO').AsString);
  frPesqCartaoCredito.BuscarRegistro(cdsLocal.FieldByName('CSIS_FORN_ID_CARTAO_CRED').AsString);
  frPesqCartaoDebito.BuscarRegistro(cdsLocal.FieldByName('CSIS_FORN_ID_CARTAO_DEB').AsString);
end;

procedure TfCad_Configuracao.OpenClientDataSet(intPOS : Integer = 99);
begin
  with dmConfiguracao do begin
    case intPOS of
      3 : begin
        with cdsConfOS do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
          Edit;
        end;
      end;
      4 : begin
        with cdsIRPF do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
          Edit;
        end;
      end;
      5 : begin
      end else begin
        OpenClientDataSet(3);
        OpenClientDataSet(4);
        OpenClientDataSet(5);
      end;
    end;
  end;
end;

initialization
  if fCad_Configuracao = nil then  
    fCad_Configuracao := TfCad_Configuracao.Create(nil);
finalization
  FreeAndNil(fCad_Configuracao);

end.
