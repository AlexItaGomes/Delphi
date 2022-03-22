unit ufPesquisa;

interface

uses
  Data.DB, Vcl.StdCtrls, Vcl.Controls, Vcl.ComCtrls, System.Classes, Vcl.Buttons,
  Vcl.Mask, Vcl.Forms, Funcoes, Datasnap.DBClient;

type
  ObjCampo = Class
    Name     : String;
    DataType : TFieldType;
    EditMask : TCustomMaskEdit;
  end;

type
  TfPesquisa = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    btnLocaliza: TSpeedButton;
    btnCancelar: TSpeedButton;
    edtPesquisa: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure ckContenhaClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLocalizaClick(Sender: TObject);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
    cdsPesquisa : TClientDataSet;
    strCampo    : String;
  end;

var
  fPesquisa: TfPesquisa;

implementation

{$R *.dfm}

procedure TfPesquisa.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfPesquisa.btnLocalizaClick(Sender: TObject);
begin
  try
    funcLocal.MSGAguarde();
    try
      with cdsPesquisa do begin
        Filtered := false;
        Filter   := funcLocal.GerarFilter(cdsPesquisa,edtPesquisa.Text);
        Filtered := true;
      end;
    except
    end;
  finally
    funcLocal.MSGAguarde(false);
  end;
end;

procedure TfPesquisa.btnOkClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfPesquisa.ckContenhaClick(Sender: TObject);
begin
  edtPesquisa.SetFocus;
end;

procedure TfPesquisa.FormCreate(Sender: TObject);
var
  formPrinc : TForm;
begin
  formPrinc := Application.MainForm;
  funcLocal := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
end;

procedure TfPesquisa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    btnCancelar.Click;
    key := #0;
  end;
  if key = #13 then begin
    btnLocaliza.Click;
    key := #0;
  end;
end;

procedure TfPesquisa.FormShow(Sender: TObject);
begin
  edtPesquisa.SetFocus;
end;

end.
