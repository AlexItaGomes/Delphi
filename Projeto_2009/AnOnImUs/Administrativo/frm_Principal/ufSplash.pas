unit ufSplash;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.Imaging.pngimage, System.Classes, Vcl.Controls,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TfSplash = class(TForm)
    LabelProgress: TLabel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSplash: TfSplash;

implementation

uses
  Vcl.Graphics;

{$R *.dfm}

procedure TfSplash.FormShow(Sender: TObject);
begin
  Brush.Style := bsClear;
end;

end.
