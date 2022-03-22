unit ufLocaliza;

interface

uses
  Data.DB, Vcl.ImgList, Vcl.Controls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.Classes, Vcl.Forms, Winapi.Windows,
  Funcoes, Datasnap.DBClient;

type
  ObjCampo = Class
    Name     : String;
    DataType : TFieldType;
  end;

type
  TfLocaliza = class(TForm)
    GroupBox1: TGroupBox;
    edtPesq: TEdit;
    Panel1: TPanel;
    dsLocal: TDataSource;
    GroupBox2: TGroupBox;
    grdBasico: TDBGrid;
    Label1: TLabel;
    BalloonHint: TBalloonHint;
    imgButtons_24_x_24: TImageList;
    btnOK: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure ckContenhaClick(Sender: TObject);
    procedure edtPesqKeyPress(Sender: TObject; var Key: Char);
    procedure grdBasicoKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure grdBasicoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPesqChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    funcLocal : TFuncoes;
    procedure PreparaDBGrid(Grid: TDBgrid);
    function Contar_Colunas(Texto: String): Integer;
    function Buscar_Coluna(Texto: String; Coluna: Integer): String;
    procedure OrdenarClientDataSet(Field: TField; ClientDS: TClientDataSet;
      OrdemInversa: boolean = false);
    procedure SetarIndice(ClientDS: TClientDataSet; Colunas: string;
      Nome: string = ''; OrdemInversa: boolean = false);
    { Private declarations }
  public
    cdsLocal      : TClientDataSet;
    strCampo,
    strResult,
    ChaveBusca,
    CamposRetorno : String;
  end;

var
  fLocaliza: TfLocaliza;

implementation

uses
  System.IniFiles, System.SysUtils, Vcl.Graphics;

{$R *.dfm}

procedure TfLocaliza.btnCancelarClick(Sender: TObject);
begin
  cdsLocal.Filtered := false;
  Self.Close;
end;

procedure TfLocaliza.btnOKClick(Sender: TObject);
var
  intI ,
  intContCol : integer;
begin
  strResult := '';
  if not cdsLocal.IsEmpty then begin
    intContCol  := Contar_Colunas(CamposRetorno);
    for intI    := 1 to intContCol do begin
      strResult := strResult + cdsLocal.FieldByName(Buscar_Coluna(CamposRetorno,intI)).Text + ';';
    end;
    if strResult <> '' then
      Delete(strResult,length(strResult),1);
  end;
  Self.Close;
end;

function TfLocaliza.Buscar_Coluna(Texto: String; Coluna: Integer) : String;
var
  Posicao: Integer;
begin
  Texto := Texto + ';';
  for Posicao := 1 to Coluna do begin
    Result := Copy(Texto,1,Pos(';',Texto) - 1);
    Texto  := Copy(Texto,Pos(';',Texto) + 1,Length(Texto));
  end;
end;

function TfLocaliza.Contar_Colunas(Texto : String) : Integer;
var
  intCont ,
  intI    : Integer;
begin
  intCont  := 0;
  Texto    := Texto + ';';
  for intI := 1 to length(Texto) do begin
    if Texto[intI] = ';' then
      inc(intCont);
  end;
  result := intCont;
end;

procedure TfLocaliza.ckContenhaClick(Sender: TObject);
begin
  edtPesq.SetFocus;
end;

procedure TfLocaliza.edtPesqChange(Sender: TObject);
begin
  with cdsLocal do begin
    Filtered := false;
    Filter   := funcLocal.GerarFilter(cdsLocal,edtPesq.Text);
    Filtered := true;
  end;
end;

procedure TfLocaliza.edtPesqKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    btnCancelar.Click;
    key := #0;
  end;
  if key = #13 then begin
    grdBasico.SetFocus;
    key := #0;
  end;
end;

procedure TfLocaliza.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  iniTMP : TIniFile;
  intI   : Integer;
begin
  try
    if cdsLocal <> nil then begin
      if grdBasico.Columns.Count > 0 then begin
        try
          iniTMP   := TIniFile.Create(ExtractFilePath(Application.ExeName)+'SearchSystem_'+IntToStr(funcLocal.User_ID)+'.ini');
          for intI := 0 to grdBasico.Columns.Count - 1 do begin
            iniTMP.WriteInteger('LOCALIZAR',UpperCase(grdBasico.Columns[intI].FieldName),grdBasico.Columns[intI].Width);
          end;
        finally
          FreeAndNil(iniTMP);
        end;
      end;
    end;
  except
  end;
end;

procedure TfLocaliza.FormCreate(Sender: TObject);
var
  formPrinc : TForm;
begin
  formPrinc := Application.MainForm;
  funcLocal := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
end;

procedure TfLocaliza.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (key = 70) then begin
    if edtPesq.CanFocus then
      edtPesq.SetFocus;
  end;
end;

procedure TfLocaliza.FormShow(Sender: TObject);
var
  intI,
  intTam     : Integer;
  iniTMP     : TIniFile;
