unit ufBasico;

interface

uses
  Vcl.Forms, frxClass, frxDBSet, frxDesgn, Vcl.Menus, Funcoes, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Graphics, Vcl.Controls,
  Vcl.Buttons, System.Classes, System.Types, DataSnap.DBClient, Data.SqlExpr,
  ufCadastro, ufPesquisa, System.IniFiles, UrlMon, Dialogs, frxExportPDF;

const
  VConf_File = 'AnOnImUs.ini';
  strHint    = 'Utilize ( Alt + Seta p/ Baixo para pesquisar ) ou ( Alt + Insert ) para inserir novo registro';
  iHeigth           = 0.35;
  iLeft             = 3.95;
  sFonte            = 'Segoe UI';
  iSizeFonte        = 7;
  iWidthPoPortrait  = 9.20;
  iWidthPoLandscape = 18.00;

type
  TfBasico = class(TForm)
    panelInferior: TPanel;
    btnCancelar: TSpeedButton;
    panelSuperior: TPanel;
    dsGrid: TDataSource;
    btnHelp: TSpeedButton;
    Timer1: TTimer;
    lbVersion: TLabel;
    gropGridPrincipal: TGroupBox;
    Label1: TLabel;
    imgRotina: TImage;
    lbCadNovo: TLabel;
    lbCadEditar: TLabel;
    lbCadExcluir: TLabel;
    lbCadLocalizar: TLabel;
    lbCadImprimir: TLabel;
    lbCadSair: TLabel;
    ppBasico: TPopupMenu;
    Filtrarporestevalor1: TMenuItem;
    LimparFiltros1: TMenuItem;
    btnFecharRotina: TSpeedButton;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnLocalizar: TSpeedButton;
    grdBasico: TDBGrid;
    frRelatorio: TfrxReport;
    dstRelatorio: TfrxDBDataset;
    tmCartao: TTimer;
    funcBasico: TFuncoes;
    frxPDFExport: TfrxPDFExport;
    procedure btnNovoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnHelpClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure grdBasicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Filtrarporestevalor1Click(Sender: TObject);
    procedure btnFecharRotinaClick(Sender: TObject);
    procedure btnMarcarTodosClick(Sender: TObject);
    procedure btnDesmarcarTodosClick(Sender: TObject);
    procedure frRelatorioProgress(Sender: TfrxReport;
      ProgressType: TfrxProgressType; Progress: Integer);
    procedure tmCartaoTimer(Sender: TObject);
  private
    strAux  : String;
    FCCRE_ID: String;
    procedure ClicaBotao(Sender: TObject);
    procedure BuscaPermissoes(classTMP: String);
    procedure AtribuiPermissoes(strMenu_ID: String);
    procedure KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DbEditChange(Sender: TObject);
    procedure TrataGrid;
    procedure TrataFields;
    procedure CarregaVersion;
    procedure SetCaptionRotina;
    procedure FiltrarRegistrosPorValor(grdTMP: TDBGrid; cdsTMP: TClientDataSet;
      intTipo: Integer = 1);
//    procedure CloseClientDataSet(dmTMP: TDataModule);
  public
    DBGeral       : TSQLConnection;
    cdsGeral      : TClientDataSet;
    dmDataModule  : TDataModule;
    formCadastro  : TFCadastro;
    formLocaliza  : TfPesquisa;
    strEmpr_ID,
    strUser_ID    : String;
    procedure BacktoDefaultWindows;
    function  IsValidData: Boolean;
    procedure PreparaDbGrid(grid: tDbGrid);
    procedure LoadFileVersionPackage;
    property  CCRE_ID : String  read FCCRE_ID   write FCCRE_ID;
  end;

var
  fBasico: TfBasico;

implementation

uses
  Vcl.DBCtrls, Winapi.Windows, Winapi.Messages, System.SysUtils, Vcl.Printers;

{$R *.dfm}

procedure TfBasico.BacktoDefaultWindows;
var
  intI       : integer;
  Componente : TWinControl;
  clField    : TColor;
