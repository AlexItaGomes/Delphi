unit ufRel_ABC_Financas_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, SQLExpr;

type
  TfRel_ABC_Financas_Sintetico = class(TfImpressoes)
    lbID: TQRLabel;
    lbDescricao: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    lbPercDeb: TQRLabel;
    lbPercCred: TQRLabel;
    lbPercAcum: TQRLabel;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    lbDeb: TQRLabel;
    QRLabel14: TQRLabel;
    lbCred: TQRLabel;
    QRLabel13: TQRLabel;
    lbLiq: TQRLabel;
    QRShape1: TQRShape;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrepRelatorioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    function TotalCredito(intVisual : Integer): Real;
    function TotalDebito(intVisual : Integer): Real;
    { Private declarations }
  public
    dtDataI,
    dtDataF   : TDate;
    intVisual : Integer;
  end;

var
  fRel_ABC_Financas_Sintetico: TfRel_ABC_Financas_Sintetico;
  floatTotal,
  floatDebito,
  floatCredito : Real;

implementation

uses udmRel_ABC_Financas;

{$R *.dfm}

procedure TfRel_ABC_Financas_Sintetico.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  floatPerc : Real;
begin
  inherited;
  floatTotal := floatTotal + dmRel_Abc_Financas.cdsRel_ABC_FinancasVALOR.AsFloat;
  floatPerc  := (floatDebito / 100);
  floatPerc  := (dmRel_Abc_Financas.cdsRel_ABC_FinancasVALOR.AsFloat / floatPerc);
  lbPercDeb.Caption := FormatFloat('0.00',floatPerc) + '%';
  floatPerc  := (floatCredito / 100);
  floatPerc  := (dmRel_Abc_Financas.cdsRel_ABC_FinancasVALOR.AsFloat / floatPerc);
  lbPercCred.Caption := FormatFloat('0.00',floatPerc) + '%';
  floatPerc  := (floatDebito / 100);
  floatPerc  := (floatTotal / floatPerc);
  lbPercAcum.Caption := FormatFloat('0.00',floatPerc) + '%';
end;

procedure TfRel_ABC_Financas_Sintetico.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lbCred.Caption := 'R$ ' + FormatFloat('###,###,##0.00',floatCredito);
  if floatTotal < 0 then
    floatTotal   := (floatTotal * -1);
  lbDeb.Caption  := 'R$ ' + FormatFloat('###,###,##0.00',(floatTotal));
  lbLiq.Caption  := 'R$ ' + FormatFloat('###,###,##0.00',(floatCredito - (floatTotal)));
end;

procedure TfRel_ABC_Financas_Sintetico.qrepRelatorioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  floatTotal   := 0;
  floatDebito  := TotalDebito(intVisual);
  floatCredito := TotalCredito(intVisual);
end;

function TfRel_ABC_Financas_Sintetico.TotalCredito(intVisual : Integer) : Real;
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
        case intVisual of
          0 : begin
            SQL.Add('SELECT');
            SQL.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0)');
            SQL.Add('FROM  CONTAS_RECEBER CR');
            SQL.Add('WHERE CR.CREC_EMPR_ID   = ' + IntToStr(funcLocal.Empr_ID));
            SQL.Add('AND   CR.CREC_DTA_VCTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtDataI)));
            SQL.Add('AND   CR.CREC_DTA_VCTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtDataF)));
            SQL.Add('AND   CR.CREC_STATUS   <> ' + QuotedStr('C'));
          end;
          1 : begin
            sql.Add('SELECT');
            sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
            sql.Add('FROM  CONTAS_RECEBER CR');
            sql.Add('INNER JOIN CONTAS_RECEBER_ACERTOS AC');
            sql.Add('ON (AC.ACRE_CREC_ID      = CR.CREC_ID');
            sql.Add('AND AC.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)');
            sql.Add('WHERE CR.CREC_EMPR_ID       = ' + IntToStr(funcLocal.Empr_ID));
            sql.Add('AND   AC.ACRE_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtDataI)));
            sql.Add('AND   AC.ACRE_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtDataF)));
            SQL.Add('AND   CR.CREC_STATUS       <> ' + QuotedStr('C'));
          end;
        end;
        Open;
      end;
      Result := qryCons.Fields[0].AsFloat;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'TotalCredito',e.Message);
      funcLocal.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfRel_ABC_Financas_Sintetico.TotalDebito(intVisual : Integer) : Real;
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
        case intVisual of
          0 : begin
            SQL.Add('SELECT');
            SQL.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0)');
            SQL.Add('FROM  CONTAS_PAGAR CP');
            SQL.Add('WHERE CP.CPAG_EMPR_ID   = ' + IntToStr(funcLocal.Empr_ID));
            SQL.Add('AND   CP.CPAG_DTA_VCTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtDataI)));
            SQL.Add('AND   CP.CPAG_DTA_VCTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtDataF)));
            SQL.Add('AND   CP.CPAG_STATUS   <> ' + QuotedStr('C'));
          end;
          1 : begin
            sql.Add('SELECT');
            sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
            sql.Add('FROM  CONTAS_PAGAR CP');
            sql.Add('INNER JOIN CONTAS_PAGAR_ACERTOS AC');
            sql.Add('ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
            sql.Add('AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
            sql.Add('WHERE CP.CPAG_EMPR_ID       = ' + IntToStr(funcLocal.Empr_ID));
            sql.Add('AND   AC.ACPG_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtDataI)));
            sql.Add('AND   AC.ACPG_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtDataF)));
            SQL.Add('AND   CP.CPAG_STATUS       <> ' + QuotedStr('C'));
          end;
        end;
        Open;
      end;
      Result := qryCons.Fields[0].AsFloat;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'TotalCredito',e.Message);
      funcLocal.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

end.
