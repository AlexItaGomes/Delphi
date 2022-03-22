unit ufMensagens;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.Buttons, System.Classes, Vcl.Controls,
  Vcl.OleCtrls, SHDocVw;

type
  TfMensagens = class(TForm)
    WebBrowser1: TWebBrowser;
    btnOk: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMensagens: TfMensagens;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TfMensagens.btnOkClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfMensagens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    FreeAndNil(WebBrowser1);
  except
  end;
end;

procedure TfMensagens.FormShow(Sender: TObject);
begin
  btnOk.SetFocus;
end;

end.