begin
  clField    := clWhite;
  for intI  := 0 to Self.ComponentCount - 1 do begin
    Componente := TWinControl(Self.Components[intI]);
    if (Componente is TEdit) then begin
      if TEdit(Componente).Color <> clGradientInactiveCaption then begin
        TEdit(Componente).Color             := clField;
      end;
      if TEdit(Componente).ImeName <> '' then begin
        TEdit(Componente).Hint := strHint;
        TEdit(Componente).ShowHint := true;
      end;
    end;
    if (Componente is TDBEdit) then begin
      if TDBEdit(Componente).Color <> clGradientInactiveCaption then begin
        TDBEdit(Componente).Color           := clField;
      end;
      if TDBEdit(Componente).ImeName <> '' then begin
        TDBEdit(Componente).Hint := strHint;
        TDBEdit(Componente).ShowHint := true;
      end;
    end;
    if (Componente is TCustomComboBox) then begin
      if TComboBox(Componente).Color <> clGradientInactiveCaption then begin
        TComboBox(Componente).Color         := clField;
      end;
    end;
    if (Componente is TDBLookupControl) then begin
      if TDBLookupComboBox(Componente).Color <> clGradientInactiveCaption then begin
        TDBLookupComboBox(Componente).Color := clField;
      end;
    end;
    if (Componente is TCustomListBox) then begin
      if TListBox(Componente).Color <> clGradientInactiveCaption then begin
        TListBox(Componente).Color          := clField;
      end;
    end;
    if (Componente is TCustomComboBox) then begin
      if TComboBox(Componente).Color <> clGradientInactiveCaption then begin
        TComboBox(Componente).Color         := clField;
      end;
    end;
    if (Componente is TDBComboBox) then begin
      if TDBComboBox(Componente).Color <> clGradientInactiveCaption then begin
        TDBComboBox(Componente).Color       := clField;
      end;
    end;
    if (Components[intI] is TGroupBox) or (Components[intI] is TPanel) then begin
      try
        (Components[intI] as TGroupBox).ParentBackground := true;
        (Components[intI] as TGroupBox).ParentColor      := true;
      except
        if (Components[intI] as TPanel).Tag <> 99 then begin
          (Components[intI] as TPanel).ParentBackground := true;
          (Components[intI] as TPanel).ParentColor      := true;
        end;
      end;
    end;
  end;
end;

procedure TfBasico.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Self.Handle, WM_SYSCOMMAND, 61458, 0);
end;

function TfBasico.IsValidData : Boolean;
var
  intI  : integer;
  lstErros : TStringList;
  Comp     : TWinControl;
begin
  try
    Result := true;
    BacktoDefaultWindows;
    lstErros := TStringList.Create;
    for intI := 0 to Self.ComponentCount - 1 do begin
      Comp   := TWinControl(Self.Components[intI]);
      if (Comp is TCustomComboBox) or (Comp is TDBLookupControl)
      or (Comp is TCustomListBox)  or (Comp is TDBComboBox)
      or (Comp is TCustomEdit)     then begin
        if (Comp.HelpContext = 1)                   and
           ((Trim(TCustomEdit(Comp).Text) = '')     or
            (Trim(TCustomEdit(Comp).Text) = '//')   or
            (Trim(TCustomEdit(Comp).Text) = '()-')  or
            (Trim(TCustomEdit(Comp).Text) = '..-')  or
            (Trim(TCustomEdit(Comp).Text) = '../-') or
            (Trim(TCustomEdit(Comp).Text) = '.-'))  then begin
          try
            TEdit(Comp).Color := FCorAlerta;
          except
          end;
          Result := false;
        end;
      end;
    end;
  finally
    FreeAndNil(lstErros);
  end;
end;

procedure TfBasico.TrataFields;
var
  intI: Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TDBEdit) or (Components[intI] is TEdit) then begin
      try
        if (Components[intI] as TDBEdit).ImeName <> '' then begin
          (Components[intI] as TDBEdit).OnKeyDown := keyDown;
        end;
        if (Components[intI] as TDBEdit).Tag <> 1 then begin
          (Components[intI] as TDBEdit).OnChange := DbEditChange;
        end;
      except
        if (Components[intI] as TEdit).ImeName <> '' then begin
          (Components[intI] as TEdit).OnKeyDown := keyDown;
        end;
      end;
    end;
  end;
end;

procedure TfBasico.TrataGrid;
var
  intI   : Integer;
  iniTMP : TIniFile;
  intTam : Integer;
  sltTMP : TStringList;
  intII  : Integer;
begin
  try
    if FileExists(ExtractFilePath(Application.ExeName) + 'GridSystem_' + IntToStr(funcBasico.User_ID) + '.ini') then begin
      try
        sltTMP := TStringList.Create;
        iniTMP := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'GridSystem_' + IntToStr(funcBasico.User_ID) + '.ini');
        iniTMP.ReadSection(Self.Name,sltTMP);
        for intI := 0 to grdBasico.Columns.Count - 1 do begin
          grdBasico.Columns[intI].Width        := 100;
          intTam := iniTMP.ReadInteger(UpperCase(Self.Name),UpperCase(grdBasico.Columns[intI].FieldName),100);
          if intTam > 0 then begin
            grdBasico.Columns[intI].Width      := intTam
          end else begin
            grdBasico.Columns[intI].Width      := 100;
            cdsGeral.Fields[intI].DisplayWidth := 100;
          end;
        end;
        for intI := 0 to grdBasico.Columns.Count - 1 do begin
          try
            for intII := 0 to sltTMP.Count - 1 do begin
              if grdBasico.Columns[intI].FieldName = funcBasico.Buscar_Coluna(sltTMP.Strings[intII],1,'=') then
                grdBasico.Columns[intI].Index := intII;
            end;
          except
          end;
        end;
      finally
        FreeAndNil(iniTMP);
        FreeAndNil(sltTMP);
      end;
    end;
  except
  end;
end;

