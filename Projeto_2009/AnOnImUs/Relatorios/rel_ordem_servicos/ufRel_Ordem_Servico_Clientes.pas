unit ufRel_Ordem_Servico_Clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Ordem_Servico_Clientes = class(TfImpressoes)
    QRGroup1: TQRGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Ordem_Servico_Clientes: TfRel_Ordem_Servico_Clientes;

implementation

uses udmRel_Ordem_Servicos;

{$R *.dfm}

end.
