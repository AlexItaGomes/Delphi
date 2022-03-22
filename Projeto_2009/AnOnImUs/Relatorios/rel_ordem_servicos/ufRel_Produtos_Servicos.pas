unit ufRel_Produtos_Servicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufImpressoes, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, StdCtrls;

type
  TfRel_Produtos_Servicos = class(TfImpressoes)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand4: TQRBand;
    QRGroup2: TQRGroup;
    QRBand5: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRGroup3: TQRGroup;
    QRBand6: TQRBand;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    lbInterna: TQRLabel;
    lbExterna: TQRLabel;
    lbBalcao: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    lbTotInterno: TQRLabel;
    lbTotExterno: TQRLabel;
    lbTotBalcao: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    lbGeralInterno: TQRLabel;
    lbGeralExterno: TQRLabel;
    lbGeralBalcao: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    lblTotalGeral: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel40: TQRLabel;
    lblDesconto: TQRLabel;
    QRLabel42: TQRLabel;
    lblTotal: TQRLabel;
    lblTotalOS: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrepRelatorioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    fltInterno,
    fltExterno,
    fltBalcao,
    fltTotInterno,
    fltTotExterno,
    fltTotBalcao,
    fltTotal,
    fltTotalGeral,
    fltPercDesc,
    fltTotalDesconto,
    fltTotGeralInterno,
    fltTotGeralExterno,
    fltTotGeralBalcao : Real;
    FTipo: Integer;
  public
    property Tipo : Integer read FTipo write FTipo;
  end;

var
  fRel_Produtos_Servicos: TfRel_Produtos_Servicos;

implementation

uses udmRel_Ordem_Servicos;

{$R *.dfm}

procedure TfRel_Produtos_Servicos.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  with dmRel_Ordem_Servico do begin
    try
      fltPercDesc := 0;
      ///Calculo em Percentual
      if cdsComissao_Pecas_Servicos.FieldByName('PROD_TIPO_COMISSAO').AsInteger = 0 then begin
        if dmRel_Ordem_Servico.cdsComissao_Pecas_ServicosORDS_VLR_DESCONTO.AsFloat > 0 then begin
          fltPercDesc := dmRel_Ordem_Servico.cdsComissao_Pecas_ServicosVLR_PERC_DESC.AsFloat;
        end;
        try
          fltInterno := (((cdsComissao_Pecas_Servicos.FieldByName('ODIT_VLR_UNITARIO').AsFloat / 100) *
                           cdsComissao_Pecas_Servicos.FieldByName('PROD_COMISSAO_VEND_INTERNA').AsFloat) *
                          (cdsComissao_Pecas_Servicos.FieldByName('ODIT_QTDE').AsFloat));
        except
          fltInterno := 0;
        end;
        try
          fltExterno := (((cdsComissao_Pecas_Servicos.FieldByName('ODIT_VLR_UNITARIO').AsFloat / 100) *
                           cdsComissao_Pecas_Servicos.FieldByName('PROD_COMISSAO_VEND_EXTERNO').AsFloat) *
                          (cdsComissao_Pecas_Servicos.FieldByName('ODIT_QTDE').AsFloat));
        except
          fltExterno := 0;
        end;
        try
          fltBalcao := (((cdsComissao_Pecas_Servicos.FieldByName('ODIT_VLR_UNITARIO').AsFloat / 100) *
                          cdsComissao_Pecas_Servicos.FieldByName('PROD_COMISSAO_VEND_BALCAO').AsFloat) *
                         (cdsComissao_Pecas_Servicos.FieldByName('ODIT_QTDE').AsFloat));
        except
          fltBalcao := 0;
        end;
      ///Calculo em Real
      end else begin
        try
          fltInterno := (cdsComissao_Pecas_Servicos.FieldByName('PROD_COMISSAO_VEND_INTERNA').AsFloat *
                         cdsComissao_Pecas_Servicos.FieldByName('ODIT_QTDE').AsFloat);
        except
          fltInterno := 0;
        end;
        try
          fltExterno := (dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos.FieldByName('PROD_COMISSAO_VEND_EXTERNO').AsFloat *
                         dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos.FieldByName('ODIT_QTDE').AsFloat);
        except
          fltExterno := 0;
        end;
        try
          fltBalcao := (cdsComissao_Pecas_Servicos.FieldByName('PROD_COMISSAO_VEND_BALCAO').AsFloat *
                        cdsComissao_Pecas_Servicos.FieldByName('ODIT_QTDE').AsFloat);
        except
          fltBalcao := 0;
        end;
      end;
    except
    end;
  end;
  fltTotal           := fltTotal + dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos.FieldByName('ODIT_VLR_TOTAL').AsFloat;
  fltTotalGeral      := fltTotalGeral + dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos.FieldByName('ODIT_VLR_TOTAL').AsFloat;
  fltTotInterno      := fltTotInterno + fltInterno;
  fltTotExterno      := fltTotExterno + fltExterno;
  fltTotBalcao       := fltTotBalcao  + fltBalcao;
  lbInterna.Caption  := FormatFloat('###,###,##0.00',fltInterno);
  lbExterna.Caption  := FormatFloat('###,###,##0.00',fltExterno);
  lbBalcao.Caption   := FormatFloat('###,###,##0.00',fltBalcao);
