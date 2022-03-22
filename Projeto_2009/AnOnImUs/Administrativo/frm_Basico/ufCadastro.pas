unit ufCadastro;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.Buttons, Vcl.Controls, Vcl.ExtCtrls, Data.DB,
  Vcl.ComCtrls, System.Classes, Funcoes, DataSnap.DBClient, Vcl.Graphics, Vcl.DBCtrls,
  RxToolEdit, RxCurrEdit, UrlMon;

const
  strHint    = 'Utilize ( Alt + Seta p/ Baixo para pesquisar ) ou ( Alt + Insert ) para inserir novo registro';

type
  TfCadastro = class(TForm)
    pageCadastro: TPageControl;
    tabCadastro: TTabSheet;
    Panel1: TPanel;
    btnHelp: TSpeedButton;
    btnOK: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSetFocus: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    procedure AjusteTela;
    procedure KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DbEditChange(Sender: TObject);
    procedure BuscaValorFrames;
  public
    funcLocal : TFuncoes;
    cdsLocal  : TClientDataSet;
    procedure CloseClientDataSet(dmDataModule: TDataModule; strTabela: String);
    procedure SaveClientDataSet(dmDataModule: TDataModule; strTabela: String);
    procedure BacktoDefaultWindows;
    function  IsValidData: Boolean;
  end;

var
  fCadastro: TfCadastro;
  fCorAlerta : TColor = $00B7FFFF;

implementation

uses
  System.SysUtils, Winapi.Messages, Vcl.DBGrids, Winapi.Windows,
  uFrPesqIndividual;

{$R *.dfm}
{$WARN SYMBOL_DEPRECATED OFF}

procedure TfCadastro.FormCreate(Sender: TObject);
var
  intI      : Integer;
  formPrinc : TForm;
begin
  try
    formPrinc := Application.MainForm;
    funcLocal := TFuncoes(formPrinc.FindComponent('funcBasico'));
    for intI := 0 to ComponentCount - 1 do begin
      if (Components[intI] is TEdit) then begin
        if (Components[intI] as TEdit).Tag <> 1 then
          (Components[intI] as TEdit).CharCase := ecUpperCase;
      end;
      if (Components[intI] is TDBEdit) then begin
        if (Components[intI] as TDBEdit).Tag <> 1 then begin
          (Components[intI] as TDBEdit).CharCase := ecUpperCase;
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
  except on e: exception do
    funcLocal.ReportaErro(Caption,(Sender as TComponent).Name,e.Message);
  end;
  try
    pageCadastro.Pages[0].Show;
  except
  end;
end;

procedure TfCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    if not (ActiveControl is TDBMemo) then begin
      if not (ActiveControl is TDBGrid) then begin
        key := #0;
        Perform(WM_NEXTDLGCTL,0,0);
      end else if (ActiveControl is TDBGrid) then begin
        with TDBGrid(ActiveControl) do begin
          if SelectedIndex < (FieldCount - 1) then begin
            SelectedIndex := SelectedIndex + 1
          end else begin
            SelectedIndex := 0
          end;
        end;
      end;
    end;
    key := #0;
  end;
  if key = #27 then begin
    btnCancelar.Click;
    key := #0;
  end;
end;

procedure TfCadastro.FormShow(Sender: TObject);
var
  intI : Integer;
begin
  pageCadastro.Pages[0].Show;
  AjusteTela;
  BacktoDefaultWindows;
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
          (Components[intI] as TEdit).OnKeyDown   := keyDown;
        end;
      end;
    end;
    if (Components[intI] is TPanel) then begin
      if (Components[intI] as TPanel).Tag <> 99 then begin
        (Components[intI] as TPanel).ParentBackground := true;
        (Components[intI] as TPanel).ParentColor      := true;
      end;
    end;
  end;
  try
    for intI := 0 to cdsLocal.FieldCount -1 do begin
      if (Pos('FONE',cdsLocal.Fields[intI].FieldName) > 0) or
         (Pos('FAX',cdsLocal.Fields[intI].FieldName) > 0) then begin
        cdsLocal.Fields[intI].EditMask := '(##)##########';
      end;
    end;
  except
  end;
  IsValidData;
end;

procedure TfCadastro.DbEditChange(Sender: TObject);
var
  intPosicao : Integer;