procedure TfBasico.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfBasico.btnDesmarcarTodosClick(Sender: TObject);
var
  intI : Integer;
begin
  try
    for intI := 0 to ComponentCount - 1 do begin
      if (Components[intI] is TCheckBox) then begin
        (Components[intI] as TCheckBox).Checked := false;
      end;
    end;
  except
  end;
end;

procedure TfBasico.btnFecharRotinaClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfBasico.btnHelpClick(Sender: TObject);
var
  strLink : String;
  strTMP  : PWideChar;
begin
  try
    strLink := 'http://www.anonimus.info/'+Self.Name+'.php' + funcBasico.Se(funcBasico.Privado,'?ID=1','');
    strTMP  := StringToOleStr(strLink);
    HlinkNavigateString(nil,strTMP);
  except on e: exception do begin
    funcBasico.ReportaErro(Caption,'btnHelpClick',e.Message);
    funcBasico.Alerta('Erro ao tentar executar o navegador padrão.'+#13+'['+e.Message+']',1)
  end; end;
end;

procedure TfBasico.btnMarcarTodosClick(Sender: TObject);
var
  intI : Integer;
begin
  try
    for intI := 0 to ComponentCount - 1 do begin
      if (Components[intI] is TCheckBox) then begin
        (Components[intI] as TCheckBox).Checked := true;
      end;
    end;
  except
  end;
end;

procedure TfBasico.btnNovoClick(Sender: TObject);
begin
  ClicaBotao((Sender as TSpeedButton));
end;

procedure TfBasico.ClicaBotao(Sender : TObject);
var
  strBtnNome  : String;
begin
  try
    if (cdsGeral = nil) and ((Sender as TSpeedButton).Name <> 'btnImprimir') then begin
      funcBasico.Alerta('Erro de programação [ ClientDataSet ] não definido!',1)
    end else begin
      strBtnNome := (Sender as TSpeedButton).Name;
      if strBtnNome = 'btnNovo' then begin
        if (grdBasico.DataSource <> nil) then begin
          if (btnNovo.Enabled) then begin
            if formCadastro <> nil then begin
              try
                cdsGeral.Insert;
                formCadastro.ShowModal;
              except on e: exception do begin
                funcBasico.Alerta(e.Message,1);
                funcBasico.RollBack;
              end; end;
            end;
          end;
        end;
      end else if strBtnNome = 'btnEditar' then begin
        if (grdBasico.DataSource <> nil) then begin
          if (btnEditar.Enabled) then begin
            if formCadastro <> nil then begin
              try
                cdsGeral.Edit;
                formCadastro.ShowModal;
              except on e: exception do begin
                funcBasico.Alerta(e.Message,1);
                funcBasico.RollBack;
              end; end;
            end;
          end;
        end;
      end else if strBtnNome = 'btnLocalizar' then begin
        if (grdBasico.DataSource <> nil) then begin
          if (btnLocalizar.Enabled) and (not grdBasico.DataSource.DataSet.IsEmpty) then begin
            try
              fPesquisa := TfPesquisa.Create(nil);
              with fPesquisa do begin
                strCampo    := grdBasico.Columns[grdBasico.SelectedIndex].Field.DisplayName;
                cdsPesquisa := TClientDataSet(grdBasico.DataSource.DataSet);
                ShowModal;
              end;
              FreeAndNil(fPesquisa);
            except on e: exception do begin
              funcBasico.Alerta(e.Message,1);
            end; end;
          end else begin
            funcBasico.Alerta('I N F O R M A Ç Ã O ! ! !'+#13+#13+'Não há registro a ser pesquisado.',0);
          end;
        end;
      end else if strBtnNome = 'btnExcluir' then begin
        if (grdBasico.DataSource <> nil) and (not cdsGeral.IsEmpty) then begin
          if (btnExcluir.Enabled) then begin
            if formCadastro <> nil then begin
              if funcBasico.Alerta('Confirma a exclusão do registro selecionado?',1,true) = 6 then begin
                try
                  try
                    funcBasico.StartCommit;
                  except
                  end;
                  cdsGeral.Delete;
                  cdsGeral.ApplyUpdates(-1);
                  try
                    funcBasico.Commit;
                  except
                  end;
                except on e: exception do begin
                  funcBasico.RollBack;
                  cdsGeral.CancelUpdates;
                end; end;
              end;
            end;
          end;
        end else funcBasico.Alerta('Não há registro a ser excluido.',1);
      end else if strBtnNome = 'btnImprimir' then begin
        //Função desabilitada
      end;
    end;
  except on e: exception do
    funcBasico.ReportaErro(Caption,(Sender as TComponent).Name,e.Message);
  end;
end;

procedure TfBasico.FormActivate(Sender: TObject);
var
  Princ     : TForm;
  funcPrinc : TFuncoes;
begin
  try
    Princ     := Application.MainForm;
    funcPrinc := TFuncoes(Princ.FindComponent('funcPrincipal'));
    if funcPrinc <> nil then
      funcPrinc.JanelaAtiva := UpperCase(Self.ClassName);
    funcBasico.MSGAguarde(false);
  except
  end;
end;

procedure TfBasico.FormClose(Sender: TObject; var Action: TCloseAction);
var
  formPrincipal : TForm;
  panelTMP      : TSpeedButton;
  funcTMP       : TFuncoes;
  Timer         : TTimer;
begin
  try
    formPrincipal := Application.MainForm;
    formPrincipal.BringToFront;
    panelTMP      := TSpeedButton(formPrincipal.FindComponent('BOTAO'+Self.ClassName));
    formPrincipal.BringToFront;
    funcTMP       := TFuncoes(formPrincipal.FindComponent('funcPrincipal'));
    formPrincipal.BringToFront;
    funcTMP.Janelas.Delete(funcTMP.Janelas.IndexOf(Self.ClassName));
    formPrincipal.BringToFront;
    funcTMP.JanelasFechar := Self.ClassName;
    formPrincipal.BringToFront;
    Timer         := TTimer(formPrincipal.FindComponent('Timer1'));
    formPrincipal.BringToFront;
    if Timer <> nil then begin
      Timer.Enabled := true;
    end;
    FreeAndNil(panelTMP);
    formPrincipal.BringToFront;
  except
  end;
  Action := caFree;
end;

//procedure TfBasico.CloseClientDataSet(dmTMP : TDataModule);
//var
//  intI : Integer;
//begin
//  for intI := 0 to dmTMP.ComponentCount -1 do begin
//    if (Components[intI] is TSQLQuery) or (Components[intI] is TClientDataSet) then begin
//      try
//        (Components[intI] as TSQLQuery).Close;
//      except
//        (Components[intI] as TClientDataSet).Close;
//      end;
//    end;
//  end;
//end;

procedure TfBasico.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  iniTMP : TIniFile;
  intI   : Integer;
begin
  try
    if cdsGeral <> nil then begin
      if grdBasico.Columns.Count > 0 then begin
        try
          iniTMP   := TIniFile.Create(ExtractFilePath(Application.ExeName)+'GridSystem_'+IntToStr(funcBasico.User_ID)+'.ini');
          iniTMP.EraseSection(Self.Name);
          for intI := 0 to grdBasico.Columns.Count - 1 do begin
            iniTMP.WriteInteger(UpperCase(Self.Name),UpperCase(grdBasico.Columns[intI].FieldName),grdBasico.Columns[intI].Width);
          end;
        finally
          FreeAndNil(iniTMP);
        end;
      end;
    end;
  except
  end;
end;

procedure TfBasico.FormCreate(Sender: TObject);
var
  Princ : TForm;
  intI  : Integer;
  btnTMPFlat : TSpeedButton;
begin

  try
    Princ := Application.MainForm;
    if Princ <> nil then begin
        funcBasico := TFuncoes(Princ.FindComponent('funcPrincipal'));
      if funcBasico <> nil then begin
        DbGeral    := funcBasico.Conexao;
        if assigned(DbGeral) then begin
          try
            DbGeral.Open;
            funcBasico.Conexao := DBGeral;
          except
          end;
        end;
        if not Assigned(DbGeral) then begin
          funcBasico.Alerta('Não foi possível conectar com o banco de dados!',0)
        end else PreparaDbGrid(grdBasico);
      end;
    end;
    LoadFileVersionPackage;
    try
      if TPanel(FindComponent('panelFiltros')) <> nil then
        TPanel(FindComponent('panelFiltros')).Height := 155;
    except
    end;

    try
      for intI := 0 to Self.ComponentCount-1 do begin
        if (Self.Components[intI] is TSpeedButton) then begin
          btnTMPFlat := TSpeedButton(Self.Components[intI]);
          if Assigned(btnTMPFlat) then begin
            btnTMPFlat.Font.Style := [fsBold];
            btnTMPFlat.Font.Color := clNavy;
          end;
        end;
      end;
    except
    end;
  except
  end;
end;

procedure TfBasico.LoadFileVersionPackage;
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      MENU_NOME_BPL');
        sql.Add('FROM  MENU');
        sql.Add('WHERE MENU_CLASSE_FORM_BPL = ' + QuotedStr(Self.ClassName));
        Open;
        strAux := FloatToStr(GetFileVersion(ExtractFilePath(Application.ExeName)+'bpl/'+Trim(qryCons.Fields[0].AsString)));
      end;
    except on e: exception do
      ShowMessage(e.Message);
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfBasico.PreparaDbGrid(grid : tDbGrid);
var
  intI         : Integer;
  ColunaTitulo : TColumnTitle;
  Coluna       : TColumn;
  Campo        : TField;
begin
  grid.DataSource.DataSet := cdsGeral;
  if cdsGeral = nil then exit;
  cdsGeral.Open;
  grid.Columns.Clear;
  for intI := 0 to cdsGeral.Fields.Count - 1 do begin
    Campo  := cdsGeral.Fields[intI];
    if Campo.Visible then begin
      Coluna                := TColumn.Create(grid.Columns);
      ColunaTitulo          := TColumnTitle.Create(Coluna);
      Coluna.Field          := Campo;
      Coluna.DisplayName    := Campo.DisplayText;
      Coluna.Width          := Campo.DisplayWidth;
      ColunaTitulo.Caption  := Campo.DisplayLabel;
      Coluna.Title          := ColunaTitulo;
      Coluna.Width          := 100;
    end;
  end;
end;

procedure TfBasico.SpeedButton1Click(Sender: TObject);
var
  formPrincipal : TForm;
  panelTMP      : TSpeedButton;
begin
  Self.Visible    := False;
  Self.SetBounds(0, 0, 0, 0);
  Self.Repaint;
  try
    formPrincipal := Application.MainForm;
    panelTMP      := TSpeedButton(formPrincipal.FindComponent(UpperCase('BOTAO'+Self.ClassName)));
    panelTMP.Down := false;
  except
  end;
end;

procedure TfBasico.Timer1Timer(Sender: TObject);
begin
  try
    grdBasico.SetFocus;
    Timer1.Enabled := false;
  except
  end;
end;

procedure TfBasico.tmCartaoTimer(Sender: TObject);
begin
  tmCartao.Enabled := false;
end;

procedure TfBasico.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfBasico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    if key = 13 then begin
      key := 0;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
    if key = 27 then begin
      if grdBasico.DataSource.DataSet.Filtered = true then begin
        grdBasico.DataSource.DataSet.Filtered := false;
        grdBasico.Refresh;
      end else btnCancelar.Click;
      key := 0;
    end;
  except
  end;
end;

procedure TfBasico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  try
    if key = #13 then begin
      Perform(WM_NEXTDLGCTL,0,0);
      key := #0;
    end;
  except
  end;
end;

procedure TfBasico.FormResize(Sender: TObject);
begin
  try
    CarregaVersion;
  except
  end;
end;

procedure TfBasico.FormShow(Sender: TObject);
var
  intHandle : Integer;
begin
  try
    BuscaPermissoes((Self).ClassName);
    TrataGrid;
    TrataFields;
    BacktoDefaultWindows;
    Timer1.Enabled := true;
    Self.Caption   := '';
    SetCaptionRotina;
    intHandle      := FindWindow(nil,PChar(Self.Caption));
    if intHandle > 0 then begin
      SendMessage(intHandle,WM_SETICON,0,0);
    end;
  except
  end;
//  funcBasico.VersionSystem(StrToInt(lbVersion.Caption));
end;

procedure TfBasico.frRelatorioProgress(Sender: TfrxReport;
  ProgressType: TfrxProgressType; Progress: Integer);
var
  bRetrato : Boolean;

  iWidth,
  iLeftLine : Variant;
begin
  try
    bRetrato := TfrxReportPage(TfrxReport(Sender).FindComponent('Page1')).Orientation = poPortrait;
    if bRetrato then begin
      iWidth      := iWidthPoPortrait;
      iLeftLine   := 13.25;
    end else begin
      iWidth      := iWidthPoLandscape;
      iLeftLine   := 22.00;
    end;
    //*** LOGO DA EMPRESA ***//
//    TfrxPictureView(TfrxReport(Sender).FindComponent('imgLogo')).Height         := 2.60;
//    TfrxPictureView(TfrxReport(Sender).FindComponent('imgLogo')).Left           := 0.10;
//    TfrxPictureView(TfrxReport(Sender).FindComponent('imgLogo')).Top            := 0.10;
//    TfrxPictureView(TfrxReport(Sender).FindComponent('imgLogo')).Width          := 3.80;
    //*** NOME FANTASIA ***//
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblFantasia')).Font.Name     := sFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblFantasia')).Font.Size     := iSizeFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblFantasia')).Font.Style    := [fsBold];
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblFantasia')).Height        := iHeigth;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblFantasia')).Left          := iLeft;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblFantasia')).Top           := 0.10;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblFantasia')).Width         := iWidth;
    //*** ENDERECO ***//
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblEndereco')).Font.Name     := sFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblEndereco')).Font.Size     := iSizeFonte;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblEndereco')).Height        := iHeigth;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblEndereco')).Left          := iLeft;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblEndereco')).Top           := 0.50;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblEndereco')).Width         := iWidth;
    //*** RAZAO SOCIAL ***//
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblRazao_Social')).Font.Name := sFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblRazao_Social')).Font.Size := iSizeFonte;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblRazao_Social')).Height    := iHeigth;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblRazao_Social')).Left      := iLeft;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblRazao_Social')).Top       := 0.90;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblRazao_Social')).Width     := iWidth;
    //*** TELEFONE ***//
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblTelefone')).Font.Name     := sFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblTelefone')).Font.Size     := iSizeFonte;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblRazao_Social')).Height    := iHeigth;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblRazao_Social')).Left      := iLeft;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblRazao_Social')).Top       := 1.30;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblRazao_Social')).Width     := iWidth;
    //*** TITULO ***//
    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo14')).Font.Name          := sFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo14')).Font.Size          := 10;
    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo14')).Font.Style         := [fsBold];
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo14')).Height             := 0.50;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo14')).Left               := iLeft;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo14')).Top                := 2.20;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo14')).Width              := iWidth;

    //*** LINHA LATERAL ***//