end;

procedure TfRel_Produtos_Servicos.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lbGeralInterno.Caption := FormatFloat('###,###,##0.00',fltTotGeralInterno);
  lbGeralExterno.Caption := FormatFloat('###,###,##0.00',fltTotGeralExterno);
  lbGeralBalcao.Caption  := FormatFloat('###,###,##0.00',fltTotGeralBalcao);
  lblTotalGeral.Caption  := FormatFloat('###,###,##0.00',fltTotalGeral-fltTotalDesconto);
end;

procedure TfRel_Produtos_Servicos.QRBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lbTotInterno.Caption := FormatFloat('###,###,##0.00',((fltTotInterno/100)*(100-fltPercDesc)));
  lbTotExterno.Caption := FormatFloat('###,###,##0.00',((fltTotExterno/100)*(100-fltPercDesc)));
  lbTotBalcao.Caption  := FormatFloat('###,###,##0.00',((fltTotBalcao /100)*(100-fltPercDesc)));
  fltTotGeralInterno   := fltTotGeralInterno+((fltTotInterno/100)*(100-fltPercDesc));
  fltTotGeralExterno   := fltTotGeralExterno+((fltTotExterno/100)*(100-fltPercDesc));
  fltTotGeralBalcao    := fltTotGeralBalcao +((fltTotBalcao /100)*(100-fltPercDesc));
  lblTotal.Caption     := FormatFloat('###,###,##0.00',fltTotal);
  lblDesconto.Caption  := FormatFloat('###,###,##0.00',dmRel_Ordem_Servico.cdsComissao_Pecas_ServicosORDS_VLR_DESCONTO.AsFloat);
  lblTotalOS.Caption   := FormatFloat('###,###,##0.00',fltTotal-dmRel_Ordem_Servico.cdsComissao_Pecas_ServicosORDS_VLR_DESCONTO.AsFloat);
  fltTotalDesconto     := fltTotalDesconto+dmRel_Ordem_Servico.cdsComissao_Pecas_ServicosORDS_VLR_DESCONTO.AsFloat;
  fltTotGeralInterno := 0;
  fltTotGeralExterno := 0;
  fltTotGeralBalcao  := 0;
  fltTotalGeral      := 0;
  fltTotalDesconto   := 0;
  fltTotInterno      := 0;
  fltTotExterno      := 0;
  fltTotBalcao       := 0;
  fltTotal           := 0;
end;

procedure TfRel_Produtos_Servicos.qrepRelatorioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  QRDBText26.Enabled := false;
  QRDBText1.Enabled  := false;
  case Tipo of
    3 : begin
      QRGroup1.Expression  := 'cdsComissao_Pecas_Servicos.USER_NOME_TECNICO';
      QRLabel3.Caption     := 'Técnico:';
      QRDBText1.Enabled    := true;
    end;
    4 : begin
      QRGroup1.Expression  := 'cdsComissao_Pecas_Servicos.ATENDENTE';
      QRLabel3.Caption     := 'Atendente:';
      QRDBText26.Enabled   := true;
    end;
  end;
end;

procedure TfRel_Produtos_Servicos.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  fltTotGeralInterno := 0;
  fltTotGeralExterno := 0;
  fltTotGeralBalcao  := 0;
end;

procedure TfRel_Produtos_Servicos.QRGroup3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  fltInterno    := 0;
  fltExterno    := 0;
  fltBalcao     := 0;
  fltTotInterno := 0;
  fltTotExterno := 0;
  fltTotBalcao  := 0;
  fltTotal      := 0;
end;

end.
