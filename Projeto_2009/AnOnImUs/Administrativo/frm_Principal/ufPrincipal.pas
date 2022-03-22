unit ufPrincipal;

interface

uses
  System.Classes, VclTee.TeeGDIPlus, Vcl.Controls, Vcl.Menus, Vcl.ExtCtrls, ShellApi,
  Vcl.ImgList, Funcoes, Vcl.ComCtrls, VCLTee.Series, VCLTee.TeEngine,
  VCLTee.TeeFunci, VCLTee.TeeProcs, VCLTee.Chart, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Graphics, Vcl.Forms, Winapi.Windows, System.Win.Registry, IdSMTP, IdMessage,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

Const
  Mensagem   = 'Conexão estabelecida com sucesso, entre em contato com o nosso suporte técnico informando os dados abaixo.';
  intVersion = 50014;
  intFHeight =   -10;
  intFWidth  =    -1;
  intFLeft   =     2;
  intFTop    =    22;

type
  TTipoSystem = (sysFinanc, sysEstoque, sysOS, sysConstruction, sysFrota, sysDelivery, sysVendas);

type
  TTema = (tmClassico, tmXP);

  TDownload = Class(TThread)
    Constructor Create;
    procedure   Download;
  end;

type
  TfPrincipal = class(TForm)
    panelTop: TPanel;
    Panel2: TPanel;
    stbPrincipal: TStatusBar;
    edtRotina: TEdit;
    funcPrincipal: TFuncoes;
    ImageList1: TImageList;
    imgPrincipal: TImageList;
    Timer1: TTimer;
    popBarra: TPopupMenu;
    Restaurar1: TMenuItem;
    Minimizar1: TMenuItem;
    N1: TMenuItem;
    Fechar1: TMenuItem;
    PanelControl: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    panelPrincipal: TPanel;
    Panel1: TPanel;
    btnMenu: TPanel;
    Panel5: TPanel;
    panelGrafico: TPanel;
    GroupBox2: TGroupBox;
    chtProjecao: TChart;
    Series1: TLineSeries;
    TeeFunction1: TAddTeeFunction;
    Series2: TLineSeries;
    PageControlAvisos: TPageControl;
    PanelTitulos: TTabSheet;
    pagePrincipal: TTabSheet;
    panelAvisos: TPanel;
    GroupBox3: TGroupBox;
    Image5: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Shape1: TShape;
    lbCredOntem: TLabel;
    lbDebOntem: TLabel;
    lbCredHoje: TLabel;
    lbDebHoje: TLabel;
    lbCredAmanha: TLabel;
    lbDebAmanha: TLabel;
    lbCredMes: TLabel;
    lbDebMes: TLabel;
    lbTotalOntem: TLabel;
    lbTotalHoje: TLabel;
    lbTotalAmanha: TLabel;
    lbTotalMes: TLabel;
    Shape2: TShape;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    lbCredPgOntem: TLabel;
    lbDebPgOntem: TLabel;
    lbTotalPgOntem: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    lbCredPgHoje: TLabel;
    lbDebPgHoje: TLabel;
    lbTotalPgHoje: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    lbCredPgAmanha: TLabel;
    lbDebPgAmanha: TLabel;
    lbTotalPgAmanha: TLabel;
    Shape7: TShape;
    Shape8: TShape;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    lbCredPgMes: TLabel;
    lbDebPgMes: TLabel;
    lbTotalPgMes: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    lbCredProx: TLabel;
    lbDebProx: TLabel;
    lbTotalProx: TLabel;
    Image2: TImage;
    PagePainel: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lbEstoque: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    TabSheet3: TTabSheet;
    Label44: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    lbSaldo: TLabel;
    LbSaldo2: TLabel;
    Label26: TLabel;
    lbmeta: TLabel;
    Image1: TImage;
    treePrincipal: TTreeView;
    lbVersaoSistema: TLabel;
    Panel3: TPanel;
    lbBuild: TLabel;
    mmPrincipal: TMainMenu;
    Shape9: TShape;
    Label3: TLabel;
    Label24: TLabel;
    BalloonHint: TBalloonHint;
    BalloonHint_16_x_16: TBalloonHint;
    BalloonHint_24_x_24: TBalloonHint;
    BalloonHint_32_x_32: TBalloonHint;
    BalloonHint_48_x_48: TBalloonHint;
    ImageList_16_x_16: TImageList;
    ImageList_24_x_24: TImageList;
    ImageList_32_x_32: TImageList;
    ImageList_48_x_48: TImageList;
    btnRotina: TSpeedButton;
    panelPlanejamento: TPanel;
    lblLimite: TLabel;
    pgGrafico: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    GroupBox1: TGroupBox;
    chtPlanejamento: TChart;
    BarSeries1: TBarSeries;
    AddTeeFunction1: TAddTeeFunction;
    BarSeries2: TBarSeries;
    GroupBox4: TGroupBox;
    Chart1: TChart;
    BarSeries3: TBarSeries;
    AddTeeFunction2: TAddTeeFunction;
    BarSeries4: TBarSeries;
    Series3: TBarSeries;
    Label4: TLabel;
    TimerBackup: TTimer;
    img2: TImage;
    lvlVersao: TLabel;
    Image3: TImage;
    procedure edtRotinaEnter(Sender: TObject);
    procedure edtRotinaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure treePrincipalClick(Sender: TObject);
    procedure treePrincipalCollapsed(Sender: TObject; Node: TTreeNode);
    procedure treePrincipalCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure treePrincipalDblClick(Sender: TObject);
    procedure treePrincipalExpanded(Sender: TObject; Node: TTreeNode);
    procedure treePrincipalExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure treePrincipalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure treePrincipalKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure btnRotinaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Restaurar1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Minimizar1Click(Sender: TObject);
//    procedure timeSuporteTimer(Sender: TObject);
    procedure btnSuporteClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lbVersaoSistemaClick(Sender: TObject);
    procedure imgPublicidadeClick(Sender: TObject);
    procedure FlowPanel1Click(Sender: TObject);
    procedure TimerBackupTimer(Sender: TObject);
  private
    intTop        : Integer;
    menuItem      : array[0..9999] of TMenuItem;
    intMenu       : Integer;
    intSubMenu    : Integer;
    intSubSubMenu : Integer;
    function  GetWindowsWorkArea: TRect;
    procedure CriarMenuUsuario;
    function  TemFilho(strMenu_ID: String): Boolean;
    procedure CriarSubMenusUsuario(strUser_Id, strEmpr_Id, strMenu: String;
                                   treeItem: TTreeNode; boolSub : Boolean = false);
    function  MenuTemFilho(strUser_ID, strEmpr_Id, strMenu_Id: String): Boolean;
    function  TemFilhoSub(strMenu_ID: String): Boolean;
    procedure ExecutaRotina(intRotina: Integer);
    procedure MinimizeAll(Botao : TSpeedButton = nil);
    procedure AtualizaTela(strFormPesq   : String  = 'TFPRINCIPAL';
                           boolMinimizar : Boolean = false);
    function  FormAberto(Formulario: String): Boolean;
    procedure CriarBotao(Formulario, Caption : String);
    procedure MouseDown(Sender: TObject; Button: TMouseButton;
      Shift:  TShiftState; X, Y: Integer);
    procedure ClickBotao(Sender: TObject);
    procedure BuscaRotina(intRotina: Integer);
    function  TemPermissao(strMenu_ID: String): Boolean;
    procedure AtualizaMenus;
    procedure CompactarError;
    function  DeletaDiretorio(FolderName: String; LeaveFolder: Boolean): Boolean;
    procedure EnviaEmail;
    procedure FormsAction(strFormPesq, strAction: String);
//    procedure GeraSuporte;
//    function  KillTask(ExeFileName: string): Integer;
//    procedure StatuSuportes;
//    procedure LabelVisible(boolVisible: Boolean);
    procedure PositionPanel;
    procedure LoadBussiness;
    function  FileVerInfo(const FileName: string;
      var FileInfo: TStringList; out strVersion : String): Boolean;
    procedure LoadAlerts;
    function  ReportaErro: Boolean;
    procedure DirList(ASource: string; ADirList: TStringList;
              boolForce : boolean = false);
    procedure VerificaRegistro;
    procedure StatisticUso;
    procedure LoadEstoque;
    procedure LoadGrafics;
    procedure CreditoAno;
    procedure DebitoAno;
    procedure SaldoTitulos;
    function  GetBuildInfo: String;
    procedure VerificaMenu;
    procedure LoadOS;
    procedure VerificaVersaoSistema;
    procedure RetornaVersaoSistema;
    procedure ClickMenu(Sender: TObject);
    procedure VerificaExistenciaICODE(strSerial: String);
    procedure VerificaMensagem;
    procedure BloqueioCNPJ(strCNPJ: String);
    procedure LoadGraficoAnual;
    procedure UpdateCartaoCreditos();
    procedure AtualizaCartoes;
    procedure RegistraMenu(intRotina: Integer);
    procedure AtualizaPainel;
    function  getVersao: String;
    procedure RealizaBackup(strMSG, strCaminho: String);
    function  RealizouBackup(out strCaminho : String): Boolean;
  public
    boolConect    : Boolean;
    BotaoClicked  : TSpeedButton;
    boolRegister  : Boolean;
    TipoSystem    : TTipoSystem;
    function  MacAddress: string;
    procedure DownloadLicenca;
    property  Versao   : String   read getVersao;
  end;

var
  fPrincipal    : TfPrincipal;
  Reg           : TRegistry;
  intTop        : integer;
  FormOpen      : TForm;
  TemaWindows   : TTema;
  intHelp       : Integer;
  arrayDeb,
  arrayCred,
  floatPlanejado,
  floatRealizado: array[1..12] of Real;
  floatCredito,
  floatDebito,
  fltCaixa,
  fltBanco      : Real;
  pRect         : TRect;


implementation

{$R *.dfm}

uses ufLogin, udmConexao, System.SysUtils, System.IniFiles, uUpdate,
  ufConfDataBase, ufHelp, ufMensagens, ufRegistro, Data.SqlExpr, ufAtualizacao,
  Winapi.WinInet, Vcl.Dialogs, Winapi.UrlMon, Datasnap.DBClient, ufLicenca,
  Data.DB, PidUtils, ufVersao;


{$WARN SYMBOL_DEPRECATED OFF}

procedure TfPrincipal.edtRotinaEnter(Sender: TObject);
begin
  edtRotina.Clear;
end;

procedure TfPrincipal.edtRotinaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) and (edtRotina.Text <> '') then begin
    btnRotina.Click;
    key := #0;
    edtRotina.SetFocus;
  end;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
end;

procedure TfPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
var
  iniFile : TIniFile;
begin
  try
    iniFile := TIniFile.Create(ExtractFilePath(ParamStr(0))+VConf_File);
    FreeAndNil(fLogin);
    case Panel1.Width of
      7   : begin
        iniFile.WriteString('Menu','Menu','1');
      end;
      290 : begin
        iniFile.WriteString('Menu','Menu','0');
      end;
    end;
    FreeAndNil(iniFile);
  except
  end;
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
var
  strTema : string;
  R       : TRect;
begin
  try
    if dmConexao = nil then
      dmConexao := TdmConexao.Create(nil);
    if boolConect then begin
      funcPrincipal.Conexao := dmConexao.dbConexao;
      LoadPackage('bpl\basico.bpl');
      Reg := Tregistry.create;
      with Reg do begin
        rootkey := HKEY_CURRENT_USER;
        OpenkeyReadOnly('Software\Microsoft\Plus!\Themes\Current');
        strTema := readstring('');
        if pos('Windows Classic',strTema)>0 then begin
          inttop      := 125;
          TemaWindows := tmClassico;
        end else begin
          inttop      := 132;
          TemaWindows := tmXP;
        end;
        CloseKey;
        Free;
      end;
      R := GetWindowsWorkArea;
      funcPrincipal.Conexao     := dmConexao.dbConexao;
      panelPrincipal.Font.Color := panelPrincipal.Color;
      PagePainel.Pages[0].Show;
      PagePainel.Pages[1].TabVisible := false;
      PagePainel.Pages[2].TabVisible := false;
    end;
  except
  end;
end;

procedure TfPrincipal.RetornaVersaoSistema;
var
  strMenu : String;
begin
  try
    try
      ExecSQL('SELECT DISTINCT CSIS_TIPO FROM CONF_SISTEMA',true);
      strMenu := qryConsSQL.FieldByName('CSIS_TIPO').AsString[1];
    except
      try
        ExecSQL('SELECT MENU_DESCRICAO FROM MENU WHERE MENU_ID = 445',true);
        strMenu := TFuncoes(fPrincipal.funcPrincipal).Se(UpperCase(Trim(qryConsSQL.FieldByName('MENU_DESCRICAO').AsString)) = 'ORDEM DE SERVIÇO','0','');
        if strMenu = '' then begin
          ExecSQL('SELECT MENU_DESCRICAO FROM MENU WHERE MENU_ID = 421',true);
          strMenu := TFuncoes(fPrincipal.funcPrincipal).Se(UpperCase(Trim(qryConsSQL.FieldByName('MENU_DESCRICAO').AsString)) = 'ESTOQUE E PRODUTOS','E','F');
        end;
      except
      end;
    end;
  except
  end;
  case strMenu[1] of
    'F' : begin
      TipoSystem   := sysFinanc;
      Self.Caption := 'AR Sistemas & Consultoria Ltda.';
    end;
    'E' : begin
      TipoSystem   := sysEstoque;
      Self.Caption := 'AR Sistemas & Consultoria Ltda.';
      PagePainel.Pages[1].TabVisible := true;
    end;
    'O' : begin
      TipoSystem   := sysOS;
      Self.Caption := 'AR Sistemas & Consultoria Ltda.';
      PagePainel.Pages[1].TabVisible := true;
      PagePainel.Pages[2].TabVisible := true;
    end;
    'V' : begin
      TipoSystem   := sysVendas;
      Self.Caption := 'AR Sistemas && Consultoria Ltda.';
      PagePainel.Pages[1].TabVisible := true;
    end;
  end;
end;

procedure TfPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    try
      if (Shift = [ssCtrl]) and (key = 82) then begin
        key := 0;
        edtRotina.SetFocus;
      end;
    except
    end;
    if Key = 116 then begin
      AtualizaMenus;
      edtRotina.SetFocus;
    end;
    Key   := 0;
  except
  end;
end;

procedure TfPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    key := #0;
    edtRotina.SetFocus;
  end;
end;

procedure TfPrincipal.FormPaint(Sender: TObject);
begin
  if funcPrincipal.JanelaAtiva <> '' then
    AtualizaTela(funcPrincipal.JanelaAtiva);
end;

procedure TfPrincipal.FormResize(Sender: TObject);
begin
  if funcPrincipal.JanelaAtiva <> '' then
    AtualizaTela(funcPrincipal.JanelaAtiva);
  PositionPanel;
end;

procedure TfPrincipal.FormsAction(strFormPesq, strAction: String);
var
  intI      : Integer;
  AForm     : TForm;
  strform   : String;
  panelTEMP : TPanel;
begin
  MinimizeAll;
  GetWindowRect(panelPrincipal.Handle,pRect);
  panelPrincipal.Refresh;
  for intI := 0 to Screen.FormCount - 1 do begin
    AForm := screen.Forms[intI];
    strform := string(AForm.ClassName);
    if (strform = strFormPesq) then begin
      if strAction = 'CLOSE' then begin
        AForm.Close;
        panelTEMP := TPanel(Self.FindComponent('BARRA'+Copy(BotaoClicked.Name,6,length(BotaoClicked.Name))));
        if panelTEMP <> nil then
          FreeAndNil(panelTEMP);
        PanelControl.Repaint;
        if funcPrincipal.Janelas.IndexOf(strForm) <> -1 then
          funcPrincipal.Janelas.Delete(funcPrincipal.Janelas.IndexOf(strForm));
        Break;
      end else if strAction = 'MINIMIZAR' then begin
        AForm.Visible := False;
        AForm.SetBounds(0, 0, 0, 0);
        AForm.Repaint;
        BotaoClicked.Down := false;
        PanelControl.Repaint;
        Break;
      end else begin
        AForm.Visible := True;
        AForm.Repaint;
        AForm.BringToFront;
        ///Verificar as constantes [ intFHeight, intFWidth, intFLeft, intFTop ]
        AForm.SetBounds(panelPrincipal.Left + intFLeft, panelPrincipal.Top, panelPrincipal.Width + intFWidth, panelPrincipal.Height + intFHeight);
        AForm.Constraints.MaxHeight := panelPrincipal.Height;
        AForm.Constraints.MaxWidth  := panelPrincipal.Width + intFWidth;
        AForm.Constraints.MinHeight := panelPrincipal.Height;
        AForm.Constraints.MaxWidth  := panelPrincipal.Width + intFWidth;
        AForm.Top                   := pRect.Top;
        AForm.Left                  := pRect.Left;
        BotaoClicked.Down           := true;
        PanelControl.Repaint;
        Break;
      end;
    end;
  end;
end;

function TfPrincipal.ReportaErro : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      CSIS_REPORTA_ERROS');
        sql.Add('FROM  CONF_SISTEMA');
        sql.Add('WHERE CSIS_EMPR_ID = ' + IntToStr(funcPrincipal.Empr_ID));
        Open;
      end;
      Result := (qryCons.Fields[0].AsInteger = 1);
    except on e: exception do
      funcPrincipal.ReportaErro(Caption,'ReportaErro',e.Message);
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfPrincipal.SpeedButton2Click(Sender: TObject);
begin
  fHelp.intPos := 3;
  fHelp.ShowModal;
end;

procedure TfPrincipal.StatisticUso;

function RetornaDados(intPos : Integer) : String;
var
  iniTMP : TIniFile;
begin
  try
    Result := '';
    iniTMP := TIniFile.Create(ExtractFilePath(ParamStr(0))+VConf_File);
    case intPos of
      1 : Result := iniTMP.ReadString('Client','Razao Social','');
      2 : Result := iniTMP.ReadString('Client','Empresa','');
      3 : Result := iniTMP.ReadString('Client','Cidade','');
      4 : Result := iniTMP.ReadString('Client','UF','');
      5 : Result := iniTMP.ReadString('Client','email','');
      6 : Result := iniTMP.ReadString('Client','Telefone','');
    end;
  finally
    FreeAndNil(iniTMP);
  end;
end;

var
  idMsg       : TIdMessage;
  STMP        : TIdSMTP;
  iniTMP      : TIniFile;
  txtTMP,
  txtTMPI     : TextFile;
  Dia,Mes,Ano : Word;
  strTMP,
  strName,
  strMes      : String;
  qryCons     : TSQLQuery;
  flags       : DWord;
begin
  if InternetGetConnectedState(@flags, 0) then begin
    try
      iniTMP := TIniFile.Create(ExtractFilePath(Application.ExeName)+'AnOnImUs.ini');
      DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
      strTMP := iniTMP.ReadString('Version','Date','');
      strMes := funcPrincipal.Buscar_Coluna(strTMP,1,'-');
      if StrToInt(strMes) <> Mes then begin
        try
          funcPrincipal.MSGAguarde();
          if not DirectoryExists(ExtractFilePath(Application.ExeName)+'Statistic') then
            ForceDirectories(ExtractFilePath(Application.ExeName)+'Statistic');
          strName := FormatDateTime('dd-mm-yyyy hh-mm-ss',funcPrincipal.DataServidor(funcPrincipal.Conexao,true));
          AssignFile(txtTMP,ExtractFilePath(Application.ExeName)+'Statistic\'+strName+'.log');
          Rewrite(txtTMP);
          Writeln(txtTMP,'Razão Social: ' + RetornaDados(1));
          Writeln(txtTMP,'Fantasia :    ' + RetornaDados(2));
          Writeln(txtTMP,'Cidade   :    ' + RetornaDados(3));
          Writeln(txtTMP,'UF       :    ' + RetornaDados(4));
          Writeln(txtTMP,'email    :    ' + RetornaDados(5));
          Writeln(txtTMP,'Telefone :    ' + RetornaDados(6));
          Writeln(txtTMP,'Usuário  :    ' + funcPrincipal.User_Login);
          Writeln(txtTMP,'Data/Hora:    ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',funcPrincipal.DataServidor(funcPrincipal.Conexao,true)));
          Writeln(txtTMP,'Mac      :    ' + funcPrincipal.MacAddress);
          Writeln(txtTMP,'Versão   :    ' + Versao);
          case TipoSystem of
            sysFinanc       : Writeln(txtTMP,'Modulo   :    Controle Financeiro');
            sysEstoque      : Writeln(txtTMP,'Modulo   :    Controle de Estoque');
            sysOS           : Writeln(txtTMP,'Modulo   :    Ordem de Serviço');
            sysConstruction : Writeln(txtTMP,'Modulo   :    Construção Civil');
            sysFrota        : Writeln(txtTMP,'Modulo   :    Controle de Frota');
            sysDelivery     : Writeln(txtTMP,'Modulo   :    Delivery');
          end;
          Writeln(txtTMP,'---------------------------------------------');
          Writeln(txtTMP,'ICODES:');
          try
            AssignFile(txtTMPI,ExtractFilePath(Application.ExeName)+'icode.bpl');
            Reset(txtTMPI);
            while not Eof(txtTMPI) do begin
              ReadLn(txtTMPI, strTMP);
              WriteLn(txtTMP, strTMP);
            end;
            CloseFile(txtTMPI);
          except
          end;
          Writeln(txtTMP,'---------------------------------------------');
          qryCons := TSQLQuery.Create(nil);
          qryCons.SQLConnection := funcPrincipal.Conexao;
          try
            with qryCons do begin
              Close;
              sql.Clear;
              sql.Add('SELECT');
              sql.Add('      COUNT(*)');
              sql.Add('FROM  LOGIN');
              sql.Add('WHERE EXTRACT(MONTH FROM LOGI_DTA_LOG) = ' + IntToStr(Mes - 1));
              sql.Add('AND   EXTRACT(YEAR FROM LOGI_DTA_LOG)  = ' + IntToStr(Ano));
              Open;
              Writeln(txtTMP,'Acessos: ' + qryCons.Fields[0].AsString);
              sql.Clear;
              sql.Add('SELECT');
              sql.Add('      COUNT(*)');
              sql.Add('FROM  EMPRESAS');
              Open;
              Writeln(txtTMP,'Empresas: ' + qryCons.Fields[0].AsString);
              sql.Clear;
              sql.Add('SELECT');
              sql.Add('      COUNT(*)');
              sql.Add('FROM  CLIENTES');
              Open;
              if qryCons.Fields[0].AsInteger < 5 then Exit;
              Writeln(txtTMP,'Clientes: ' + qryCons.Fields[0].AsString);
              sql.Clear;
              sql.Add('SELECT');
              sql.Add('      COUNT(*)');
              sql.Add('FROM  FORNECEDORES');
              Open;
              Writeln(txtTMP,'Fornecedores: ' + qryCons.Fields[0].AsString);
              sql.Clear;
              sql.Add('SELECT');
              sql.Add('      COUNT(*)');
              sql.Add('FROM  CONTAS_PAGAR');
              Open;
              Writeln(txtTMP,'C. Pagar: ' + qryCons.Fields[0].AsString);
              sql.Clear;
              sql.Add('SELECT');
              sql.Add('      COUNT(*)');
              sql.Add('FROM  CONTAS_RECEBER');
              Open;
              Writeln(txtTMP,'C. Receber: ' + qryCons.Fields[0].AsString);
              sql.Clear;
              sql.Add('SELECT');
              sql.Add('      COUNT(*)');
              sql.Add('FROM  LIVRO_CAIXA');
              Open;
              Writeln(txtTMP,'L. Caixa: ' + qryCons.Fields[0].AsString);
              SQL.Clear;
              sql.Add('SELECT');
              sql.Add('      COUNT(*)');
              sql.Add('FROM  PRODUTOS');
              Writeln(txtTMP,'Produtos: ' + qryCons.Fields[0].AsString);
              SQL.Clear;
              sql.Add('SELECT');
              sql.Add('      COUNT(*)');
              sql.Add('FROM  ORDEM_SERVICO');
              Writeln(txtTMP,'Ordem Serviço: ' + qryCons.Fields[0].AsString);
              CloseFile(txtTMP);
            end;
          except
          end;
          try
            idMsg   := TIdMessage.Create(nil);
            STMP    := TIdSMTP.Create(nil);
            try
              with idMsg do begin
                From.Name                 := funcPrincipal.Empr_Razao;
                Recipients.EMailAddresses := 'estatistica@arsistemaseconsultoria.com.br';
                Subject                   := 'Estatistica de Uso';
                Reset(txtTMP);
                while not Eof(txtTMP) do begin
                  ReadLn(txtTMP,strTMP);
                  idMsg.Body.Add(strTMP);
                end;
              end;
              with STMP do begin
                Host     := 'mail.arsistemaseconsultoria.com.br';
                Port     := 587;
                Username := 'estatistica@arsistemaseconsultoria.com.br';
                Password := 'estoldq9';
                Connect;
                Try
                  try
                    Send(idMsg);
                  finally
                  end;
                except
                  try
                    Disconnect;
                    Host   := 'mail.arsistemaseconsultoria.com.br';
                    Connect;
                    try
                      Send(idMsg);
                    except
                    end;
                    Disconnect;
                  finally
                  end;
                end;
                Disconnect;
              end;
            except
            end;
          finally
          end;
        finally
          qryCons.Close;
          FreeAndNil(qryCons);
        end;
      end;
    finally
      iniTMP.WriteString('Version','Date',FormatFloat('00',Mes)+'-'+IntToStr(Ano));
      FreeAndNil(iniTMP);
      funcPrincipal.MSGAguarde(false);
    end;
  end;