//    TfrxLineView(TfrxReport(Sender).FindComponent('Line1')).Left                := iLeftLine;
//    TfrxLineView(TfrxReport(Sender).FindComponent('Line1')).Height              := 2.80;
//    TfrxLineView(TfrxReport(Sender).FindComponent('Line1')).Top                 := 0.10;
//    TfrxLineView(TfrxReport(Sender).FindComponent('Line1')).Width               := 0;

    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo3')).Font.Name           := sFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo3')).Font.Size           := iSizeFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo3')).Font.Style          := [fsBold];
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo3')).Height              := iHeigth;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo3')).Left                := iLeftLine+0.05;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo3')).Top                 := 0.10;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo3')).Width               := 1.90;

    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo4')).Font.Name           := sFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo4')).Font.Size           := iSizeFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo4')).Font.Style          := [fsBold];
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo4')).Height              := iHeigth;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo4')).Left                := iLeftLine+0.05;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo4')).Top                 := 0.50;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo4')).Width               := 1.90;

    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit01')).Font.Name         := sFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit01')).Font.Size         := iSizeFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit01')).Font.Style        := [fsBold];
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit01')).Height            := iHeigth;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit01')).Left              := iLeftLine+0.05;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit01')).Top               := 0.90;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit01')).Width             := 1.90;

    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit02')).Font.Name         := sFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit02')).Font.Size         := iSizeFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit02')).Font.Style        := [fsBold];
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit02')).Height            := iHeigth;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit02')).Left              := iLeftLine+0.05;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit02')).Top               := 1.30;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit02')).Width             := 1.90;

    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit03')).Font.Name         := sFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit03')).Font.Size         := iSizeFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit03')).Font.Style        := [fsBold];
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit03')).Height            := iHeigth;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit03')).Left              := iLeftLine+0.05;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit03')).Top               := 1.70;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbTit03')).Width             := 1.90;

    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo2')).Font.Name     := sFonte;
    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo2')).Font.Size     := iSizeFonte;