begin
  if (Sender is TDBEdit) then begin
    intPosicao                := TDbEdit(Sender).SelStart;
    TDbEdit(Sender).Text      := funcLocal.EliminaCaracter(TDbEdit(Sender).Text);
    TDbEdit(Sender).SelStart  := intPosicao;
  end;
end;

procedure TfCadastro.KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  btnTMP : TSpeedButton;
  strTMP : String;
begin
  try
    if ((Shift = [ssAlt]) and (key = 40)) or (key = VK_F5) then begin
      try
        strTMP := funcLocal.Buscar_Coluna((Sender as TDBEdit).ImeName,1);
        btnTMP := TSpeedButton(Self.FindComponent(strTMP));
      except
        strTMP := funcLocal.Buscar_Coluna((Sender as TEdit).ImeName,1);
        btnTMP := TSpeedButton(Self.FindComponent(strTMP));
      end;
      btnTMP.Click;
    end;
    if (Shift = [ssAlt]) and (key = 45) then begin
      try
        strTMP := funcLocal.Buscar_Coluna((Sender as TDBEdit).ImeName,2);
        btnTMP := TSpeedButton(Self.FindComponent(strTMP));
      except
        strTMP := funcLocal.Buscar_Coluna((Sender as TEdit).ImeName,2);
        btnTMP := TSpeedButton(Self.FindComponent(strTMP));
      end;
      btnTMP.Click;
    end;
  except
  end;
end;

procedure TfCadastro.BacktoDefaultWindows;
var
  intI       : integer;
  Componente : TWinControl;
  clField    : TColor;
begin
  clField      := clWhite;
  for intI     := 0 to Self.ComponentCount - 1 do begin
    Componente := TWinControl(Self.Components[intI]);
    if (Componente is TEdit) then begin
      if TEdit(Componente).Color <> clGradientInactiveCaption then begin
        TEdit(Componente).Color    := clField;
      end;
      if TEdit(Componente).ImeName <> '' then begin
        TEdit(Componente).Hint     := strHint;
        TEdit(Componente).ShowHint := true;
      end;
    end;
    if (Componente is TDBEdit) then begin
      if TDBEdit(Componente).Color <> clGradientInactiveCaption then begin
        TDBEdit(Componente).Color := clField;
      end;
      if TDBEdit(Componente).ImeName <> '' then begin
        TDBEdit(Componente).Hint     := strHint;
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
  end;
end;

function TfCadastro.IsValidData : Boolean;
var
  intI     : Integer;
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
      or (Comp is TCustomEdit)     or (Comp is TRxCalcEdit) then begin
        if (Comp.HelpContext = 1) and
           ((Trim(TCustomEdit(Comp).Text) = '')      or
            (Trim(TCustomEdit(Comp).Text)  = '//')   or
            (Trim(TCustomEdit(Comp).Text) = '()-')   or
            (Trim(TCustomEdit(Comp).Text)  = '..-')  or
            (Trim(TCustomEdit(Comp).Text)  = '../-') or
            (Trim(TCustomEdit(Comp).Text)  = '.-'))  then begin
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

procedure TfCadastro.AjusteTela;
begin
  with Self.Constraints do begin
    MaxHeight := Height;
    MaxWidth  := Width;
    MinHeight := Height;
    MinWidth  := Width;
  end;
end;

procedure TfCadastro.btnCancelarClick(Sender: TObject);
begin
  try
    cdsLocal.CancelUpdates;
    Self.Close;
  except on e: exception do begin
    funcLocal.ReportaErro(Caption,(Sender as TComponent).Name,e.Message);
    funcLocal.Alerta(e.Message,1);
  end; end;
end;

procedure TfCadastro.btnHelpClick(Sender: TObject);
var
  strLink : String;
  strTMP  : PWideChar;
