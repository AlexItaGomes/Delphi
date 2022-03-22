unit ufCadPatrimonio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, DBCtrls,
  rxToolEdit, rxCurrEdit, RXDBCtrl, uFrPesqIndividual, UrlMon, ExtDlgs, JPEG;

type
  TfCadPatrimonio = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtPatrimonio: TDBEdit;
    RxDBCalcEdit1: TRxDBCalcEdit;
    Label4: TLabel;
    DBDateEdit1: TDBDateEdit;
    frPesqPatrimonio: TfrPesqIndividual;
    frPesqFornecedor: TfrPesqIndividual;
    GroupBox1: TGroupBox;
    frPesqCliente: TfrPesqIndividual;
    edtDtVenda: TDBDateEdit;
    edtVlrVenda: TRxDBCalcEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    DBRichEdit1: TDBRichEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    edtDtCompra: TDBDateEdit;
    edtNrNF: TRxDBCalcEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    OpenPictureDialog: TOpenPictureDialog;
    GroupBox3: TGroupBox;
    DBImage1: TDBImage;
    btnPesquisar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure DBImage1DblClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure frPesqPatrimonioedtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure frPesqPatrimonioedtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure frPesqFornecedoredtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure frPesqFornecedoredtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure frPesqClienteedtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure frPesqClienteedtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure frPesqPatrimonioedtCodigoExit(Sender: TObject);
    procedure frPesqFornecedoredtCodigoExit(Sender: TObject);
    procedure frPesqClienteedtCodigoExit(Sender: TObject);
  private
    function ValidaDados: Boolean;
    procedure SetaValoresFrames;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadPatrimonio: TfCadPatrimonio;

implementation

uses udmPatrimonio, DB, ufCadVisualizaNF;

{$R *.dfm}

procedure TfCadPatrimonio.btnOKClick(Sender: TObject);
begin
  if funcLocal.EmpresasBloqueada() then Exit;
  if ValidaDados then begin
    inherited;
    SetaValoresFrames;
    if edtDtCompra.CanFocus then
      edtDtCompra.SetFocus;
  end;
end;

function TfCadPatrimonio.ValidaDados : Boolean;
begin
  Result := true;
  if edtDtCompra.Date <= 0 then begin
    funcLocal.Alerta('Informe a Data de Compra do patrimonio antes de continuar!',0);
    edtDtCompra.SetFocus;
    Result := false;
    Exit;
  end;
  if edtPatrimonio.Text = '' then begin
    funcLocal.Alerta('Informe a descrição do patrimonio antes de continuar!',0);
    edtPatrimonio.SetFocus;
    Result := false;
    Exit;
  end;
  if ((frPesqCliente.TemRegistro()) or (edtDtVenda.Date > 0) or (edtVlrVenda.Value > 0)) and
     ((not frPesqCliente.TemRegistro()) or (edtDtVenda.Date <= 0) or (edtVlrVenda.Value <= 0)) then begin
    funcLocal.Alerta('Necessário informar todos os dados da venda antes de continuar!',0);
    frPesqCliente.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfCadPatrimonio.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  fCadVisualizaNF.ShowModal;
end;

procedure TfCadPatrimonio.DBImage1DblClick(Sender: TObject);
var
  imgLogo : TBitmap;
  imgJPEG : TJPEGImage;
begin
  try
    imgLogo := TBitmap.Create;
    imgJPEG := TJPEGImage.Create;
    if OpenPictureDialog.Execute then begin
      try
        imgLogo.LoadFromFile(OpenPictureDialog.FileName);
        cdsLocal.FieldByName('PATR_FOTO_NF').Assign(imgLogo);
      except
        imgJPEG.LoadFromFile(OpenPictureDialog.FileName);
        imgLogo.Assign(imgJPEG);
        cdsLocal.FieldByName('PATR_FOTO_NF').Assign(imgLogo);
      end;
    end;
  except on e: exception do begin
    funcLocal.ReportaErro(Caption,(Sender as TComponent).Name,funcLocal.User_Login,e.Message);
    funcLocal.Alerta(e.Message,1);
  end; end;
end;

procedure TfCadPatrimonio.FormShow(Sender: TObject);
begin
  inherited;
  SetaValoresFrames;
  if edtDtCompra.CanFocus then
    edtDtCompra.SetFocus
end;

procedure TfCadPatrimonio.frPesqClienteedtCodigoExit(Sender: TObject);
begin
  inherited;
  frPesqCliente.edtCodigoExit(Sender);

end;

procedure TfCadPatrimonio.frPesqClienteedtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  frPesqCliente.edtCodigoKeyDown(Sender, Key, Shift);

end;

procedure TfCadPatrimonio.frPesqClienteedtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  frPesqCliente.edtCodigoKeyPress(Sender, Key);

end;

procedure TfCadPatrimonio.frPesqFornecedoredtCodigoExit(Sender: TObject);
begin
  inherited;
  frPesqFornecedor.edtCodigoExit(Sender);

end;

procedure TfCadPatrimonio.frPesqFornecedoredtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  frPesqFornecedor.edtCodigoKeyDown(Sender, Key, Shift);

end;

procedure TfCadPatrimonio.frPesqFornecedoredtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  frPesqFornecedor.edtCodigoKeyPress(Sender, Key);

end;

procedure TfCadPatrimonio.frPesqPatrimonioedtCodigoExit(Sender: TObject);
begin
  inherited;
  frPesqPatrimonio.edtCodigoExit(Sender);

end;

procedure TfCadPatrimonio.frPesqPatrimonioedtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  frPesqPatrimonio.edtCodigoKeyDown(Sender, Key, Shift);

end;

procedure TfCadPatrimonio.frPesqPatrimonioedtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  frPesqPatrimonio.edtCodigoKeyPress(Sender, Key);

end;

procedure TfCadPatrimonio.SetaValoresFrames;
var
  intI  : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TfrPesqIndividual) then begin
      (Components[intI] as TfrPesqIndividual).Limpar;
    end;
  end;

  frPesqPatrimonio.cdsLocal  := Self.cdsLocal;
  frPesqPatrimonio.cdsField1 := 'PATR_PATR_ID';
  frPesqFornecedor.cdsLocal  := Self.cdsLocal;
  frPesqFornecedor.cdsField1 := 'PATR_FORN_ID';
  frPesqCliente.cdsLocal     := Self.cdsLocal;
  frPesqCliente.cdsField1    := 'PATR_CLIE_ID';

  try
    if not (cdsLocal.State = dsInsert) then begin
      frPesqPatrimonio.BuscarRegistro(cdsLocal.FieldByName('PATR_PATR_ID').AsString);
      frPesqFornecedor.BuscarRegistro(cdsLocal.FieldByName('PATR_FORN_ID').AsString);
      frPesqCliente.BuscarRegistro(cdsLocal.FieldByName('PATR_CLIE_ID').AsString);
    end;
  except
  end;
end;


initialization
  if fCadPatrimonio = nil then
    fCadPatrimonio := TfCadPatrimonio.Create(nil);
finalization
  FreeAndNil(fCadPatrimonio);

end.
