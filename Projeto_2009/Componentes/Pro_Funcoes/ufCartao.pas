unit ufCartao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Funcoes,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TfCartao = class(TForm)
    Shape1: TShape;
    Image1: TImage;
    lbOrigem: TLabel;
    Label1: TLabel;
    lbValorDebito: TLabel;
    lbNumero: TLabel;
    Shape2: TShape;
    Label2: TLabel;
    Panel1: TPanel;
    btnHelp: TSpeedButton;
    btnSetFocus: TBitBtn;
    Label3: TLabel;
    edtNrTransDebito: TRxCalcEdit;
    Label4: TLabel;
    Shape3: TShape;
    Label5: TLabel;
    edtNrTransCredito: TRxCalcEdit;
    Label6: TLabel;
    edtNrParcelas: TRxCalcEdit;
    rdTipo: TRadioGroup;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure rdTipoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    funcLocal : TFuncoes;
    FNrNSUCredito: Integer;
    FNrParcelas: Integer;
    FNrNSUDebito: Integer;
    FResult: Integer;
    procedure getNrNSUCredito(const Value: Integer);
    procedure getNrNSUDebito(const Value: Integer);
    procedure getNrParcelas(const Value: Integer);
    function setNrNSUCredito: Integer;
    function setNrNSUDebito: Integer;
    function setNrParcelas: Integer;
    function ValidaDados: Boolean;
    { Private declarations }
  public
    procedure Habilita(VlrDebito, vlrCredito : Real);
    property NrNSUDebito : Integer     read setNrNSUDebito    write getNrNSUDebito;
    property NrNSUCredito: Integer     read setNrNSUCredito   write getNrNSUCredito;
    property NrParcelas  : Integer     read setNrParcelas     write getNrParcelas;
  end;

var
  fCartao: TfCartao;

implementation

{$R *.dfm}

procedure TfCartao.btnCancelarClick(Sender: TObject);
begin
  NrParcelas:=1;
  NrNSUDebito:=0;
  NrNSUCredito:=0;
  Self.Close;
end;

procedure TfCartao.btnOKClick(Sender: TObject);
begin
  if not ValidaDados() then Exit;
  NrParcelas   := edtNrParcelas.AsInteger;
  NrNSUDebito  := edtNrTransDebito.AsInteger;
  NrNSUCredito := edtNrTransCredito.AsInteger;
  Self.Close;
end;

function TfCartao.ValidaDados() : Boolean;
begin
  Result := false;
  if edtNrTransDebito.Enabled then begin
    if edtNrTransDebito.Value <= 0 then begin
      funcLocal.Alerta('I N F O R M A Ç Ã O ! ! !'+#13+#13+
                      'Necessário informar o NSU do débito realizado!',0);
      edtNrTransDebito.SetFocus;
      Exit;
    end;
  end;
  if edtNrTransCredito.Enabled then begin
    if edtNrTransCredito.Value <= 0 then begin
      funcLocal.Alerta('I N F O R M A Ç Ã O ! ! !'+#13+#13+
                      'Necessário informar o NSU do crédito realizado!',0);
      edtNrTransCredito.SetFocus;
      Exit;
    end;
  end;
  Result := true;
end;

procedure TfCartao.FormCreate(Sender: TObject);
var
  formPrinc : TForm;
begin
  formPrinc    := Application.MainForm;
  funcLocal    := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
end;

procedure TfCartao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    key := #0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;
  if key = #27 then begin
    btnCancelar.Click;
    key := #0;
  end;
end;

procedure TfCartao.FormShow(Sender: TObject);
begin
  try
    edtNrTransDebito.SetFocus;
  except
    edtNrTransCredito.SetFocus;
  end;
end;

procedure TfCartao.getNrNSUCredito(const Value: Integer);
begin
  FNrNSUCredito := Value;
end;

procedure TfCartao.getNrNSUDebito(const Value: Integer);
begin
  FNrNSUDebito := Value;
end;

procedure TfCartao.getNrParcelas(const Value: Integer);
begin
  FNrParcelas := Value;
end;

procedure TfCartao.Habilita(VlrDebito, vlrCredito: Real);
begin
  edtNrTransDebito.Enabled := false;
  edtNrTransCredito.Enabled := false;
  rdTipo.Enabled := false;
  edtNrParcelas.Enabled := false;
  if VlrDebito >0 then begin
    edtNrTransDebito.Enabled := true;
  end;
  if vlrCredito>0 then begin
    edtNrTransCredito.Enabled := true;
    rdTipo.Enabled := true;
  end;
end;

procedure TfCartao.rdTipoClick(Sender: TObject);
begin
  edtNrParcelas.Enabled := false;
  case rdTipo.ItemIndex of
    1 : begin
      edtNrParcelas.Enabled := true;
      edtNrParcelas.SetFocus;
    end;
  end;
end;

function TfCartao.setNrNSUCredito: Integer;
begin
  Result := FNrNSUCredito;
end;

function TfCartao.setNrNSUDebito: Integer;
begin
  Result := FNrNSUDebito;
end;

function TfCartao.setNrParcelas: Integer;
begin
  Result := FNrParcelas;
end;

end.