begin
  try
    strLink := 'http://www.anonimus.info/'+Self.Name+'.php' + funcLocal.Se(funcLocal.Privado,'?ID=1','');
    strTMP  := StringToOleStr(strLink);
    HlinkNavigateString(nil,strTMP);
  except on e: exception do begin
    funcLocal.ReportaErro(Caption,'btnHelpClick',e.Message);
    funcLocal.Alerta('Erro ao tentar executar o navegador padrão.'+#13+'['+e.Message+']',1)
  end; end;
end;

procedure TfCadastro.btnOkClick(Sender: TObject);
begin
  try
    try
      if btnSetFocus.CanFocus then
        btnSetFocus.SetFocus;
    except
    end;
    BuscaValorFrames;
    if cdsLocal.State = dsInsert then begin
      cdsLocal.Post;
      cdsLocal.ApplyUpdates(-1);
      cdsLocal.Insert;
    end else begin
      cdsLocal.ApplyUpdates(-1);
      Close;
    end;
    try
      pageCadastro.Pages[0].Show;
    except
    end;
  except on e: exception do begin
    funcLocal.ReportaErro(Caption,(Sender as TComponent).Name,e.Message);
    funcLocal.Alerta(e.Message,1);
    cdsLocal.CancelUpdates;
    Abort;
  end; end;
  IsValidData;
end;

procedure TfCadastro.BuscaValorFrames;
var
  intI  : Integer;
  frTMP : TFrame;
begin
  intI :=0;
  try
    try
      for intI := 0 to Self.ComponentCount -1 do begin
        if (Components[intI] is TfrPesqIndividual) then begin
          if TfrPesqIndividual(Components[intI] as TfrPesqIndividual).cdsLocal <> nil then begin

            TfrPesqIndividual(Components[intI] as TfrPesqIndividual).cdsLocal.FieldByName(TfrPesqIndividual(Components[intI] as TfrPesqIndividual).cdsField1).AsString   :=
            TfrPesqIndividual(Components[intI] as TfrPesqIndividual).cdsLocal.FieldByName(TfrPesqIndividual(Components[intI] as TfrPesqIndividual).cdsField1).AsString;

            if TfrPesqIndividual(Components[intI] as TfrPesqIndividual).cdsField2 <> '' then begin
              TfrPesqIndividual(Components[intI] as TfrPesqIndividual).cdsLocal.FieldByName(TfrPesqIndividual(Components[intI] as TfrPesqIndividual).cdsField2).AsString   :=
              TfrPesqIndividual(Components[intI] as TfrPesqIndividual).cdsLocal.FieldByName(TfrPesqIndividual(Components[intI] as TfrPesqIndividual).cdsField2).AsString;
            end;

            if TfrPesqIndividual(Components[intI] as TfrPesqIndividual).cdsField3 <> '' then begin
              TfrPesqIndividual(Components[intI] as TfrPesqIndividual).cdsLocal.FieldByName(TfrPesqIndividual(Components[intI] as TfrPesqIndividual).cdsField3).AsString :=
              TfrPesqIndividual(Components[intI] as TfrPesqIndividual).cdsLocal.FieldByName(TfrPesqIndividual(Components[intI] as TfrPesqIndividual).cdsField3).AsString;
            end;
          end;
        end;
      end;
    except on e: exception do begin
      funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                       'Erro na atribuição de valores dos FRAMES!',1);
      funcLocal.ReportaErro(Self.Name,TfrPesqIndividual(Components[intI] as TfrPesqIndividual).Name,e.Message);
    end; end;
  finally
    FreeAndNil(frTMP);
  end;
end;

procedure TfCadastro.CloseClientDataSet(dmDataModule : TDataModule; strTabela : String);
var
  intI : Integer;
begin
  try
    with dmDataModule do begin
      for intI := 0 to ComponentCount - 1 do begin
        if (Components[intI] is TClientDataSet) then begin
          if (Components[intI] as TClientDataSet).Active then begin
            if (Components[intI] as TClientDataSet).Name <> strTabela then begin
              (Components[intI] as TClientDataSet).Close;
            end;
          end;
        end;
      end;
    end;
  except on e: exception do begin
    funcLocal.ReportaErro(Caption,'procedure TfCadastro.CloseClientDataSet',e.Message);
    funcLocal.Alerta(e.Message,1);
  end; end;
end;

procedure TfCadastro.SaveClientDataSet(dmDataModule : TDataModule; strTabela : String);
var
  intI : Integer;
begin
  try
    with dmDataModule do begin
      for intI := 0 to ComponentCount - 1 do begin
        if (Components[intI] is TClientDataSet) then begin
          if (Components[intI] as TClientDataSet).Active then begin
            if (Components[intI] as TClientDataSet).Name <> strTabela then begin
              (Components[intI] as TClientDataSet).ApplyUpdates(-1);
            end;
          end;
        end;
      end;
    end;
  except on e: exception do begin
    funcLocal.ReportaErro(Caption,'procedure TfCadastro.SaveClientDataSet',e.Message);
    funcLocal.Alerta(e.Message,1);
  end; end;
end;

end.
