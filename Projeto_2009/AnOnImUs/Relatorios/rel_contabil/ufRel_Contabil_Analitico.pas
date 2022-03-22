unit ufRel_Contabil_Analitico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, SQLExpr;

type
  TfRel_Contabil_Analitico = class(TfImpressoes)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    mmAtivos: TQRMemo;
    mmPassivo: TQRMemo;
    mmAtivoVlr: TQRMemo;
    mmPassivoVlr: TQRMemo;
    QRBand4: TQRBand;
    QRLabel5: TQRLabel;
    lbAtivos: TQRLabel;
    QRLabel7: TQRLabel;
    lbPassivos: TQRLabel;
    QRLabel9: TQRLabel;
    lbTotalAtivos: TQRLabel;
    QRLabel11: TQRLabel;
    lbTotalPassivos: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    lbLiquido: TQRLabel;
    mmCodAtivos: TQRMemo;
    mmCodPassivos: TQRMemo;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrepRelatorioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    floatAtivo,
    floatPassivo : Real;
    procedure RetornaAtivos;
    procedure RetornaPassivos;
  public
    dtInicio,
    dtFim    : TDateTime;
    intTipo,
    intOrder : Integer;
  end;

var
  fRel_Contabil_Analitico: TfRel_Contabil_Analitico;

implementation

{$R *.dfm}

procedure TfRel_Contabil_Analitico.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  mmCodAtivos.Lines.Clear;
  mmCodPassivos.Lines.Clear;
  mmAtivos.Lines.Clear;
  mmPassivo.Lines.Clear;
  mmAtivoVlr.Lines.Clear;
  mmPassivoVlr.Lines.Clear;
  RetornaAtivos;
  RetornaPassivos;
  lbAtivos.Caption        := FormatFloat('###,###,##0.00',floatAtivo);
  lbPassivos.Caption      := FormatFloat('###,###,##0.00',floatPassivo);
  lbTotalAtivos.Caption   := FormatFloat('###,###,##0.00',floatAtivo);
  lbTotalPassivos.Caption := FormatFloat('###,###,##0.00',floatPassivo);
  lbLiquido.Caption       := FormatFloat('###,###,##0.00',(floatAtivo-floatPassivo));
end;

procedure TfRel_Contabil_Analitico.qrepRelatorioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  floatAtivo   := 0;
  floatPassivo := 0;
end;