//    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo2')).Height        := iHeigth;
//    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo2')).Left          := iLeftLine+2.00;
//    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo2')).Top           := 0.10;
//    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo2')).Width         := 1.85;

    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo3')).Font.Name     := sFonte;
    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo3')).Font.Size     := iSizeFonte;
//    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo3')).Height        := iHeigth;
//    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo3')).Left          := iLeftLine+3.90;
//    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo3')).Top           := 0.10;
//    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo3')).Width         := 1.80;

    TfrxMemoView(TfrxReport(Sender).FindComponent('lblUsuario')).Font.Name      := sFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblUsuario')).Font.Size      := iSizeFonte;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblUsuario')).Height         := iHeigth;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblUsuario')).Left           := iLeftLine+2.00;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblUsuario')).Top            := 0.50;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lblUsuario')).Width          := 3.70;

    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild01')).Font.Name        := sFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild01')).Font.Size        := iSizeFonte;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild01')).Height           := iHeigth;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild01')).Left             := iLeftLine+2.00;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild01')).Top              := 0.90;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild01')).Width            := 3.70;

    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild02')).Font.Name        := sFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild02')).Font.Size        := iSizeFonte;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild02')).Height           := iHeigth;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild02')).Left             := iLeftLine+2.00;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild02')).Top              := 1.30;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild02')).Width            := 3.70;

    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild03')).Font.Name        := sFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild03')).Font.Size        := iSizeFonte;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild03')).Height           := iHeigth;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild03')).Left             := iLeftLine+2.00;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild03')).Top              := 1.70;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('lbFild03')).Width            := 3.70;

    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo1')).Font.Name           := sFonte;
    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo1')).Font.Size           := iSizeFonte;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo1')).Height              := iHeigth;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo1')).Left                := 0.10;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo1')).Top                 := 0.0;
