unit ufVersao;

interface

uses
  Vcl.Forms, Vcl.Controls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  System.Classes, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TfVersao = class(TForm)
    Panel1: TPanel;
    btnOK: TSpeedButton;
    btnSetFocus: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fVersao: TfVersao;

implementation

{$R *.dfm}

procedure TfVersao.btnOKClick(Sender: TObject);
begin
  Self.Close;
end;

end.
