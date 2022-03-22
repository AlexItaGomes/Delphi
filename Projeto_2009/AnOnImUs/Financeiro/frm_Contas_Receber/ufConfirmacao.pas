unit ufConfirmacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfConfirmacao = class(TForm)
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
    Label4: TLabel;
    lbFornecedor: TLabel;
    panelSuperior: TPanel;
    Label1: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConfirmacao: TfConfirmacao;
  boolConfirm : Boolean;

implementation

{$R *.dfm}

procedure TfConfirmacao.btnCancelarClick(Sender: TObject);
begin
  boolConfirm := false;
  Self.Close;
end;

procedure TfConfirmacao.btnOkClick(Sender: TObject);
begin
  boolConfirm := true;
  Self.Close;
end;

procedure TfConfirmacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (ActiveControl <> btnOk) and (ActiveControl <> btnCancelar) then
    boolConfirm := false;
end;

end.