//    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo1')).Width               := 4;
    TfrxMemoView(TfrxReport(Sender).FindComponent('Memo1')).Text                := 'www.arsistemaseconsultoria.com.br';

    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo1')).Font.Name     := sFonte;
    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo1')).Font.Size     := iSizeFonte;
//    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo1')).Left          := 15.30;
//    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo1')).Top           := 0;
//    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo1')).Width         := 3.70;
//    TfrxSysMemoView(TfrxReport(Sender).FindComponent('SysMemo1')).HAlign        := haRight;

    TfrxPageFooter(TfrxReport(Sender).FindComponent('PageFooter1')).Height      := 0.40;

    TfrxPictureView(TfrxReport(Sender).FindComponent('imgLogo')).Picture.LoadFromFile(ExtractFileDir(ParamStr(0))+'\imgLogo.bmp');
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblFantasia')).Text          := funcBasico.Empr_Fantasia;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblEndereco')).Text          := 'End......: '+funcBasico.Empr_Endereco + ' - ' +
                                                                                funcBasico.Empr_Bairro   + ' - ' +
                                                                                funcBasico.Empr_Cidade   + ' - ' +
                                                                                funcBasico.Empr_UF;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblRazao_Social')).Text      := 'CNPJ...: ' + funcBasico.Empr_CNPJ +
                                                                                ' - Insc. Est.: ' + funcBasico.Empr_IE;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblTelefone')).Text          := 'Fone(s): ' +
                                                                                funcBasico.Empr_Telefone + '/' +
                                                                                funcBasico.Empr_Fax;
    TfrxMemoView(TfrxReport(Sender).FindComponent('lblUsuario')).Text           := funcBasico.User_Login;
  except
  end;
