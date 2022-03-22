unit ufMensagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfMensagem = class(TForm)
    panelSuperior: TPanel;
    Label1: TLabel;
    Image2: TImage;
    Label2: TLabel;
    lbMsg: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbProveniente: TLabel;
    lbPlano: TLabel;
    lbTipo_doc: TLabel;
    lbVlr: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    lbFornecedor: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMensagem: TfMensagem;
  boolConfirm : Boolean;

implementation

{$R *.dfm}

procedure TfMensagem.btnCancelarClick(Sender: TObject);
begin
  boolConfirm := false;
  Self.Close;
end;

procedure TfMensagem.btnOkClick(Sender: TObject);
begin
  boolConfirm := true;
  Self.Close;
end;

procedure TfMensagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (ActiveControl <> btnOk) and (ActiveControl <> btnCancelar) then
    boolConfirm := false;
end;

end.
