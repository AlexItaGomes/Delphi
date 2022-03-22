unit ufRel_Plano_Contas_Planejamento_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRWebFilt, QRExport, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, SQLExpr;

type
  TfRel_Planejamento_Anual_Sintetico = class(TfImpressoes)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
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
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
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
    QRBand4: TQRBand;
    lb01: TQRLabel;
    lb02: TQRLabel;
    lb03: TQRLabel;
    lb04: TQRLabel;
    lb05: TQRLabel;
    lb06: TQRLabel;
    lb07: TQRLabel;
    lb08: TQRLabel;
    lb09: TQRLabel;
    lb10: TQRLabel;
    lb11: TQRLabel;
    lb12: TQRLabel;
    lbRec01: TQRLabel;
    lbRec02: TQRLabel;
    lbRec03: TQRLabel;
    lbRec04: TQRLabel;
    lbRec05: TQRLabel;
    lbRec06: TQRLabel;
    lbRec07: TQRLabel;
    lbRec08: TQRLabel;
    lbRec09: TQRLabel;
    lbRec10: TQRLabel;
    lbRec11: TQRLabel;
    lbRec12: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    lbTot01: TQRLabel;
    lbTot02: TQRLabel;
    lbTot03: TQRLabel;
    lbTot04: TQRLabel;
    lbTot05: TQRLabel;
    lbTot06: TQRLabel;
    lbTot07: TQRLabel;
    lbTot08: TQRLabel;
    lbTot09: TQRLabel;
    lbTot11: TQRLabel;
    lbTot12: TQRLabel;
    lbTot10: TQRLabel;
    lbPrevisao: TQRLabel;
    ChildBand1: TQRChildBand;
    lbSoma1: TQRLabel;
    lbSoma2: TQRLabel;
    lbSoma3: TQRLabel;
    lbSoma4: TQRLabel;
    lbSoma5: TQRLabel;
    lbSoma6: TQRLabel;
    lbSoma7: TQRLabel;
    lbSoma8: TQRLabel;
    lbSoma9: TQRLabel;
    lbSoma10: TQRLabel;
    lbSoma11: TQRLabel;
    lbSoma12: TQRLabel;
    lbTotalCred: TQRLabel;
    lbTotalDeb: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrepRelatorioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    intAnoI,
    intAnoF    : Integer;
    boolVisual : Boolean;
  end;

var
  fRel_Planejamento_Anual_Sintetico: TfRel_Planejamento_Anual_Sintetico;
  float01,
  float02,
  float03,
  float04,
  float05,
  float06,
  float07,
  float08,
  float09,
  float10,
  float11,
  float12,
  floatRec01,
  floatRec02,
  floatRec03,
  floatRec04,
  floatRec05,
  floatRec06,
  floatRec07,
  floatRec08,
  floatRec09,
  floatRec10,
  floatRec11,
  floatRec12 : Real;
  floatTotal : Array[1..12] of Real;

implementation

uses udmRel_Plano_Contas_Planejamento;

{$R *.dfm}

procedure TfRel_Planejamento_Anual_Sintetico.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lbSoma1.Caption  := FormatFloat('##,###,###0.00',floatTotal[1]);
  lbSoma2.Caption  := FormatFloat('##,###,###0.00',floatTotal[2]);
  lbSoma3.Caption  := FormatFloat('##,###,###0.00',floatTotal[3]);
  lbSoma4.Caption  := FormatFloat('##,###,###0.00',floatTotal[4]);
  lbSoma5.Caption  := FormatFloat('##,###,###0.00',floatTotal[5]);
  lbSoma6.Caption  := FormatFloat('##,###,###0.00',floatTotal[6]);
  lbSoma7.Caption  := FormatFloat('##,###,###0.00',floatTotal[7]);
  lbSoma8.Caption  := FormatFloat('##,###,###0.00',floatTotal[8]);
  lbSoma9.Caption  := FormatFloat('##,###,###0.00',floatTotal[9]);
  lbSoma10.Caption := FormatFloat('##,###,###0.00',floatTotal[10]);
  lbSoma11.Caption := FormatFloat('##,###,###0.00',floatTotal[11]);
  lbSoma12.Caption := FormatFloat('##,###,###0.00',floatTotal[12]);
end;

procedure TfRel_Planejamento_Anual_Sintetico.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  qryCons    : TSQLQuery;
  intI       : Integer;
begin
  inherited;
