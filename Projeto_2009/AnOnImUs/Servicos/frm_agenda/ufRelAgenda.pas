unit ufRelAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufImpressoes, QRExport, QRWebFilt,
  QRPDFFilt, QRCtrls, QuickRpt, Vcl.ExtCtrls;

type
  TfRelAgendaSemana = class(TfImpressoes)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelAgendaSemana: TfRelAgendaSemana;

implementation

{$R *.dfm}

initialization
  fRelAgendaSemana := TfRelAgendaSemana.Create(nil);
finalization
  FreeAndNil(fRelAgendaSemana);

end.
