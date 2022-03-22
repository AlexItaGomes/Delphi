unit ufConexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, IniFiles;

type
  TfConexao_DB = class(TForm)
    Edit1: TEdit;
    Open: TOpenDialog;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    btnPesq: TSpeedButton;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConexao_DB: TfConexao_DB;

implementation

{$R *.dfm}

end.