//  if boolVisual then begin
    with dmRel_Plano_Contas_Planejamento do begin
      float01 := float01 + cdsRel_Planejamento_AnualPCPJ_MES_01.AsFloat;
      float02 := float02 + cdsRel_Planejamento_AnualPCPJ_MES_02.AsFloat;
      float03 := float03 + cdsRel_Planejamento_AnualPCPJ_MES_03.AsFloat;
      float04 := float04 + cdsRel_Planejamento_AnualPCPJ_MES_04.AsFloat;
      float05 := float05 + cdsRel_Planejamento_AnualPCPJ_MES_05.AsFloat;
      float06 := float06 + cdsRel_Planejamento_AnualPCPJ_MES_06.AsFloat;
      float07 := float07 + cdsRel_Planejamento_AnualPCPJ_MES_07.AsFloat;
      float08 := float08 + cdsRel_Planejamento_AnualPCPJ_MES_08.AsFloat;
      float09 := float09 + cdsRel_Planejamento_AnualPCPJ_MES_09.AsFloat;
      float10 := float10 + cdsRel_Planejamento_AnualPCPJ_MES_10.AsFloat;
      float11 := float11 + cdsRel_Planejamento_AnualPCPJ_MES_11.AsFloat;
      float12 := float12 + cdsRel_Planejamento_AnualPCPJ_MES_12.AsFloat;
    end;
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) AS MES,');
          sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0) AS VALOR');
          sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
          sql.Add('INNER JOIN CONTAS_PAGAR CP');
          sql.Add('ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
          sql.Add('AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
          sql.Add('WHERE CP.CPAG_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND   CP.CPAG_STATUS      <> ' + QuotedStr('C'));
          sql.Add('AND   CP.CPAG_PLCT_ID      = ' + dmRel_Plano_Contas_Planejamento.cdsRel_Planejamento_AnualPCPJ_PLCT_ID.AsString);
          sql.Add('AND   CP.CPAG_PLCT_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO) >= ' + IntToStr(intAnoI));
          sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO) <= ' + IntToStr(intAnoF));
          sql.Add('GROUP BY');
          sql.Add('      1');
          Open;
          if not IsEmpty then begin
            for inti := 1 to 12 do
              floatTotal[intI] := 0;
            First;
            while not eof do begin
              floatTotal[qryCons.Fields[0].AsInteger] := qryCons.Fields[1].AsFloat;
              Next;
            end;
          end;
        end;
      except on e: exception do begin
        funcLocal.ReportaErro(Caption,'QRBand3BeforePrint',e.Message);
        funcLocal.Alerta('Erro na montagem do relatório.'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
//  end;
end;

procedure TfRel_Planejamento_Anual_Sintetico.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  qryCons : TSQLQuery;
begin
  inherited;
  floatRec01 := 0; floatRec02 := 0; floatRec03 := 0;
  floatRec04 := 0; floatRec05 := 0; floatRec06 := 0;
  floatRec07 := 0; floatRec08 := 0; floatRec09 := 0;
  floatRec10 := 0; floatRec11 := 0; floatRec12 := 0;

  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(PCPJ_MES_01,0),');
        sql.Add('      COALESCE(PCPJ_MES_02,0),');
        sql.Add('      COALESCE(PCPJ_MES_03,0),');
        sql.Add('      COALESCE(PCPJ_MES_04,0),');
        sql.Add('      COALESCE(PCPJ_MES_05,0),');
        sql.Add('      COALESCE(PCPJ_MES_06,0),');
        sql.Add('      COALESCE(PCPJ_MES_07,0),');
        sql.Add('      COALESCE(PCPJ_MES_08,0),');
        sql.Add('      COALESCE(PCPJ_MES_09,0),');
        sql.Add('      COALESCE(PCPJ_MES_10,0),');
        sql.Add('      COALESCE(PCPJ_MES_11,0),');
        sql.Add('      COALESCE(PCPJ_MES_12,0)');
        sql.Add('FROM  PLANO_CONTAS_PLANEJAMENTO');
        sql.Add('WHERE PCPJ_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   PCPJ_PLCT_ID      = 155');
        sql.Add('AND   PCPJ_PLCT_EMPR_ID = 0');
        sql.Add('AND   PCPJ_ANO          = ' + dmRel_Plano_Contas_Planejamento.cdsRel_Planejamento_AnualPCPJ_ANO.AsString);
        Open;
        try
          floatRec01 := qryCons.Fields[0].AsFloat;
        except
        end;
        try
          floatRec02 := qryCons.Fields[1].AsFloat;
        except
        end;
        try
          floatRec03 := qryCons.Fields[2].AsFloat;
        except
        end;
        try
          floatRec04 := qryCons.Fields[3].AsFloat;
        except
        end;
        try
          floatRec05 := qryCons.Fields[4].AsFloat;
        except
        end;
        try
          floatRec06 := qryCons.Fields[5].AsFloat;
        except
        end;
        try
          floatRec07 := qryCons.Fields[6].AsFloat;
        except
        end;
        try
          floatRec08 := qryCons.Fields[7].AsFloat;
        except
        end;
        try
          floatRec09 := qryCons.Fields[8].AsFloat;
        except
        end;
        try
          floatRec10 := qryCons.Fields[9].AsFloat;
        except
        end;
        try
          floatRec11 := qryCons.Fields[10].AsFloat;
        except
        end;
        try
          floatRec12 := qryCons.Fields[11].AsFloat;
        except
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'QRBand3BeforePrint',e.Message);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;

  lbRec01.Caption := FormatFloat('##,###,###0.00',floatRec01);
  lbRec02.Caption := FormatFloat('##,###,###0.00',floatRec02);
  lbRec03.Caption := FormatFloat('##,###,###0.00',floatRec03);
  lbRec04.Caption := FormatFloat('##,###,###0.00',floatRec04);
  lbRec05.Caption := FormatFloat('##,###,###0.00',floatRec05);
  lbRec06.Caption := FormatFloat('##,###,###0.00',floatRec06);
  lbRec07.Caption := FormatFloat('##,###,###0.00',floatRec07);
  lbRec08.Caption := FormatFloat('##,###,###0.00',floatRec08);
  lbRec09.Caption := FormatFloat('##,###,###0.00',floatRec09);
  lbRec10.Caption := FormatFloat('##,###,###0.00',floatRec10);
  lbRec11.Caption := FormatFloat('##,###,###0.00',floatRec11);
  lbRec12.Caption := FormatFloat('##,###,###0.00',floatRec12);

  lb01.Caption    := FormatFloat('##,###,###0.00',float01);
  lb02.Caption    := FormatFloat('##,###,###0.00',float02);
  lb03.Caption    := FormatFloat('##,###,###0.00',float03);
  lb04.Caption    := FormatFloat('##,###,###0.00',float04);
  lb05.Caption    := FormatFloat('##,###,###0.00',float05);
  lb06.Caption    := FormatFloat('##,###,###0.00',float06);
  lb07.Caption    := FormatFloat('##,###,###0.00',float07);
  lb08.Caption    := FormatFloat('##,###,###0.00',float08);
  lb09.Caption    := FormatFloat('##,###,###0.00',float09);
  lb10.Caption    := FormatFloat('##,###,###0.00',float10);
  lb11.Caption    := FormatFloat('##,###,###0.00',float11);
  lb12.Caption    := FormatFloat('##,###,###0.00',float12);

  lbTot01.Caption := FormatFloat('##,###,###0.00',(floatRec01 - float01));
  lbTot02.Caption := FormatFloat('##,###,###0.00',(floatRec02 - float02));
  lbTot03.Caption := FormatFloat('##,###,###0.00',(floatRec03 - float03));
  lbTot04.Caption := FormatFloat('##,###,###0.00',(floatRec04 - float04));
  lbTot05.Caption := FormatFloat('##,###,###0.00',(floatRec05 - float05));
  lbTot06.Caption := FormatFloat('##,###,###0.00',(floatRec06 - float06));
  lbTot07.Caption := FormatFloat('##,###,###0.00',(floatRec07 - float07));
  lbTot08.Caption := FormatFloat('##,###,###0.00',(floatRec08 - float08));
  lbTot09.Caption := FormatFloat('##,###,###0.00',(floatRec09 - float09));
  lbTot10.Caption := FormatFloat('##,###,###0.00',(floatRec10 - float10));
  lbTot11.Caption := FormatFloat('##,###,###0.00',(floatRec11 - float11));
  lbTot12.Caption := FormatFloat('##,###,###0.00',(floatRec12 - float12));
  lbTotalDeb.Caption  := FormatFloat('##,###,###0.00',(float01 +
                                                       float02 +
                                                       float03 +
                                                       float04 +
                                                       float05 +
                                                       float06 +
                                                       float07 +
                                                       float08 +
                                                       float09 +
                                                       float10 +
                                                       float11 +
                                                       float12));
  lbTotalCred.Caption := FormatFloat('##,###,###0.00',(floatRec01  +
                                                       floatRec02  +
                                                       floatRec03  +
                                                       floatRec04  +
                                                       floatRec05  +
                                                       floatRec06  +
                                                       floatRec07  +
                                                       floatRec08  +
                                                       floatRec09  +
                                                       floatRec10  +
                                                       floatRec11  +
                                                       floatRec12));
  lbPrevisao.Caption := FormatFloat('##,###,###0.00',(
                                                      (floatRec01 - float01) +
                                                      (floatRec02 - float02) +
                                                      (floatRec03 - float03) +
                                                      (floatRec04 - float04) +
                                                      (floatRec05 - float05) +
                                                      (floatRec06 - float06) +
                                                      (floatRec07 - float07) +
                                                      (floatRec08 - float08) +
                                                      (floatRec09 - float09) +
                                                      (floatRec10 - float10) +
                                                      (floatRec11 - float11) +
                                                      (floatRec12 - float12)));

end;

procedure TfRel_Planejamento_Anual_Sintetico.qrepRelatorioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  if not boolVisual then begin
    ChildBand1.Height   := 0;
    QRShape14.Enabled := false;
  end else begin
    ChildBand1.Height   := 15;
    QRShape14.Enabled := true;
  end;
end;

procedure TfRel_Planejamento_Anual_Sintetico.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  float01 := 0; float02 := 0; float03 := 0;
  float04 := 0; float05 := 0; float06 := 0;
  float07 := 0; float08 := 0; float09 := 0;
  float10 := 0; float11 := 0; float12 := 0;
end;

end.
