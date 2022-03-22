unit ufRel_Contas_Bancarias_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Contas_Bancarias_Sintetico = class(TfImpressoes)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRBand5: TQRBand;
    QRLabel25: TQRLabel;
    lbTotal: TQRLabel;
    procedure QRBand5BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    floatTotal : Real;
  public
    { Public declarations }
  end;

var
  fRel_Contas_Bancarias_Sintetico: TfRel_Contas_Bancarias_Sintetico;

implementation

uses udmRel_Contas_Bancarias;

{$R *.dfm}

procedure TfRel_Contas_Bancarias_Sintetico.FormCreate(Sender: TObject);
begin
  inherited;
  floatTotal := 0;
end;

procedure TfRel_Contas_Bancarias_Sintetico.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  floatTotal := floatTotal + dmRel_Contas_Bancarias.cdsContas_BancariasCBCO_SALDO_ATUAL.AsFloat;
end;

procedure TfRel_Contas_Bancarias_Sintetico.QRBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lbTotal.Caption := FormatFloat('###,###,##0.00',floatTotal);
end;

end.
