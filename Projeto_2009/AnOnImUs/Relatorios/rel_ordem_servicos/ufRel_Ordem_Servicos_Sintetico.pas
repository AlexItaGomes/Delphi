unit ufRel_Ordem_Servicos_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Ordem_Servico_Sintetico = class(TfImpressoes)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Ordem_Servico_Sintetico: TfRel_Ordem_Servico_Sintetico;

implementation

{$R *.dfm}

end.