end;

procedure TfBasico.SetCaptionRotina;
var
  qryCons : TSQLQuery;
  imgTMP  : TStream;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      MENU_CODIGO,');
        sql.Add('      MENU_DESCRICAO,');
        sql.Add('      MENU_IMAGE1');
        sql.Add('FROM  MENU');
        sql.Add('WHERE MENU_CLASSE_FORM_BPL = ' + QuotedStr(Self.ClassName));
        Open;
      end;
      Label1.Caption := Trim(qryCons.Fields[0].AsString + ' - ' + qryCons.Fields[1].AsString);
      try
        imgTMP := qryCons.CreateBlobStream((qryCons.Fields[2] as TBlobField),bmRead);
        if imgTMP.Size > 0 then begin
          imgRotina.Picture.Icon.LoadFromStream(imgTMP);
        end;
      except
      end;
    except on e: exception do
      funcBasico.ReportaErro(Caption,'SetCaptionRotina',e.Message);
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfBasico.CarregaVersion;
var
  strAux : String;
begin
  strAux := IntToStr(Self.Tag);
  lbVersion.Caption := Copy(strAux,1,1) + '.' + Copy(strAux,2,1) + '.' + Copy(strAux,3,1) + '.' + Copy(strAux,4,3);
  lbVersion.Visible := true;
end;

procedure TfBasico.DbEditChange(Sender: TObject);
var
  intPosicao : Integer;
begin
  if (Sender is TDBEdit) then begin
    intPosicao := TDbEdit(Sender).SelStart;
    TDbEdit(Sender).Text     := funcBasico.EliminaCaracter(TDbEdit(Sender).Text);
    TDbEdit(Sender).SelStart := intPosicao;
  end;
end;

procedure TfBasico.KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  btnTMP : TSpeedButton;
  strTMP : String;
begin
  try
    if ((Shift = [ssAlt]) and (key = 40)) or (key = VK_F5) then begin
      try
        strTMP := funcBasico.Buscar_Coluna((Sender as TDBEdit).ImeName,1);
        btnTMP := TSpeedButton(Self.FindComponent(strTMP));
      except
        strTMP := funcBasico.Buscar_Coluna((Sender as TEdit).ImeName,1);
        btnTMP := TSpeedButton(Self.FindComponent(strTMP));
      end;
      btnTMP.Click;
    end;
    if (Shift = [ssAlt]) and (key = 45) then begin
      try
        strTMP := funcBasico.Buscar_Coluna((Sender as TDBEdit).ImeName,2);
        btnTMP := TSpeedButton(Self.FindComponent(strTMP));
      except
        strTMP := funcBasico.Buscar_Coluna((Sender as TEdit).ImeName,2);
        btnTMP := TSpeedButton(Self.FindComponent(strTMP));
      end;
      btnTMP.Click;
    end;
  except
  end;
end;

procedure TfBasico.BuscaPermissoes(classTMP : String);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      M.MENU_ID');
        sql.Add('FROM  MENU M');
        sql.Add('INNER JOIN USUARIO_M U');
        sql.Add('ON (M.MENU_ID = U.USRM_MENU_ID)');
        sql.Add('WHERE M.MENU_GENE_EMPR_ID_TP = 0');
        sql.Add('AND   M.MENU_GENE_TGEN_ID_TP = 1');
        sql.Add('AND   M.MENU_GENE_ID_TP      = 1');
        sql.Add('AND   M.MENU_CLASSE_FORM_BPL = ' + QuotedStr(classTMP));
        sql.Add('AND   U.USRM_USER_ID         = ' + IntToStr(funcBasico.User_ID));
        sql.Add('AND   U.USRM_EMPR_ID         = ' + IntToStr(funcBasico.Empr_ID));
        Open;
        if not IsEmpty then begin
          AtribuiPermissoes(qryCons.Fields[0].AsString);
        end;
      end;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'BuscaPermissoes',e.Message);
      funcBasico.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfBasico.AtribuiPermissoes(strMenu_ID : String);
