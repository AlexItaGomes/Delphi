unit ufRel_Ordem_Servicos_Analitico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Ordem_Servico_Analitico = class(TfImpressoes)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Ordem_Servico_Analitico: TfRel_Ordem_Servico_Analitico;

implementation

{$R *.dfm}

end.