procedure TfRel_Contabil_Analitico.RetornaAtivos;
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        case intTipo of
          0 : begin
            sql.Add('SELECT');
            sql.Add('      PL.PLCT_COD_SIMPLIFICADO,');
            sql.Add('      PL.PLCT_DESCRICAO,');
            sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0) VALOR');
            sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
            sql.Add('INNER JOIN CONTAS_RECEBER CR');
            sql.Add('ON (CR.CREC_ID            = AC.ACRE_CREC_ID');
            sql.Add('AND CR.CREC_EMPR_ID       = AC.ACRE_CREC_EMPR_ID)');
            sql.Add('INNER JOIN PLANO_CONTAS PL');
            sql.Add('ON (PL.PLCT_ID            = CR.CREC_PLCT_ID');
            sql.Add('AND PL.PLCT_EMPR_ID       = CR.CREC_PLCT_EMPR_ID)');
            sql.Add('WHERE AC.ACRE_EMPR_ID       = ' + IntToStr(funcLocal.Empr_ID));
            sql.Add('AND   CR.CREC_STATUS       <> ' + QuotedStr('C'));
            sql.Add('AND   AC.ACRE_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtInicio)));
            sql.Add('AND   AC.ACRE_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtFim)));
            sql.Add('GROUP BY');
            sql.Add('      PLCT_COD_SIMPLIFICADO,');
            sql.Add('      PLCT_DESCRICAO');
            sql.Add('ORDER BY');
            case intOrder of
              0 : sql.Add('      PLCT_COD_SIMPLIFICADO');
              1 : sql.Add('      PLCT_DESCRICAO');
              2 : sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
              3 : sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0) DESC');
            end;
          end;
          1 : begin
            sql.Add('SELECT');
            SQL.Add('      PL.PLCT_COD_SIMPLIFICADO,');
            SQL.Add('      PL.PLCT_DESCRICAO,');
            SQL.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0) VALOR');
            SQL.Add('FROM CONTAS_RECEBER CR');
            SQL.Add('INNER JOIN PLANO_CONTAS PL');
            SQL.Add('ON (PL.PLCT_ID            = CR.CREC_PLCT_ID');
            SQL.Add('AND PL.PLCT_EMPR_ID       = CR.CREC_PLCT_EMPR_ID)');
            SQL.Add('WHERE CR.CREC_EMPR_ID   = ' + IntToStr(funcLocal.Empr_ID));
            SQL.Add('AND   CR.CREC_STATUS   <> ' + QuotedStr('C'));
            SQL.Add('AND   CR.CREC_DTA_VCTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtInicio)));
            SQL.Add('AND   CR.CREC_DTA_VCTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtFim)));
            SQL.Add('GROUP BY');
            SQL.Add('      PLCT_COD_SIMPLIFICADO,');
            SQL.Add('      PLCT_DESCRICAO');
            SQL.Add('ORDER BY');
            case intOrder of
              0 : SQL.Add('      PLCT_COD_SIMPLIFICADO');
              1 : SQL.Add('      PLCT_DESCRICAO');
              2 : SQL.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0)');
              3 : SQL.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0) DESC');
            end;
          end;
        end;
        Open;
        First;
        while not eof do begin
          floatAtivo := floatAtivo + qryCons.Fields[2].AsFloat;
          mmCodAtivos.Lines.Add(Trim(qryCons.Fields[0].AsString));
          mmAtivos.Lines.Add(Trim(qryCons.Fields[1].AsString));
          mmAtivoVlr.Lines.Add(FormatFloat('###,###,##0.00',qryCons.Fields[2].AsFloat));
          Next;
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'RetornaAtivos',e.Message);
      funcLocal.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfRel_Contabil_Analitico.RetornaPassivos;
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        case intTipo of
          0 : begin
            sql.Add('SELECT');
            sql.Add('      PL.PLCT_COD_SIMPLIFICADO,');
            sql.Add('      PL.PLCT_DESCRICAO,');
            sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0) VALOR');
            sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
            sql.Add('INNER JOIN CONTAS_PAGAR CP');
            sql.Add('ON (CP.CPAG_ID            = AC.ACPG_CPAG_ID');
            sql.Add('AND CP.CPAG_EMPR_ID       = AC.ACPG_CPAG_EMPR_ID)');
            sql.Add('INNER JOIN PLANO_CONTAS PL');
            sql.Add('ON (PL.PLCT_ID            = CP.CPAG_PLCT_ID');
            sql.Add('AND PL.PLCT_EMPR_ID       = CP.CPAG_PLCT_EMPR_ID)');
            sql.Add('WHERE AC.ACPG_EMPR_ID       = ' + IntToStr(funcLocal.Empr_ID));
            sql.Add('AND   CP.CPAG_STATUS       <> ' + QuotedStr('C'));
            sql.Add('AND   AC.ACPG_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtInicio)));
            sql.Add('AND   AC.ACPG_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtFim)));
            sql.Add('GROUP BY');
            sql.Add('      PLCT_COD_SIMPLIFICADO,');
            sql.Add('      PLCT_DESCRICAO');
            sql.Add('ORDER BY');
            case intOrder of
              0 : sql.Add('      PLCT_COD_SIMPLIFICADO');
              1 : sql.Add('      PLCT_DESCRICAO');
              2 : sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
              3 : sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0) DESC');
            end;
          end;
          1 : begin
            sql.Add('SELECT');
            SQL.Add('      PL.PLCT_COD_SIMPLIFICADO,');
            SQL.Add('      PL.PLCT_DESCRICAO,');
            SQL.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0) VALOR');
            SQL.Add('FROM CONTAS_PAGAR CP');
            SQL.Add('INNER JOIN PLANO_CONTAS PL');
            SQL.Add('ON (PL.PLCT_ID            = CP.CPAG_PLCT_ID');
            SQL.Add('AND PL.PLCT_EMPR_ID       = CP.CPAG_PLCT_EMPR_ID)');
            SQL.Add('WHERE CP.CPAG_EMPR_ID   = ' + IntToStr(funcLocal.Empr_ID));
            SQL.Add('AND   CP.CPAG_STATUS   <> ' + QuotedStr('C'));
            SQL.Add('AND   CP.CPAG_DTA_VCTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtInicio)));
            SQL.Add('AND   CP.CPAG_DTA_VCTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtFim)));
            SQL.Add('GROUP BY');
            SQL.Add('      PLCT_COD_SIMPLIFICADO,');
            SQL.Add('      PLCT_DESCRICAO');
            SQL.Add('ORDER BY');
            case intOrder of
              0 : SQL.Add('      PLCT_COD_SIMPLIFICADO');
              1 : SQL.Add('      PLCT_DESCRICAO');
              2 : SQL.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0)');
              3 : SQL.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0) DESC');
            end;
          end;
        end;
        Open;
        First;
        while not eof do begin
          floatPassivo := floatPassivo + qryCons.Fields[2].AsFloat;
          mmCodPassivos.Lines.Add(Trim(qryCons.Fields[0].AsString));
          mmPassivo.Lines.Add(Trim(qryCons.Fields[1].AsString));
          mmPassivoVlr.Lines.Add(FormatFloat('###,###,##0.00',qryCons.Fields[2].AsFloat));
          Next;
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'RetornaPassivos',e.Message);
      funcLocal.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

end.