end;

procedure TfPrincipal.FormShow(Sender: TObject);
var
  strTMP,
  strSerial,
  strVersion : String;
  intI       : Integer;
begin
  try
    lvlVersao.Caption := Versao;
    if boolConect then begin
      funcPrincipal.MSGAguarde(false);
      ///Verificar se a cópia já está registrada
      VerificaRegistro;
      try
        if fLogin = nil then
          fLogin := TfLogin.Create(nil);
        fLogin.ShowModal;
        if (funcPrincipal.User_Login = '') and (funcPrincipal.Empr_Razao = '') then
          Application.Terminate;
      finally
        fLogin.Hide;
      end;
      ///Verifica se Reportar Erro esta habilitado e envia os erros por e-mail
      //if ReportaErro then
      //  CompactarError;
      ///Verifica a estatistica de uso do sistema e envia por e-mail
      StatisticUso;
      edtRotina.SetFocus;
      stbPrincipal.Panels[0].Width := Trunc(Screen.Width / 4);
      stbPrincipal.Panels[1].Width := Trunc(Screen.Width / 4);
      stbPrincipal.Panels[2].Width := Trunc(Screen.Width / 4);
      stbPrincipal.Panels[3].Width := Trunc(Screen.Width / 4);
      stbPrincipal.Panels[0].Text  := 'Usuário: ' + IntToStr(funcPrincipal.User_ID) + ' - ' + funcPrincipal.User_Login;
      stbPrincipal.Panels[1].Text  := 'Empresa: ' + funcPrincipal.Empr_Razao;
      stbPrincipal.Panels[2].Text  := 'Data:    ' + FormatDateTime('dd/mm/yyyy',funcPrincipal.DataServidor(funcPrincipal.Conexao));
      strVersion := Versao;
      for intI := 1 to Length(strVersion) do begin
        if strVersion[intI] <> '.' then begin
          strTMP := strTMP + strVersion[intI];
        end;
      end;
      try
        funcPrincipal.VersionSystem  := StrToInt(strTMP);
      except
      end;
      try
        ///Atualiza menus e paineis
        AtualizaMenus;
      except
      end;
    end else begin
      ShowMessage('Não foi possível estabelecer uma conexão com o banco de dados, verifique os parametros do banco de dados antes de continuar.');
      fConfDataBase.ShowModal;
      Exit;
    end;
  except
  end;
  ///Retorna Seria do HD
  strSerial := '';//Trim(GetIDESerialNumber(0));
  ///Se não retornar Serial HD, retorna MAC
  if (strSerial = '') or (not FileExists(ExtractFilePath(ParamStr(0))+strSerial+'.xml')) then
    strSerial := MacAddress;
  ///Grava o ICODE gerado caso seja criado um novo ICODE
  VerificaExistenciaICODE(Trim(strSerial));

  ///Verifica Permissões do sistema
  funcPrincipal.PermissoesSystem(strSerial);
  stbPrincipal.Panels[3].Text := 'Idenficação: ' +  strSerial;
  pagePrincipal.Refresh;
  if (Screen.Width < 1280) or (Screen.Height < 768) then begin
    funcPrincipal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'A resolução miníma recomendada para o uso do sistema e de 1280x768'+#13+
                         'a resolução ' + IntToStr(Screen.Width) + 'x' + IntToStr(Screen.Height) + ' poderá não apresentar uma boa '+
                         'visualização das telas do sistema.',0);
  end;
  lbBuild.Caption := 'Build: ' + GetBuildInfo;
  funcPrincipal.MSGAguarde();
  ///Recolhe treeview
  VerificaMenu;
  VerificaMensagem;      ///Apresenta mensagem ao usuário
  VerificaVersaoSistema; ///Verifica se há nova versão disponivel para download
  VerificaUpdate;        ///Verifica se necessita de atualização no banco de dados.
  funcPrincipal.MSGAguarde(false);
  ///Verifica qual versão o cliente esta utilizando e seta-a no título
  RetornaVersaoSistema;
  pgGrafico.Pages[0].Show;
  edtRotina.SetFocus;
  TimerBackup.Enabled := true;
end;

procedure TfPrincipal.VerificaMensagem;
var
  Dia, Mes, Ano : Word;
  strArquivoLocal,
  strArquivoNet : String;
begin
  Exit;
  DecodeDate(Date,Ano,Mes,Dia);
  strArquivoLocal := ExtractFilePath(Application.ExeName);
  strArquivoNet   := 'http://www.arsistemaseconsultoria.com.br/';
  case Dia of
    1..10 : begin
      strArquivoLocal := strArquivoLocal + 'mensagem.html';
      strArquivoNet   := strArquivoNet + 'mensagem.html';
      URLDownloadToFile(nil,PChar(strArquivoNet),PChar(strArquivoLocal), 0, nil);
    end;
    11..15 : begin
      strArquivoLocal := strArquivoLocal + 'mensagem2.html';
      strArquivoNet   := strArquivoNet   + 'mensagem2.html';
      URLDownloadToFile(nil,PChar(strArquivoNet),PChar(strArquivoLocal), 0, nil);
    end;
    16..20 : begin
      strArquivoLocal := strArquivoLocal + 'mensagem3.html';
      strArquivoNet   := strArquivoNet + 'mensagem3.html';
      URLDownloadToFile(nil,PChar(strArquivoNet),PChar(strArquivoLocal), 0, nil);
    end;
    21..25 : begin
      strArquivoLocal := strArquivoLocal + 'mensagem4.html';
      strArquivoNet   := strArquivoNet   + 'mensagem4.html';
      URLDownloadToFile(nil,PChar(strArquivoNet),PChar(strArquivoLocal), 0, nil);
    end;
    26..31 : begin
      strArquivoLocal := strArquivoLocal + 'mensagem5.html';
      strArquivoNet   := strArquivoNet   + 'mensagem5.html';
      URLDownloadToFile(nil,PChar(strArquivoNet),PChar(strArquivoLocal), 0, nil);
    end;
  end;
  if FileExists(strArquivoLocal) then begin
    try
      if fMensagens = nil then
        fMensagens := TfMensagens.Create(nil);
      fMensagens.WebBrowser1.Navigate(strArquivoNet);
      fMensagens.ShowModal;
    finally
      FreeAndNil(fMensagens);
    end;
  end;
end;

///Vai gravando os ICODES encontrados na maquina do cliente.
procedure TfPrincipal.VerificaExistenciaICODE(strSerial : String);
var
  txtTMP     : TextFile;
  strTMP     : String;
  boolExiste : Boolean;
begin
  boolExiste := True;
  try
    AssignFile(txtTMP,ExtractFilePath(Application.ExeName)+'icode.bpl');
    try
    boolExiste := false;
    Reset(txtTMP);
    while not Eof(txtTMP) do begin
      ReadLn(txtTMP, strTMP);
      if strTMP = strSerial then
        boolExiste := true;
    end;
    except
    end;
    if not boolExiste then begin
      Rewrite(txtTMP);
      Writeln(txtTMP,strSerial);
    end;
  finally
    CloseFile(txtTMP);
  end;
end;

procedure TfPrincipal.VerificaMenu;
var
  iniFile : TIniFile;
begin
  try
    iniFile := TIniFile.Create(ExtractFilePath(ParamStr(0))+VConf_File);
    if iniFile.ReadString('Menu','Menu','0') = '1' then
      btnMenuClick(Self);
  finally
    FreeAndNil(iniFile);
  end;
end;

function TfPrincipal.GetBuildInfo : String;
var
    VerInfoSize: DWORD;
    VerInfo: Pointer;
    VerValueSize: DWORD;
    VerValue: PVSFixedFileInfo;
    Dummy: DWORD;
    V1, V2, V3, V4: Word;
    Prog,ultimo : string;
begin
    Prog := Application.Exename;
    VerInfoSize := GetFileVersionInfoSize(PChar(prog), Dummy);
    GetMem(VerInfo, VerInfoSize);
    GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
    VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);
    with VerValue^ do
    begin
          V1 := dwFileVersionMS shr 16;
          V2 := dwFileVersionMS and $FFFF;
          V3 := dwFileVersionLS shr 16;
          V4 := dwFileVersionLS and $FFFF;
    end;
    FreeMem(VerInfo, VerInfoSize);
    ultimo := Copy ('100' + IntToStr(v4), 4, 2);

    result := Copy ('100'+IntToStr (v1), 4, 2) + '.' +
              Copy ('100'+IntToStr (v2), 4, 2) + '.' +
              Copy ('100'+IntToStr (v3), 4, 2) + '.' +
              Copy ('100'+IntToStr (v4), 4, 3);
end;


function TfPrincipal.getVersao: String;
begin
  Result := IntToStr(intVersion);
  Result := Copy(Result,1,1)+'.'+Copy(Result,2,1)+'.'+Copy(Result,3,1)+'.'+Copy(Result,4,2)
end;

procedure TfPrincipal.VerificaRegistro;
var
  iniTMP : TIniFile;
  intI   : Integer;
  Dia,Mes,Ano : Word;
begin
  try
    iniTMP := TIniFile.Create(ExtractFilePath(Application.ExeName)+'AnOnImUs.ini');
    ///Verifica se a cópia já e registrada, caso não seja abre tela de registro
    if not iniTMP.ReadBool('Version','Register',false) then begin
      iniTMP.WriteBool('Version','Register',false);
      iniTMP.WriteInteger('Version','Tentativas',0);
      if fRegistro = nil then
        fRegistro := TfRegistro.Create(nil);
      fRegistro.funcLocal := Self.funcPrincipal;
      fRegistro.ShowModal;
      if boolRegister then begin
        iniTMP.WriteBool('Version','Register',true);
        iniTMP.WriteBool('Version','Statistic',true);
        DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
        iniTMP.WriteString('Version','Date',FormatFloat('00',Mes)+'-'+IntToStr(Ano));
      end else begin
        funcPrincipal.Alerta('Não foi possível efetuar o registro de sua cópia do AR Sistemas.'+#13+#13+
                             'Por favor tente novamente mais tarde!',1);
        intI := iniTMP.ReadInteger('Version','Tentativas',1);
        if intI = 3 then begin
          iniTMP.WriteBool('Version','Register',true);
        end else begin
          inc(intI);
          iniTMP.WriteInteger('Version','Tentativas',intI);
        end;
      end;
    end;
  finally
    FreeAndNil(fRegistro);
    FreeAndNil(iniTMP);
  end;
end;

procedure TfPrincipal.DownloadLicenca;
var
  strCaminho,
  strLicenca,
  strMAC,
  strCaminhoMAC : String;
  txtTMP        : TextFile;
  cdsChave      : TClientDataSet;
  intResult     : Integer;

{$REGION 'LerChaveLicenca'}
  procedure LerChaveLicenca;
  begin
    ///Criase um dataset para armazenamento das informações
    if cdsChave.Active then
      cdsChave.Close;
    cdsChave.FieldDefs.Clear;
    cdsChave.FieldDefs.Add('ICODE',ftString,20,False);
    cdsChave.FieldDefs.Add('CHAVE',ftString,250,false);
    cdsChave.CreateDataSet;
    cdsChave.Open;
    ///Verifica-se se o arquivo com o serial do HD esteja criado, senão passasse
    ///para o MAC da máquina
    if FileExists(strCaminho) then begin
      cdsChave.LoadFromFile(strCaminho);
    end else if FileExists(strCaminhoMAC) then begin
      cdsChave.LoadFromFile(strCaminhoMAC);
    end else Exit;

    ///Verifica se o valor retornado no arquivo de licença bate com as informações
    if FileExists(strCaminho) or FileExists(strCaminhoMAC) or
       (cdsChave.FieldByName('ICODE').AsString = Trim(GetIDESerialNumber(0))) or
       (cdsChave.FieldByName('ICODE').AsString = MacAddress) then begin
      if not cdsChave.IsEmpty then begin
        try
          ///Caso o arquivo da licenca não exista, cria-se
          if not FileExists(ExtractFilePath(Application.ExeName)+'rtlwinsystem.bpl') then begin
            try
              AssignFile(txtTMP, ExtractFilePath(Application.ExeName)+'rtlwinsystem.bpl');
              CloseFile(txtTMP);
            except
            end;
          end;
          ///Escreve as informações sobre a licença do usuário
          AssignFile(txtTMP, ExtractFilePath(ParamStr(0))+'rtlwinsystem.bpl');
          Rewrite(txtTMP);
          WriteLn(txtTMP,cdsChave.FieldByName('CHAVE').AsString);
        finally
          CloseFile(txtTMP);
        end;
      end;
    end;
  end;
{$ENDREGION}

begin
  Exit;
  try
    cdsChave        := TClientDataSet.Create(nil);
    try
      ///Setando os valores de licença como Serial HD e MAC da Máquina, na falta de um
      ///o outro substitui
      strLicenca    := Trim(GetIDESerialNumber(0))+'.xml';
      strMAC        := MacAddress     + '.xml';
      strCaminho    := ExtractFilePath(ParamStr(0));
      strCaminhoMAC := strCaminho;
      strCaminho    := strCaminho     + strLicenca;
      strCaminhoMAC := strCaminhoMAC  + strMAC;
      try
        ///Efetua o exclusão d o arquivo url.txt, para que seja baixado novamente.
        while FileExists(ExtractFilePath(ParamStr(0))+'url.bpl') do begin
          SetFileAttributes(PWideChar(ExtractFilePath(ParamStr(0))+'url.bpl'),FILE_ATTRIBUTE_NORMAL);
          DeleteFile(PChar(ExtractFilePath(ParamStr(0))+'url.bpl'));
        end;
        ///Realiza o download do arquivo url.bpl
        intResult     := URLDownloadToFile(nil,PChar('http://www.arsistemaseconsultoria.com.br/licencas/teste.txt'),PChar(ExtractFilePath(ParamStr(0))+'url.bpl'), 0, nil);
      except
        intResult     := 0;
      end;
      ///Caso ele consiga efetuar o download ele continuar com o processo, caso
      ///contrario ele aborta o processo mantendo a licença atual.
      if intResult > 0 then begin
        ///1º Etapa, se existe o arquivo de licença com o Serial do HD ele efetua
        ///um backup do mesmo e tenta efetuar o download dele novamente.
        while FileExists(strCaminho) do begin
          SetFileAttributes(PWideChar(strCaminho),FILE_ATTRIBUTE_NORMAL);
          RenameFile(strCaminho,strCaminho+'.bkp');
        end;
        ///O mesmo se efetua com o arquivo de licença com o MAC da Máquina.
        while FileExists(strCaminhoMAC) do begin
          SetFileAttributes(PWideChar(strCaminhoMAC),FILE_ATTRIBUTE_NORMAL);
          RenameFile(strCaminhoMAC,strCaminhoMAC+'.bkp');
        end;
        ///2º Etapa, caso a licença gerada com o Serial do HD não venha vazia ele
        ///continua com o processo senão tenta-se com o MAC do máquina
        if strLicenca <> '.xml' then begin
          try
            ///Tenta-se efetuar o download da licença pelo serial do HD
            URLDownloadToFile(nil, PChar('http://www.arsistemaseconsultoria.com.br/licencas/'+strLicenca),PChar(strCaminho), 0, nil);
          except
          end;
          ///Caso após a conclusão do download não tenha retornando um valor tenta-se
          ///com o mac da maquina
          if not FileExists(strCaminho) then begin
            try
              ///Tenta-se efetuar o download com o mac da máquina
              URLDownloadToFile(nil, PChar('http://www.arsistemaseconsultoria.com.br/licencas/'+strMAC),PChar(strCaminhoMAC), 0, nil);
            except
            end;
          end;
        end else begin
          try
            ///Caso o processo de geração do arquivo licença com o serial do HD
            ///tenha falhado ele tenta efetuar o download pelo MAC da máquina
            URLDownloadToFile(nil, PChar('http://www.arsistemaseconsultoria.com.br/licencas/'+strMAC),PChar(strCaminhoMAC), 0, nil);
          except
          end;
        end;
        ///3º Etapa, delete-se o arquivo que contém as informações da licença do
        ///usuário
        ///Caso tenha ocorrido o download corretamente de uma das licenças, exclua-se
        ///os arquivos antigos
        if FileExists(strCaminho) or FileExists(strCaminhoMAC) then begin
          while FileExists(ExtractFilePath(ParamStr(0))+'rtlwinsystem.bpl') do begin
            SetFileAttributes(PWideChar(ExtractFilePath(ParamStr(0))+'rtlwinsystem.bpl'),FILE_ATTRIBUTE_NORMAL);
            DeleteFile(PChar(ExtractFilePath(ParamStr(0))+'rtlwinsystem.bpl'));
          end;
          while FileExists(strCaminho+'.bkp') do begin
            SetFileAttributes(PWideChar(strCaminho+'.bkp'),FILE_ATTRIBUTE_NORMAL);
            DeleteFile(PChar(strCaminho+'.bkp'));
          end;
          while FileExists(strCaminhoMAC+'.bkp') do begin
            SetFileAttributes(PWideChar(strCaminhoMAC+'.bkp'),FILE_ATTRIBUTE_NORMAL);
            DeleteFile(PChar(strCaminhoMAC+'.bkp'));
          end;
          ///Lea-se o arquivo de licença baixado
          LerChaveLicenca;
        ///Caso não tenha ocorrido o download corretamente das licenças, volta-se o
        ///backup realizado das licenças
        end else if FileExists(strCaminho+'.bkp') or FileExists(strCaminhoMAC+'.bkp') then begin
          while FileExists(strCaminho+'.bkp') do begin
            SetFileAttributes(PWideChar(strCaminho+'.bkp'),FILE_ATTRIBUTE_NORMAL);
            RenameFile(strCaminho+'.bkp',strCaminho);
          end;
          while FileExists(strCaminhoMAC+'.bkp') do begin
            SetFileAttributes(PWideChar(strCaminhoMAC+'.bkp'),FILE_ATTRIBUTE_NORMAL);
            RenameFile(strCaminhoMAC+'.bkp',strCaminhoMAC);
          end;
          ///Lea-se o arquivo de licença baixado
          LerChaveLicenca;
        end;
      end else begin
        LerChaveLicenca;
        Exit;
      end;
    except
    end;
  finally
    FreeAndNil(cdsChave);
  end;
end;

procedure TfPrincipal.BloqueioCNPJ(strCNPJ : String);

function RelacaoMAC(strMAC : String) : Boolean;
begin
  Result := Trim(strMAC) = MacAddress();
end;

var
  qryCons : TSQLQuery;
begin
  try
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT COUNT(*) AS QTDE');
        sql.Add('  FROM EMPRESAS');
        sql.Add(' WHERE EMPR_CNPJ = ' + QuotedStr(funcPrincipal.Buscar_Coluna(strCNPJ,1)));
        Open;
        if (FieldByName('QTDE').AsInteger > 0) then begin
          sql.Clear;
          sql.Add('UPDATE CONF_SISTEMA');
          sql.Add('   SET CSIS_BSYS = ' + QuotedStr(funcPrincipal.Buscar_Coluna(strCNPJ,2)));
          ExecSQL();
        end;
      end;
    except
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfPrincipal.VerificaVersaoSistema;
var
  txtTMP      : TextFile;
  strCNPJ     : String;
  strVersion  : String;
  strLink     : String;
  strTMP      : PWideChar;
begin
  lbVersaoSistema.Caption := '';
  if not FileExists(ExtractFilePath(ParamStr(0))+'url.bpl') then Exit;
  try
    AssignFile(txtTMP,PChar(ExtractFilePath(ParamStr(0))+'url.bpl'));
    Reset(txtTMP);
    ReadLn(txtTMP,strVersion);
    try
      StrToInt(strVersion);
      while not Eof(txtTMP) do begin
        ReadLn(txtTMP, strCNPJ);
        BloqueioCNPJ(strCNPJ);
      end;
    except
      Exit;
    end;
    ///Verifica se a versão atual do sistema e inferior a versão WEB
    if (intVersion < StrToInt(strVersion)) then begin
      ///Verifica o numero de versão se for inferior a 3 so apresenta mensagem senão obriga download
      if (StrToInt(strVersion) - intVersion) < 3 then begin
        lbVersaoSistema.Caption := 'Nova versão disponível para download!';
        Exit;
      end else begin
        fAtualizacao.lbl1.Caption := 'Uma versão superior a sua já se encontra '+
                                     'disponível para download. É necessário '+
                                     'realizar a atualização de seu sistema para '+
                                     'está nova versão antes de continuar.';
        fAtualizacao.lbl2.Caption := 'Ao clicar em OK eu vou redirecionar você '+
                                     'para o nosso site ( www.arsistemaseconsultoria.com.br ), '+
                                     'selecione a sua versão, faça o download é '+
                                     'a instalação desta nova versão. Se isso '+
                                     'não acontecer, você mesmo pode entrar em '+
                                     'nosso site e fazer o download por conta própria.';
        fAtualizacao.lbl3.Caption := 'Não se preocupe, você não irá perder suas informações!';
        fAtualizacao.lbl4.Caption := 'Depois que você finalizar a instalação para esta nova versão, continue a utilizar o sistema normalmente.';
        fAtualizacao.lbl5.Caption := 'Agora clique em OK para que eu redirecione você para o nosso site.';
        fAtualizacao.ShowModal;
        try
          strLink := 'http://www.arsistemaseconsultoria.com.br/index2.php';
          strTMP  := StringToOleStr(strLink);
          HlinkNavigateString(nil,strTMP);
        except
        end;
        Application.Terminate;
      end;
    end;
  finally
    CloseFile(txtTMP);
  end;
end;

function TfPrincipal.MacAddress(): string;
var
  Lib: Cardinal;
  Func: function(GUID: PGUID): Longint; stdcall;
  GUID1, GUID2: TGUID;
begin
  Result  := '';
  Lib     := LoadLibrary('rpcrt4.dll');
  if Lib <> 0 then begin
    @Func := GetProcAddress(Lib, 'UuidCreateSequential');
    if Assigned(Func) then begin
       if (Func(@GUID1) = 0) and
       (Func(@GUID2) = 0) and
       (GUID1.D4[2] = GUID2.D4[2]) and
       (GUID1.D4[3] = GUID2.D4[3]) and
       (GUID1.D4[4] = GUID2.D4[4]) and
       (GUID1.D4[5] = GUID2.D4[5]) and
       (GUID1.D4[6] = GUID2.D4[6]) and
       (GUID1.D4[7] = GUID2.D4[7]) then begin
         Result :=
         IntToHex(GUID1.D4[2], 2) + '-' +
         IntToHex(GUID1.D4[3], 2) + '-' +
         IntToHex(GUID1.D4[4], 2) + '-' +
         IntToHex(GUID1.D4[5], 2) + '-' +
         IntToHex(GUID1.D4[6], 2) + '-' +
         IntToHex(GUID1.D4[7], 2);
       end;
    end;
  end;
end;

procedure TfPrincipal.LoadAlerts;

