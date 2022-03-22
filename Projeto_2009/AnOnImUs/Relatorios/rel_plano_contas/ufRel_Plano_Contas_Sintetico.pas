unit ufRel_Plano_Contas_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, SQLExpr;

type
  TfRel_Plano_Contas_Sintetico = class(TfImpressoes)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand5: TQRBand;
    QRLabel3: TQRLabel;
    lbDeb: TQRLabel;
    QRLabel9: TQRLabel;
    lbCred: TQRLabel;
    QRShape1: TQRShape;
    lbTotal: TQRLabel;
    QRLabel12: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRShape2: TQRShape;
    lblTotal: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel4: TQRLabel;
    procedure qrepRelatorioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    function GeraSQL(strPLCT_ID: STring): String;
    function TotalTitulos(strPLCT_ID: String): Real;
    { Private declarations }
  public
    dtInicio,
    dtFim       : TDate;
    intAtivo,
    intTipo     : Integer;
  end;

var
  fRel_Plano_Contas_Sintetico: TfRel_Plano_Contas_Sintetico;
  floatValor,
  floatCred,
  floatDeb,
  fltTotal : Real;

implementation

uses udmRel_Plano_Contas, ufRel_Plano_Contas;

{$R *.dfm}

procedure TfRel_Plano_Contas_Sintetico.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  QRMemo1.Lines.Clear;
  QRMemo2.Lines.Clear;
  QRMemo3.Lines.Clear;
end;

procedure TfRel_Plano_Contas_Sintetico.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  qryCons : TSQLQuery;
begin
  try
    fltTotal := 0;
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add(GeraSQL(dmRel_Plano_Contas.cdsListaPlanoPLCT_ID.AsString));
        Open;
        First;
        if not IsEmpty then begin
          while not qryCons.Eof do begin

            QRMemo1.Lines.Add(qryCons.FieldByName('PLCT_COD_SIMPLIFICADO').AsString);
            QRMemo2.Lines.Add(qryCons.FieldByName('PLCT_DESCRICAO').AsString);
            floatValor := TotalTitulos(qryCons.FieldByName('PLCT_ID').AsString);
            if Trim(qryCons.FieldByName('PLCT_TIPO').AsString) = 'C' then
              floatCred     := floatCred + floatValor
            else floatDeb   := floatDeb + floatValor;
            QRMemo3.Lines.Add( FormatFloat('###,####,##0.00',floatValor) );
            fltTotal := fltTotal + floatValor;
            qryCons.Next;
          end;
        end;
      end;
    finally
      lblTotal.Caption := FormatFloat('###,####,##0.00',fltTotal);
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  except
  end;
end;

function TfRel_Plano_Contas_Sintetico.GeraSQL(strPLCT_ID : STring) : String;
var
  qryCons : TStringList;
  strTMP  : String;
begin
  try
    Result  := '';
    qryCons := TStringList.Create;
    try
      strTMP := funcLocal.RetornaFilhosPlanoContas(strPLCT_ID,intAtivo,intTipo);
      strTMP := Copy(strTMP,1,length(strTMP)-1);
      with qryCons do begin
        Clear;
        Add('SELECT');
        Add('       PLCT_ID,');
        Add('       PLCT_COD_SIMPLIFICADO,');
        Add('       PLCT_DESCRICAO,');
        Add('       PLCT_TIPO');
        Add('  FROM PLANO_CONTAS');
        Add(' WHERE PLCT_EMPR_ID = 0');
        case intAtivo of
          0 : Add('AND   PLCT_ATIVO   = 1');
          1 : Add('AND   PLCT_ATIVO   = 0');
        end;
        case intTipo of
          0 : Add('AND PLCT_TIPO = ' + QuotedStr('C'));
          1 : Add('AND PLCT_TIPO = ' + QuotedStr('D'));
        end;
        Add('   AND PLCT_SISTEMA = 0');
        Add('   AND PLCT_PLCT_ID IN ('+strTMP+')');
        Add('ORDER BY');
        Add('      PLCT_COD_SIMPLIFICADO,');
        Add('      PLCT_TIPO');
      end;
      Result := qryCons.Text;
    except on e: exception do
      ShowMessage(e.Message);
    end;
  finally
    FreeAndNil(qryCons);
  end;
end;

procedure TfRel_Plano_Contas_Sintetico.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lbCred.Caption  := FormatFloat('###,####,##0.00',floatCred);
  lbDeb.Caption   := FormatFloat('###,####,##0.00',floatDeb);
  lbTotal.Caption := FormatFloat('###,####,##0.00',(floatCred - floatDeb));
end;

procedure TfRel_Plano_Contas_Sintetico.qrepRelatorioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  floatCred := 0;
  floatDeb  := 0;
end;

function TfRel_Plano_Contas_Sintetico.TotalTitulos(strPLCT_ID : String) : Real;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := 0;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(SUM(VALOR),0)');
        sql.Add('FROM');
        sql.Add('     (SELECT');
        sql.Add('            COALESCE(SUM(CPAG_VALOR_DOC),0) AS VALOR');
        sql.Add('      FROM  CONTAS_PAGAR');
        sql.Add('      WHERE CPAG_EMPR_ID   = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('      AND   CPAG_STATUS   <> ' + QuotedStr('C'));
        sql.Add('      AND   CPAG_DTA_VCTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtInicio)));
        sql.Add('      AND   CPAG_DTA_VCTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtFim)));
        sql.Add('      AND   CPAG_PLCT_ID   = ' + strPLCT_ID);
        sql.Add('');
        sql.Add('      UNION');
        sql.Add('');
        sql.Add('      SELECT');
        sql.Add('            COALESCE(SUM(CREC_VALOR_DOC),0) AS VALOR');
        sql.Add('      FROM  CONTAS_RECEBER');
        sql.Add('      WHERE CREC_EMPR_ID   = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('      AND   CREC_STATUS   <> ' + QuotedStr('C'));
        sql.Add('      AND   CREC_DTA_VCTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtInicio)));
        sql.Add('      AND   CREC_DTA_VCTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtFim)));
        sql.Add('      AND   CREC_PLCT_ID   = ' + strPLCT_ID);
        sql.Add('      )');
        Open;
      end;
      Result := qryCons.Fields[0].AsFloat;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'TotalTitulos',e.Message);
      funcLocal.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

end.
