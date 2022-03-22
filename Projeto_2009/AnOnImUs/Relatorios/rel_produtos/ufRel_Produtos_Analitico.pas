unit ufRel_Produtos_Analitico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TfRel_Produtos_Analitico = class(TfImpressoes)
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText17: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText27: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    function GeraSQL: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Produtos_Analitico: TfRel_Produtos_Analitico;

implementation

uses udmRel_Produtos;

{$R *.dfm}

procedure TfRel_Produtos_Analitico.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  with dmRel_Produtos.cdsRelCompProdutos do begin
    Close;
    CommandText := GeraSQL;
    Open;
    if IsEmpty then begin
      QRBand3.Height := 140;
    end else begin
      QRBand3.Height := 180;
    end;
  end;
end;

function TfRel_Produtos_Analitico.GeraSQL : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    try
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      PC.PRCP_PROD_ID_COMP,');
        Add('      PC.PRCP_QTDE,');
        Add('      PR.PROD_DESCRICAO,');
        Add('      PR.PROD_UNIDADE,');
        Add('      GP.GENE_DESCR GRUPO_PROD,');
        Add('      MC.GENE_DESCR MARCA_PROD,');
        Add('      MD.GENE_DESCR MODELO_PROD');
        Add('FROM  PRODUTOS_COMP PC');
        Add('INNER JOIN PRODUTOS PR');
        Add('ON (PR.PROD_ID      = PC.PRCP_PROD_ID_COMP');
        Add('AND PR.PROD_EMPR_ID = PC.PRCP_PROD_EMPR_ID_COMP)');
        Add('INNER JOIN GENERICA GP');
        Add('ON (GP.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_GRUPO');
        Add('AND GP.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_GRUPO');
        Add('AND GP.GENE_ID      = PR.PROD_GENE_ID_GRUPO)');
        Add('INNER JOIN GENERICA MC');
        Add('ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA');
        Add('AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA');
        Add('AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)');
        Add('INNER JOIN GENERICA MD');
        Add('ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO');
        Add('AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO');
        Add('AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)');
        Add('WHERE PC.PRCP_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
        Add('AND   PC.PRCP_PROD_ID      = ' + dmRel_Produtos.cdsRel_ProdutosPROD_ID.AsString);
        Add('AND   PC.PRCP_PROD_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
      end;
      Result := sltTMP.Text;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'GeraSQL',e.Message);
      funcLocal.Alerta('Erro no processo de geração do relatório.'+#13+'['+e.Message+']',1);
    end; end;                                                             
  finally
    FreeAndNil(sltTMP);
  end;
end;

end.
