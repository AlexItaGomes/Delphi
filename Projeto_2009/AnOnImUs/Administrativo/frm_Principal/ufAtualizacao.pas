unit ufAtualizacao;

interface

uses
  Vcl.Forms, Vcl.Buttons, Vcl.StdCtrls, Vcl.Graphics, Vcl.ExtCtrls,
  System.Classes, Vcl.Controls, Vcl.Imaging.jpeg;

type
  TfAtualizacao = class(TForm)
    btnOK: TSpeedButton;
    Label3: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    Bevel1: TBevel;
    Image1: TImage;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAtualizacao: TfAtualizacao;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TfAtualizacao.btnOKClick(Sender: TObject);
begin
   Application.Terminate;
   Abort;
end;

initialization
  fAtualizacao := TfAtualizacao.Create(nil);

finalization
  FreeAndNil(fAtualizacao);

end.