begin
  dsLocal.DataSet   := cdsLocal;
  cdsLocal.Open;
  cdsLocal.Filtered := false;
  cdsLocal.Filter   := '';
  cdsLocal.Filtered := true;
  PreparaDbGrid(grdBasico);
  edtPesq.SetFocus;
  edtPesq.Text := funcLocal.VlrPesq;
  edtPesqChange(Sender);
  try
    if FileExists(ExtractFilePath(Application.ExeName)+'SearchSystem_'+IntToStr(funcLocal.User_ID)+'.ini') then begin
      try
        iniTMP   := TIniFile.Create(ExtractFilePath(Application.ExeName)+'SearchSystem_'+IntToStr(funcLocal.User_ID)+'.ini');
        for intI := 0 to grdBasico.Columns.Count - 1 do begin
          grdBasico.Columns[intI].Width := 100;
          intTam := iniTMP.ReadInteger('LOCALIZAR',UpperCase(grdBasico.Columns[intI].FieldName),0);
          if intTam > 0 then grdBasico.Columns[intI].Width := intTam;
        end;
      finally
        FreeAndNil(iniTMP);
      end;
    end else begin
      for intI := 0 to grdBasico.Columns.Count - 1 do begin
        grdBasico.Columns[intI].Width := 100
      end;
    end;
  except
  end;
  try
    edtPesq.SelStart := Length(edtPesq.Text);
  except
  end;
end;

procedure TfLocaliza.PreparaDBGrid(Grid : TDBgrid);
var
  intI          : integer;
  ColunaTitulo  : TColumnTitle;
  Coluna        : TColumn;
  Campo         : TField;
  tmpCampo      : ObjCampo;
begin
  try
    try
      dsLocal.DataSet := cdsLocal;
      grdBasico.Columns.Clear;
      for intI  := 0 to cdsLocal.Fields.Count - 1 do begin
        Campo   := cdsLocal.Fields[intI];
        if Campo.Visible then begin
          Coluna                := TColumn.Create(grid.Columns);
          ColunaTitulo          := TColumnTitle.Create(Coluna);
          Coluna.Field          := Campo;
          Coluna.DisplayName    := Campo.DisplayText;
          Coluna.Width          := Campo.DisplayWidth;
          ColunaTitulo.Caption  := Campo.DisplayLabel;
          Coluna.Title          := ColunaTitulo;
          tmpCampo              := ObjCampo.Create;
          tmpCampo.Name         := Campo.FieldName;
          tmpCampo.DataType     := Campo.DataType;
        end;
      end;
    except
    end;
  finally
  end;
end;

procedure TfLocaliza.grdBasicoDblClick(Sender: TObject);
begin
  btnOK.Click;
end;

procedure TfLocaliza.grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
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
end;

procedure TfLocaliza.grdBasicoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    btnCancelar.Click;
    key := #0;
  end;
  if key = #13 then begin
    btnOK.Click;
    key := #0;
  end;
end;

procedure TfLocaliza.grdBasicoTitleClick(Column: TColumn);
//var
//  intPoint: Pointer;
begin
  try
    cdsLocal.IndexFieldNames := Column.FieldName;
  except
  end;
//
//  intPoint := grdBasico.DataSource.DataSet.GetBookmark;
//  OrdenarClientDataSet(Column.Field,cdsLocal);
//  grdBasico.DataSource.DataSet.GotoBookmark(intPoint);
end;

procedure TfLocaliza.OrdenarClientDataSet(Field: TField; ClientDS: TClientDataSet;
  OrdemInversa: boolean = false);
begin
  if Field = nil then Exit;
  if (Field.FieldKind in [fkCalculated, fkLookup]) then Exit;
  SetarIndice(ClientDS, Field.FieldName, '', OrdemInversa);
end;

procedure TfLocaliza.SetarIndice(ClientDS: TClientDataSet; Colunas: string;
  Nome: string = ''; OrdemInversa: boolean = false);
var
  strColumn   : String;
  intX        : integer;
  IdxOptions  : TIndexOptions;
begin
  strColumn := 'DEFAULT_ORDER';
  IdxOptions := [];
  if Nome = '' then Nome := Colunas;
  // O índice já está em uso, então classificar ao contrário
  if (Nome = ClientDS.IndexName) or OrdemInversa then
    IdxOptions := [ixDescending];
  // Verifica a existência do índice
  ClientDS.IndexDefs.Update;
  for intX := 0 to ClientDS.IndexDefs.Count - 1 do begin
    if ClientDS.IndexDefs.Items[intX].Name = Nome then
      strColumn := Nome;
  end;
  // Se não encontrou o índice...
  if (strColumn = 'DEFAULT_ORDER') or (IdxOptions <> []) then begin
    try
      if (IdxOptions <> []) or OrdemInversa then
        Nome := Nome + '_Desc_';//descending
      ClientDS.AddIndex(Nome, Colunas, IdxOptions, '', '', 0);
    finally
      strColumn := Colunas;
    end;
  end;
  ClientDS.IndexName := Nome;
end;

end.
