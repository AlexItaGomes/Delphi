unit ufImpressoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, SQLExpr, Funcoes, QRPDFFilt, QRWebFilt,
  QRExport;

type
  TfImpressoes = class(TForm)
    qrepRelatorio: TQuickRep;
    QRBand1: TQRBand;
    lblFantasia: TQRLabel;
    lblRazao_Social: TQRLabel;
    QRSysData2: TQRSysData;
    lblEndereco: TQRLabel;
    imgLogo: TQRImage;
    QRBand2: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRBand3: TQRBand;
    QRPDFFilter1: TQRPDFFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRShape1000: TQRShape;
    lbTit01: TQRLabel;
    lbTit02: TQRLabel;
    lbTit03: TQRLabel;
    lbFild01: TQRLabel;
    lbFild02: TQRLabel;
    lbFild03: TQRLabel;
    QRLabel1118: TQRLabel;
    QRLabel1119: TQRLabel;
    QRLabel1120: TQRLabel;
    QRLabel1121: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    procedure qrepRelatorioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
  public
    funcLocal : TFuncoes;
  end;

var
  fImpressoes: TfImpressoes;

implementation

uses
  DB;

{$R *.dfm}

procedure TfImpressoes.FormCreate(Sender: TObject);
var
  formPrinc : TForm;
begin
  formPrinc := Application.MainForm;
  funcLocal := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
end;

procedure TfImpressoes.qrepRelatorioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  qryCons : TSQLQuery;
  BS      : TStream;
  bmpIMG  : TBitmap;
begin
  QRLabel1119.Caption := FormatDateTime('dd/mm/yyyy hh:mm:ss',funcLocal.DataServidor(funcLocal.Conexao,true));
  QRLabel1121.Caption := funcLocal.User_Login;
  try
    if bmpIMG = nil then
      bmpIMG := TBitmap.Create;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      E.EMPR_RAZAO_SOCIAL,');  //0
        sql.Add('      E.EMPR_NOME_FANTASIA,'); //1
        sql.Add('      E.EMPR_CNPJ,');          //2
        sql.Add('      E.EMPR_CEP,');           //3
        sql.Add('      E.EMPR_ENDERECO,');      //4
        sql.Add('      E.EMPR_NR_ENDERECO,');   //5
        sql.Add('      E.EMPR_BAIRRO,');        //6
        sql.Add('      C.GENE_DESCR,');         //7
        sql.Add('      C.GENE_PAR1,');          //8
        sql.Add('      E.EMPR_TELEFONE,');      //9
        sql.Add('      E.EMPR_FAX,');           //10
        sql.Add('      E.EMPR_SITE,');          //11
        sql.Add('      E.EMPR_EMAIL,');         //12
        sql.Add('      E.EMPR_LOGOTIPO');       //13
        sql.Add('FROM  EMPRESAS E');
        sql.Add('INNER JOIN GENERICA C');
        sql.Add('ON (C.GENE_EMPR_ID = E.EMPR_GENE_EMPR_ID_PRACA');
        sql.Add('AND C.GENE_TGEN_ID = E.EMPR_GENE_TGEN_ID_PRACA');
        sql.Add('AND C.GENE_ID      = E.EMPR_GENE_ID_PRACA)');
        sql.Add('WHERE E.EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        Open;
        lblRazao_Social.Caption := 'CPF/CNPJ: ' + Fields[2].AsString + '        Tel.: ' + Fields[9].AsString+'/'+Fields[10].AsString;
        lblEndereco.Caption     := Fields[4].AsString+','+Fields[5].AsString+ ' - ' + Fields[6].AsString + ' - ' + Fields[7].AsString+'-'+Fields[8].AsString;
        lblFantasia.Caption     := Fields[0].AsString;
        try
          BS := qryCons.CreateBlobStream(qryCons.FieldByName('EMPR_LOGOTIPO'),bmRead);
          if BS.Size > 0 then begin
            bmpIMG.LoadFromStream(BS);
            imgLogo.Picture.Assign(bmpIMG);
          end;
        except
        end;
      end;
    except
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FreeAndNil(bmpIMG);
    FreeAndNil(BS);
  end;
end;

end.
