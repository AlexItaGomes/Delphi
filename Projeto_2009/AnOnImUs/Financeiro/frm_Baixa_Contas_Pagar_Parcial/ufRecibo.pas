unit ufRecibo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt, Vcl.ExtCtrls, QRCtrls;

type
  TfRecibo = class(TForm)
    QrRecibo: TQuickRep;
    QRBand1: TQRBand;
    lblEmpRazao: TQRLabel;
    lblCNPJ: TQRLabel;
    lblEndereco: TQRLabel;
    lblCEP: TQRLabel;
    lblReciboNr: TQRLabel;
    lblValor: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    lblFavorecidoI: TQRLabel;
    lblFavorecido: TQRLabel;
    lblValorExtenso: TQRLabel;
    QRLabel14: TQRLabel;
    lblCPFCNPJFavorecido: TQRLabel;
    lblReferente: TQRLabel;
    QRLabel17: TQRLabel;
    lblCidadeData: TQRLabel;
    lblCPFCNPJFavorecidoI: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    procedure QrReciboBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    FCPFCNPJFavorecido: String;
    FCNPJ: String;
    FValor: String;
    FCEP: String;
    FReferente: String;
    FFavorecido: String;
    FNrRecibo: String;
    FEmpresa: String;
    FEndereco: String;
    FValorExtenso: String;
    FCidadeData: String;
    FIE: String;
    procedure PreencheCampos;
    { Private declarations }
  public
    property  Empresa             : String  read FEmpresa             write FEmpresa;
    property  CNPJ                : String  read FCNPJ                write FCNPJ;
    property  IE                  : String  read FIE                  write FIE;
    property  Endereco            : String  read FEndereco            write FEndereco;
    property  CEP                 : String  read FCEP                 write FCEP;
    property  NrRecibo            : String  read FNrRecibo            write FNrRecibo;
    property  Valor               : String  read FValor               write FValor;
    property  Favorecido          : String  read FFavorecido          write FFavorecido;
    property  CPFCNPJFavorecido   : String  read FCPFCNPJFavorecido   write FCPFCNPJFavorecido;
    property  Referente           : String  read FReferente           write FReferente;
    property  ValorExtenso        : String  read FValorExtenso        write FValorExtenso;
    property  CidadeData          : String  read FCidadeData          write FCidadeData;
  end;

var
  fRecibo: TfRecibo;

implementation

{$R *.dfm}

procedure TfRecibo.QrReciboBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  PreencheCampos();
end;

procedure TfRecibo.PreencheCampos();
begin
  lblEmpRazao.Caption           := Trim(Empresa);
  lblCNPJ.Caption               := Trim('CNPJ: '+CNPJ+', Insc. Est.: '+IE);
  lblEndereco.Caption           := Trim(Endereco);
  lblCEP.Caption                := Trim(CEP);
  lblReciboNr.Caption           := Trim(NrRecibo);
  lblValor.Caption              := Trim(Valor);
  lblFavorecido.Caption         := Trim(Empresa);
  lblFavorecidoI.Caption        := Trim(Favorecido);
  lblCPFCNPJFavorecido.Caption  := Trim(CNPJ);
  lblCPFCNPJFavorecidoI.Caption := Trim(CPFCNPJFavorecido);
  lblValorExtenso.Caption       := Trim(ValorExtenso);
  lblReferente.Caption          := Trim(Referente);
  lblCidadeData.Caption         := Trim(CidadeData);
end;

end.