{$REGION 'TrocaUsuario'}
  procedure TrocaUsuario;
  var
    treeItem : TTreeNode;
  begin
//    treeItem      := treeAvisos.Items.Add(nil,'Trocar usuário.');
    treeItem := nil;
    treeItem.Data := Pointer(99);
  end;
{$ENDREGION}

{$REGION 'SaldoBancario'}
  procedure SaldoBancario;
  var
    fltSaldo : Real;
  begin
    fltSaldo := funcPrincipal.SaldoBancario;
    if  fltSaldo > 0 then begin
      Label30.Caption := 'Saldo Bancário: R$ ' + FormatFloat('###,###,##0.00',fltSaldo);
      fltBanco := fltSaldo;
      if fltSaldo <= 0 then
        Label30.Font.Color    := clRed
      else Label30.Font.Color := clBlue;
    end else begin
      Label30.Font.Color := clRed;
      Label30.Caption := 'Saldo Bancário: R$ ' + FormatFloat('###,###,##0.00',0);
    end;
  end;
{$ENDREGION}

{$REGION 'SaldoemCaixa'}
  procedure SaldoemCaixa;
  var
    qryCons  : TSQLQuery;
  begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT FIRST 1');
          sql.Add('       COALESCE(LCAX_VLR_SALDO,0)');
          sql.Add('  FROM LIVRO_CAIXA');
          sql.Add(' WHERE LCAX_EMPR_ID = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add(' ORDER BY');
          sql.Add('       LCAX_ID DESC');
          Open;
          if not IsEmpty then begin
            Label31.Caption := 'Saldo Caixa: R$ ' + FormatFloat('###,###,##0.00',qryCons.Fields[0].AsFloat);
            fltCaixa := qryCons.Fields[0].AsFloat;
          end else Label31.Caption := 'Saldo Caixa: R$ ' + FormatFloat('###,###,##0.00',0);
          if qryCons.Fields[0].AsFloat <= 0 then
            Label31.Font.Color := clRed
          else Label31.Font.Color := clBlue;
        end;
      except on e: exception do
        funcPrincipal.ReportaErro(Caption,'SaldoemCaixa',e.Message);
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'SaldoBancoNegativo'}
  procedure SaldoBancoNegativo;
  var
    qryCons  : TSQLQuery;
  begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT COALESCE(SUM(CBCO_SALDO_ATUAL),0)');
          sql.Add('  FROM CONTAS_BANCARIAS');
          sql.Add(' WHERE CBCO_EMPR_ID                       = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('   AND COALESCE(CBCO_ATIVO,1)             = 1');
          sql.Add('   AND COALESCE(CBCO_CONSIDERAR_SALDOS,1) = 1');
          sql.Add('   AND COALESCE(CBCO_SALDO_ATUAL,0)       < 0');
          Open;
          if (not IsEmpty) and (qryCons.Fields[0].AsFloat < 0) then begin
            Label36.Visible    := true;
            Label36.Caption    := 'Consta(m) saldo(s) bancário(s) negativo(s): R$ ' + FormatFloat('###,###,##0.00',qryCons.Fields[0].AsFloat);
            Label36.Font.Color := clRed;
          end else Label36.Visible := false;
        end;
      except on e: exception do
        funcPrincipal.ReportaErro(Caption,'SaldoBancoNegativo',e.Message);
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'ContasPagar'}
  procedure ContasPagar;
  var
    qryCons  : TSQLQuery;
  begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT COUNT(*)');
          sql.Add('  FROM CONTAS_PAGAR');
          sql.Add(' WHERE CPAG_EMPR_ID   = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('   AND CPAG_STATUS   <> ' + QuotedStr('C'));
          sql.Add('   AND CPAG_STATUS   <> ' + QuotedStr('F'));
          sql.Add('   AND CPAG_DTA_VCTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcPrincipal.DataServidor(funcPrincipal.Conexao))));
          Open;
          if qryCons.Fields[0].AsInteger > 0 then begin
            Label32.Visible    := true;
            Label32.Caption    := 'Você tem título(s) pendente(s) de pagto'
          end else Label32.Visible := false;
        end;
      except on e: exception do
        funcPrincipal.ReportaErro(Caption,'SaldoBancoNegativo',e.Message);
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'ContasReceber'}
  procedure ContasReceber;
  var
    qryCons  : TSQLQuery;
  begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COUNT(*)');
          sql.Add('FROM  CONTAS_RECEBER');
          sql.Add('WHERE CREC_EMPR_ID   = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CREC_STATUS   <> ' + QuotedStr('C'));
          sql.Add('AND   CREC_STATUS   <> ' + QuotedStr('F'));
          sql.Add('AND   CREC_DTA_VCTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcPrincipal.DataServidor(funcPrincipal.Conexao))));
          Open;
          if qryCons.Fields[0].AsInteger > 0 then begin
            Label37.Visible := true;
            Label37.Caption := 'Você tem título(s) pendente(s) de receb.'
          end else Label37.Visible := false;
        end;
      except on e: exception do
        funcPrincipal.ReportaErro(Caption,'SaldoBancoNegativo',e.Message);
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'PercentualAlcancado'}
  procedure PercentualAlcancado;

  function PercenteRenda : Integer;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(CSIS_PERCENTE_RENDA,0)');
          sql.Add('FROM  CONF_SISTEMA');
          sql.Add('WHERE CSIS_EMPR_ID = ' + IntToStr(funcPrincipal.Empr_ID));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsInteger;
        end;
      except
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;

  var
    floatValorX : Real;
  begin
    try
      floatValorX := (floatCredito / 100);
      floatValorX := (floatDebito / floatValorX);
      if floatValorX <= 0 then floatValorX := 0;
      Label27.Caption := 'Você já tem ' + FormatFloat('0.00',floatValorX) + '% de sua renda comprometida.';
      if floatValorX >= PercenteRenda then
        Label27.Font.Color := clRed
      else Label27.Font.Color := clBlue;
    except
    end;
  end;
{$ENDREGION}

{$REGION 'MediaGastoDia'}
  procedure MediaGastoDia;
  begin
    Label28.Caption := 'Média de [ gastos por dia R$ ' + FormatFloat('##,###,###0.00',(floatDebito / 30)) +
                       ' ] / [' + 'ganhos por dia R$ ' + FormatFloat('##,###,###0.00',(floatCredito / 30)) + ' ] ';
    if floatDebito > floatCredito then
      Label28.Font.Color := clRed
    else Label28.Font.Color := clBlue;
  end;
{$ENDREGION}

{$REGION 'FechamentoAno'}
  procedure FechamentoAno;
  var
    fltAtivo,
    fltPassivo,
    fltPrev,
    fltCronc : Real;
    Dia,Mes,Ano  : Word;

    procedure RetornaAtivos(intTipo : Integer);
    var
      qryCons : TSQLQuery;
    begin
      try
        qryCons := TSQLQuery.Create(nil);
        qryCons.SQLConnection := funcPrincipal.Conexao;
        try
          with qryCons do begin
            Close;
            sql.Clear;
            case intTipo of
              0 : begin
                sql.Add('SELECT');
                sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0) VALOR');
                sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
                sql.Add('INNER JOIN CONTAS_RECEBER CR');
                sql.Add('ON (CR.CREC_ID            = AC.ACRE_CREC_ID');
                sql.Add('AND CR.CREC_EMPR_ID       = AC.ACRE_CREC_EMPR_ID)');
                sql.Add('INNER JOIN PLANO_CONTAS PL');
                sql.Add('ON (PL.PLCT_ID            = CR.CREC_PLCT_ID');
                sql.Add('AND PL.PLCT_EMPR_ID       = CR.CREC_PLCT_EMPR_ID)');
                sql.Add('WHERE AC.ACRE_EMPR_ID                         = ' + IntToStr(funcPrincipal.Empr_ID));
                sql.Add('AND   CR.CREC_STATUS                         <> ' + QuotedStr('C'));
                sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO) = ' + IntToStr(Ano));
              end;
              1 : begin
                sql.Add('SELECT');
                SQL.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0) VALOR');
                SQL.Add('FROM  CONTAS_RECEBER CR');
                SQL.Add('INNER JOIN PLANO_CONTAS PL');
                SQL.Add('ON (PL.PLCT_ID            = CR.CREC_PLCT_ID');
                SQL.Add('AND PL.PLCT_EMPR_ID       = CR.CREC_PLCT_EMPR_ID)');
                SQL.Add('WHERE CR.CREC_EMPR_ID                     = ' + IntToStr(funcPrincipal.Empr_ID));
                SQL.Add('AND   CR.CREC_STATUS                     <> ' + QuotedStr('C'));
                SQL.Add('AND   EXTRACT(YEAR FROM CR.CREC_DTA_VCTO) = ' + IntToStr(Ano));
              end;
            end;
//            ShowMessage(qryCons.Text);
            Open;
            fltAtivo := qryCons.Fields[0].AsFloat;
          end;
        except on e: exception do begin
          funcPrincipal.ReportaErro(Caption,'RetornaAtivos',e.Message);
          funcPrincipal.Alerta('Erro no processo de montagem dos Dados.'+#13+'['+e.Message+']',1);
        end; end;
      finally
        qryCons.Close;
        FreeAndNil(qryCons);
      end;
    end;

    procedure RetornaPassivos(intTipo : Integer);
    var
      qryCons : TSQLQuery;
    begin
      try
        qryCons := TSQLQuery.Create(nil);
        qryCons.SQLConnection := funcPrincipal.Conexao;
        try
          with qryCons do begin
            Close;
            sql.Clear;
            case intTipo of
              0 : begin
                sql.Add('SELECT');
                sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0) VALOR');
                sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
                sql.Add('INNER JOIN CONTAS_PAGAR CP');
                sql.Add('ON (CP.CPAG_ID            = AC.ACPG_CPAG_ID');
                sql.Add('AND CP.CPAG_EMPR_ID       = AC.ACPG_CPAG_EMPR_ID)');
                sql.Add('INNER JOIN PLANO_CONTAS PL');
                sql.Add('ON (PL.PLCT_ID            = CP.CPAG_PLCT_ID');
                sql.Add('AND PL.PLCT_EMPR_ID       = CP.CPAG_PLCT_EMPR_ID)');
                sql.Add('WHERE AC.ACPG_EMPR_ID                         = ' + IntToStr(funcPrincipal.Empr_ID));
                sql.Add('AND   CP.CPAG_STATUS                         <> ' + QuotedStr('C'));
                sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO) = ' + IntToStr(Ano));
              end;
              1 : begin
                sql.Add('SELECT');
                SQL.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0) VALOR');
                SQL.Add('FROM  CONTAS_PAGAR CP');
                SQL.Add('INNER JOIN PLANO_CONTAS PL');
                SQL.Add('ON (PL.PLCT_ID            = CP.CPAG_PLCT_ID');
                SQL.Add('AND PL.PLCT_EMPR_ID       = CP.CPAG_PLCT_EMPR_ID)');
                SQL.Add('WHERE CP.CPAG_EMPR_ID                     = ' + IntToStr(funcPrincipal.Empr_ID));
                SQL.Add('AND   CP.CPAG_STATUS                     <> ' + QuotedStr('C'));
                SQL.Add('AND   EXTRACT(YEAR FROM CP.CPAG_DTA_VCTO) = ' + IntToStr(Ano));
              end;
            end;
//            ShowMessage(qryCons.Text);
            Open;
            fltPassivo := qryCons.Fields[0].AsFloat;
          end;
        except on e: exception do begin
          funcPrincipal.ReportaErro(Caption,'RetornaPassivos',e.Message);
          funcPrincipal.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1);
        end; end;
      finally
        qryCons.Close;
        FreeAndNil(qryCons);
      end;
    end;

  begin
    DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);

    ///Concretizado
    RetornaAtivos(0);
    RetornaPassivos(0);
    fltCronc := fltAtivo - fltPassivo;

    ///Previsão de recebimento
    RetornaAtivos(1);
    RetornaPassivos(1);
    fltPrev  := fltAtivo - fltPassivo;
    Label38.Caption := 'Fechamento para o Ano [ Previsão: R$ '+FormatFloat('###,###,##0.00',fltPrev)+' ] / [ Concretizado R$ '+FormatFloat('###,###,##0.00',fltCronc)+' ]';
    if fltPrev <= 0 then
      Label38.Font.Color := clRed
    else Label38.Font.Color := clBlue;
  end;
{$ENDREGION}

