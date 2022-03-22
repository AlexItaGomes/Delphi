unit ufRelEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, Funcoes;

type
  TfRelEtiquetas = class(TForm)
    qrepRelatorio: TQuickRep;
    QRBand1: TQRBand;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    procedure FormCreate(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    funcLocal : TFuncoes;
  public

  end;

var
  fRelEtiquetas: TfRelEtiquetas;

implementation

uses udmRel_Ordem_Servicos;

{$R *.dfm}

procedure TfRelEtiquetas.FormCreate(Sender: TObject);
var
  formPrinc : TForm;
begin
  formPrinc := Application.MainForm;
  funcLocal := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
end;

procedure TfRelEtiquetas.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  intCol,
  intLin   : Integer;
  topLinha : Integer;
  mmTMP    : TQRMemo;
  strNome,
  strEnd,
  strBairro,
  strCid,
  strCEP,
  strRef : String;
begin
  topLinha := 0;
  for intLin := 1 to 7 do begin
    topLinha := funcLocal.Se(intLin=1,18,topLinha+145);
    for intCol := 1 to 2 do begin
      mmTMP := TQRMemo.Create(nil);

      mmTMP.Parent    := QRBand1;
      mmTMP.Left      := funcLocal.Se(intCol=1,5,385);
      mmTMP.Top       := topLinha;
      mmTMP.Height    := 145;
      mmTMP.Width     := 365;
      mmTMP.AutoSize  := false;
      mmTMP.Font.Name := 'Calibri';
      mmTMP.Font.Size := 12;
      strNome := ''; strEnd := ''; strBairro := ''; strCid := ''; strCEP := ''; strRef := '';

      if not dmRel_Ordem_Servico.cdsRel_Ordem_Servico.Eof then begin
        strNome   := Copy(Trim('Nome: '+Trim(dmRel_Ordem_Servico.cdsRel_Ordem_ServicoCLIE_RAZAO_SOCIAL.AsString)),1,47);
        strEnd    := Copy(Trim('End  .: '+Trim(dmRel_Ordem_Servico.cdsRel_Ordem_ServicoCLIE_ENDERECO.AsString)),1,47);
        strBairro := Copy(Trim('Bairro: ' + Trim(dmRel_Ordem_Servico.cdsRel_Ordem_ServicoCLIE_BAIRRO.AsString)),1,47);
        strCid    := Copy(Trim(Trim(dmRel_Ordem_Servico.cdsRel_Ordem_ServicoPRACA.AsString) + ' - ' +
                          Trim(dmRel_Ordem_Servico.cdsRel_Ordem_ServicoUF.AsString)),1,47);
        strCEP    := Copy(Trim('CEP.: '+Trim(dmRel_Ordem_Servico.cdsRel_Ordem_ServicoCLIE_CEP.AsString)),1,47);
        strRef    := Copy(Trim('Ref.: '+Trim(dmRel_Ordem_Servico.cdsRel_Ordem_ServicoCLIE_REFERENCIA.AsString)),1,47);
      end;

      mmTMP.Lines.Add(strNome);
      mmTMP.Lines.Add(strEnd);
      mmTMP.Lines.Add(strBairro);
      mmTMP.Lines.Add(strCid);
      mmTMP.Lines.Add(strCEP);
      mmTMP.Lines.Add(strRef);
      dmRel_Ordem_Servico.cdsRel_Ordem_Servico.Next;
    end;
  end;
end;

end.