var
  qryCons : TSQLQuery;
  strCMD  : String;
  btnExec : TSpeedButton;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      M.MENU_CLASSE_FORM_BPL');
        sql.Add('FROM  MENU M');
        sql.Add('INNER JOIN USUARIO_M U');
        sql.Add('ON (M.MENU_ID = U.USRM_MENU_ID)');
        sql.Add('WHERE M.MENU_GENE_EMPR_ID_TP = 0');
        sql.Add('AND   M.MENU_GENE_TGEN_ID_TP = 1');
        sql.Add('AND   M.MENU_GENE_ID_TP      = 1');
        sql.Add('AND   M.MENU_MENU_ID         = ' + strMenu_ID);
        sql.Add('AND  (M.MENU_NOME_BPL        IS NULL');
        sql.Add('OR    M.MENU_NOME_BPL        = ' + QuotedStr(''));
        sql.Add('OR    M.MENU_NOME_BPL        = ' + QuotedStr('Null')+')');
        sql.Add('AND   U.USRM_USER_ID         = ' + IntToStr(funcBasico.User_ID));
        sql.Add('AND   U.USRM_EMPR_ID         = ' + IntToStr(funcBasico.Empr_ID));
//        ShowMessage(qryCons.Text);
        Open;
        if not IsEmpty then begin
          while not eof do begin
            strCMD := qryCons.Fields[0].AsString;
            if (Self.FindComponent(strCMD) is TSpeedButton) then begin
              btnExec := (Self.FindComponent(strCMD) as TSpeedButton);
              if btnExec <> nil then
                btnExec.Enabled := true;
            end;
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'BuscaPermissoes',e.Message);
      funcBasico.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfBasico.grdBasicoDblClick(Sender: TObject);
begin
  btnEditar.Click;
end;

procedure TfBasico.grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  try
    If odd(grdBasico.DataSource.DataSet.RecNo) then begin
      grdBasico.Canvas.Font.Color  := clBlack;
      grdBasico.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      grdBasico.Canvas.Font.Color  := clBlack;
      grdBasico.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      grdBasico.Canvas.Brush.Color := clSilver;
      grdBasico.Canvas.Font.Style  := [fsBold];
    end;
     grdBasico.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
end;

procedure TfBasico.grdBasicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  btnTMPFlat : TSpeedButton;
begin
  try
    if (Shift = [ssAlt]) and (key = 40) then begin
      btnTMPFlat := TSpeedButton(Self.FindComponent('btnFlat'));
      if Assigned(btnTMPFlat) then begin
        btnTMPFlat.Top := 0;
        btnTMPFlat.Height:=24;
        btnTMPFlat.Click;
      end;
    end;
  except
  end;
end;

procedure TfBasico.Filtrarporestevalor1Click(Sender: TObject);
begin
  FiltrarRegistrosPorValor(grdBasico,cdsGeral,(Sender as TMenuItem).Tag)
end;

procedure TfBasico.FiltrarRegistrosPorValor(grdTMP : TDBGrid; cdsTMP : TClientDataSet;
  intTipo : Integer = 1);
var
  xsValor: string;
  xsCampo: String;
begin
  try
    case intTipo of
      1 : begin ///Filtra os registros
        if (grdTMP.SelectedField.DataType in [ftMemo, ftBlob, ftGraphic]) or
          (grdTMP.SelectedField.FieldKind = fkCalculated) then begin
          Application.MessageBox('Não é possível filtrar por este campo', 'Erro', MB_ICONINFORMATION+MB_OK);
          Exit;
        end;
        xsCampo := grdTMP.SelectedField.FieldName;
        case grdTMP.SelectedField.DataType of
          ftString   : xsValor := QuotedStr(cdsTMP.FieldByName(xsCampo).AsString);
          ftInteger,
          ftFloat,
          ftCurrency,
          ftSmallint : xsValor := cdsTMP.FieldByName(xsCampo).AsString;
          ftDate,
          ftDateTime,
          ftTimeStamp: xsValor := QuotedStr(FormatDateTime('dd/mm/yy hh:nn:ss',
                                                           cdsTMP.FieldByName(xsCampo).AsDateTime));
          ftBoolean  : begin
            if cdsTMP.FieldByName(xsCampo).AsBoolean then
              xsValor    := IntToStr(1)
            else xsValor := IntToStr(0);
          end;
        end;
        cdsTMP.Filter   := grdTMP.SelectedField.FieldName + ' = ' + xsValor;
        cdsTMP.Filtered := true;
      end;
      2 : begin ///Limpa o filtro de pesquisa.
        cdsTMP.Filtered := false;
        cdsTMP.Filter   := '';
      end;
    end;
  except
    funcBasico.Alerta('Não foi possível realizar a filtragem pelo parâmetros passado.',0);
  end;
end;

procedure TfBasico.grdBasicoTitleClick(Column: TColumn);
begin
  try
    cdsGeral.IndexFieldNames := Column.FieldName; 
  except
  end;
end;

end.