{$REGION 'PrevisaoCrescimento'}
  procedure PrevisaoCrescimento;
  var
    Dia,
    Mes,
    Ano        : Word;
    floatPerc,
    floatAnoI,
    floatAnoII : Real;
    qryCons    : TSQLQuery;
  begin
    try
      DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          ///Pega todos os acertos do ano passado onde as c. Receber forem diferente de CANCELADOS
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
          sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
          sql.Add('INNER JOIN CONTAS_RECEBER CR');
          sql.Add('ON (AC.ACRE_CREC_ID      = CR.CREC_ID');
          sql.Add('AND AC.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)');
          sql.Add('WHERE AC.ACRE_EMPR_ID                         = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO) = ' + IntToStr(Ano - 1));
          sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
          Open;
          floatAnoI := qryCons.Fields[0].AsFloat;
          SQL.Clear;
          ///Pega todos os pagamentos do ano passado onde as c. pagar forem diferentes de Cancelados
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC),0)');
          sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
          sql.Add('INNER JOIN CONTAS_PAGAR CP');
          sql.Add('ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
          sql.Add('AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
          sql.Add('WHERE AC.ACPG_EMPR_ID                         = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO) = ' + IntToStr(Ano - 1));
          sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
          Open;
          floatAnoI := (floatAnoI - (qryCons.Fields[0].AsFloat * -1));
          if floatAnoI < 0 then
            floatAnoI := (floatAnoI * -1);
          sql.Clear;
          ///Pega todos os recebimento do ano que não estejam cancelados
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
          sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
          sql.Add('INNER JOIN CONTAS_RECEBER CR');
          sql.Add('ON (AC.ACRE_CREC_ID      = CR.CREC_ID');
          sql.Add('AND AC.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)');
          sql.Add('WHERE AC.ACRE_EMPR_ID                         = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO) = ' + IntToStr(Ano));
          sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
          Open;
          floatAnoII := qryCons.Fields[0].AsFloat;
          SQL.Clear;
          ///Pega todos os pagamentos do ano que não estejam cancelados
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC),0)');
          sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
          sql.Add('INNER JOIN CONTAS_PAGAR CP');
          sql.Add('ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
          sql.Add('AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
          sql.Add('WHERE AC.ACPG_EMPR_ID                         = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO) = ' + IntToStr(Ano));
          sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
          Open;
          floatAnoII := (floatAnoII - (qryCons.Fields[0].AsFloat * -1));
        end;
        try
          if floatAnoI > 0 then begin
            floatPerc := (((floatAnoII - floatAnoI) / (floatAnoI / 100)));
            if floatPerc <= 0 then floatPerc := 0;
          end else begin
            floatPerc := 100;
          end;
        except
          floatPerc := 0;
        end;
        Label26.Caption := 'Crescimento do ano até o momento: '+FormatFloat('##,###,###0.00',floatPerc)+'%';
        if floatPerc <= 0 then
          Label26.Font.Color    := clRed
        else Label26.Font.Color := clBlue;
      except
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'PrevisaoFechamentoAno'}
  procedure PrevisaoFechamentoAno;
  var
    Dia, Mes, Ano : Word;
    qryCons  : TSQLQuery;
  begin
    try
      DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      SUM(VALOR)');
          sql.Add('FROM');
          sql.Add('    (SELECT');
          sql.Add('           COALESCE(SUM(AC.ACRE_VALOR_DOC),0) AS VALOR');
          sql.Add('     FROM CONTAS_RECEBER_ACERTOS AC');
          sql.Add('     INNER JOIN CONTAS_RECEBER CR');
          sql.Add('     ON (AC.ACRE_CREC_ID        = CR.CREC_ID');
          sql.Add('     AND AC.ACRE_CREC_EMPR_ID   = CR.CREC_EMPR_ID)');
          sql.Add('     WHERE CR.CREC_EMPR_ID      = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('     AND   CR.CREC_STATUS      <> ' + QuotedStr('C'));
          sql.Add('     AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO) = ' + IntToStr(Ano));
          sql.Add('');
          sql.Add('     UNION');
          sql.Add('');
          sql.Add('     SELECT');
          sql.Add('           COALESCE(SUM(AC.ACPG_VALOR_DOC),0) AS VALOR');
          sql.Add('     FROM  CONTAS_PAGAR_ACERTOS AC');
          sql.Add('     INNER JOIN CONTAS_PAGAR CP');
          sql.Add('     ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
          sql.Add('     AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
          sql.Add('     WHERE CP.CPAG_EMPR_ID                         = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('     AND   CP.CPAG_STATUS                         <> ' + QuotedStr('C'));
          sql.Add('     AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO) = ' + IntToStr(Ano));
          sql.Add('     )');
          Open;
        end;
        Label25.Caption := 'Fechamento do ano: R$ '+FormatFloat('##,###,###0.00',(qryCons.Fields[0].AsFloat));
        if qryCons.Fields[0].AsFloat <= 0 then
          Label25.Font.Color    := clRed
        else Label25.Font.Color := clBlue;
      except on e: exception do
        funcPrincipal.ReportaErro(Caption,'PrevisaoFechamentoAno',e.Message);
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'MetaAno'}
  procedure MetaAno;
  var
    qryCons    : TSQLQuery;
    fltVlrX    : Real;
  begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(CSIS_VLR_META_ANO,0)');
          sql.Add('FROM  CONF_SISTEMA');
          sql.Add('WHERE CSIS_EMPR_ID = ' + IntToStr(funcPrincipal.Empr_ID));
          Open;
        end;
        fltBanco := funcPrincipal.SaldoBancario(True);
        if qryCons.Fields[0].AsFloat > 0 then begin
          fltVlrX := (qryCons.Fields[0].AsFloat / 100);
          fltVlrX := ((fltCaixa + fltBanco) / fltVlrX);
          if fltVlrX <= 0 then fltVlrX := 0;
        end else begin
          fltVlrX := 0;
        end;
        lbmeta.Caption := 'Meta p/ Ano: (' + FormatFloat('###,###,##0.00',(fltCaixa + fltBanco)) + ' / ' +
                                             FormatFloat('###,###,##0.00',qryCons.Fields[0].AsFloat) + ') Perc.: ' +
                                             FormatFloat('###,###,##0.00',fltVlrX) + '%';
        if ((fltCaixa + fltBanco) <= 0) or (qryCons.Fields[0].AsFloat <= 0) then
          lbmeta.Font.Color := clRed
        else if (fltCaixa + fltBanco) < qryCons.Fields[0].AsFloat then
          lbmeta.Font.Color := clGreen
        else if (fltCaixa + fltBanco) >= qryCons.Fields[0].AsFloat then
          lbmeta.Font.Color := clBlue;
      except
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'LimiteCartaoCredito'}
  procedure LimiteCartaoCredito();
  var
    qryCons  : TSQLQuery;
  begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT SUM(COALESCE(CCRE_LIMITE_COMPRAS,0) -');
          sql.Add('       (SELECT COALESCE(SUM(CPAG_VALOR_DOC-CPAG_VALOR_PAGO),0)');
          sql.Add('          FROM CONTAS_PAGAR');
          sql.Add('         WHERE CPAG_EMPR_ID      = CCRE_EMPR_ID');
          sql.Add('           AND CPAG_CCRE_ID      = CCRE_ID');
          sql.Add('           AND CPAG_CCRE_EMPR_ID = CCRE_EMPR_ID');
          sql.Add('           AND CPAG_STATUS       = ''A''');
          sql.Add('           AND CPAG_PREVISAO     = 0) +');
          sql.Add('       (SELECT COALESCE(SUM(CREC_VALOR_DOC-CREC_VALOR_PAGO),0)');
          sql.Add('          FROM CONTAS_RECEBER');
          sql.Add('         WHERE CREC_EMPR_ID      = CCRE_EMPR_ID');
          sql.Add('           AND CREC_CCRE_ID      = CCRE_ID');
          sql.Add('           AND CREC_CCRE_EMPR_ID = CCRE_EMPR_ID');
          sql.Add('           AND CREC_STATUS       = ''A''');
          sql.Add('           AND CREC_PREVISAO     = 0))                            AS SALDO');
          sql.Add('  FROM CARTAO_CREDITO');
          sql.Add(' WHERE CCRE_EMPR_ID              = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('   AND CCRE_ATIVO                = 1');
//          sql.SaveToFile('C:\text.txt');
          Open;
          lblLimite.Caption    := 'Limite C. Créd.: R$ ' + FormatFloat('###,###,##0.00',qryCons.Fields[0].AsFloat);
          if qryCons.Fields[0].AsFloat < 0 then
            lblLimite.Font.Color := clRed
          else lblLimite.Font.Color := clBlue;
        end;
      except on e: exception do
        funcPrincipal.ReportaErro(Caption,'SaldoBancoNegativo',e.Message);
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

begin
  PrevisaoFechamentoAno;
  PrevisaoCrescimento;
  PercentualAlcancado;
  MediaGastoDia;
  FechamentoAno;
  SaldoTitulos;
  SaldoBancario;
  SaldoemCaixa;
  LimiteCartaoCredito;
  MetaAno;
  SaldoBancoNegativo;
  ContasPagar;
  ContasReceber;
end;

procedure TfPrincipal.SaldoTitulos;
var
  arrayForma    : array[1..8] of Real;
  intI          : Integer;
  qryCons       : TSQLQuery;
  Dia, Mes, Ano : Word;
begin
  try
    for intI := 1 to 8 do
      arrayForma[intI] := 0;

    DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      CR.CREC_GENE_ID_TIPO_DOC,');
        sql.Add('      SUM(CR.CREC_VALOR_DOC - CR.CREC_VALOR_PAGO) AS VALOR');
        sql.Add('FROM  CONTAS_RECEBER CR');
        sql.Add('WHERE CR.CREC_EMPR_ID = ' + IntToStr(funcPrincipal.Empr_ID));
        sql.Add('AND   CR.CREC_STATUS <> ' + QuotedStr('C'));
        sql.Add('AND   CR.CREC_STATUS <> ' + QuotedStr('F'));
        sql.Add('AND   EXTRACT(YEAR FROM CR.CREC_DTA_VCTO) <= ' + IntToStr(Ano));
        sql.Add('GROUP BY');
        sql.Add('      1');
        Open;
        First;
        while not eof do begin
          arrayForma[qryCons.Fields[0].AsInteger] := qryCons.Fields[1].AsFloat;
          Next;
        end;
      end;
    except
    end;
  finally
    lbSaldo.Caption := 'Saldo em Títulos: [DH R$ '+FormatFloat('###,###,##0.00',arrayForma[1])+'] '+
                                         '[CH R$ '+FormatFloat('###,###,##0.00',arrayForma[2])+'] '+
                                         '[CP R$ '+FormatFloat('###,###,##0.00',arrayForma[3])+'] '+
                                         '[CD R$ '+FormatFloat('###,###,##0.00',arrayForma[4])+'] ';
    LbSaldo2.Caption := '[CC R$ '+FormatFloat('###,###,##0.00',arrayForma[5])+'] '+
                        '[CT R$ '+FormatFloat('###,###,##0.00',arrayForma[6])+'] '+
                        '[BL R$ '+FormatFloat('###,###,##0.00',arrayForma[7])+'] '+
                        '[DP R$ '+FormatFloat('###,###,##0.00',arrayForma[8])+']';
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfPrincipal.LoadBussiness;

/// CONTAS A PAGAR / RECEBER

{Nesta parte do sistema e realizado o calculo para o usuário para previsao de
titulos a serem recebidos e pagos, independente de seu recebimento/pagamento}

{$REGION 'CreditoOntem'}
  function CreditoOntem : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(CREC_VALOR_DOC),0) VALOR_DOC');
          sql.Add('FROM  CONTAS_RECEBER');
          sql.Add('WHERE CREC_EMPR_ID  = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CREC_STATUS  <> ' + QuotedStr('C'));
          sql.Add('AND   CREC_DTA_VCTO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',(funcPrincipal.DataServidor(funcPrincipal.Conexao)-1))));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'CreditoHoje'}
  function CreditoHoje : Real;
  var
    qryCons     : TSQLQuery;
    Dia,Mes,Ano : Word;
  begin
    try
      Result  := 0;
      DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(CREC_VALOR_DOC),0) VALOR_DOC');
          sql.Add('FROM  CONTAS_RECEBER');
          sql.Add('WHERE CREC_EMPR_ID  = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CREC_STATUS  <> ' + QuotedStr('C'));
          sql.Add('AND   CREC_DTA_VCTO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',(funcPrincipal.DataServidor(funcPrincipal.Conexao)))));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'CreditoAmanha'}
  function CreditoAmanha : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(CREC_VALOR_DOC),0) VALOR_DOC');
          sql.Add('FROM  CONTAS_RECEBER');
          sql.Add('WHERE CREC_EMPR_ID  = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CREC_STATUS  <> ' + QuotedStr('C'));
          sql.Add('AND   CREC_DTA_VCTO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',(funcPrincipal.DataServidor(funcPrincipal.Conexao)+1))));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'CreditoMes'}
  function CreditoMes : Real;
  var
    qryCons : TSQLQuery;
    Dia,
    Mes,
    Ano     : Word;
  begin
    try
      Result  := 0;
      DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      SUM(VALOR_DOC)');
          sql.Add('FROM');
          sql.Add('    (');
          sql.Add('     SELECT');
          sql.Add('           COALESCE(SUM(CREC_VALOR_DOC),0) VALOR_DOC');
          sql.Add('     FROM  CONTAS_RECEBER');
          sql.Add('     WHERE CREC_EMPR_ID                       = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('     AND   CREC_STATUS                       <> ' + QuotedStr('C'));
          sql.Add('     AND   CREC_STATUS                       <> ' + QuotedStr('F'));
          sql.Add('     AND   EXTRACT(MONTH FROM CREC_DTA_VCTO) <= ' + IntToStr(Mes));
          sql.Add('     AND   EXTRACT(YEAR  FROM CREC_DTA_VCTO)  = ' + IntToStr(Ano));
          sql.Add('');
          sql.Add('     UNION');
          sql.Add('');
          sql.Add('     SELECT');
          sql.Add('           COALESCE(SUM(CREC_VALOR_DOC),0) VALOR_DOC');
          sql.Add('     FROM  CONTAS_RECEBER');
          sql.Add('     WHERE CREC_EMPR_ID                       = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('     AND   CREC_STATUS                        = ' + QuotedStr('F'));
          sql.Add('     AND   EXTRACT(MONTH FROM CREC_DTA_PGTO)  = ' + IntToStr(Mes));
          sql.Add('     AND   EXTRACT(YEAR  FROM CREC_DTA_PGTO)  = ' + IntToStr(Ano));
          sql.Add('    )');
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'CreditoProxMes'}
  function CreditoProxMes : Real;
  var
    qryCons : TSQLQuery;
    Dia,
    Mes,
    Ano     : Word;
  begin
    try
      Result  := 0;
      DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(CREC_VALOR_DOC),0) VALOR_DOC');
          sql.Add('FROM  CONTAS_RECEBER');
          sql.Add('WHERE CREC_EMPR_ID                      = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CREC_STATUS                      <> ' + QuotedStr('C'));
          sql.Add('AND   CREC_STATUS                      <> ' + QuotedStr('F'));
          Mes := Mes + 1;
          if Mes > 12 then begin
            Mes := 01;
            Ano := Ano + 1;
          end;
          sql.Add('AND   EXTRACT(MONTH FROM CREC_DTA_VCTO) = ' + IntToStr(Mes));
          sql.Add('AND   EXTRACT(YEAR  FROM CREC_DTA_VCTO) = ' + IntToStr(Ano));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'DebOntem'}
  function DebOntem : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(CPAG_VALOR_DOC),0) VALOR_DOC');
          sql.Add('FROM  CONTAS_PAGAR');
          sql.Add('WHERE CPAG_EMPR_ID  = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CPAG_STATUS  <> ' + QuotedStr('C'));
          sql.Add('AND   CPAG_DTA_VCTO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcPrincipal.DataServidor(funcPrincipal.Conexao)-1)));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'DebHoje'}
  function DebHoje : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(CPAG_VALOR_DOC),0) VALOR_DOC');
          sql.Add('FROM  CONTAS_PAGAR');
          sql.Add('WHERE CPAG_EMPR_ID  = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CPAG_STATUS  <> ' + QuotedStr('C'));
          sql.Add('AND   CPAG_DTA_VCTO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcPrincipal.DataServidor(funcPrincipal.Conexao))));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'DebAmanha'}
  function DebAmanha : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(CPAG_VALOR_DOC),0) VALOR_DOC');
          sql.Add('FROM  CONTAS_PAGAR');
          sql.Add('WHERE CPAG_EMPR_ID  = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CPAG_STATUS  <> ' + QuotedStr('C'));
          sql.Add('AND   CPAG_DTA_VCTO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcPrincipal.DataServidor(funcPrincipal.Conexao)+1)));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'DebMes'}
  function DebMes : Real;
  var
    qryCons : TSQLQuery;
    Dia,
    Mes,
    Ano     : Word;
  begin
    try
      Result  := 0;
      DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      SUM(VALOR_DOC)');
          sql.Add('FROM');
          sql.Add('    (');
          sql.Add('     SELECT');
          sql.Add('           COALESCE(SUM(CPAG_VALOR_DOC),0) VALOR_DOC');
          sql.Add('     FROM  CONTAS_PAGAR');
          sql.Add('     WHERE CPAG_EMPR_ID                       = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('     AND   CPAG_STATUS                       <> ' + QuotedStr('C'));
          sql.Add('     AND   CPAG_STATUS                       <> ' + QuotedStr('F'));
          sql.Add('     AND   EXTRACT(MONTH FROM CPAG_DTA_VCTO) <= ' + IntToStr(Mes));
          sql.Add('     AND   EXTRACT(YEAR  FROM CPAG_DTA_VCTO)  = ' + IntToStr(Ano));
          sql.Add('');
          sql.Add('     UNION');
          sql.Add('');
          sql.Add('     SELECT');
          sql.Add('           COALESCE(SUM(CPAG_VALOR_DOC),0) VALOR_DOC');
          sql.Add('     FROM  CONTAS_PAGAR');
          sql.Add('     WHERE CPAG_EMPR_ID                       = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('     AND   CPAG_STATUS                        = ' + QuotedStr('F'));
          sql.Add('     AND   EXTRACT(MONTH FROM CPAG_DTA_PGTO)  = ' + IntToStr(Mes));
          sql.Add('     AND   EXTRACT(YEAR  FROM CPAG_DTA_PGTO)  = ' + IntToStr(Ano));
          sql.Add('    )');
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'DebProxMes'}
  function DebProxMes : Real;
  var
    qryCons : TSQLQuery;
    Dia,
    Mes,
    Ano     : Word;
  begin
    try
      Result  := 0;
      DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(CPAG_VALOR_DOC),0) VALOR_DOC');
          sql.Add('FROM  CONTAS_PAGAR');
          sql.Add('WHERE CPAG_EMPR_ID                      = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CPAG_STATUS                      <> ' + QuotedStr('C'));
          sql.Add('AND   CPAG_STATUS                      <> ' + QuotedStr('F'));
          Mes := Mes + 1;
          if Mes > 12 then begin
            Mes := 01;
            Ano := Ano + 1;
          end;
          sql.Add('AND   EXTRACT(MONTH FROM CPAG_DTA_VCTO) = ' + IntToStr(Mes));
          sql.Add('AND   EXTRACT(YEAR  FROM CPAG_DTA_VCTO) = ' + IntToStr(Ano));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

/// RECEBIDO / PAGO

{Nesta parte do sistema e realizado o calculo do que realmente foi efetuado pelo
usuario, o que retornará para o usuario somente o que realmente foi recebido/pago}

{$REGION 'CreditoPgtoOntem'}
  function CreditoPgtoOntem : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
          sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
          sql.Add('INNER JOIN CONTAS_RECEBER CR');
          sql.Add('ON (AC.ACRE_CREC_ID      = CR.CREC_ID');
          sql.Add('AND AC.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)');
          sql.Add('WHERE CR.CREC_EMPR_ID      = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CR.CREC_STATUS      <> ' + QuotedStr('C'));
          sql.Add('AND   AC.ACRE_DTA_CADASTRO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcPrincipal.DataServidor(funcPrincipal.Conexao)-1)));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'CreditoPgtoHoje'}
  function CreditoPgtoHoje : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
          sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
          sql.Add('INNER JOIN CONTAS_RECEBER CR');
          sql.Add('ON (AC.ACRE_CREC_ID      = CR.CREC_ID');
          sql.Add('AND AC.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)');
          sql.Add('WHERE CR.CREC_EMPR_ID      = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CR.CREC_STATUS      <> ' + QuotedStr('C'));
          sql.Add('AND   AC.ACRE_DTA_CADASTRO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcPrincipal.DataServidor(funcPrincipal.Conexao))));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'CreditoPgtoAmanha'}
  function CreditoPgtoAmanha : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
          sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
          sql.Add('INNER JOIN CONTAS_RECEBER CR');
          sql.Add('ON (AC.ACRE_CREC_ID      = CR.CREC_ID');
          sql.Add('AND AC.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)');
          sql.Add('WHERE CR.CREC_EMPR_ID      = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CR.CREC_STATUS      <> ' + QuotedStr('C'));
          sql.Add('AND   AC.ACRE_DTA_CADASTRO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcPrincipal.DataServidor(funcPrincipal.Conexao)+1)));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'CreditoPgtoMes'}
  function CreditoPgtoMes : Real;
  var
    qryCons : TSQLQuery;
    Dia,
    Mes,
    Ano : Word;
  begin
    try
      Result  := 0;
      DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
          sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
          sql.Add('INNER JOIN CONTAS_RECEBER CR');
          sql.Add('ON (AC.ACRE_CREC_ID      = CR.CREC_ID');
          sql.Add('AND AC.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)');
          sql.Add('WHERE CR.CREC_EMPR_ID                       = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CR.CREC_STATUS                       <> ' + QuotedStr('C'));
          sql.Add('AND   EXTRACT(MONTH FROM ACRE_DTA_CADASTRO) = ' + IntToStr(Mes));
          SQL.Add('AND   EXTRACT(YEAR FROM ACRE_DTA_CADASTRO)  = ' + IntToStr(Ano));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'DebitoPgtoOntem'}
  function DebitoPgtoOntem : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
          sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
          sql.Add('INNER JOIN CONTAS_PAGAR CP');
          sql.Add('ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
          sql.Add('AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
          sql.Add('WHERE CP.CPAG_EMPR_ID      = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CP.CPAG_STATUS      <> ' + QuotedStr('C'));
          sql.Add('AND   AC.ACPG_DTA_CADASTRO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcPrincipal.DataServidor(funcPrincipal.Conexao)-1)));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'DebitoPgtoHoje'}
  function DebitoPgtoHoje : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
          sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
          sql.Add('INNER JOIN CONTAS_PAGAR CP');
          sql.Add('ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
          sql.Add('AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
          sql.Add('WHERE CP.CPAG_EMPR_ID      = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CP.CPAG_STATUS      <> ' + QuotedStr('C'));
          sql.Add('AND   AC.ACPG_DTA_CADASTRO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcPrincipal.DataServidor(funcPrincipal.Conexao))));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'DebitoPgtoAmanha'}
  function DebitoPgtoAmanha : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
          sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
          sql.Add('INNER JOIN CONTAS_PAGAR CP');
          sql.Add('ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
          sql.Add('AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
          sql.Add('WHERE CP.CPAG_EMPR_ID      = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CP.CPAG_STATUS      <> ' + QuotedStr('C'));
          sql.Add('AND   AC.ACPG_DTA_CADASTRO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcPrincipal.DataServidor(funcPrincipal.Conexao)+1)));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'DebitoPgtoMes'}
  function DebitoPgtoMes : Real;
  var
    qryCons : TSQLQuery;
    Dia,
    Mes,
    Ano : Word;
  begin
    try
      Result  := 0;
      DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
          sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
          sql.Add('INNER JOIN CONTAS_PAGAR CP');
          sql.Add('ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
          sql.Add('AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
          sql.Add('WHERE CP.CPAG_EMPR_ID                       = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CP.CPAG_STATUS                       <> ' + QuotedStr('C'));
          sql.Add('AND   EXTRACT(MONTH FROM ACPG_DTA_CADASTRO) = ' + IntToStr(Mes));
          SQL.Add('AND   EXTRACT(YEAR FROM ACPG_DTA_CADASTRO)  = ' + IntToStr(Ano));
          Open;
          if not IsEmpty then
            Result := qryCons.Fields[0].AsFloat
          else Result := 0;
        end;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'LoadBussiness',e.Message);
        funcPrincipal.Alerta('Erro ao carregar dados financeiros'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

///EVOLUCAO FINANCEIRA

var
  floatCredOntem,
  floatCredHoje,
  floatCredAmanha,
  floatCredMes,
  floatCredProx,
  floatDebOntem,
  floatDebHoje,
  floatDebAmanha,
  floatDebMes,
  floatDebProx,
  floatCredPgOntem,
  floatCredPgHoje,
  floatCredPgAmanha,
  floatCredPgMes,
  floatDebPgOntem,
  floatDebPgHoje,
  floatDebPgAmanha,
  floatDebPgMes      : Real;
  Dia,
  Mes,
  Ano                : Word;
begin
  Application.ProcessMessages;
  DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
  ///CREDITO / DEBIDO DO MES
  floatCredOntem  := CreditoOntem;
  Application.ProcessMessages;
  floatCredHoje   := CreditoHoje;
  Application.ProcessMessages;
  floatCredAmanha := CreditoAmanha;
  Application.ProcessMessages;
  floatCredMes    := CreditoMes;
  Application.ProcessMessages;
  floatCredProx   := CreditoProxMes;
  Application.ProcessMessages;
  floatDebOntem   := DebOntem;
  Application.ProcessMessages;
  floatDebHoje    := DebHoje;
  Application.ProcessMessages;
  floatDebAmanha  := DebAmanha;
  Application.ProcessMessages;
  floatDebMes     := DebMes;
  Application.ProcessMessages;
  floatDebProx    := DebProxMes;
  Application.ProcessMessages;
  floatCredito    := floatCredMes;
  Application.ProcessMessages;
  floatDebito     := floatDebMes;
  Application.ProcessMessages;
  ///Repassando os valores
  lbCredOntem.Caption   := 'R$ ' + FormatFloat('###,###,##0.00',floatCredOntem);
  lbCredHoje.Caption    := 'R$ ' + FormatFloat('###,###,##0.00',floatCredHoje);
  lbCredAmanha.Caption  := 'R$ ' + FormatFloat('###,###,##0.00',floatCredAmanha);
  lbCredMes.Caption     := 'R$ ' + FormatFloat('###,###,##0.00',floatCredMes);
  lbCredProx.Caption    := 'R$ ' + FormatFloat('###,###,##0.00',floatCredProx);
  lbDebOntem.Caption    := 'R$ ' + FormatFloat('###,###,##0.00',floatDebOntem);
  lbDebHoje.Caption     := 'R$ ' + FormatFloat('###,###,##0.00',floatDebHoje);
  lbDebAmanha.Caption   := 'R$ ' + FormatFloat('###,###,##0.00',floatDebAmanha);
  lbDebMes.Caption      := 'R$ ' + FormatFloat('###,###,##0.00',floatDebMes);
  lbDebProx.Caption     := 'R$ ' + FormatFloat('###,###,##0.00',floatDebProx);
  lbTotalOntem.Caption  := 'R$ ' + FormatFloat('###,###,##0.00',(floatCredOntem - floatDebOntem));
  if (floatCredOntem - floatDebOntem) > 0 then
    lbTotalOntem.Font.Color    := clBlue
  else lbTotalOntem.Font.Color := clRed;
  lbTotalHoje.Caption   := 'R$ ' + FormatFloat('###,###,##0.00',(floatCredHoje  - floatDebHoje));
  if (floatCredHoje  - floatDebHoje) > 0 then
    lbTotalHoje.Font.Color    := clBlue
  else lbTotalHoje.Font.Color := clRed;
  lbTotalAmanha.Caption := 'R$ ' + FormatFloat('###,###,##0.00',(floatCredAmanha - floatDebAmanha));
  if (floatCredAmanha - floatDebAmanha) > 0 then
    lbTotalAmanha.Font.Color    := clBlue
  else lbTotalAmanha.Font.Color := clRed;
  lbTotalMes.Caption    := 'R$ ' + FormatFloat('###,###,##0.00',(floatCredMes - floatDebMes));
  if (floatCredMes - floatDebMes) > 0 then
    lbTotalMes.Font.Color    := clBlue
  else lbTotalMes.Font.Color := clRed;
  lbTotalProx.Caption := 'R$ ' + FormatFloat('###,###,##0.00',(floatCredProx - floatDebProx));
  if (floatCredProx - floatDebProx) > 0 then
    lbTotalProx.Font.Color    := clBlue
  else lbTotalProx.Font.Color := clRed;

  /// RECEBIDO / PAGO DO MES
  Application.ProcessMessages;
  floatCredPgOntem  := CreditoPgtoOntem;
  Application.ProcessMessages;
  floatCredPgHoje   := CreditoPgtoHoje;
  Application.ProcessMessages;
  floatCredPgAmanha := CreditoPgtoAmanha;
  Application.ProcessMessages;
  floatCredPgMes    := CreditoPgtoMes;
  Application.ProcessMessages;
  floatDebPgOntem   := DebitoPgtoOntem;
  Application.ProcessMessages;
  floatDebPgHoje    := DebitoPgtoHoje;
  Application.ProcessMessages;
  floatDebPgAmanha  := DebitoPgtoAmanha;
  Application.ProcessMessages;
  floatDebPgMes     := DebitoPgtoMes;
  Application.ProcessMessages;
  ///Repassando nos valores
  lbCredPgOntem.Caption  := 'R$ ' + FormatFloat('###,###,##0.00',floatCredPgOntem);
  lbCredPgHoje.Caption   := 'R$ ' + FormatFloat('###,###,##0.00',floatCredPgHoje);
  lbCredPgAmanha.Caption := 'R$ ' + FormatFloat('###,###,##0.00',floatCredPgAmanha);
  lbCredPgMes.Caption    := 'R$ ' + FormatFloat('###,###,##0.00',floatCredPgMes);
  lbDebPgOntem.Caption   := 'R$ ' + FormatFloat('###,###,##0.00',floatDebPgOntem);
  lbDebPgHoje.Caption    := 'R$ ' + FormatFloat('###,###,##0.00',floatDebPgHoje);
  lbDebPgAmanha.Caption  := 'R$ ' + FormatFloat('###,###,##0.00',floatDebPgAmanha);
  lbDebPgMes.Caption     := 'R$ ' + FormatFloat('###,###,##0.00',floatDebPgMes);
  lbTotalPgOntem.Caption := 'R$ ' + FormatFloat('###,###,##0.00',(floatCredPgOntem - floatDebPgOntem));
  if (floatCredPgOntem - floatDebPgOntem) > 0 then
    lbTotalPgOntem.Font.Color    := clBlue
  else lbTotalPgOntem.Font.Color := clRed;
  lbTotalPgHoje.Caption   := 'R$ ' + FormatFloat('###,###,##0.00',(floatCredPgHoje  - floatDebPgHoje));
  if (floatCredPgHoje  - floatDebPgHoje) > 0 then
    lbTotalPgHoje.Font.Color    := clBlue
  else lbTotalPgHoje.Font.Color := clRed;
  lbTotalPgAmanha.Caption := 'R$ ' + FormatFloat('###,###,##0.00',(floatCredPgAmanha - floatDebPgAmanha));
  if (floatCredPgAmanha - floatDebPgAmanha) > 0 then
    lbTotalPgAmanha.Font.Color    := clBlue
  else lbTotalPgAmanha.Font.Color := clRed;
  lbTotalPgMes.Caption    := 'R$ ' + FormatFloat('###,###,##0.00',(floatCredPgMes - floatDebPgMes));
  if (floatCredPgMes - floatDebPgMes) > 0 then
    lbTotalPgMes.Font.Color    := clBlue
  else lbTotalPgMes.Font.Color := clRed;
  Application.ProcessMessages;
end;

procedure TfPrincipal.CreditoAno;
  function DiferencaCredito(intMes, intAno : Integer) : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(CREC_VALOR_DOC),0)');
          sql.Add('FROM  CONTAS_RECEBER');
          sql.Add('WHERE CREC_EMPR_ID                       = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CREC_STATUS                        = ' + QuotedStr('F'));
          sql.Add('AND   EXTRACT(YEAR  FROM CREC_DTA_VCTO)  = ' + IntToStr(intAno));
          sql.Add('AND   EXTRACT(MONTH FROM CREC_DTA_VCTO)  = ' + IntToStr(intMes));
          sql.Add('AND   EXTRACT(MONTH FROM CREC_DTA_PGTO) <> ' + IntToStr(intMes));
          Open;
          if not IsEmpty then begin
            Result := qryCons.Fields[0].AsFloat;
          end;
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(CREC_VALOR_DOC),0)');
          sql.Add('FROM  CONTAS_RECEBER');
          sql.Add('WHERE CREC_EMPR_ID                       = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CREC_STATUS                        = ' + QuotedStr('F'));
          sql.Add('AND   EXTRACT(YEAR  FROM CREC_DTA_VCTO)  = ' + IntToStr(intAno));
          sql.Add('AND   EXTRACT(MONTH FROM CREC_DTA_VCTO) <> ' + IntToStr(intMes));
          sql.Add('AND   EXTRACT(MONTH FROM CREC_DTA_PGTO)  = ' + IntToStr(intMes));
          Open;
          if not IsEmpty then begin
            Result := (Result - qryCons.Fields[0].AsFloat);
          end;
        end;
      except
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
var
  qryCons : TSQLQuery;
  intI    : Integer;
  Dia,
  Mes,
  Ano     : Word;
begin
  try
    DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(SUM(CREC_VALOR_DOC),0) VALOR,');
        sql.Add('      EXTRACT(MONTH FROM CREC_DTA_VCTO) AS MES');
        sql.Add('FROM  CONTAS_RECEBER');
        sql.Add('WHERE CREC_EMPR_ID                     = ' + IntToStr(funcPrincipal.Empr_ID));
        sql.Add('AND   CREC_STATUS                     <> ' + QuotedStr('C'));
        sql.Add('AND   EXTRACT(YEAR FROM CREC_DTA_VCTO) = ' + IntToStr(Ano));
        sql.Add('GROUP BY 2');
        Open;
        if not IsEmpty then begin
          First;
          for intI := 1 to 12 do begin
            if intI = qryCons.Fields[1].AsInteger then begin
              arrayCred[intI] := (qryCons.Fields[0].AsFloat - DiferencaCredito(intI, Ano));
              Next;
            end;
          end;
        end;
      end;
    except
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfPrincipal.DebitoAno;
  function DiferencaDebito(intMes, intAno : Integer) : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(CPAG_VALOR_DOC),0)');
          sql.Add('FROM  CONTAS_PAGAR');
          sql.Add('WHERE CPAG_EMPR_ID                       = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CPAG_STATUS                        = ' + QuotedStr('F'));
          sql.Add('AND   EXTRACT(YEAR  FROM CPAG_DTA_VCTO)  = ' + IntToStr(intAno));
          sql.Add('AND   EXTRACT(MONTH FROM CPAG_DTA_VCTO)  = ' + IntToStr(intMes));
          sql.Add('AND   EXTRACT(MONTH FROM CPAG_DTA_PGTO) <> ' + IntToStr(intMes));
          Open;
          if not IsEmpty then begin
            Result := qryCons.Fields[0].AsFloat;
          end;
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(CPAG_VALOR_DOC),0)');
          sql.Add('FROM  CONTAS_PAGAR');
          sql.Add('WHERE CPAG_EMPR_ID                       = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   CPAG_STATUS                        = ' + QuotedStr('F'));
          sql.Add('AND   EXTRACT(YEAR  FROM CPAG_DTA_VCTO)  = ' + IntToStr(intAno));
          sql.Add('AND   EXTRACT(MONTH FROM CPAG_DTA_VCTO) <> ' + IntToStr(intMes));
          sql.Add('AND   EXTRACT(MONTH FROM CPAG_DTA_PGTO) =  ' + IntToStr(intMes));
          Open;
          if not IsEmpty then begin
            Result := (Result - qryCons.Fields[0].AsFloat);
          end;
        end;
      except
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
var
  qryCons : TSQLQuery;
  intI    : Integer;
  Dia,
  Mes,
  Ano     : Word;
begin
  try
    DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(SUM(CPAG_VALOR_DOC),0) VALOR,');
        sql.Add('      EXTRACT(MONTH FROM CPAG_DTA_VCTO) AS MES');
        sql.Add('FROM  CONTAS_PAGAR');
        sql.Add('WHERE CPAG_EMPR_ID                     = ' + IntToStr(funcPrincipal.Empr_ID));
        sql.Add('AND   CPAG_STATUS                     <> ' + QuotedStr('C'));
        sql.Add('AND   EXTRACT(YEAR FROM CPAG_DTA_VCTO) = ' + IntToStr(Ano));
        sql.Add('GROUP BY 2');
//          showmessage(qrycons.text);
        Open;
        if not IsEmpty then begin
          First;
          for intI := 1 to 12 do begin
            try
              if intI = qryCons.Fields[1].AsInteger then begin
                arrayDeb[intI] := (qryCons.Fields[0].AsFloat - DiferencaDebito(intI, Ano));
                Next;
              end;
            except
              arrayDeb[intI] := 0;
              Next;
            end;
          end;
        end;
      end;
    except
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfPrincipal.GetWindowsWorkArea: TRect;
begin
  SystemParametersInfo(SPI_GETWORKAREA, 0, @Result, 0);
end;

procedure TfPrincipal.Image1Click(Sender: TObject);
begin
  case Panel1.Width of
    300 : Panel1.Width := 15;
    15  : Panel1.Width := 300;
  end;
end;

procedure TfPrincipal.imgPublicidadeClick(Sender: TObject);
begin
  HlinkNavigateString(nil,'http://www.e-mai.net/2.0/?link=como_funciona&af=aigomes');
end;

procedure TfPrincipal.lbVersaoSistemaClick(Sender: TObject);
var
  strLink : String;
  strTMP  : PWideChar;
begin
  try
    strLink := 'http://www.arsistemaseconsultoria.com.br';
    strTMP  := StringToOleStr(strLink);
    HlinkNavigateString(nil,strTMP);
  except
  end;
end;

procedure TfPrincipal.CriarMenuUsuario;
var
  qryCons     : TSQLQuery;
  treeItem    : TTreeNode;
begin
  try
    treeItem := nil;
//    if funcPrincipal.TipoMenu = 1 then begin
      Panel1.Visible := false;
//    end else begin
//      Panel1.Visible := true
//    end;
    intMenu       := -1;
    mmPrincipal.Items.Clear;
    treePrincipal.Items.Clear;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('	   M.MENU_ID,');
        sql.Add('    M.MENU_CODIGO,');
        sql.Add('    M.MENU_DESCRICAO,');
        sql.Add('    M.MENU_IMAGE1');
        sql.Add('FROM	MENU M');
        sql.Add('INNER JOIN GENERICA G');
        sql.Add('ON (M.MENU_GENE_EMPR_ID_TP = G.GENE_EMPR_ID');
        sql.Add('AND M.MENU_GENE_TGEN_ID_TP = G.GENE_TGEN_ID');
        sql.Add('AND M.MENU_GENE_ID_TP      = G.GENE_ID)');
        sql.Add('INNER JOIN USUARIO_M U');
        sql.Add('ON (M.MENU_ID = U.USRM_MENU_ID)');
        sql.Add('WHERE M.MENU_MENU_ID IS NULL');
        sql.add('AND   M.MENU_ATIVO    = 1');
        sql.Add('AND   M.MENU_NOME_BPL = ' + QuotedStr('CMD'));
        sql.Add('AND   U.USRM_USER_ID  = ' + IntToStr(funcPrincipal.User_ID));
        sql.Add('AND   U.USRM_EMPR_ID  = ' + IntToStr(funcPrincipal.Empr_ID));
        sql.Add('ORDER BY M.MENU_CODIGO,M.MENU_DESCRICAO');
        Application.ProcessMessages;
        Open;
        while not Eof do begin
          Application.ProcessMessages;
//          case funcPrincipal.TipoMenu of
//            2 : begin
//              treeItem := treePrincipal.Items.Add(nil,qryCons.Fields[1].AsString + ' - ' + qryCons.Fields[2].AsString);
//              if TemFilho(qryCons.Fields[0].AsString) then begin
//                with treeItem do begin
//                  SelectedIndex := 1;
//                  StateIndex    := 0;
//                  ImageIndex    := 0;
//                end;
//              end else begin
//                with treeItem do begin
//                  SelectedIndex := 2;
//                  StateIndex    := 2;
//                  ImageIndex    := 2;
//                end;
//              end;
//              treeItem.Data := Pointer(qryCons.Fields[0].AsInteger);
//            end;
//            1 : begin
              with mmPrincipal do begin
                intSubMenu    := -1;
                intSubSubMenu := -1;
                inc(intMenu);
                menuItem[intMenu]         := TMenuItem.Create(mmPrincipal);
                menuItem[intMenu].Caption := qryCons.Fields[1].AsString + ' - ' + qryCons.Fields[2].AsString;
                mmPrincipal.Items.Add( menuItem[intMenu] );
              end;
//            end;
//          end;
          CriarSubMenusUsuario(IntToStr(funcPrincipal.User_ID),IntToStr(funcPrincipal.Empr_ID), qryCons.Fields[0].AsString,treeItem);
          Application.ProcessMessages;
          Next;
        end;
        with mmPrincipal do begin
          //** AJUDA **//
          intSubMenu    := -1;
          intSubSubMenu := -1;
          inc(intMenu);
          menuItem[intMenu]         := TMenuItem.Create(mmPrincipal);
          menuItem[intMenu].Caption := 'Ajuda';
          mmPrincipal.Items.Add( menuItem[intMenu] );
          inc(intSubMenu);
          menuItem[intSubMenu]             := TMenuItem.Create(mmPrincipal);
          menuItem[intSubMenu].Caption     := 'Ativar licença';
          menuItem[intSubMenu].HelpContext := 999;
          menuItem[intSubMenu].OnClick     := ClickMenu;
          mmPrincipal.Items.Items[intMenu].Add( menuItem[intSubMenu] );
          //** EMPRESAS **//
        end;
      end;
    except on e: exception do begin
      funcPrincipal.ReportaErro(Caption,'CriarMenuUsuario',e.Message);
      funcPrincipal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfPrincipal.TemFilho(strMenu_ID: String): Boolean;
var
  qryCons : TSQLQuery;
begin
  Result := true;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('	     COUNT(M.MENU_ID)');
        sql.Add('FROM	 MENU M');
        sql.Add('INNER JOIN GENERICA G');
        sql.Add('ON (M.MENU_GENE_EMPR_ID_TP = G.GENE_EMPR_ID');
        sql.Add('AND M.MENU_GENE_TGEN_ID_TP = G.GENE_TGEN_ID');
        sql.Add('AND M.MENU_GENE_ID_TP      = G.GENE_ID)');
        sql.Add('INNER JOIN USUARIO_M U');
        sql.Add('ON (M.MENU_ID = U.USRM_MENU_ID)');
        sql.Add('WHERE M.MENU_MENU_ID  = ' + strMenu_ID);
        sql.add('AND   M.MENU_ATIVO    = 1');
        sql.Add('AND   M.MENU_NOME_BPL = ' + QuotedStr('CMD'));
        sql.Add('AND   U.USRM_USER_ID  = ' + IntToStr(funcPrincipal.User_ID));
        sql.Add('AND   U.USRM_EMPR_ID  = ' + IntToStr(funcPrincipal.Empr_ID));
        Open;
        if qryCons.Fields[0].AsInteger > 0 then
          Result    := true
        else Result := false;
      end;
    except on e: exception do
      funcPrincipal.Alerta(e.Message,1);
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfPrincipal.CriarSubMenusUsuario(strUser_Id, strEmpr_Id,
  strMenu: String; treeItem: TTreeNode; boolSub : Boolean = false);
var
  qryCons : TSQLQuery;
  treeNew : TTreeNode;
begin
  try
    treeNew := nil;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('	   M.MENU_ID,');
        sql.Add('    M.MENU_CODIGO,');
        sql.Add('    M.MENU_DESCRICAO,');
        sql.Add('    M.MENU_MENU_ID');
        sql.Add('FROM	MENU M');
        sql.Add('INNER JOIN GENERICA G');
        sql.Add('ON (M.MENU_GENE_EMPR_ID_TP = G.GENE_EMPR_ID');
        sql.Add('AND M.MENU_GENE_TGEN_ID_TP = G.GENE_TGEN_ID');
        sql.Add('AND M.MENU_GENE_ID_TP      = G.GENE_ID)');
        sql.Add('INNER JOIN USUARIO_M U');
        sql.Add('ON (M.MENU_ID = U.USRM_MENU_ID)');
        sql.Add('WHERE M.MENU_MENU_ID   = ' + strMenu);
        sql.Add('AND   M.MENU_ATIVO     = 1');
        SQL.Add('AND   M.MENU_NOME_BPL <> ' + QuotedStr(''));
        SQL.Add('AND   M.MENU_NOME_BPL <> ' + QuotedStr('Null'));
        sql.Add('AND   U.USRM_USER_ID   = ' + strUser_ID);
        sql.Add('AND   U.USRM_EMPR_ID   = ' + strEmpr_ID);
        sql.Add('ORDER BY M.MENU_CODIGO,M.MENU_DESCRICAO');
        Open;
        while not eof do begin
//          if (not funcPrincipal.TrabStatusOS) and (qryCons.Fields[1].AsString = '615') then begin Next; Continue; end;
//          if (not funcPrincipal.TrabTipoAgendamento) and (qryCons.Fields[1].AsString = '616') then begin Next; Continue; end;
          Application.ProcessMessages;
          case funcPrincipal.TipoMenu of
            2 : begin
              treeNew := treePrincipal.Items.AddChild(treeItem,qryCons.Fields[1].AsString + ' - ' + qryCons.Fields[2].AsString);
              if TemFilhoSub(qryCons.Fields[0].AsString) then begin
                with treeNew do begin
                  SelectedIndex := 1;
                  StateIndex    := 0;
                  ImageIndex    := 0;
                end;
              end else begin
                with treeNew do begin
                  SelectedIndex := 2;
                  StateIndex    := 2;
                  ImageIndex    := 2;
                end;
              end;
              treeNew.Data := Pointer(qryCons.Fields[0].AsInteger);
            end;
            1 : begin
              if not boolSub then begin
                inc(intSubMenu);
                menuItem[intSubMenu]             := TMenuItem.Create(mmPrincipal);
                menuItem[intSubMenu].Caption     := qryCons.Fields[1].AsString + ' - ' + qryCons.Fields[2].AsString;
                menuItem[intSubMenu].HelpContext := qryCons.Fields[0].AsInteger;
                menuItem[intSubMenu].OnClick     := ClickMenu;
                mmPrincipal.Items.Items[intMenu].Add( menuItem[intSubMenu] );
              end else begin
                inc(intSubSubMenu);
                menuItem[intSubSubMenu]             := TMenuItem.Create(mmPrincipal);
                menuItem[intSubSubMenu].Caption     := qryCons.Fields[1].AsString + ' - ' + qryCons.Fields[2].AsString;
                menuItem[intSubSubMenu].HelpContext := qryCons.Fields[0].AsInteger;
                menuItem[intSubSubMenu].OnClick     := ClickMenu;
                mmPrincipal.Items.Items[intMenu].Items[intSubMenu].Add( menuItem[intSubSubMenu] );
              end;
            end;
          end;
          if MenuTemFilho(strUser_Id,strEmpr_Id,qryCons.Fields[0].AsString) then
            CriarSubMenusUsuario(strUser_Id,strEmpr_Id,qryCons.Fields[0].AsString,treeNew,true);
          Next;
        end;
      end;
    except on e: exception do
      funcPrincipal.Alerta(e.Message,1);
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfPrincipal.ClickMenu(Sender : TObject);
begin
  BuscaRotina((Sender as TMenuItem).HelpContext);
end;

function TfPrincipal.DeletaDiretorio(FolderName: String;
  LeaveFolder: Boolean): Boolean;
var
  r : TshFileOpStruct;
begin
  Result := False;
  try
    if not DirectoryExists(FolderName) then
      Exit;
    if LeaveFolder then
      FolderName := FolderName + ' *.* '
    else
    Delete(FolderName,Length(FolderName), 1);
    FillChar(r, SizeOf(r), 0);
    r.wFunc  := FO_DELETE;
    r.pFrom  := PChar(FolderName);
    r.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
    Result   := ((ShFileOperation(r) = 0) and (not r.fAnyOperationsAborted));
  except
  end;
end;

function TfPrincipal.MenuTemFilho(strUser_ID, strEmpr_Id,
  strMenu_Id: String): Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('	   COUNT(M.MENU_ID)');
        sql.Add('FROM	MENU M');
        sql.Add('INNER JOIN GENERICA G');
        sql.Add('ON (M.MENU_GENE_EMPR_ID_TP = G.GENE_EMPR_ID');
        sql.Add('AND M.MENU_GENE_TGEN_ID_TP = G.GENE_TGEN_ID');
        sql.Add('AND M.MENU_GENE_ID_TP      = G.GENE_ID)');
        sql.Add('INNER JOIN USUARIO_M U');
        sql.Add('ON (M.MENU_ID = U.USRM_MENU_ID)');
        sql.Add('WHERE M.MENU_MENU_ID = ' + strMenu_Id);
        sql.Add('AND   U.USRM_USER_ID = ' + strUser_ID);
        sql.Add('AND   U.USRM_EMPR_ID = ' + strEmpr_ID);
        Open;
        if qryCons.Fields[0].AsInteger > 0 then
          Result    := True
        else Result := false;
      end;
    except on e: exception do
      funcPrincipal.Alerta(e.Message,1);
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfPrincipal.TemFilhoSub(strMenu_ID: String): Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('	     COUNT(M.MENU_ID)');
        sql.Add('FROM	 MENU M');
        sql.Add('INNER JOIN GENERICA G');
        sql.Add('ON (M.MENU_GENE_EMPR_ID_TP = G.GENE_EMPR_ID');
        sql.Add('AND M.MENU_GENE_TGEN_ID_TP = G.GENE_TGEN_ID');
        sql.Add('AND M.MENU_GENE_ID_TP      = G.GENE_ID)');
        sql.Add('INNER JOIN USUARIO_M U');
        sql.Add('ON (M.MENU_ID = U.USRM_MENU_ID)');
        sql.Add('WHERE M.MENU_MENU_ID   = ' + strMenu_ID);
        sql.add('AND   M.MENU_ATIVO     = 1');
        sql.Add('AND   M.MENU_NOME_BPL IS NOT NULL');
        SQL.Add('AND   M.MENU_NOME_BPL <> ' + QuotedStr(''));
        SQL.Add('AND   M.MENU_NOME_BPL <> ' + QuotedStr('Null'));
        sql.Add('AND   U.USRM_USER_ID   = ' + IntToStr(funcPrincipal.User_ID));
        sql.Add('AND   U.USRM_EMPR_ID   = ' + IntToStr(funcPrincipal.Empr_ID));
        Open;
        if qryCons.Fields[0].AsInteger > 0 then
          Result    := true
        else Result := false;
      end;
    except on e: exception do
      funcPrincipal.Alerta(e.Message,1);
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

//procedure TfPrincipal.timeSuporteTimer(Sender: TObject);
//var
//  intHandle : Cardinal;
//  icon      : TICon;
//begin
//  try
//    try
//      Icon := TIcon.Create;
//      Icon.Handle := ExtractIcon(Handle,PChar(Application.ExeName),0);
//    except
//    end;
//    ///Escondendo janelas
//    try
//      Application.ProcessMessages;
//      intHandle := FindWindow(PChar(#32770),'TeamViewer');
//      Application.ProcessMessages;
//      ShowWindow(intHandle,SW_HIDE);
//    except
//    end;
//    try
//      Application.ProcessMessages;
//      intHandle := FindWindow(PChar(#32770),PChar('Confirmar o acesso para '+Trim(lbID.Text)));
//      Application.ProcessMessages;
//      ShowWindow(intHandle,SW_HIDE);
//    except
//    end;
//    try
//      Application.ProcessMessages;
//      intHandle := FindWindow(PChar(#32770),PChar('Sessão patrocinada'));
//      Application.ProcessMessages;
//      ShowWindow(intHandle,SW_HIDE);
//    except
//    end;
//    try
//      Application.ProcessMessages;
//      intHandle := FindWindow(PChar(#32770),PChar('Transferência de arquivos parou'));
//      Application.ProcessMessages;
//      ShowWindow(intHandle,SW_HIDE);
//    except
//    end;
//    try
//      Application.ProcessMessages;
//      intHandle := FindWindow(PChar('#32770'),PChar('Informação de conexão'));
//      Application.ProcessMessages;
//      ShowWindow(intHandle,SW_HIDE);
//    except
//    end;
//    try
//      Application.ProcessMessages;
//      intHandle := FindWindow(Pchar('ATL:006FECB0'),nil);
//      Application.ProcessMessages;
//      ShowWindow(intHandle,SW_HIDE);
//    except
//    end;
//    ///Personalizando janelas
//    try
//      Application.ProcessMessages;
//      intHandle := FindWindow(PChar(#32770),PChar('TeamViewer -  diário de evento da transferência de arquivos'));
//      Application.ProcessMessages;
//      SetWindowText(intHandle,PChar('Tec-Info - Transferência de arquivos'));
//      Application.ProcessMessages;
//      SendMessage(intHandle, WM_SETICON, 0, Icon.Handle);
//    except
//    end;
//    try
//      Application.ProcessMessages;
//      intHandle := FindWindow(PChar(#32770),PChar('Bate-papo - TeamViewer'));
//      Application.ProcessMessages;
//      SetWindowText(intHandle,PChar('Tec-Info - Bate papo'));
//      Application.ProcessMessages;
//      SendMessage(intHandle, WM_SETICON, 0, Icon.Handle);
//    except
//    end;
//      Application.ProcessMessages;
//  except
//  end;
//end;

procedure TfPrincipal.treePrincipalClick(Sender: TObject);
begin
//  if treePrincipal.Selected <> nil then begin
//    if not treePrincipal.Selected.Expanded then begin
//      treePrincipal.Selected.Expand(false);
//      AbrePai(treePrincipal.Selected);
//    end else begin
//      with treePrincipal.Selected do begin
//        Collapse(true);
//        SelectedIndex := 0;
//        StateIndex    := 0;
//        ImageIndex    := 0;
//      end;
//    end;
//  end;
end;

procedure TfPrincipal.treePrincipalCollapsed(Sender: TObject; Node: TTreeNode);
begin
//  if treePrincipal.Selected <> nil then begin
//    with treePrincipal.Selected do begin
//      SelectedIndex := 0;
//      StateIndex    := 0;
//      ImageIndex    := 0;
//    end;
//  end;
end;

procedure TfPrincipal.treePrincipalCollapsing(Sender: TObject; Node: TTreeNode;
  var AllowCollapse: Boolean);
begin
//  if treePrincipal.Selected <> nil then begin
//    with treePrincipal.Selected do begin
//      SelectedIndex := 0;
//      StateIndex    := 0;
//      ImageIndex    := 0;
//    end;
//  end;
end;

procedure TfPrincipal.treePrincipalDblClick(Sender: TObject);
begin
  try
    if treePrincipal.Selected <> nil then
      BuscaRotina(Integer(treePrincipal.Selected.Data));
  except
  end;
end;

procedure TfPrincipal.treePrincipalExpanded(Sender: TObject; Node: TTreeNode);
begin
//  if treePrincipal.Selected <> nil then begin
//    with treePrincipal.Selected do begin
//      SelectedIndex := 1;
//      StateIndex    := 1;
//      ImageIndex    := 1;
//    end;
//  end;
end;

procedure TfPrincipal.treePrincipalExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
//  if treePrincipal.Selected <> nil then begin
//    with treePrincipal.Selected do begin
//      SelectedIndex := 0;
//      StateIndex    := 0;
//      ImageIndex    := 0;
//    end;
//  end;
end;

procedure TfPrincipal.treePrincipalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    try
      if (Shift = [ssCtrl]) and (key = 82) then begin
        key := 0;
        edtRotina.SetFocus;
      end;
    except
    end;
    if Key = 116 then begin
      AtualizaMenus;
      edtRotina.SetFocus;
    end;
    Key   := 0;
  except
  end;
end;

procedure TfPrincipal.treePrincipalKeyPress(Sender: TObject; var Key: Char);
begin
  try
    if Key = #13 then begin
      if treePrincipal.Selected <> nil then
        BuscaRotina(Integer(treePrincipal.Selected.Data));
      Key := #0
    end;
  except
  end;
end;

procedure TfPrincipal.UpdateCartaoCreditos;
begin

end;

procedure TfPrincipal.EnviaEmail;
var
  idMsg      : TIdMessage;
  STMP       : TIdSMTP;
  strFont    : String;
  lstTMP     : TStringList;
  intI       : Integer;
  erroTMP    : TextFile;
  strTMP     : String;
  iniTMP     : TIniFile;
  strNome,strEmpr,
  strCidade,strUF,
  strEmail,strFone : String;
begin
  try
    try
      iniTMP    := TIniFile.Create(ExtractFilePath(Application.ExeName)+'AnOnImUs.ini');
      strNome   := iniTMP.ReadString('Client','Razao Social','');
      strEmpr   := iniTMP.ReadString('Client','Empresa','');
      strCidade := iniTMP.ReadString('Client','Cidade','');
      strUF     := iniTMP.ReadString('Client','UF','');
      strEmail  := iniTMP.ReadString('Client','email','');
      strFone   := iniTMP.ReadString('Client','Telefone','');
    finally
      FreeAndNil(iniTMP);
    end;
    lstTMP  := TStringList.Create;
    strFont := ExtractFilePath(ParamStr(0)) + 'Except\*.log';
    DirList(strFont,lstTMP);
    if lstTMP.Count > 0 then begin
      idMsg   := TIdMessage.Create(nil);
      STMP    := TIdSMTP.Create(nil);
      try
        with idMsg do begin
          From.Name                 := funcPrincipal.Empr_Razao;
          Recipients.EMailAddresses := 'reportar@arsistemaseconsultoria.com.br';
          Subject                   := 'Reportando Erro do Sistema';
        end;
        with STMP do begin
          Host     := 'mail.arsistemaseconsultoria.com.br';
          Port     := 587;
          Username := 'reportar@arsistemaseconsultoria.com.br';
          Password := 'estoldq9';
          Connect;
          try
            for intI := 0 to lstTMP.Count - 1 do begin
              try
                AssignFile(erroTMP,ExtractFilePath(ParamStr(0)) + 'Except\'+lstTMP.Strings[intI]);
                Reset(erroTMP);
                idMsg.Body.Clear;
                idMsg.Body.Add('Dados do Cliente');
                idMsg.Body.Add('');
                idMsg.Body.Add('Cliente: ' + strNome);
                idMsg.Body.Add('Empresa: ' + strEmpr);
                idMsg.Body.Add('Cidade:  ' + strCidade);
                idMsg.Body.Add('UF:      ' + strUF);
                idMsg.Body.Add('Email:   ' + strEmail);
                idMsg.Body.Add('Telefone:' + strFone);
                idMsg.Body.Add('');
                idMsg.Body.Add('Detalhes sobre o erro');
                idMsg.Body.Add('');
                while not Eof(erroTMP) do begin
                  ReadLn(erroTMP,strTMP);
                  idMsg.Body.Add(strTMP);
                end;
                Send(idMsg);
                try
                  DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'Except\'+lstTMP.Strings[intI]));
                except
                end;
              finally
                CloseFile(erroTMP);
              end;
            end;
          except
          end;
          Disconnect;
        end;
      except on e: exception do
        funcPrincipal.ReportaErro(Caption,'EnviaEmail',e.Message);
      end;
    end;
  finally
    FreeAndNil(lstTMP);
  end;
end;

procedure TfPrincipal.ExecutaRotina(intRotina : Integer);

  procedure BloqueiaEmpresa();
  var
    qryCons : TSQLQuery;
  begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('UPDATE CONF_SISTEMA SET CSIS_BSYS = ''S'' WHERE CSIS_EMPR_ID = '+IntToStr(funcPrincipal.Empr_ID));
        ExecSQL()
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;

  procedure DesbloqueiaEmpresa();
  var
    qryCons : TSQLQuery;
  begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('UPDATE CONF_SISTEMA SET CSIS_BSYS = ''N'' WHERE CSIS_EMPR_ID = '+IntToStr(funcPrincipal.Empr_ID));
        ExecSQL()
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;


  function BloqueiaSystem() : Boolean;
  var
    qryCons : TSQLQuery;
    strKey,
    strCNPJ,
    strData : String;
    intI : Integer;
    Chave : Array[1..22] of String;
  begin
    //ShowMessage(funcPrincipal.Criptografar2('00.071.488/8631-72;01/01/2020'));
    //EEAE2-8A511D1368-B27-CE8DE8D7E-7E
    Result := true;
    DesbloqueiaEmpresa;
    try
      try
        qryCons := TSQLQuery.Create(nil);
        qryCons.SQLConnection := funcPrincipal.Conexao;
        with qryCons do begin
          SQL.Clear;
          sql.Add('SELECT FIRST 1');
          sql.Add('       CHVS_KEY');
          sql.Add('  FROM CHAVES');
          sql.Add(' WHERE CHVS_EMPR_ID = '+IntToStr(funcPrincipal.Empr_ID));
          sql.Add(' ORDER BY');
          sql.Add('       CHVS_ID DESC');
          Open;
          if qryCons.IsEmpty then begin
            BloqueiaEmpresa;
            Exit;
          end;
          strCNPJ  := StringReplace(StringReplace(funcPrincipal.Criptografar2( qryCons.Fields[0].AsString ),'-','',[rfReplaceAll]),'.','',[rfReplaceAll]);
          Chave[01] := Copy(strCNPJ,1,1); Chave[02] := Copy(strCNPJ,5,1);Chave[03] := Copy(strCNPJ,2,1); Chave[04] := Copy(strCNPJ,8,1);
          Chave[05] := Copy(strCNPJ,9,1); Chave[06] := Copy(strCNPJ,6,1);Chave[07] := Copy(strCNPJ,3,1); Chave[08] := Copy(strCNPJ,11,1);
          Chave[09] := Copy(strCNPJ,4,1); Chave[10] := Copy(strCNPJ,7,1);Chave[11] := Copy(strCNPJ,18,1);Chave[12] := Copy(strCNPJ,16,1);
          Chave[13] := Copy(strCNPJ,17,1);Chave[14] := Copy(strCNPJ,15,1);Chave[15] := Copy(strCNPJ,14,1);Chave[16] := Copy(strCNPJ,12,1);
          Chave[17] := Copy(strCNPJ,21,1);Chave[18] := Copy(strCNPJ,22,1);Chave[19] := Copy(strCNPJ,19,1);Chave[20] := Copy(strCNPJ,20,1);
          Chave[21] := Copy(strCNPJ,13,1);Chave[22] := Copy(strCNPJ,10,1);
          strCNPJ := ''; for intI := 1 to 22 do strCNPJ := strCNPJ + Chave[intI];
          strData := Copy(strCNPJ,15,2)+'/'+Copy(strCNPJ,17,2)+'/'+Copy(strCNPJ,19,4);
          strCNPJ := Copy(strCNPJ,1,2)+'.'+Copy(strCNPJ,3,3)+'.'+Copy(strCNPJ,6,3)+'/'+Copy(strCNPJ,9,4)+'-'+Copy(strCNPJ,13,2);
          sql.Clear;
          sql.Add('SELECT EMPR_CNPJ FROM EMPRESAS WHERE EMPR_ID = '+IntToStr(funcPrincipal.Empr_ID));
          Open;
          if qryCons.Fields[0].AsString <> strCNPJ then begin
            BloqueiaEmpresa;
            Exit;
          end;
          if StrToDate(strData) < funcPrincipal.DataServidor then begin
            BloqueiaEmpresa;
            Exit;
          end;
          Close;
          sql.Clear;
          SQL.Add('SELECT COALESCE(CSIS_BSYS,''S'') AS BSYS FROM CONF_SISTEMA WHERE CSIS_EMPR_ID = '+IntToStr(funcPrincipal.Empr_ID));
          Open;
          if qryCons.Fields[0].AsString = 'S' then Exit;
        end;
        Result := false;
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'BloqueiaSystem',e.Message);
        funcPrincipal.Alerta(e.Message,1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;

var
  qryCons     : TSQLQuery;
  intI        : Integer;
  AForm       : TForm;
  FormClass   : TFormClass;
  HandlePack  : HModule;
  btnTmp      : TSpeedButton;
  PackageName,
  Formulario,
  Descricao   : String;
  strVersion  : String;
  lstTMP      : TStringList;
begin
  TimerBackup.Enabled := false;
//  if (BloqueiaSystem()) and (not (intRotina in [111,133])) then begin
//    funcPrincipal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
//                         'O prazo de validade de sua licença expirou, entre em '+
//                         'contato com o seu representante para maiores informações.'+#13+#13+
//                         'Não será possível a execução da rotina selecionada!',0);
//    BuscaRotina(999);
//    Exit;
//  end;

  try
    AForm   := nil;
    funcPrincipal.AbreOS := false;
    GetWindowRect(panelPrincipal.Handle,pRect);
    lstTMP  := TStringList.Create;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      MENU_NOME_BPL,');         ///PackageName
        sql.Add('      MENU_CLASSE_FORM_BPL,');  ///Formulario
        sql.Add('      MENU_DESCRICAO,');        ///Descricao
        SQL.Add('      MENU_ID');
        sql.Add('FROM  MENU');
        sql.Add('WHERE MENU_CODIGO = ' + QuotedStr(IntToStr(intRotina)));
        Open;
        ///Executando rotina
        if (not IsEmpty) and (Pos('bpl',qryCons.Fields[0].AsString) > 0) then begin
          if not TemPermissao(qryCons.Fields[3].AsString) then Exit;

          funcPrincipal.RegistraAcesso(qryCons.Fields[3].AsInteger);

          PackageName := 'bpl/'+Trim(qryCons.Fields[0].AsString);
          Formulario  := Trim(qryCons.Fields[1].AsString);
          Descricao   := Trim(qryCons.Fields[2].AsString);
          intRotina   := qryCons.Fields[3].AsInteger;
          if (PackageName <> '') or (PackageName <> 'CMD') then begin
            ///Verificando se o form ja esta aberto.
            if FormAberto(Formulario) then begin
              btnTmp      := TSpeedButton.Create(nil);
              btnTmp.Name := 'Botao' + Formulario;
              MinimizeAll(btnTmp);
              AtualizaTela(Formulario);
              funcPrincipal.JanelaAtiva := Formulario;
              btnTmp.Free;
              Exit;
            end;
            ///Abrindo um form.
            HandlePack  := LoadPackage(PackageName);
            if HandlePack > 0 then begin
              FormClass := TFormClass(GetClass(Formulario));
              if Assigned(FormClass) then begin
                funcPrincipal.HandleJanelas.Add(Formulario + ';' + IntToStr(HandlePack));
                if not FormAberto(Formulario) then begin
                  funcPrincipal.MSGAguarde();
                  Self.HelpFile := PackageName;
                  Aform         := FormClass.Create(nil);
                  Self.HelpFile := '';
                  FileVerInfo(PackageName,lstTMP,strVersion);
                  Aform.Tag     := StrToInt(funcPrincipal.Busca_Troca(strVersion,'.',''));
                  funcPrincipal.Janelas.Add(Formulario);
                  try
                    MinimizeAll;
                    CriarBotao(Formulario, Descricao);
                    AForm.BorderStyle           := bsNone;
                    AForm.Show;
                    ///Verificar as constantes [ intFHeight, intFWidth, intFLeft, intFTop ]
                    AForm.SetBounds(panelPrincipal.Left + intFLeft, panelPrincipal.Top, panelPrincipal.Width + intFWidth, panelPrincipal.Height + intFHeight);
                    AForm.Constraints.MaxHeight := panelPrincipal.Height;
                    AForm.Constraints.MaxWidth  := panelPrincipal.Width + intFWidth;
                    AForm.Constraints.MinHeight := panelPrincipal.Height;
                    AForm.Constraints.MaxWidth  := panelPrincipal.Width + intFWidth;
                    AForm.Top                   := pRect.Top;
                    AForm.Left                  := pRect.Left;
                  finally
                  end;
                end else begin
                  try
                    MinimizeAll;
                    AForm.BorderStyle := bsNone;
                    AForm             := FormClass.Create(Application);
                    FileVerInfo(PackageName,lstTMP,strVersion);
                    AForm.Tag := StrToInt(funcPrincipal.Busca_Troca(strVersion,'.',''));
                    for intI  := 0 to ComponentCount - 1 do begin
                      if (Components[intI] is TSpeedButton) then begin
                        if (Components[intI] as TSpeedButton).Name  = 'Botao' + Formulario then begin
                           (Components[intI] as TSpeedButton).Down := True;
                        end;
                      end;
                    end;
                    AForm.BorderStyle           := bsNone;
                    AForm.Show;
                    ///Verificar as constantes [ intFHeight, intFWidth, intFLeft, intFTop ]
                    AForm.SetBounds(panelPrincipal.Left + intFLeft, panelPrincipal.Top, panelPrincipal.Width + intFWidth, panelPrincipal.Height + intFHeight);
                    AForm.Constraints.MaxHeight := panelPrincipal.Height;
                    AForm.Constraints.MaxWidth  := panelPrincipal.Width + intFWidth;
                    AForm.Constraints.MinHeight := panelPrincipal.Height;
                    AForm.Constraints.MaxWidth  := panelPrincipal.Width + intFWidth;
                    AForm.Top                   := pRect.Top;
                    AForm.Left                  := pRect.Left;
                  finally
                  end;
                end;
                RegistraMenu(intRotina);
              end else funcPrincipal.Alerta('Rotina não encontrada ou arquivo corrompido.',1);
            end;
            funcPrincipal.MSGAguarde(false);
          end;
        end else edtRotina.SetFocus;
      end;
    except on e: exception do begin
      funcPrincipal.ReportaErro(Caption,'ExecutaRotina',e.Message);
      funcPrincipal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FreeAndNil(lstTMP);
    edtRotina.SetFocus;
  end;
end;

procedure TfPrincipal.RegistraMenu(intRotina : Integer);
var
  qryCons : TSQLQuery;
  S       : String;
begin
  try
    S := 'UPDATE OR INSERT INTO HISTORICOMENU         '+
         'VALUES(%d,%d,%d,                            '+
         '       (SELECT COALESCE(MAX(HTME_QTDE),0)+1 '+
         '          FROM HISTORICOMENU                '+
         '         WHERE HTME_MENU_ID = %d            '+
         '           AND HTME_EMPR_ID = %d            '+
         '           AND HTME_USER_ID = %d))          ';
    S := Format(S,[intRotina,funcPrincipal.Empr_ID,funcPrincipal.User_ID,
                   intRotina,funcPrincipal.Empr_ID,funcPrincipal.User_ID]);
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add(S);
      ExecSQL();
    end;
  finally
    qryCons.Close();
    FreeAndNil(qryCons);
  end;
end;

function TfPrincipal.FileVerInfo(const FileName: string; var FileInfo: TStringList; out strVersion : String): Boolean;
const
  Key   : array[1..9] of string = ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName', 'LegalCopyright', 'OriginalFilename', 'ProductName', 'ProductVersion', 'Comments');
  KeyBr : array[1..9] of string = ('Empresa', 'Descricao', 'Versao do Arquivo', 'Nome Interno', 'Copyright', 'Nome Original do Arquivo', 'Produto', 'Versao do Produto', 'Comentarios');
var
  Dummy         : Cardinal;
  BufferSize,
  Len           : Integer;
  Buffer        : PChar;
  LoCharSet,
  HiCharSet     : Word;
  Translate,
  Return        : Pointer;
  StrFileInfo,
  Flags         : string;
  TargetOS,
  TypeArq       : string;
  FixedFileInfo : Pointer;
  i             : Byte;
begin
  Result := False;
  { Obtemos o tamanho em bytes do "version  information" }
  BufferSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
  if BufferSize <> 0 then begin
    GetMem(Buffer, Succ(BufferSize));
    try
      if GetFileVersionInfo(PChar(FileName), 0, BufferSize, Buffer) then
       { Executamos a função "VerQueryValue" e conseguimos informações sobre o idioma /character-set }
      if VerQueryValue(Buffer, '\VarFileInfo\Translation', Translate, UINT(Len)) then begin
        LoCharSet := LoWord(Longint(Translate^));
        HiCharSet := HiWord(Longint(Translate^));
        for i := 1 to 9 do begin
          { Montamos a string de pesquisa }
          StrFileInfo := Format('\StringFileInfo\0%x0%x\%s', [LoCharSet, HiCharSet, Key[i]]);
          { Adicionamos cada key pré-definido }
          if VerQueryValue(Buffer,PChar(StrFileInfo), Return, UINT(Len)) then
            FileInfo.Add(KeyBr[i] + ': ' + PChar(Return));
          if i = 3 then
            strVersion := PChar(Return);
        end;
        if VerQueryValue(Buffer,'\',FixedFileInfo, UINT(Len)) then
          with TVSFixedFileInfo(FixedFileInfo^) do begin
          Flags := '';
          {Efetuamos um bitmask e obtemos os "flags" do arquivo}
          if (dwFileFlags and VS_FF_DEBUG) = VS_FF_DEBUG then
            Flags := Concat(Flags,'*Debug* ');
          if (dwFileFlags and VS_FF_SPECIALBUILD) = VS_FF_SPECIALBUILD then
            Flags := Concat(Flags, '*Special Build* ');
          if (dwFileFlags and VS_FF_PRIVATEBUILD) = VS_FF_PRIVATEBUILD then
            Flags := Concat(Flags, '*Private Build* ');
          if (dwFileFlags and VS_FF_PRERELEASE) = VS_FF_PRERELEASE then
            Flags := Concat(Flags, '*Pre-Release Build* ');
          if (dwFileFlags and VS_FF_PATCHED) = VS_FF_PATCHED then
            Flags := Concat(Flags, '*Patched* ');
          if Flags <> '' then FileInfo.Add('Atributos: ' + Flags);
            TargetOS := 'Plataforma (OS): ';
         { Plataforma }
          case dwFileOS of
            VOS_UNKNOWN        : TargetOS := Concat(TargetOS, 'Desconhecido');
            VOS_DOS            : TargetOS := Concat(TargetOS, 'MS-DOS');
            VOS_OS216          : TargetOS := Concat(TargetOS, '16-bit OS/2');
            VOS_OS232          : TargetOS := Concat(TargetOS, '32-bit OS/2');
            VOS_NT             : TargetOS := Concat(TargetOS, 'Windows NT');
            VOS_NT_WINDOWS32,4 : TargetOS := Concat(TargetOS, 'Win32 API');
            VOS_DOS_WINDOWS16  : TargetOS := Concat(TargetOS, '16-bit Windows ','sob MS-DOS');
            else TargetOS      := Concat(TargetOS, 'Fora do Padrão. Código: ', IntToStr(dwFileOS));
          end;
          FileInfo.Add(TargetOS);
          TypeArq := 'Tipo de Arquivo: ';
          { Tipo de Arquivo }
          case dwFileType of
            VFT_UNKNOWN : TypeArq := Concat(TypeArq,'Desconhecido');
            VFT_APP     : TypeArq := Concat(TypeArq,'Aplicacao');
            VFT_DLL     : TypeArq := Concat(TypeArq,'Dynamic-Link Lib.');
            VFT_DRV     : begin
              TypeArq   := Concat(TypeArq,'Device driver - Driver ');
              case dwFileSubtype of
                VFT2_UNKNOWN          : TypeArq := Concat (TypeArq,'Desconhecido');
                VFT2_DRV_PRINTER      : TypeArq := Concat(TypeArq,'de Impressao');
                VFT2_DRV_KEYBOARD     : TypeArq := Concat(TypeArq,'de Teclado');
                VFT2_DRV_LANGUAGE     : TypeArq := Concat(TypeArq,'de Idioma');
                VFT2_DRV_DISPLAY      : TypeArq := Concat(TypeArq,'de Vídeo');
                VFT2_DRV_MOUSE        : TypeArq := Concat(TypeArq,'de Mouse');
                VFT2_DRV_NETWORK      : TypeArq := Concat(TypeArq,'de Rede');
                VFT2_DRV_SYSTEM       : TypeArq := Concat(TypeArq,'de Sistema');
                VFT2_DRV_INSTALLABLE  : TypeArq := Concat(TypeArq,'Instalavel');
                VFT2_DRV_SOUND        : TypeArq := Concat(TypeArq,'Multimida');
              end;
            end;
           VFT_FONT : begin
             TypeArq := Concat(TypeArq,'Fonte - Fonte ');
             case dwFileSubtype of
               VFT2_UNKNOWN       : TypeArq := Concat(TypeArq,'Desconhecida');
               VFT2_FONT_RASTER   : TypeArq := Concat(TypeArq,'Raster');
               VFT2_FONT_VECTOR   : TypeArq := Concat(TypeArq,'Vetorial');
               VFT2_FONT_TRUETYPE : TypeArq := Concat(TypeArq,'TrueType');
             end;
           end;
           VFT_VXD        : TypeArq := Concat(TypeArq,'Virtual Device');
           VFT_STATIC_LIB : TypeArq := Concat(TypeArq,'Static-Link Lib.');
         end;
         FileInfo.Add(TypeArq);
       end;
     end;
     finally
       FreeMem(Buffer, Succ(BufferSize));
       Result := FileInfo.Text <> '';
     end;
  end;
end;

procedure TfPrincipal.FlowPanel1Click(Sender: TObject);
begin

end;

//procedure TfPrincipal.GeraSuporte;
//var
//  intCont     : Integer;
//  intHwnd     : Cardinal;
//  Paswd       : array[0..63] of Char;
//  ClassName   : array[0..255] of char;
//  boolEsperar : boolean;
//  strCaminho,
//  strEndereco ,
//  strSenha    : String;
//begin
//  try
//    if (intHelp < 0) or (intHelp > 3) then intHelp := 0;
//    intCont := 0;
//    inc(intHelp);
//    if intHelp <= 3 then begin
//      strCaminho := ExtractFilePath(ParamStr(0));
//      strCaminho := strCaminho + 'bpl\Suporte.bpl';
//      if (FileExists(strCaminho)) or (FileExists(Copy(strCaminho,1,length(strCaminho)-3)+'exe')) then begin
//        RenameFile(strCaminho,Copy(strCaminho,1,length(strCaminho) - 3) + 'exe');
//        try
//          try
//            lbID.Clear;
//            lbSenha.Clear;
//            LabelVisible(false);
//            KillTask('TeamViewer.exe');
//            KillTask('mshta.exe');
//            PositionPanel;
//            panelSuporte.Visible := true;
//            lbMensage.Caption    := 'Aguarde!!! Estabelecendo conexão. ('+IntToStr(intHelp)+')';
//            KillTask('TeamViewer.exe');
//            KillTask('mshta.exe');
//            intHwnd := ShellExecute(Handle,nil,PChar(Copy(strCaminho,1,length(strCaminho)-3)+'exe'),'','', SW_HIDE);
//            while intHwnd = 0 do
//              intHwnd := ShellExecute(Handle,nil,PChar(Copy(strCaminho,1,length(strCaminho)-3)+'exe'),'','', SW_HIDE);
//            timeSuporte.Enabled := true;
//            intHwnd := FindWindow(nil,'TeamViewer');
//            intHwnd := GetWindow(intHwnd, GW_CHILD);
//            Application.ProcessMessages;
//          except
//          end;
//          try
//            while intHwnd = 0 do begin
//              inc(intCont);
//              Application.ProcessMessages;
//              intHwnd := FindWindow(nil,'TeamViewer');
//              Application.ProcessMessages;
//              ShowWindow(intHwnd,SW_HIDE);
//              Application.ProcessMessages;
//              if intCont >= 1000000 then begin
//                lbMensage.Caption := 'Demora na conexão, reiniciando processo.';
//                lbMensage.Repaint;
//                Sleep(5000);
//                GeraSuporte;
//                Exit;
//              end;
//            end;
//            boolEsperar := true;
//            while boolEsperar do begin
//              Application.ProcessMessages;
//              GetClassName(intHwnd, ClassName, 255);
//              if (String(ClassName) = 'Static') then begin
//                SendMessage(intHwnd, WM_GETTEXT, 64, Longint(@Paswd));
//                if pos('Pronto para', String(Paswd)) >0 then begin
//                  boolEsperar := false;
//                end;
//              end;
//              intHwnd := GetWindow(intHwnd, GW_HWNDNEXT);
//              if intHwnd = 0 then begin
//                intHwnd := FindWindow(nil,'TeamViewer');
//                intHwnd := GetWindow(intHwnd, GW_CHILD);
//                Application.ProcessMessages;
//              end;
//            end;
//          except
//          end;
//          if intHelp > 3 then Exit;
//          strEndereco := '';
//          strSenha    := '';
//          intHwnd     := FindWindow(nil,'TeamViewer');
//          intHwnd     := GetWindow(intHwnd, GW_CHILD);
//          try
//            while intHwnd > 0 do begin
//              Application.ProcessMessages;
//              GetClassName(intHwnd, ClassName, 255);
//              if (String(ClassName) = 'Edit') then begin
//                SendMessage(intHwnd, WM_GETTEXT, 64, Longint(@Paswd));
//                if (length( trim(String(Paswd))) = 4) then {senha}
//                  strSenha := Trim(String(Paswd))
//                else strEndereco :=  Trim(String(Paswd));
//              end;
//              intHwnd := GetWindow(intHwnd, GW_HWNDNEXT);
//              if ((strEndereco = '') or (strSenha = '')) and
//                (intHwnd = 0) then begin
//               Application.ProcessMessages;
//               intHwnd := FindWindow(nil,'TeamViewer');
//               intHwnd := GetWindow(intHwnd, GW_CHILD);
//              end;
//            end;
//          except
//          end;
//          try
//            lbMensage.Caption   := Mensagem;
//            lbID.Clear;
//            lbSenha.Clear;
//            lbID.Text           := strEndereco;
//            lbSenha.Text        := strSenha;
//            LabelVisible(true);
//            timeSuporte.Enabled := true;
//            intHelp             := 0;
//          except
//          end;
//        finally
//        end;
//      end else begin
//        funcPrincipal.Alerta('Não foram encontradas as bibliotecas necessárias para estabelecer a conexão.'+#13+#13+
//                             'Será feito o download dessas bibliotecas.',0);
//        DownloadFile;
//      end;
//    end else begin
//      lbMensage.Caption  := 'Erro no processo de conexão, processo cancelado.';
//      btnSuporte.Visible := true;
//      Abort;
//    end;
//  except
//  end;
//end;

procedure TfPrincipal.btnHelpClick(Sender: TObject);
var
  strLink : String;
  strTMP  : PWideChar;
begin
  try
    strLink := 'http://www.arsistemaseconsultoria.com.br/'+Self.Name+'.php' + funcPrincipal.Se(funcPrincipal.Privado,'?ID=1','');
    strTMP  := StringToOleStr(strLink);
    HlinkNavigateString(nil,strTMP);
  except on e: exception do begin
    funcPrincipal.ReportaErro(Caption,'btnHelpClick',e.Message);
    funcPrincipal.Alerta('Erro ao tentar executar o navegador padrão.'+#13+'['+e.Message+']',1)
  end; end;
end;

procedure TfPrincipal.btnMenuClick(Sender: TObject);
begin
  case Panel1.Width of
    7   : begin
      Panel1.Width := 290;
      btnMenu.Caption := '<';
    end;
    290 : begin
      Panel1.Width := 7;
      btnMenu.Caption := '>';
    end;
  end;
end;

procedure TfPrincipal.PositionPanel;
begin
//  panelTitulos.Top      := treePrincipal.Top;
//  panelTitulos.Left     := Self.Width       - 935;
//  panelGrafico.Top      := panelTitulos.Top + 200;
//  panelGrafico.Left     := Self.Width       - 935;
//  panelAvisos.Top       := panelGrafico.Top + 215;
//  panelAvisos.Left      := Self.Width       - 935;
  treePrincipal.Top     := 5;
  treePrincipal.Left    := 5;
  treePrincipal.Height  := panelPrincipal.Height - 8;
end;

//procedure TfPrincipal.LabelVisible(boolVisible : Boolean);
//begin
//  lbChave.Visible     := boolVisible;
//  lbPassWord.Visible  := boolVisible;
//  lbID.Visible        := boolVisible;
//  lbSenha.Visible     := boolVisible;
//  btnSuporte.Visible  := boolVisible;
//end;

//procedure TfPrincipal.StatuSuportes;
//var
//  intHwnd     : Cardinal;
//  Paswd       : array[0..63] of Char;
//  ClassName   : array[0..255] of char;
//  strEndereco ,
//  strSenha    : String;
//begin
//  try
//    PositionPanel;
//    intHwnd     := FindWindow(PChar(#32770),'TeamViewer');
//    if intHwnd > 0 then begin
//      timeSuporte.Enabled  := true;
//      panelSuporte.Visible := true;
//      lbMensage.Caption    := 'Aguarde!!! Gerando chave de conexão.';
//      strEndereco := '';
//      strSenha    := '';
//      intHwnd     := FindWindow(nil,'TeamViewer');
//      intHwnd     := GetWindow(intHwnd, GW_CHILD);
//      while intHwnd > 0 do begin
//        Application.ProcessMessages;
//        GetClassName(intHwnd, ClassName, 255);
//        if (String(ClassName) = 'Edit') then begin
//          SendMessage(intHwnd, WM_GETTEXT, 64, Longint(@Paswd));
//          if (length( trim(String(Paswd))) = 4) then {senha}
//            strSenha := Trim(String(Paswd))
//          else strEndereco :=  Trim(String(Paswd));
//        end;
//        intHwnd := GetWindow(intHwnd, GW_HWNDNEXT);
//        if ((strEndereco = '') or (strSenha='')) and
//          (intHwnd = 0) then begin
//         Application.ProcessMessages;
//         intHwnd := FindWindow(nil,'TeamViewer');
//         intHwnd := GetWindow(intHwnd, GW_CHILD);
//        end;
//      end;
//      lbMensage.Caption    := Mensagem;
//      lbID.Text            := Trim(strEndereco);
//      lbSenha.Text         := strSenha;
//      Timer1.Enabled       := true;
//      LabelVisible(true);
//      funcPrincipal.MSGAguarde(false);
//    end;
//  finally
//    PositionPanel;
//  end;
//end;

//function TfPrincipal.KillTask(ExeFileName: string): Integer;
//const
//  PROCESS_TERMINATE = $0001;
//var
//  ContinueLoop: BOOL;
//  FSnapshotHandle: THandle;
//  FProcessEntry32: TProcessEntry32;
//begin
//  Result := 0;
//  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
//  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
//  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
//  while Integer(ContinueLoop) <> 0 do  begin
//    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or
//         (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
//      Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE,BOOL(0),FProcessEntry32.th32ProcessID),0));
//     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
//  end;
//  CloseHandle(FSnapshotHandle);
//end;

//procedure TfPrincipal.AbrePai(TreeItem: TTreeNode);
//var
//  treePai : TTreeNode;
//begin
//  treePai := TreeItem.Parent;
//  repeat
//    if treePai <> nil then begin
//      with treePai do begin
//        SelectedIndex := 1;
//        StateIndex    := 1;
//        ImageIndex    := 1;
//      end;
//      treePai         := treePai.Parent;
//    end;
//  until (treePai = nil);
//end;

procedure TfPrincipal.Minimizar1Click(Sender: TObject);
begin
  if BotaoClicked <> nil then
    FormsAction(Copy(BotaoClicked.Name,6,length(BotaoClicked.Name)),'MINIMIZAR');
end;

procedure TfPrincipal.MinimizeAll(Botao : TSpeedButton = nil);
var
  intI   : integer;
  btnTMP : TSpeedButton;
begin
  for intI := 0 to fPrincipal.ComponentCount - 1 do begin
    if (fprincipal.Components[intI] is tspeedbutton) and (pos('Botao',fprincipal.Components[intI].Name)>0) then begin
      btntmp := TSpeedButton(fPrincipal.Components[intI]);
      if Botao = nil then begin
        btntmp.Down := false;
        ClickBotao(btnTMP);
      end else begin
        if Botao <> btntmp then begin
          btnTMP.Down := false;
          ClickBotao(btnTMP);
        end;
      end;
    end;
  end;
end;

procedure TfPrincipal.AtualizaTela(strFormPesq : String = 'TFPRINCIPAL'; boolMinimizar : Boolean=false);
var
  intI    : Integer;
  AForm   : Tform;
  strForm : string;
begin
  GetWindowRect(panelPrincipal.Handle,pRect);
  panelPrincipal.Refresh;
  for intI := 0 to Screen.FormCount - 1 do begin
    AForm := Screen.Forms[intI];
    strform := UpperCase(string(AForm.ClassName));
    if strFormPesq = 'TFPRINCIPAL' then begin
      if (strform <> 'TFPRINCIPAL') and (AForm.Tag <> 999) then begin
        AForm.Visible := true;
        ///Verificar as constantes [ intFHeight, intFWidth, intFLeft, intFTop ]
        AForm.SetBounds(panelPrincipal.Left + intFLeft, panelPrincipal.Top, panelPrincipal.Width + intFWidth, panelPrincipal.Height + intFHeight);
        AForm.Constraints.MaxHeight := panelPrincipal.Height;
        AForm.Constraints.MaxWidth  := panelPrincipal.Width + intFWidth;
        AForm.Constraints.MinHeight := panelPrincipal.Height;
        AForm.Constraints.MaxWidth  := panelPrincipal.Width + intFWidth;
        AForm.Top                   := pRect.Top;
        AForm.Left                  := pRect.Left;
        AForm.BringToFront;
        AForm.Repaint;
        break;
      end
    end else begin
      if (strform = UpperCase(strFormPesq)) and (not boolMinimizar) then begin
        AForm.Visible := true;
        ///Verificar as constantes [ intFHeight, intFWidth, intFLeft, intFTop ]
        AForm.SetBounds(panelPrincipal.Left + intFLeft, panelPrincipal.Top, panelPrincipal.Width + intFWidth, panelPrincipal.Height + intFHeight);
        AForm.Constraints.MaxHeight := panelPrincipal.Height;
        AForm.Constraints.MaxWidth  := panelPrincipal.Width + intFWidth;
        AForm.Constraints.MinHeight := panelPrincipal.Height;
        AForm.Constraints.MaxWidth  := panelPrincipal.Width + intFWidth;
        AForm.Top                   := pRect.Top;
        AForm.Left                  := pRect.Left;
        BringWindowToTop(AForm.Handle);
        SetForegroundWindow(AForm.Handle);
        Break;
      end else if (strform = UpperCase(strFormPesq)) and (boolMinimizar) then begin
        AForm.Visible := false;
        Break;
      end;
    end;
  end;
end;


procedure TfPrincipal.btnRotinaClick(Sender: TObject);
begin
  try
    if (edtRotina.Text <> '') and (Trim(edtRotina.Text) <> 'Ctrl+R') then
      ExecutaRotina(StrToInt(edtRotina.Text));
  except
  end;
  edtRotina.Clear;
end;

procedure TfPrincipal.btnSuporteClick(Sender: TObject);
begin
//  KillTask('TeamViewer.exe');
//  KillTask('mshta.exe');
//  KillTask('TeamViewer.exe');
//  KillTask('mshta.exe');
//  LabelVisible(false);
//  panelSuporte.Visible := false;
//  timeSuporte.Enabled  := false;
end;

procedure TfPrincipal.Fechar1Click(Sender: TObject);
begin
  if BotaoClicked <> nil then
    FormsAction(Copy(BotaoClicked.Name,6,length(BotaoClicked.Name)), 'CLOSE');
end;

function TfPrincipal.FormAberto(Formulario : String) : Boolean;
begin
  Result := (funcPrincipal.Janelas.IndexOf(Formulario) <> - 1);
end;

procedure TfPrincipal.CriarBotao(Formulario, Caption: String);
var
  btnBarra  : TSpeedButton;
  NomeBarra : String;
begin
  try
    MinimizeAll;
  except
  end;
  if CharInSet(Formulario[1],['0'..'9']) then
    Formulario              := Copy(Formulario,5,LENGTH(Formulario));
  btnBarra                  := TSpeedButton.Create(Self);
  NomeBarra                 := 'Barra'+Formulario;
  btnBarra.Parent           := PanelControl;
  btnBarra.Width            := 102;
  btnBarra.Left             := 3;
  btnBarra.Top              := 3;
  btnBarra.Align            := alLeft;
  btnBarra.Name             := 'Botao'+Formulario;
  btnBarra.ShowHint         := True;
  btnBarra.Hint             := Caption;
  btnBarra.GroupIndex       := 1;
  btnBarra.AllowAllUp       := True;
  btnBarra.OnMouseDown      := MouseDown;
  btnBarra.Caption          := Copy(Caption,1,14);
  btnBarra.OnClick          := ClickBotao;
  btnBarra.Down             := True;
  funcPrincipal.JanelaAtiva := Formulario;
end;

procedure TFPrincipal.MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pt : TPoint;
begin
  if Button = mbRight then begin
    GetCursorPos(pt);
    BotaoClicked := (Sender as TSpeedButton);
    Restaurar1.Caption := 'Restaurar ['+BotaoClicked.Caption+']';
    Minimizar1.Caption := 'Minimizar ['+BotaoClicked.Caption+']';
    Fechar1.Caption    := 'Fechar    ['+BotaoClicked.Caption+']';
    popBarra.Popup(pt.X, pt.Y - 65);
  end;
end;

procedure TfPrincipal.Restaurar1Click(Sender: TObject);
begin
  if BotaoClicked <> nil then
    FormsAction(Copy(BotaoClicked.Name,6,length(BotaoClicked.Name)), 'RESTAURAR');
end;

procedure TFPrincipal.ClickBotao(Sender: TObject);
var
  FormName : String;
begin
  if (Sender as TSpeedButton).Tag > 1 then begin
    ExecutaRotina((Sender as TSpeedButton).Tag);
    Exit;
  end;
  FormName := (Sender as TSpeedButton).Name;
  Delete(FormName,1,5);
  if not (Sender as TSpeedButton).Down then begin
    AtualizaTela(FormName, True);
    funcPrincipal.JanelaAtiva := '';
  end else begin
    MinimizeAll((Sender as TSpeedButton));
    AtualizaTela(FormName);
    funcPrincipal.JanelaAtiva := FormName;
  end;
end;

procedure TfPrincipal.DirList(ASource : string; ADirList : TStringList ; boolForce : boolean = false);
var
  SearchRec : TSearchRec;
  Result    : Integer;
begin
  Result := FindFirst( ASource, faAnyFile, SearchRec );
  if Result = 0 then
    while (Result = 0) do begin
      if (SearchRec.Name+' ')[1] = '.' then begin
        Result := FindNext( SearchRec );
        Continue;
      end;
    if not boolForce then
      ADirList.Add( LowerCase( SearchRec.Name ) )
    else ADirList.Add( LowerCase( ExtractFilePath( ASource ) + SearchRec.Name  ) );
    Result := FindNext( SearchRec );
  end;
  System.SysUtils.FindClose( SearchRec );
  ADirList.Sort;
end;

procedure TfPrincipal.CompactarError;
var
  strNomeArq : String;
  flags      : dword;
begin
  try
    try
      if DirectoryExists(ExtractFilePath(Application.ExeName)+'Except\') then begin
        try
          funcPrincipal.MSGAguardeErro();
          try
            try
              if InternetGetConnectedState(@flags, 0) then
                EnviaEmail;
            except
            end;
            strNomeArq := ExtractFilePath(Application.ExeName)+'Except\';
            DeletaDiretorio(strNomeArq ,false);
          except on e: exception do
            funcPrincipal.ReportaErro(Caption,'CompactarError',e.Message);
          end;
        finally
          funcPrincipal.MSGAguardeErro(false);
        end;
      end;
    except
      funcPrincipal.MSGAguardeErro(false);
    end;
  finally
    funcPrincipal.MSGAguardeErro(false);
    funcPrincipal.MSGAguardeErro(false);
  end;
end;

procedure TfPrincipal.BuscaRotina(intRotina : Integer);

procedure AtivaLicenca;
begin
  try
    fLicenca := TfLicenca.Create(nil);
    fLicenca.ShowModal;

  finally
    FreeAndNil(fLicenca);
  end;
end;

var
  qryCons : TSQLQuery;
begin
  if intRotina = 999 then begin
    AtivaLicenca;
    Exit;
  end;
  if not TemPermissao(IntToStr(intRotina)) then Exit;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      MENU_CODIGO');
        sql.Add('FROM  MENU');
        sql.Add('WHERE MENU_ID = ' + IntToStr(intRotina));
        SQL.Add('AND   MENU_NOME_BPL <> ' + QuotedStr('CMD'));
        Open;
        if not IsEmpty then begin
          ExecutaRotina(qryCons.Fields[0].Value);
        end;
      end;
    except on e: exception do
      funcPrincipal.Alerta('Erro ao tentar executar esta rotina.'+#13+'['+e.Message+']',1)
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfPrincipal.TemPermissao(strMenu_ID : String) : Boolean;
var
  qryCons : TSQLQuery;
begin
  Result := true;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      USRM_ID');
        sql.Add('FROM  USUARIO_M');
        sql.Add('WHERE USRM_USER_ID = ' + IntToStr(funcPrincipal.User_ID));
        sql.Add('AND   USRM_EMPR_ID = ' + IntToStr(funcPrincipal.Empr_ID));
        sql.Add('AND   USRM_MENU_ID = ' + strMenu_ID);
        Open;
        Result := (not IsEmpty)
      end;
    except on e: exception do
      funcPrincipal.Alerta('Erro ao perquisar a permissão do usuário.'+#13+'['+e.Message+']',1)
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfPrincipal.Timer1Timer(Sender: TObject);
begin
  try
    try
      Self.BringToFront;
      Timer1.Enabled := false;
      TimerBackup.Enabled := true;
      if GetClass(funcPrincipal.JanelasFechar) <> nil then begin
        Self.BringToFront;
        funcPrincipal.DescarregarPacote(funcPrincipal.JanelasFechar);
        Self.BringToFront;
        funcPrincipal.JanelasFechar := '';
        AtualizaPainel();
      end else Timer1.Enabled := true;
      Self.BringToFront;
    except
    end;
  finally
    edtRotina.SetFocus;
  end;
end;

procedure TfPrincipal.AtualizaPainel();
var
  qryCons : TSQLQuery;
  S       : String;
begin
  S := 'SELECT FIRST 10                     '+
       '       MENU_CODIGO,                 '+
       '       MENU_DESCRICAO               '+
       '  FROM HISTORICOMENU                '+
       '  JOIN MENU                         '+
       '    ON MENU_ID      = HTME_MENU_ID  '+
       ' WHERE HTME_EMPR_ID = %D            '+
       '   AND HTME_USER_ID = %D            '+
       ' ORDER BY                           '+
       '       HTME_QTDE                    ';
  S := Format(S,[funcPrincipal.Empr_ID,funcPrincipal.User_ID]);
  Exit;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add(S);
      Open;
      First;
      while not Eof do begin
        Next;
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfPrincipal.TimerBackupTimer(Sender: TObject);
var
  strCaminho : String;
begin
  TimerBackup.Enabled := false;
  case dayofweek(Now) of
    1 : begin //Domingo
      if funcPrincipal.BackupDomingo then begin
        if not RealizouBackup(strCaminho) then Exit;
        RealizaBackup('Backup de Domingo: ' + FormatDateTime('dd/mm/yyyy',Now),strCaminho);
      end
    end;
    2 : begin //Segunda
      if funcPrincipal.BackupSegunda then begin
        if not RealizouBackup(strCaminho) then Exit;
        RealizaBackup('Backup de Segunda: ' + FormatDateTime('dd/mm/yyyy',Now),strCaminho);
      end;
    end;
    3 : begin //Terça
      if funcPrincipal.BackupTerca then begin
        if not RealizouBackup(strCaminho) then Exit;
        RealizaBackup('Backup de Terca: ' + FormatDateTime('dd/mm/yyyy',Now),strCaminho);
      end;
    end;
    4 : begin //Quarta
      if funcPrincipal.BackupQuarta then begin
        if not RealizouBackup(strCaminho) then Exit;
        RealizaBackup('Backup de Quarta: ' + FormatDateTime('dd/mm/yyyy',Now),strCaminho);
      end;
    end;
    5 : begin //Quinta
      if funcPrincipal.BackupQuinta then begin
        if not RealizouBackup(strCaminho) then Exit;
        RealizaBackup('Backup de Quinta: ' + FormatDateTime('dd/mm/yyyy',Now),strCaminho);
      end;
    end;
    6 : begin //Sexta
      if funcPrincipal.BackupSexta then begin
        if not RealizouBackup(strCaminho) then Exit;
        RealizaBackup('Backup de Sexta: ' + FormatDateTime('dd/mm/yyyy',Now),strCaminho);
      end;
    end;
    7 : begin //Sábado
      if funcPrincipal.BackupSabado then begin
        if not RealizouBackup(strCaminho) then Exit;
        RealizaBackup('Backup de Sabado: ' + FormatDateTime('dd/mm/yyyy',Now),strCaminho);
      end;
    end;
  end;
end;

function TfPrincipal.RealizouBackup(out strCaminho : String) : Boolean;

function AvaliaHorario(hrAtual, hrBackup : String) : Boolean;
var
  sHrAtual,
  sMinAtual,
  sHrBkp,
  sMinBkp : Integer;
  S       : String;
  qryCons : TSQLQuery;
begin
  Result    := false;

  sHrAtual  := StrToInt( Copy(hrAtual,1,2) );
  sMinAtual := StrToInt( Copy(hrAtual,4,2) );

  sHrBkp    := StrToInt( Copy(hrBackup,1,2) );
  sMinBkp   := StrToInt( Copy(hrBackup,4,2) );

  if sHrBkp = 0 then Exit;
  if sHrBkp > sHrAtual then Exit;
  if sHrBkp+sMinBkp > sHrAtual+sMinAtual then Exit;

  S := 'SELECT COUNT(*) AS QTDE                         '+
       '  FROM LISTABACKUP                              '+
       ' WHERE BKUP_DTA_BACKUP   = ''%S''               '+
       '   AND BKUP_HORA_BACKUP <= CAST(''%S'' AS TIME) '+
       '   AND BKUP_HORA_BACKUP >= CAST(''%S'' AS TIME) ';

  S := Format(S,[FormatDateTime('mm/dd/yyyy',Now),hrAtual,hrBackup]);

  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add(S);
      Open;
      Result := Fields[0].AsInteger = 0;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

var
  sHora : String;
  iniTMP : TIniFile;
begin

  Result := false;

  strCaminho := 'C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe';
  if not FileExists(strCaminho) then Exit;

  iniTMP := TIniFile.Create(ExtractFilePath(Application.ExeName)+'AnOnImUs.ini');
  strCaminho := ExtractFilePath(Application.ExeName);
  strCaminho := Copy(strCaminho,1,length(strCaminho)-4)+'DataBase\ANONIMUS.GDB';
  strCaminho := iniTMP.ReadString('DBConfig','DataBase',strCaminho);
  if not FileExists(strCaminho) then Exit;

  sHora := FormatDateTime('hh:mm',Now);
  sHora := Shora+':00';

  Result := AvaliaHorario(sHora,funcPrincipal.BackupHora3); if Result then Exit;
  Result := AvaliaHorario(sHora,funcPrincipal.BackupHora2); if Result then Exit;
  Result := AvaliaHorario(sHora,funcPrincipal.BackupHora1); if Result then Exit;

end;

procedure TfPrincipal.RealizaBackup(strMSG, strCaminho : String);
var
  ArqBat : TextFile;
  qryCons : TSQLQuery;
begin
  try
    fVersao := TfVersao.Create(nil);
    fVersao.ShowModal;
    strCaminho := StringReplace(strCaminho,'/','\',[rfReplaceAll]);
    AssignFile(ArqBat, ExtractFileDir(ParamStr(0))+'\backup.bat');
    ReWrite(ArqBat);
    WriteLn(ArqBat, 'CD C:\Program Files\TortoiseSVN\bin');
    WriteLn(ArqBat, 'TortoiseProc.exe /command:cleanup /path:"'+ExtractFileDir(strCaminho)+'\" /logmsg:"'+strMSG+'" /closeonend:3');
    WriteLn(ArqBat, 'TortoiseProc.exe /command:commit  /path:"'+ExtractFileDir(strCaminho)+'\" /logmsg:"'+strMSG+'" /closeonend:3');
    CloseFile(ArqBat);

    ShellExecute(0, Nil, Pchar(ExtractFileDir(ParamStr(0))+'\backup.bat'), Nil, Nil, SW_ShowMaximized);

    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add(Format('INSERT INTO LISTABACKUP(BKUP_ID,BKUP_DTA_BACKUP,BKUP_HORA_BACKUP) VALUES(%D,''%S'',''%S'')',[funcPrincipal.ObterSequencia('LISTABACKUP',0),
                         FormatDateTime('mm/dd/yyyy',Now),
                         FormatDateTime('hh:mm',Now)]));
      ExecSQL();
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FreeAndNil(fVersao);
    Application.Terminate;
  end;
end;

{*******************************************************************************
Data:       19/03/2010
Autor:      Alex Itamar Gomes
Descrição:  Metodo para verificar se ha estoque abaixo do minimo parametrizado
            pelo usuário no cadastro de produtos

Historico
Data          Autor               Descrição
19/03/2010    Alex I. Gomes       Inclusão de Cabeçalho
*******************************************************************************}
procedure TfPrincipal.LoadEstoque;

{$REGION 'ProdutoSemEstoque'}
  procedure ProdutoSemEstoque;
  var
    qryCons : TSQLQuery;
  begin
    try
      lbEstoque.Caption := '';
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COUNT(*)');
          sql.Add('FROM  PRODUTOS PR');
          sql.Add('INNER JOIN ESTOQUE ET');
          sql.Add('ON (ET.ESTQ_PROD_ID      = PR.PROD_ID');
          sql.Add('AND ET.ESTQ_PROD_EMPR_ID = PR.PROD_EMPR_ID)');
          sql.Add('WHERE PR.PROD_EMPR_ID    = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   PR.PROD_ATIVO      = 1');
          sql.Add('AND   ET.ESTQ_EST_ATUAL <= PR.PROD_ESTQ_MINIMO');
          Open;
          if qryCons.Fields[0].AsInteger > 0 then begin
            lbEstoque.Caption := 'Consta(m) '+qryCons.Fields[0].AsString+' produto(s) com estoque abaixo do minimo.';
          end;
        end;
      except
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'ProdutoDivergente'}
  procedure ProdutoDivergente;
  var
    qryCons : TSQLQuery;
  begin
    try
      Label42.Caption := '';
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COUNT(*)');
          sql.Add('FROM  PRODUTOS');
          SQL.Add('WHERE PROD_EMPR_ID              = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   PROD_ATIVO                = 1');
          sql.Add('AND   PROD_GENE_EMPR_ID_TP_PROD = 0');
          sql.Add('AND   PROD_GENE_TGEN_ID_TP_PROD = 10');
          sql.Add('AND   PROD_GENE_ID_TP_PROD      = 2');
          sql.Add('AND  (PROD_ESTQ_MINIMO          > 0');
          sql.Add('OR    PROD_ESTQ_INICIAL         > 0');
          sql.Add('OR    PROD_FLG_FRACIONADO       = 1');
          sql.Add('OR    PROD_GRADE                = 1');
          sql.Add('OR    PROD_FLG_ESTOQUE          = 1)');
          Open;
          if qryCons.Fields[0].AsInteger > 0 then begin
            Label42.Caption := 'Você possui '+qryCons.Fields[0].AsString+' serviços com divergência no cadastro';
          end;
        end;
      except
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'ProdutoCadastro'}
  procedure ProdutoCadastro;
  var
    qryCons : TSQLQuery;
  begin
    try
      Label43.Caption := '';
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      SUM(CONTA)');
          sql.Add('FROM');
          sql.Add('    (SELECT');
          sql.Add('           COUNT(*) AS CONTA');
          sql.Add('     FROM  PRODUTOS');
          sql.Add('     WHERE PROD_EMPR_ID              = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('     AND   PROD_ATIVO                = 1');
          sql.Add('     AND   PROD_GENE_EMPR_ID_TP_PROD = 0');
          sql.Add('     AND   PROD_GENE_TGEN_ID_TP_PROD = 10');
          sql.Add('     AND   PROD_GENE_ID_TP_PROD      = 1');
          sql.Add('     AND   PROD_COD_NCM              IS NULL');
          sql.Add('     OR    PROD_COD_NCM              = ' + QuotedStr(''));
          sql.Add('');
          sql.Add('     UNION');
          sql.Add('');
          sql.Add('     SELECT');
          sql.Add('           COUNT(PROD_ID) AS CONTA');
          sql.Add('     FROM  PRODUTOS');
          sql.Add('     WHERE PROD_EMPR_ID              = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('     AND   PROD_ATIVO                = 1');
          sql.Add('     AND   PROD_GENE_EMPR_ID_TP_PROD = 0');
          sql.Add('     AND   PROD_GENE_TGEN_ID_TP_PROD = 10');
          sql.Add('     AND   PROD_GENE_ID_TP_PROD      = 1');
          sql.Add('     AND   PROD_ID NOT IN (SELECT');
          sql.Add('                                 PRCB_PROD_ID');
          sql.Add('                           FROM  PRODUTOS_BAR');
          sql.Add('                           WHERE PRCB_EMPR_ID      = ' + IntToStr(funcPrincipal.Empr_ID)+')');
          sql.Add('     )');
          Open;
          if qryCons.Fields[0].AsInteger > 0 then begin
            Label43.Caption := 'Há '+qryCons.Fields[0].AsString+' produtos sem código EAN ou NCM informados.';
          end;
        end;
      except
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

begin
  ProdutoSemEstoque;
  ProdutoDivergente;
  ProdutoCadastro;
end;

procedure TfPrincipal.AtualizaMenus;

{$REGION 'VisualizaFinanceiros'}
  function VisualizaFinanceiros : Boolean;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := true;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          SQL.Clear;
          sql.Add('SELECT');
          sql.Add('      CSIS_VISUAL_FINANCEIRO');
          sql.Add('FROM  CONF_SISTEMA');
          sql.Add('WHERE CSIS_EMPR_ID = ' + IntToStr(funcPrincipal.Empr_ID));
          Open
        end;
        Result := (qryCons.Fields[0].AsInteger = 1);
      except on e: exception do begin
        funcPrincipal.ReportaErro(Caption,'VisualizaFinanceiros',e.Message);
        Result := false;
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

begin
  funcPrincipal.MSGAguarde();
  Application.ProcessMessages;
  funcPrincipal.InicializationSystem;
  CriarMenuUsuario;
  funcPrincipal.CarregaPermissoesUsuario;
  funcPrincipal.CarregaDadosEmpresa;
  if VisualizaFinanceiros and funcPrincipal.TemPermissao('319') then begin
    PageControlAvisos.Visible := true;
    if funcPrincipal.TemPermissao('345') then begin
      panelTitulos.Visible := true;
      Application.ProcessMessages;
      LoadBussiness;
    end else panelTitulos.Visible := false;
    if funcPrincipal.TemPermissao('346') then begin
      panelGrafico.Visible      := true;
      pgGrafico.Visible         := true;
      panelPlanejamento.Visible := true;
      Application.ProcessMessages;
      LoadGrafics;
    end else begin
      panelGrafico.Visible      := false;
      pgGrafico.Visible         := false;
      panelPlanejamento.Visible := false;
    end;
    if funcPrincipal.TemPermissao('347') then begin
      panelAvisos.Visible  := true ;
      Application.ProcessMessages;
      LoadAlerts;
      Application.ProcessMessages;
      LoadEstoque;
      Application.ProcessMessages;
      LoadOS;
    end else panelAvisos.Visible := false;
  end else begin
    panelTitulos.Visible      := false;
    panelGrafico.Visible      := false;
    pgGrafico.Visible         := false;
    panelPlanejamento.Visible := false;
    panelAvisos.Visible       := false;
    PageControlAvisos.Visible := false;
  end;
  AtualizaCartoes();
  AtualizaPainel();
  TimerBackup.Enabled := true;
  funcPrincipal.MSGAguarde(false);
end;

procedure TfPrincipal.AtualizaCartoes();
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('UPDATE CONTAS_PAGAR');
      sql.Add('   SET CPAG_CCRE_ID               = 1');
      sql.Add('      ,CPAG_CCRE_EMPR_ID          = 0');
      sql.Add(' WHERE CPAG_EMPR_ID               = 0');
      sql.Add('   AND CPAG_VIA_BANCO             = 1');
      sql.Add('   AND CPAG_CBCO_ID               = 1');
      sql.Add('   AND CPAG_CBCO_EMPR_ID          = 0');
      sql.Add('   AND CPAG_PREVISAO              = 0');
      sql.Add('   AND CPAG_GENE_EMPR_ID_TIPO_DOC = 0');
      sql.Add('   AND CPAG_GENE_TGEN_ID_TIPO_DOC = 5');
      sql.Add('   AND CPAG_GENE_ID_TIPO_DOC      = 5');
      ExecSQL();

      sql.Clear;
      sql.Add('UPDATE CONTAS_PAGAR');
      sql.Add('   SET CPAG_CCRE_ID               = 2');
      sql.Add('      ,CPAG_CCRE_EMPR_ID          = 0');
      sql.Add(' WHERE CPAG_EMPR_ID               = 0');
      sql.Add('   AND CPAG_VIA_BANCO             = 1');
      sql.Add('   AND CPAG_CBCO_ID               = 10');
      sql.Add('   AND CPAG_CBCO_EMPR_ID          = 0');
      sql.Add('   AND CPAG_PREVISAO              = 0');
      sql.Add('   AND CPAG_GENE_EMPR_ID_TIPO_DOC = 0');
      sql.Add('   AND CPAG_GENE_TGEN_ID_TIPO_DOC = 5');
      sql.Add('   AND CPAG_GENE_ID_TIPO_DOC      = 5');
      ExecSQL();

      sql.Clear;
      sql.Add('UPDATE CONTAS_PAGAR');
      sql.Add('   SET CPAG_CCRE_ID               = 5');
      sql.Add('      ,CPAG_CCRE_EMPR_ID          = 0');
      sql.Add(' WHERE CPAG_EMPR_ID               = 0');
      sql.Add('   AND CPAG_VIA_BANCO             = 1');
      sql.Add('   AND CPAG_CBCO_ID               = 3');
      sql.Add('   AND CPAG_CBCO_EMPR_ID          = 0');
      sql.Add('   AND CPAG_PREVISAO              = 0');
      sql.Add('   AND CPAG_GENE_EMPR_ID_TIPO_DOC = 0');
      sql.Add('   AND CPAG_GENE_TGEN_ID_TIPO_DOC = 5');
      sql.Add('   AND CPAG_GENE_ID_TIPO_DOC      = 5');
      ExecSQL();
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfPrincipal.LoadGrafics;

procedure CarregaPlanejado;
var
  qryCons : TSQLQuery;
  Dia,
  Mes,
  Ano     : Word;
begin
  try
    DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(SUM(PCPJ_MES_01),0) JAN,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_02),0) FEV,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_03),0) MAR,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_04),0) ABR,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_05),0) MAI,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_06),0) JUN,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_07),0) JUL,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_08),0) AGO,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_09),0) SET_,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_10),0) OUT,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_11),0) NOV,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_12),0) DEZ');
        sql.Add('FROM  PLANO_CONTAS_PLANEJAMENTO');
        sql.Add('WHERE PCPJ_EMPR_ID      = ' + IntToStr(funcPrincipal.Empr_ID));
        sql.Add('AND   PCPJ_PLCT_ID     <> 155');
        sql.Add('AND   PCPJ_PLCT_EMPR_ID = ' + IntToStr(funcPrincipal.Empr_ID));
        sql.Add('AND   PCPJ_ANO          = ' + IntToStr(Ano));
        Open;
        if not IsEmpty then begin
          floatPlanejado[1]  := qryCons.Fields[0].AsFloat;
          floatPlanejado[2]  := qryCons.Fields[1].AsFloat;
          floatPlanejado[3]  := qryCons.Fields[2].AsFloat;
          floatPlanejado[4]  := qryCons.Fields[3].AsFloat;
          floatPlanejado[5]  := qryCons.Fields[4].AsFloat;
          floatPlanejado[6]  := qryCons.Fields[5].AsFloat;
          floatPlanejado[7]  := qryCons.Fields[6].AsFloat;
          floatPlanejado[8]  := qryCons.Fields[7].AsFloat;
          floatPlanejado[9]  := qryCons.Fields[8].AsFloat;
          floatPlanejado[10] := qryCons.Fields[9].AsFloat;
          floatPlanejado[11] := qryCons.Fields[10].AsFloat;
          floatPlanejado[12] := qryCons.Fields[11].AsFloat;
        end;
      end;
    except on e: exception do begin
      funcPrincipal.ReportaErro(Caption,'CarregaPlanejado',e.Message);
      funcPrincipal.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure CarregaRealizado;
var
  qryCons : TSQLQuery;
  Dia,
  Mes,
  Ano     : Word;
begin
  try
    DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO),');
        sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
        sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
        sql.Add('INNER JOIN CONTAS_PAGAR CP');
        sql.Add('ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
        sql.Add('AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
        sql.Add('WHERE AC.ACPG_EMPR_ID                         = ' + IntToStr(funcPrincipal.Empr_ID));
        sql.Add('AND   CP.CPAG_STATUS                         <> ' + QuotedStr('C'));
        sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO) = ' + IntToStr(Ano));
        sql.Add('GROUP BY');
        sql.Add('      1');
        Open;
        if not IsEmpty then begin
          First;
          while not Eof do begin
            floatRealizado[qryCons.Fields[0].AsInteger] := qryCons.Fields[1].AsFloat;
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      funcPrincipal.ReportaErro(Caption,'CarregaRealizado',e.Message);
      funcPrincipal.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

var
  intI : Integer;
begin
  ///ALIMENTANDO GRAFICO
  for intI := 1 to 12 do begin
    arrayDeb[intI]        := 0;
    arrayCred[intI]       := 0;
    floatPlanejado[intI]  := 0;
    floatRealizado[intI]  := 0;
  end;
  DebitoAno;
  CreditoAno;
  CarregaPlanejado;
  CarregaRealizado;
  with chtProjecao do begin
    Series[0].Clear;
    Series[1].Clear;
    Series[0].Add(arrayDeb[1]  ,'Jan',clRed);
    Series[1].Add(arrayCred[1] ,'Jan',clBlue);
    Series[0].Add(arrayDeb[2]  ,'Fev',clRed);
    Series[1].Add(arrayCred[2] ,'Fev',clBlue);
    Series[0].Add(arrayDeb[3]  ,'Mar',clRed);
    Series[1].Add(arrayCred[3] ,'Mar',clBlue);
    Series[0].Add(arrayDeb[4]  ,'Abr',clRed);
    Series[1].Add(arrayCred[4] ,'Abr',clBlue);
    Series[0].Add(arrayDeb[5]  ,'Mai',clRed);
    Series[1].Add(arrayCred[5] ,'Mai',clBlue);
    Series[0].Add(arrayDeb[6]  ,'Jun',clRed);
    Series[1].Add(arrayCred[6] ,'Jun',clBlue);
    Series[0].Add(arrayDeb[7]  ,'Jul',clRed);
    Series[1].Add(arrayCred[7] ,'Jul',clBlue);
    Series[0].Add(arrayDeb[8]  ,'Ago',clRed);
    Series[1].Add(arrayCred[8] ,'Ago',clBlue);
    Series[0].Add(arrayDeb[9]  ,'Set',clRed);
    Series[1].Add(arrayCred[9] ,'Set',clBlue);
    Series[0].Add(arrayDeb[10] ,'Out',clRed);
    Series[1].Add(arrayCred[10],'Out',clBlue);
    Series[0].Add(arrayDeb[11] ,'Nov',clRed);
    Series[1].Add(arrayCred[11],'Nov',clBlue);
    Series[0].Add(arrayDeb[12] ,'Dez',clRed);
    Series[1].Add(arrayCred[12],'Dez',clBlue);
  end;
  with chtPlanejamento do begin
    Series[0].Clear;
    Series[1].Clear;
    Series[0].Add(floatPlanejado[1]  ,'Jan',clBlue);
    Series[1].Add(floatRealizado[1]  ,'Jan',clRed);
    Series[0].Add(floatPlanejado[2]  ,'Fev',clBlue);
    Series[1].Add(floatRealizado[2]  ,'Fev',clRed);
    Series[0].Add(floatPlanejado[3]  ,'Mar',clBlue);
    Series[1].Add(floatRealizado[3]  ,'Mar',clRed);
    Series[0].Add(floatPlanejado[4]  ,'Abr',clBlue);
    Series[1].Add(floatRealizado[4]  ,'Abr',clRed);
    Series[0].Add(floatPlanejado[5]  ,'Mai',clBlue);
    Series[1].Add(floatRealizado[5]  ,'Mai',clRed);
    Series[0].Add(floatPlanejado[6]  ,'Jun',clBlue);
    Series[1].Add(floatRealizado[6]  ,'Jun',clRed);
    Series[0].Add(floatPlanejado[7]  ,'Jul',clBlue);
    Series[1].Add(floatRealizado[7]  ,'Jul',clRed);
    Series[0].Add(floatPlanejado[8]  ,'Ago',clBlue);
    Series[1].Add(floatRealizado[8]  ,'Ago',clRed);
    Series[0].Add(floatPlanejado[9]  ,'Set',clBlue);
    Series[1].Add(floatRealizado[9]  ,'Set',clRed);
    Series[0].Add(floatPlanejado[10] ,'Out',clBlue);
    Series[1].Add(floatRealizado[10] ,'Out',clRed);
    Series[0].Add(floatPlanejado[11] ,'Nov',clBlue);
    Series[1].Add(floatRealizado[11] ,'Nov',clRed);
    Series[0].Add(floatPlanejado[12] ,'Dez',clBlue);
    Series[1].Add(floatRealizado[12] ,'Dez',clRed);
  end;
  LoadGraficoAnual();
end;

procedure TfPrincipal.LoadGraficoAnual();
var
  Dia, Mes, Ano : Word;

function Liquido(strMes, strAno : String) : Real;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := 0;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT                                                         ');
        sql.Add('      COALESCE(SUM(VALOR),0)                                   ');
        sql.Add('FROM                                                           ');
        sql.Add('    (SELECT                                                    ');
        sql.Add('           COALESCE(SUM(AC.ACRE_VALOR_DOC),0) AS VALOR         ');
        sql.Add('     FROM  CONTAS_RECEBER_ACERTOS AC                           ');
        sql.Add('     INNER JOIN CONTAS_RECEBER CR                              ');
        sql.Add('     ON (AC.ACRE_CREC_ID       = CR.CREC_ID                    ');
        sql.Add('     AND AC.ACRE_CREC_EMPR_ID  = CR.CREC_EMPR_ID)              ');
        sql.Add('     WHERE AC.ACRE_EMPR_ID                          = ' + IntToStr(funcPrincipal.Empr_ID));
        sql.Add('     AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
        sql.Add('     AND   EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = ' + strMes);
        sql.Add('     AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + strAno);
        sql.Add('                                                               ');
        sql.Add('     UNION                                                     ');
        sql.Add('                                                               ');
        sql.Add('     SELECT                                                    ');
        sql.Add('           COALESCE(SUM(AC.ACPG_VALOR_DOC),0) AS VALOR         ');
        sql.Add('     FROM  CONTAS_PAGAR_ACERTOS AC                             ');
        sql.Add('     INNER JOIN CONTAS_PAGAR CP                                ');
        sql.Add('     ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID                     ');
        sql.Add('     AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)               ');
        sql.Add('     WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcPrincipal.Empr_ID));
        sql.Add('     AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
        sql.Add('     AND   EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = ' + strMes);
        sql.Add('     AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + strAno);
        sql.Add('     )');
        Open;
      end;
      Result := qryCons.Fields[0].AsFloat;
    except on e: exception do begin
      funcPrincipal.ReportaErro(Caption,'Liquido',e.Message);
      funcPrincipal.Alerta('Erro no processo de criação do gráfico.',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

begin
  try
    DecodeDate(funcPrincipal.DataServidor(),Ano,Mes,Dia);
    funcPrincipal.MSGAguarde();
    with Chart1 do begin
      Series[0].Clear;
      Series[1].Clear;
      Series[2].Clear;
      Series[0].Title := IntToStr(Ano);
      Series[1].Title := IntToStr(Ano-1);
      Series[2].Title := IntToStr(Ano-2);
      Series[0].Add(Liquido('1', IntToStr(Ano-2)),'Jan',clGreen);
      Series[0].Add(Liquido('2', IntToStr(Ano-2)),'Fev',clGreen);
      Series[0].Add(Liquido('3', IntToStr(Ano-2)),'Mar',clGreen);
      Series[0].Add(Liquido('4', IntToStr(Ano-2)),'Abr',clGreen);
      Series[0].Add(Liquido('5', IntToStr(Ano-2)),'Mai',clGreen);
      Series[0].Add(Liquido('6', IntToStr(Ano-2)),'Jun',clGreen);
      Series[0].Add(Liquido('7', IntToStr(Ano-2)),'Jul',clGreen);
      Series[0].Add(Liquido('8', IntToStr(Ano-2)),'Ago',clGreen);
      Series[0].Add(Liquido('9', IntToStr(Ano-2)),'Set',clGreen);
      Series[0].Add(Liquido('10',IntToStr(Ano-2)),'Out',clGreen);
      Series[0].Add(Liquido('11',IntToStr(Ano-2)),'Nov',clGreen);
      Series[0].Add(Liquido('12',IntToStr(Ano-2)),'Dez',clGreen);
      Series[1].Add(Liquido('1', IntToStr(Ano-1)),'Jan',clYellow);
      Series[1].Add(Liquido('2', IntToStr(Ano-1)),'Fev',clYellow);
      Series[1].Add(Liquido('3', IntToStr(Ano-1)),'Mar',clYellow);
      Series[1].Add(Liquido('4', IntToStr(Ano-1)),'Abr',clYellow);
      Series[1].Add(Liquido('5', IntToStr(Ano-1)),'Mai',clYellow);
      Series[1].Add(Liquido('6', IntToStr(Ano-1)),'Jun',clYellow);
      Series[1].Add(Liquido('7', IntToStr(Ano-1)),'Jul',clYellow);
      Series[1].Add(Liquido('8', IntToStr(Ano-1)),'Ago',clYellow);
      Series[1].Add(Liquido('9', IntToStr(Ano-1)),'Set',clYellow);
      Series[1].Add(Liquido('10',IntToStr(Ano-1)),'Out',clYellow);
      Series[1].Add(Liquido('11',IntToStr(Ano-1)),'Nov',clYellow);
      Series[1].Add(Liquido('12',IntToStr(Ano-1)),'Dez',clYellow);
      Series[2].Add(Liquido('1', IntToStr(Ano)),'Jan',clBlue);
      Series[2].Add(Liquido('2', IntToStr(Ano)),'Fev',clBlue);
      Series[2].Add(Liquido('3', IntToStr(Ano)),'Mar',clBlue);
      Series[2].Add(Liquido('4', IntToStr(Ano)),'Abr',clBlue);
      Series[2].Add(Liquido('5', IntToStr(Ano)),'Mai',clBlue);
      Series[2].Add(Liquido('6', IntToStr(Ano)),'Jun',clBlue);
      Series[2].Add(Liquido('7', IntToStr(Ano)),'Jul',clBlue);
      Series[2].Add(Liquido('8', IntToStr(Ano)),'Ago',clBlue);
      Series[2].Add(Liquido('9', IntToStr(Ano)),'Set',clBlue);
      Series[2].Add(Liquido('10',IntToStr(Ano)),'Out',clBlue);
      Series[2].Add(Liquido('11',IntToStr(Ano)),'Nov',clBlue);
      Series[2].Add(Liquido('12',IntToStr(Ano)),'Dez',clBlue);
    end;
  finally
    funcPrincipal.MSGAguarde(false);
  end;
end;

procedure TfPrincipal.LoadOS;
var
  Dia,
  Mes,
  Ano : Word;

{$REGION 'OSMes'}
  procedure OSMes;
  var
    qryCons : TSQLQuery;
  begin
    try
      Label44.Caption := '';
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COUNT(*)');
          sql.Add('FROM  ORDEM_SERVICO');
          sql.Add('WHERE ORDS_EMPR_ID                             = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   ORDS_STATUS                              = 0');
          sql.Add('AND   EXTRACT(MONTH FROM ORDS_DTA_INSTALACAO) <= ' + IntToStr(Mes));
          sql.Add('AND   EXTRACT(YEAR FROM ORDS_DTA_INSTALACAO)  <= ' + IntToStr(Ano));
          Open;
          if qryCons.Fields[0].AsInteger > 0 then begin
            Label44.Caption := 'Você tem um total de '+qryCons.Fields[0].AsString+' O.S. em aberto até o momento.';
          end;
        end;
      except;
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'OSAtrasadas'}
  procedure OSAtrasadas;
  var
    qryCons : TSQLQuery;
  begin
    try
      Label48.Caption := '';
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COUNT(*)');
          sql.Add('FROM  ORDEM_SERVICO');
          sql.Add('WHERE ORDS_EMPR_ID        = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   ORDS_STATUS         = 0');
          sql.Add('AND   ORDS_DTA_INSTALACAO < ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcPrincipal.DataServidor(funcPrincipal.Conexao))));
          Open;
          if qryCons.Fields[0].AsInteger > 0 then begin
            Label48.Caption := 'Você tem um total de '+qryCons.Fields[0].AsString+' O.S. em atraso.';
          end;
        end;
      except;
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'OSAgendadas'}
  procedure OSAgendadas;
  var
    qryCons : TSQLQuery;
  begin
    try
      Label49.Caption := '';
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcPrincipal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COUNT(*)');
          sql.Add('FROM  ORDEM_SERVICO');
          sql.Add('WHERE ORDS_EMPR_ID        = ' + IntToStr(funcPrincipal.Empr_ID));
          sql.Add('AND   ORDS_STATUS         = 0');
          sql.Add('AND   ORDS_DTA_INSTALACAO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcPrincipal.DataServidor(funcPrincipal.Conexao))));
          Open;
          if qryCons.Fields[0].AsInteger > 0 then begin
            Label49.Caption := 'Você tem '+qryCons.Fields[0].AsString+' O.S. agendadas para hoje.';
          end;
        end;
      except;
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

begin
  DecodeDate(funcPrincipal.DataServidor(funcPrincipal.Conexao),Ano,Mes,Dia);
  OSMes;
  OSAgendadas;
  OSAtrasadas
end;

{ TDownload }

constructor TDownload.Create;
begin
  Application.ProcessMessages;
  inherited Create(true);
  FreeOnTerminate := True;
  Priority        := TpLower;
  Resume;
  Download;
end;

procedure TDownload.Download;
//var
//  strArq,
//  strDest : String;
begin
//  try
//    strArq  := 'http://www.arsistemaseconsultoria.com.br/downloads/donative.bpl';
//    strDest := ExtractFilePath(Application.ExeName)+'bpl\donative.bpl';
//    if FileExists(strDest) then
//      DeleteFile(strDest);
//    Application.ProcessMessages;
//    URLDownloadToFile(nil,PChar(strArq),Pchar(strDest),0,nil);
//    Application.ProcessMessages;
//  except
//  end;
//  try
//    strArq  := 'http://www.arsistemaseconsultoria.com.br/downloads/version.bpl';
//    strDest := ExtractFilePath(Application.ExeName)+'bpl\version.bpl';
//    if FileExists(strDest) then
//      DeleteFile(strDest);
//    Application.ProcessMessages;
//    URLDownloadToFile(nil,PChar(strArq),Pchar(strDest),0,nil);
//    Application.ProcessMessages;
//  except
//  end;
end;

end.
