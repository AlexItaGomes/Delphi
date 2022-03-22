unit ufIRPF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, frxClass, frxDBSet, frxDesgn, Menus, Funcoes, ExtCtrls, DB,
  Grids, DBGrids, StdCtrls, Buttons, SQLExpr;

type
  TfIRPF = class(TfBasico)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    cmbAnos: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    procedure CarregaCombo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fIRPF: TfIRPF;

implementation

uses ufRelIRPF, QuickRpt;

{$R *.dfm}

procedure TfIRPF.FormCreate(Sender: TObject);
begin
  inherited;
  CarregaCombo();
end;

procedure TfIRPF.btnNovoClick(Sender: TObject);
var
  qryCons,qryConsII, qryConsIII : TSQLQuery;

{$REGION 'OcultaBanda'}
  procedure OcultaBanda(strNomeBanda, strNomeDetalhes, strNomeRodape : String);
  begin
    TQRBand(RelIRPF.FindComponent(strNomeBanda)).Visible    := false;
    TQRBand(RelIRPF.FindComponent(strNomeBanda)).Enabled    := false;
    TQRBand(RelIRPF.FindComponent(strNomeBanda)).Height     := 0;
    TQRBand(RelIRPF.FindComponent(strNomeDetalhes)).Visible := false;
    TQRBand(RelIRPF.FindComponent(strNomeDetalhes)).Enabled := false;
    TQRBand(RelIRPF.FindComponent(strNomeDetalhes)).Height  := 0;
    TQRBand(RelIRPF.FindComponent(strNomeRodape)).Visible   := false;
    TQRBand(RelIRPF.FindComponent(strNomeRodape)).Enabled   := false;
    TQRBand(RelIRPF.FindComponent(strNomeRodape)).Height    := 0;
  end;
{$ENDREGION}

{$REGION '01 - RendimentosTributaveis'}
  procedure RendimentosTributaveis(strIRPF_RENDIMENTOS_RECEBIDOS,
                                   strIRPF_CONTRIBUICAO_PREVIDENCIA,
                                   strIRPF_IMPOSTO_RETIDO_FONTE,
                                   strIRPF_13_SALARIO : String);
  var
    fltTotalRendimentos,
    fltTotalPrevidencia,
    fltTotalIR,
    fltTotal13 : Real;
  begin
    if (Trim(strIRPF_RENDIMENTOS_RECEBIDOS)    = '') and
       (Trim(strIRPF_CONTRIBUICAO_PREVIDENCIA) = '') and
       (Trim(strIRPF_IMPOSTO_RETIDO_FONTE)     = '') and
       (Trim(strIRPF_13_SALARIO)               = '') then begin
      OcultaBanda('QRBand3','qr_01_Detalhes','qr_01_Rodape');
      Exit;
    end;
    try
      qryConsII.Close;
      qryConsII.SQL.Clear;
      qryConsII.SQL.Add('SELECT CLIE.CLIE_RAZAO_SOCIAL,');
      qryConsII.SQL.Add('       CLIE.CLIE_CNPJ_CPF,');
      qryConsII.SQL.Add('       SUM(ACRE.ACRE_VALOR_DOC)             AS TOTAL');
      qryConsII.SQL.Add('  FROM CONTAS_RECEBER                       CREC');
      qryConsII.SQL.Add(' INNER JOIN CONTAS_RECEBER_ACERTOS          ACRE');
      qryConsII.SQL.Add('    ON (ACRE.ACRE_CREC_ID                   = CREC.CREC_ID');
      qryConsII.SQL.Add('   AND ACRE.ACRE_CREC_EMPR_ID               = CREC.CREC_EMPR_ID)');
      qryConsII.SQL.Add(' INNER JOIN CLIENTES                        CLIE');
      qryConsII.SQL.Add('    ON (CLIE.CLIE_ID                        = CREC.CREC_CLIE_ID');
      qryConsII.SQL.Add('   AND CLIE.CLIE_EMPR_ID                    = CREC.CREC_CLIE_EMPR_ID)');
      qryConsII.SQL.Add(' WHERE CREC.CREC_EMPR_ID                    = ' + IntToStr(funcBasico.Empr_ID));
      qryConsII.SQL.Add('   AND CREC.CREC_PLCT_ID                   IN ('+strIRPF_RENDIMENTOS_RECEBIDOS+')');
      qryConsII.SQL.Add('   AND CREC.CREC_PLCT_EMPR_ID               = 0');
      qryConsII.SQL.Add('   AND ACRE.ACRE_DTA_CADASTRO              >= ''01.02.' + cmbAnos.Text+'''');
      qryConsII.SQL.Add('   AND ACRE.ACRE_DTA_CADASTRO              <= ''31.01.' + IntToStr(StrToInt(cmbAnos.Text)+1)+'''');
      qryConsII.SQL.Add(' GROUP BY');
      qryConsII.SQL.Add('       CLIE.CLIE_RAZAO_SOCIAL,');
      qryConsII.SQL.Add('       CLIE.CLIE_CNPJ_CPF');
      qryConsII.Open;
      qryConsII.First;
      fltTotalRendimentos := 0; fltTotalPrevidencia := 0; fltTotalIR := 0; fltTotal13 := 0;
      with RelIRPF do begin
        mmFontePagadora.Lines.Clear;
        mmCNPJCPF.Lines.Clear;
        mmRendimentos.Lines.Clear;
        mmPrevidencia.Lines.Clear;
        mmIRRetido.Lines.Clear;
        mm13Salario.Lines.Clear;
        mmTotalRetido.Lines.Clear;
        mmTotalPrevidencia.Lines.Clear;
        mmTotalIR.Lines.Clear;
        mmTotal13.Lines.Clear;
        while not qryConsII.Eof do begin
          ///Rendimentos
          mmFontePagadora.Lines.Add(Copy(qryConsII.FieldByName('CLIE_RAZAO_SOCIAL').AsString,1,47));
          mmCNPJCPF.Lines.Add(qryConsII.FieldByName('CLIE_CNPJ_CPF').AsString);
          mmRendimentos.Lines.Add(FormatFloat('###,###,##0.00',qryConsII.FieldByName('TOTAL').AsFloat));
          fltTotalRendimentos := fltTotalRendimentos + qryConsII.FieldByName('TOTAL').AsFloat;

          ///Previdencia
          qryConsIII.Close;
          qryConsIII.sql.Clear;
          qryConsIII.sql.Add('SELECT');
          qryConsIII.sql.Add('       FORN.FORN_RAZAO_SOCIAL,');
          qryConsIII.sql.Add('       FORN.FORN_CNPJ_CPF,');
          qryConsIII.sql.Add('       PLCT.PLCT_DESCRICAO,');
          qryConsIII.sql.Add('       SUM(COALESCE(ACPG.ACPG_VALOR_DOC*-1,0))       AS TOTAL');
          qryConsIII.sql.Add('  FROM CONTAS_PAGAR                               CPAG');
          qryConsIII.sql.Add(' INNER JOIN CONTAS_PAGAR_ACERTOS                  ACPG');
          qryConsIII.sql.Add('    ON (ACPG.ACPG_CPAG_ID                         = CPAG.CPAG_ID');
          qryConsIII.sql.Add('   AND ACPG.ACPG_CPAG_EMPR_ID                     = CPAG.CPAG_EMPR_ID)');
          qryConsIII.sql.Add(' INNER JOIN FORNECEDORES                          FORN');
          qryConsIII.sql.Add('    ON (FORN.FORN_ID                              = CPAG.CPAG_FORN_ID)');
          qryConsIII.sql.Add(' INNER JOIN PLANO_CONTAS                          PLCT');
          qryConsIII.sql.Add('    ON (PLCT.PLCT_ID                              = CPAG.CPAG_PLCT_ID');
          qryConsIII.sql.Add('   AND PLCT.PLCT_EMPR_ID                          = CPAG.CPAG_PLCT_EMPR_ID)');
          qryConsIII.sql.Add(' WHERE CPAG.CPAG_EMPR_ID                          = ' + IntToStr(funcLocal.Empr_ID));
          qryConsIII.sql.Add('   AND CPAG.CPAG_PLCT_ID                          IN ('+strIRPF_CONTRIBUICAO_PREVIDENCIA+')');
          qryConsIII.sql.Add('   AND CPAG.CPAG_PLCT_EMPR_ID                     = 0');
          qryConsIII.sql.Add('   AND ACPG.ACPG_DTA_CADASTRO                    >= ''01.02.' + cmbAnos.Text+'''');
          qryConsIII.sql.Add('   AND ACPG.ACPG_DTA_CADASTRO                    <= ''31.01.' + IntToStr(StrToInt(cmbAnos.Text)+1)+'''');
          qryConsIII.sql.Add('   AND FORN.FORN_CNPJ_CPF                         = ' + QuotedStr(qryConsII.FieldByName('CLIE_CNPJ_CPF').AsString));
          qryConsIII.sql.Add(' GROUP BY');
          qryConsIII.sql.Add('       FORN.FORN_RAZAO_SOCIAL,');
          qryConsIII.sql.Add('       FORN.FORN_CNPJ_CPF,');
          qryConsIII.sql.Add('       PLCT.PLCT_DESCRICAO');
          qryConsIII.Open;
          mmPrevidencia.Lines.Add(FormatFloat('###,###,##0.00',qryConsIII.FieldByName('TOTAL').AsFloat));
          fltTotalPrevidencia := fltTotalPrevidencia + qryConsIII.FieldByName('TOTAL').AsFloat;

          ///IR Retido
          qryConsIII.Close;
          qryConsIII.sql.Clear;
          qryConsIII.sql.Add('SELECT');
          qryConsIII.sql.Add('       FORN.FORN_RAZAO_SOCIAL,');
          qryConsIII.sql.Add('       FORN.FORN_CNPJ_CPF,');
          qryConsIII.sql.Add('       PLCT.PLCT_DESCRICAO,');
          qryConsIII.sql.Add('       SUM(COALESCE(ACPG.ACPG_VALOR_DOC*-1,0))       AS TOTAL');
          qryConsIII.sql.Add('  FROM CONTAS_PAGAR                               CPAG');
          qryConsIII.sql.Add(' INNER JOIN CONTAS_PAGAR_ACERTOS                  ACPG');
          qryConsIII.sql.Add('    ON (ACPG.ACPG_CPAG_ID                         = CPAG.CPAG_ID');
          qryConsIII.sql.Add('   AND ACPG.ACPG_CPAG_EMPR_ID                     = CPAG.CPAG_EMPR_ID)');
          qryConsIII.sql.Add(' INNER JOIN FORNECEDORES                          FORN');
          qryConsIII.sql.Add('    ON (FORN.FORN_ID                              = CPAG.CPAG_FORN_ID)');
          qryConsIII.sql.Add(' INNER JOIN PLANO_CONTAS                          PLCT');
          qryConsIII.sql.Add('    ON (PLCT.PLCT_ID                              = CPAG.CPAG_PLCT_ID');
          qryConsIII.sql.Add('   AND PLCT.PLCT_EMPR_ID                          = CPAG.CPAG_PLCT_EMPR_ID)');
          qryConsIII.sql.Add(' WHERE CPAG.CPAG_EMPR_ID                          = ' + IntToStr(funcLocal.Empr_ID));
          qryConsIII.sql.Add('   AND CPAG.CPAG_PLCT_ID                          IN ('+strIRPF_IMPOSTO_RETIDO_FONTE+')');
          qryConsIII.sql.Add('   AND CPAG.CPAG_PLCT_EMPR_ID                     = 0');
          qryConsIII.sql.Add('   AND ACPG.ACPG_DTA_CADASTRO                    >= ''01.02.' + cmbAnos.Text+'''');
          qryConsIII.sql.Add('   AND ACPG.ACPG_DTA_CADASTRO                    <= ''31.01.' + IntToStr(StrToInt(cmbAnos.Text)+1)+'''');
          qryConsIII.sql.Add('   AND FORN.FORN_CNPJ_CPF                         = ' + QuotedStr(qryConsII.FieldByName('CLIE_CNPJ_CPF').AsString));
          qryConsIII.sql.Add(' GROUP BY');
          qryConsIII.sql.Add('       FORN.FORN_RAZAO_SOCIAL,');
          qryConsIII.sql.Add('       FORN.FORN_CNPJ_CPF,');
          qryConsIII.sql.Add('       PLCT.PLCT_DESCRICAO');
          qryConsIII.Open;
          mmIRRetido.Lines.Add(FormatFloat('###,###,##0.00',qryConsIII.FieldByName('TOTAL').AsFloat));
          fltTotalIR := fltTotalIR + qryConsIII.FieldByName('TOTAL').AsFloat;

          ///13 Salario
          qryConsIII.SQL.Clear;
          qryConsIII.SQL.Add('SELECT CLIE.CLIE_RAZAO_SOCIAL,');
          qryConsIII.SQL.Add('       CLIE.CLIE_CNPJ_CPF,');
          qryConsIII.SQL.Add('       SUM(ACRE.ACRE_VALOR_DOC)             AS TOTAL');
          qryConsIII.SQL.Add('  FROM CONTAS_RECEBER                       CREC');
          qryConsIII.SQL.Add(' INNER JOIN CONTAS_RECEBER_ACERTOS          ACRE');
          qryConsIII.SQL.Add('    ON (ACRE.ACRE_CREC_ID                   = CREC.CREC_ID');
          qryConsIII.SQL.Add('   AND ACRE.ACRE_CREC_EMPR_ID               = CREC.CREC_EMPR_ID)');
          qryConsIII.SQL.Add(' INNER JOIN CLIENTES                        CLIE');
          qryConsIII.SQL.Add('    ON (CLIE.CLIE_ID                        = CREC.CREC_CLIE_ID');
          qryConsIII.SQL.Add('   AND CLIE.CLIE_EMPR_ID                    = CREC.CREC_CLIE_EMPR_ID)');
          qryConsIII.SQL.Add(' WHERE CREC.CREC_EMPR_ID                    = ' + IntToStr(funcBasico.Empr_ID));
          qryConsIII.SQL.Add('   AND CREC.CREC_PLCT_ID                   IN ('+strIRPF_13_SALARIO+')');
          qryConsIII.SQL.Add('   AND CREC.CREC_PLCT_EMPR_ID               = 0');
          qryConsIII.SQL.Add('   AND ACRE.ACRE_DTA_CADASTRO              >= ''01.02.' + cmbAnos.Text+'''');
          qryConsIIi.SQL.Add('   AND ACRE.ACRE_DTA_CADASTRO              <= ''31.01.' + IntToStr(StrToInt(cmbAnos.Text)+1)+'''');
          qryConsIII.SQL.Add('   AND CLIE.CLIE_CNPJ_CPF                   = ' + QuotedStr(qryConsII.FieldByName('CLIE_CNPJ_CPF').AsString));
          qryConsIII.SQL.Add(' GROUP BY');
          qryConsIII.SQL.Add('       CLIE.CLIE_RAZAO_SOCIAL,');
          qryConsIII.SQL.Add('       CLIE.CLIE_CNPJ_CPF');
          qryConsIII.Open;
          mm13Salario.Lines.Add(FormatFloat('###,###,##0.00',qryConsIII.FieldByName('TOTAL').AsFloat));
          fltTotal13 := fltTotal13 + qryConsIII.FieldByName('TOTAL').AsFloat;
          qryConsII.Next;
        end;
        mmTotalRetido.Lines.Add(FormatFloat('###,###,##0.00',fltTotalRendimentos));
        mmTotalPrevidencia.Lines.Add(FormatFloat('###,###,##0.00',fltTotalPrevidencia));
        mmTotalIR.Lines.Add(FormatFloat('###,###,##0.00',fltTotalIR));
        mmTotal13.Lines.Add(FormatFloat('###,###,##0.00',fltTotal13));
      end;
    finally
      qryConsII.Close;
    end;
  end;
{$ENDREGION}

{$REGION '02 - RendimentosPJExterior'}
  procedure RendimentosPJExterior(strIRPF_RENDIMENTOS_PESSOA_FISICA,
                                  strIRPF_REDIMENTOS_EXTERIOR,
                                  strIRPF_PREVIDENCIA_OFICIAL,
                                  strIRPF_PENSAO_ALIMENTICIA,
                                  strIRPF_LIVRO_CAIXA,
                                  strIRPF_DARF_PAGO : String);
  var
    ArrayValores : Array[1..12] of Real;
    intI         : Integer;
    fltTotalRendimentosPJ,
    fltTotalRendimentosEX,
    fltTotalPrevidencia,
    fltTotalPensao,
    fltTotalLivro,
    fltTotalDarf : Real;
  begin
    if (Trim(strIRPF_RENDIMENTOS_PESSOA_FISICA) = '') and
       (Trim(strIRPF_REDIMENTOS_EXTERIOR)       = '') and
       (Trim(strIRPF_PREVIDENCIA_OFICIAL)       = '') and
       (Trim(strIRPF_PENSAO_ALIMENTICIA)        = '') and
       (Trim(strIRPF_LIVRO_CAIXA)               = '') and
       (Trim(strIRPF_DARF_PAGO)                 = '') then begin
      OcultaBanda('qr_02_Titulo','qr_02_Detalhes','qr_02_Rodape');
      Exit;
    end;
    try
      fltTotalRendimentosPJ := 0; fltTotalRendimentosEX := 0;
      fltTotalPrevidencia   := 0; fltTotalPensao        := 0;
      fltTotalLivro         := 0; fltTotalDarf          := 0;
      with RelIRPF do begin
        mmRendimentoPJ.Lines.Clear;  mmRendimentoEX.Lines.Clear;
        mmPrevidencias.Lines.Clear;  mmPensao.Lines.Clear;
        mmLivro.Lines.Clear;         mmDarf.Lines.Clear;
        mmMes.Lines.Clear;
        mmMes.Lines.Add('Janeiro');   mmMes.Lines.Add('Fevereiro');
        mmMes.Lines.Add('Março');     mmMes.Lines.Add('Abril');
        mmMes.Lines.Add('Maio');      mmMes.Lines.Add('Junho');
        mmMes.Lines.Add('Julho');     mmMes.Lines.Add('Agosto');
        mmMes.Lines.Add('Setembro');  mmMes.Lines.Add('Outubro');
        mmMes.Lines.Add('Novembro');  mmMes.Lines.Add('Dezembro');
      end;
      ///Rendimento Pessoa Fisica
      for intI := 1 to 12 do begin
        ArrayValores[intI] := 0;
      end;
      qryConsII.Close;
      qryConsII.SQL.Clear;
      qryConsII.SQL.Add('SELECT EXTRACT(MONTH FROM ACRE.ACRE_DTA_CADASTRO) AS MES,');
      qryConsII.SQL.Add('       SUM(COALESCE(ACRE.ACRE_VALOR_DOC,0))       AS TOTAL');
      qryConsII.SQL.Add('  FROM CONTAS_RECEBER                       CREC');
      qryConsII.SQL.Add(' INNER JOIN PLANO_CONTAS                    PLCT');
      qryConsII.SQL.Add('    ON (PLCT.PLCT_ID                        = CREC.CREC_PLCT_ID');
      qryConsII.SQL.Add('   AND PLCT.PLCT_EMPR_ID                    = CREC.CREC_PLCT_EMPR_ID)');
      qryConsII.SQL.Add(' INNER JOIN CONTAS_RECEBER_ACERTOS          ACRE');
      qryConsII.SQL.Add('    ON (ACRE.ACRE_CREC_ID                   = CREC.CREC_ID');
      qryConsII.SQL.Add('   AND ACRE.ACRE_CREC_EMPR_ID               = CREC.CREC_EMPR_ID)');
      qryConsII.SQL.Add(' INNER JOIN CLIENTES                        CLIE');
      qryConsII.SQL.Add('    ON (CLIE.CLIE_ID                        = CREC.CREC_CLIE_ID');
      qryConsII.SQL.Add('   AND CLIE.CLIE_EMPR_ID                    = CREC.CREC_CLIE_EMPR_ID)');
      qryConsII.SQL.Add(' WHERE CREC.CREC_EMPR_ID                    = ' + IntToStr(funcBasico.Empr_ID));
      qryConsII.SQL.Add('   AND CREC.CREC_PLCT_ID                   IN ('+strIRPF_RENDIMENTOS_PESSOA_FISICA+')');
      qryConsII.SQL.Add('   AND CREC.CREC_PLCT_EMPR_ID               = 0');
      qryConsII.SQL.Add('   AND EXTRACT(YEAR FROM ACRE.ACRE_DTA_CADASTRO) = ' + cmbAnos.Text);
      qryConsII.SQL.Add(' GROUP BY');
      qryConsII.SQL.Add('       EXTRACT(MONTH FROM ACRE.ACRE_DTA_CADASTRO)');
      qryConsII.SQL.Add(' ORDER BY');
      qryConsII.SQL.Add('       EXTRACT(MONTH FROM ACRE.ACRE_DTA_CADASTRO)');
      qryConsII.Open;
      if not qryConsII.IsEmpty then begin
        qryConsII.First;
        while not qryConsII.Eof do begin
          ArrayValores[qryConsII.Fields[0].AsInteger] := qryConsII.Fields[1].AsFloat;
          qryConsII.Next;
        end;
      end;
      for intI := 1 to 12 do begin
        RelIRPF.mmRendimentoPJ.Lines.Add(FormatFloat('###,###,##0.00',ArrayValores[intI]));
        fltTotalRendimentosPJ := fltTotalRendimentosPJ + ArrayValores[intI];
      end;

      ///Rendimentos Exterior
      for intI := 1 to 12 do begin
        ArrayValores[intI] := 0;
      end;
      qryConsII.Close;
      qryConsII.SQL.Clear;
      qryConsII.SQL.Add('SELECT EXTRACT(MONTH FROM ACRE.ACRE_DTA_CADASTRO) AS MES,');
      qryConsII.SQL.Add('       SUM(COALESCE(ACRE.ACRE_VALOR_DOC,0))       AS TOTAL');
      qryConsII.SQL.Add('  FROM CONTAS_RECEBER                       CREC');
      qryConsII.SQL.Add(' INNER JOIN PLANO_CONTAS                    PLCT');
      qryConsII.SQL.Add('    ON (PLCT.PLCT_ID                        = CREC.CREC_PLCT_ID');
      qryConsII.SQL.Add('   AND PLCT.PLCT_EMPR_ID                    = CREC.CREC_PLCT_EMPR_ID)');
      qryConsII.SQL.Add(' INNER JOIN CONTAS_RECEBER_ACERTOS          ACRE');
      qryConsII.SQL.Add('    ON (ACRE.ACRE_CREC_ID                   = CREC.CREC_ID');
      qryConsII.SQL.Add('   AND ACRE.ACRE_CREC_EMPR_ID               = CREC.CREC_EMPR_ID)');
      qryConsII.SQL.Add(' INNER JOIN CLIENTES                        CLIE');
      qryConsII.SQL.Add('    ON (CLIE.CLIE_ID                        = CREC.CREC_CLIE_ID');
      qryConsII.SQL.Add('   AND CLIE.CLIE_EMPR_ID                    = CREC.CREC_CLIE_EMPR_ID)');
      qryConsII.SQL.Add(' WHERE CREC.CREC_EMPR_ID                    = ' + IntToStr(funcBasico.Empr_ID));
      qryConsII.SQL.Add('   AND CREC.CREC_PLCT_ID                   IN ('+strIRPF_REDIMENTOS_EXTERIOR+')');
      qryConsII.SQL.Add('   AND CREC.CREC_PLCT_EMPR_ID               = 0');
      qryConsII.SQL.Add('   AND EXTRACT(YEAR FROM ACRE.ACRE_DTA_CADASTRO) = ' + cmbAnos.Text);
      qryConsII.SQL.Add(' GROUP BY');
      qryConsII.SQL.Add('       EXTRACT(MONTH FROM ACRE.ACRE_DTA_CADASTRO)');
      qryConsII.SQL.Add(' ORDER BY');
      qryConsII.SQL.Add('       EXTRACT(MONTH FROM ACRE.ACRE_DTA_CADASTRO)');
      qryConsII.Open;
      if not qryConsII.IsEmpty then begin
        qryConsII.First;
        while not qryConsII.Eof do begin
          ArrayValores[qryConsII.Fields[0].AsInteger] := qryConsII.Fields[1].AsFloat;
          qryConsII.Next;
        end;
      end;
      for intI := 1 to 12 do begin
        RelIRPF.mmRendimentoEX.Lines.Add(FormatFloat('###,###,##0.00',ArrayValores[intI]));
        fltTotalRendimentosEX := fltTotalRendimentosEX + ArrayValores[intI];
      end;

      ///Previdencia Oficial
      for intI := 1 to 12 do begin
        ArrayValores[intI] := 0;
      end;
      qryConsII.Close;
      qryConsII.SQL.Clear;
      qryConsII.SQL.Add('SELECT EXTRACT(MONTH FROM ACPG.ACPG_DTA_CADASTRO) AS MES,');
      qryConsII.SQL.Add('       SUM(COALESCE(ACPG.ACPG_VALOR_DOC*-1,0))    AS TOTAL');
      qryConsII.SQL.Add('  FROM CONTAS_PAGAR                               CPAG');
      qryConsII.SQL.Add(' INNER JOIN PLANO_CONTAS                          PLCT');
      qryConsII.SQL.Add('    ON (PLCT.PLCT_ID                              = CPAG.CPAG_PLCT_ID');
      qryConsII.SQL.Add('   AND PLCT.PLCT_EMPR_ID                          = CPAG.CPAG_PLCT_EMPR_ID)');
      qryConsII.SQL.Add(' INNER JOIN CONTAS_PAGAR_ACERTOS                  ACPG');
      qryConsII.SQL.Add('    ON (ACPG.ACPG_CPAG_ID                         = CPAG.CPAG_ID');
      qryConsII.SQL.Add('   AND ACPG.ACPG_CPAG_EMPR_ID                     = CPAG.CPAG_EMPR_ID)');
      qryConsII.SQL.Add(' WHERE CPAG.CPAG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
      qryConsII.SQL.Add('   AND CPAG.CPAG_PLCT_ID                          IN ('+strIRPF_PREVIDENCIA_OFICIAL+')');
      qryConsII.SQL.Add('   AND CPAG.CPAG_PLCT_EMPR_ID                     = 0');
      qryConsII.sql.Add('   AND EXTRACT(YEAR FROM ACPG.ACPG_DTA_CADASTRO)  = ' + cmbAnos.Text);
      qryConsII.SQL.Add(' GROUP BY');
      qryConsII.SQL.Add('       EXTRACT(MONTH FROM ACPG.ACPG_DTA_CADASTRO)');
      qryConsII.SQL.Add(' ORDER BY');
      qryConsII.SQL.Add('       EXTRACT(MONTH FROM ACPG.ACPG_DTA_CADASTRO)');
      qryConsII.Open;
      if not qryConsII.IsEmpty then begin
        qryConsII.First;
        while not qryConsII.Eof do begin
          ArrayValores[qryConsII.Fields[0].AsInteger] := qryConsII.Fields[1].AsFloat;
          qryConsII.Next;
        end;
      end;
      for intI := 1 to 12 do begin
        RelIRPF.mmPrevidencias.Lines.Add(FormatFloat('###,###,##0.00',ArrayValores[intI]));
        fltTotalPrevidencia := fltTotalPrevidencia + ArrayValores[intI];
      end;

      ///Pensão Alimenticia
      for intI := 1 to 12 do begin
        ArrayValores[intI] := 0;
      end;
      qryConsII.Close;
      qryConsII.SQL.Clear;
      qryConsII.SQL.Add('SELECT EXTRACT(MONTH FROM ACPG.ACPG_DTA_CADASTRO) AS MES,');
      qryConsII.SQL.Add('       SUM(COALESCE(ACPG.ACPG_VALOR_DOC*-1,0))    AS TOTAL');
      qryConsII.SQL.Add('  FROM CONTAS_PAGAR                               CPAG');
      qryConsII.SQL.Add(' INNER JOIN PLANO_CONTAS                          PLCT');
      qryConsII.SQL.Add('    ON (PLCT.PLCT_ID                              = CPAG.CPAG_PLCT_ID');
      qryConsII.SQL.Add('   AND PLCT.PLCT_EMPR_ID                          = CPAG.CPAG_PLCT_EMPR_ID)');
      qryConsII.SQL.Add(' INNER JOIN CONTAS_PAGAR_ACERTOS                  ACPG');
      qryConsII.SQL.Add('    ON (ACPG.ACPG_CPAG_ID                         = CPAG.CPAG_ID');
      qryConsII.SQL.Add('   AND ACPG.ACPG_CPAG_EMPR_ID                     = CPAG.CPAG_EMPR_ID)');
      qryConsII.SQL.Add(' WHERE CPAG.CPAG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
      qryConsII.SQL.Add('   AND CPAG.CPAG_PLCT_ID                          IN ('+strIRPF_PENSAO_ALIMENTICIA+')');
      qryConsII.SQL.Add('   AND CPAG.CPAG_PLCT_EMPR_ID                     = 0');
      qryConsII.sql.Add('   AND EXTRACT(YEAR FROM ACPG.ACPG_DTA_CADASTRO)  = ' + cmbAnos.Text);
      qryConsII.SQL.Add(' GROUP BY');
      qryConsII.SQL.Add('       EXTRACT(MONTH FROM ACPG.ACPG_DTA_CADASTRO)');
      qryConsII.SQL.Add(' ORDER BY');
      qryConsII.SQL.Add('       EXTRACT(MONTH FROM ACPG.ACPG_DTA_CADASTRO)');
      qryConsII.Open;
      if not qryConsII.IsEmpty then begin
        qryConsII.First;
        while not qryConsII.Eof do begin
          ArrayValores[qryConsII.Fields[0].AsInteger] := qryConsII.Fields[1].AsFloat;
          qryConsII.Next;
        end;
      end;
      for intI := 1 to 12 do begin
        RelIRPF.mmPensao.Lines.Add(FormatFloat('###,###,##0.00',ArrayValores[intI]));
        fltTotalPensao := fltTotalPensao + ArrayValores[intI];
      end;

      ///Livro Caixa
      for intI := 1 to 12 do begin
        ArrayValores[intI] := 0;
      end;
      qryConsII.Close;
      qryConsII.SQL.Clear;
      qryConsII.SQL.Add('SELECT EXTRACT(MONTH FROM ACPG.ACPG_DTA_CADASTRO) AS MES,');
      qryConsII.SQL.Add('       SUM(COALESCE(ACPG.ACPG_VALOR_DOC*-1,0))    AS TOTAL');
      qryConsII.SQL.Add('  FROM CONTAS_PAGAR                               CPAG');
      qryConsII.SQL.Add(' INNER JOIN PLANO_CONTAS                          PLCT');
      qryConsII.SQL.Add('    ON (PLCT.PLCT_ID                              = CPAG.CPAG_PLCT_ID');
      qryConsII.SQL.Add('   AND PLCT.PLCT_EMPR_ID                          = CPAG.CPAG_PLCT_EMPR_ID)');
      qryConsII.SQL.Add(' INNER JOIN CONTAS_PAGAR_ACERTOS                  ACPG');
      qryConsII.SQL.Add('    ON (ACPG.ACPG_CPAG_ID                         = CPAG.CPAG_ID');
      qryConsII.SQL.Add('   AND ACPG.ACPG_CPAG_EMPR_ID                     = CPAG.CPAG_EMPR_ID)');
      qryConsII.SQL.Add(' WHERE CPAG.CPAG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
      qryConsII.SQL.Add('   AND CPAG.CPAG_PLCT_ID                          IN ('+strIRPF_LIVRO_CAIXA+')');
      qryConsII.SQL.Add('   AND CPAG.CPAG_PLCT_EMPR_ID                     = 0');
      qryConsII.sql.Add('   AND EXTRACT(YEAR FROM ACPG.ACPG_DTA_CADASTRO)  = ' + cmbAnos.Text);
      qryConsII.SQL.Add(' GROUP BY');
      qryConsII.SQL.Add('       EXTRACT(MONTH FROM ACPG.ACPG_DTA_CADASTRO)');
      qryConsII.SQL.Add(' ORDER BY');
      qryConsII.SQL.Add('       EXTRACT(MONTH FROM ACPG.ACPG_DTA_CADASTRO)');
      qryConsII.Open;
      if not qryConsII.IsEmpty then begin
        qryConsII.First;
        while not qryConsII.Eof do begin
          ArrayValores[qryConsII.Fields[0].AsInteger] := qryConsII.Fields[1].AsFloat;
          qryConsII.Next;
        end;
      end;
      for intI := 1 to 12 do begin
        RelIRPF.mmLivro.Lines.Add(FormatFloat('###,###,##0.00',ArrayValores[intI]));
        fltTotalLivro := fltTotalLivro + ArrayValores[intI];
      end;

      ///Darf
      for intI := 1 to 12 do begin
        ArrayValores[intI] := 0;
      end;
      qryConsII.Close;
      qryConsII.SQL.Clear;
      qryConsII.SQL.Add('SELECT EXTRACT(MONTH FROM ACPG.ACPG_DTA_CADASTRO) AS MES,');
      qryConsII.SQL.Add('       SUM(COALESCE(ACPG.ACPG_VALOR_DOC*-1,0))    AS TOTAL');
      qryConsII.SQL.Add('  FROM CONTAS_PAGAR                               CPAG');
      qryConsII.SQL.Add(' INNER JOIN PLANO_CONTAS                          PLCT');
      qryConsII.SQL.Add('    ON (PLCT.PLCT_ID                              = CPAG.CPAG_PLCT_ID');
      qryConsII.SQL.Add('   AND PLCT.PLCT_EMPR_ID                          = CPAG.CPAG_PLCT_EMPR_ID)');
      qryConsII.SQL.Add(' INNER JOIN CONTAS_PAGAR_ACERTOS                  ACPG');
      qryConsII.SQL.Add('    ON (ACPG.ACPG_CPAG_ID                         = CPAG.CPAG_ID');
      qryConsII.SQL.Add('   AND ACPG.ACPG_CPAG_EMPR_ID                     = CPAG.CPAG_EMPR_ID)');
      qryConsII.SQL.Add(' WHERE CPAG.CPAG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
      qryConsII.SQL.Add('   AND CPAG.CPAG_PLCT_ID                          IN ('+strIRPF_DARF_PAGO+')');
      qryConsII.SQL.Add('   AND CPAG.CPAG_PLCT_EMPR_ID                     = 0');
      qryConsII.sql.Add('   AND EXTRACT(YEAR FROM ACPG.ACPG_DTA_CADASTRO)  = ' + cmbAnos.Text);
      qryConsII.SQL.Add(' GROUP BY');
      qryConsII.SQL.Add('       EXTRACT(MONTH FROM ACPG.ACPG_DTA_CADASTRO)');
      qryConsII.SQL.Add(' ORDER BY');
      qryConsII.SQL.Add('       EXTRACT(MONTH FROM ACPG.ACPG_DTA_CADASTRO)');
      qryConsII.Open;
      if not qryConsII.IsEmpty then begin
        qryConsII.First;
        while not qryConsII.Eof do begin
          ArrayValores[qryConsII.Fields[0].AsInteger] := qryConsII.Fields[1].AsFloat;
          qryConsII.Next;
        end;
      end;
      for intI := 1 to 12 do begin
        RelIRPF.mmDARF.Lines.Add(FormatFloat('###,###,##0.00',ArrayValores[intI]));
        fltTotalDarf := fltTotalDarf + ArrayValores[intI];
      end;

      with RelIRPF do begin
        mmTotalRendimentosPJ.Lines.Clear; mmTotalRendimentoEX.Lines.Clear;
        mmTotalPrevidencias.Lines.Clear;  mmTotalPensao.Lines.Clear;
        mmTotalLivro.Lines.Clear;         mmTotalDarf.Lines.Clear;

        mmTotalRendimentosPJ.Lines.Add(FormatFloat('###,###,##0.00',fltTotalRendimentosPJ));
        mmTotalRendimentoEX.Lines.Add(FormatFloat('###,###,##0.00',fltTotalRendimentosEX));
        mmTotalPrevidencias.Lines.Add(FormatFloat('###,###,##0.00',fltTotalPrevidencia));
        mmTotalPensao.Lines.Add(FormatFloat('###,###,##0.00',fltTotalPensao));
        mmTotalLivro.Lines.Add(FormatFloat('###,###,##0.00',fltTotalLivro));
        mmTotalDarf.Lines.Add(FormatFloat('###,###,##0.00',fltTotalDarf));
      end;

    finally
      qryConsII.Close;
    end;
  end;
{$ENDREGION}

{$REGION '03 - RendimentosIsentosNaoTributaveis'}
  procedure RendimentosIsentosNaoTributaveis(strIRPF_RENDIMENTOS_ISENTOS : String);
  var
    fltTotalRendIsentos : Real;
  begin
    if (Trim(strIRPF_RENDIMENTOS_ISENTOS) = '') then begin
      OcultaBanda('qr_03_Titulo','qr_03_Detalhes','qr_03_Rodape');
      Exit;
    end;
    fltTotalRendIsentos := 0;
    RelIRPF.mmRendIsentosFonte.Lines.Clear; RelIRPF.mmRendIsentosCNPJ.Lines.Clear;
    RelIRPF.mmRendIsentosValor.Lines.Clear; RelIRPF.mmRendIsentosTotalValor.Lines.Clear;
    RelIRPF.mmOrigem.Lines.Clear;
    qryConsII.Close;
    qryConsII.sql.Clear;
    qryConsII.SQL.Add('SELECT CLIE.CLIE_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('       CLIE.CLIE_CNPJ_CPF,');
    qryConsII.SQL.Add('       PLCT.PLCT_DESCRICAO,');
    qryConsII.SQL.Add('       SUM(ACRE.ACRE_VALOR_DOC)             AS TOTAL');
    qryConsII.SQL.Add('  FROM CONTAS_RECEBER                       CREC');
    qryConsII.SQL.Add(' INNER JOIN PLANO_CONTAS                    PLCT');
    qryConsII.SQL.Add('    ON (PLCT.PLCT_ID                        = CREC.CREC_PLCT_ID');
    qryConsII.SQL.Add('   AND PLCT.PLCT_EMPR_ID                    = CREC.CREC_PLCT_EMPR_ID)');
    qryConsII.SQL.Add(' INNER JOIN CONTAS_RECEBER_ACERTOS          ACRE');
    qryConsII.SQL.Add('    ON (ACRE.ACRE_CREC_ID                   = CREC.CREC_ID');
    qryConsII.SQL.Add('   AND ACRE.ACRE_CREC_EMPR_ID               = CREC.CREC_EMPR_ID)');
    qryConsII.SQL.Add(' INNER JOIN CLIENTES                        CLIE');
    qryConsII.SQL.Add('    ON (CLIE.CLIE_ID                        = CREC.CREC_CLIE_ID');
    qryConsII.SQL.Add('   AND CLIE.CLIE_EMPR_ID                    = CREC.CREC_CLIE_EMPR_ID)');
    qryConsII.SQL.Add(' WHERE CREC.CREC_EMPR_ID                    = ' + IntToStr(funcBasico.Empr_ID));
    qryConsII.SQL.Add('   AND CREC.CREC_PLCT_ID                   IN ('+strIRPF_RENDIMENTOS_ISENTOS+')');
    qryConsII.SQL.Add('   AND CREC.CREC_PLCT_EMPR_ID               = 0');
    qryConsII.SQL.Add('   AND EXTRACT(YEAR FROM ACRE.ACRE_DTA_CADASTRO) = ' + cmbAnos.Text);
    qryConsII.SQL.Add(' GROUP BY');
    qryConsII.SQL.Add('       CLIE.CLIE_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('       CLIE.CLIE_CNPJ_CPF,');
    qryConsII.SQL.Add('       PLCT.PLCT_DESCRICAO');
    qryConsII.SQL.Add(' ORDER BY');
    qryConsII.SQL.Add('       CLIE.CLIE_RAZAO_SOCIAL');
    qryConsII.Open;
    if not qryConsII.IsEmpty then begin
      qryConsII.First;
      while not qryConsII.Eof do begin
        RelIRPF.mmRendIsentosFonte.Lines.Add(Copy(qryConsII.FieldByName('CLIE_RAZAO_SOCIAL').AsString,1,47));
        RelIRPF.mmRendIsentosCNPJ.Lines.Add(qryConsII.FieldByName('CLIE_CNPJ_CPF').AsString);
        RelIRPF.mmOrigem.Lines.Add(qryConsII.FieldByName('PLCT_DESCRICAO').AsString);
        RelIRPF.mmRendIsentosValor.Lines.Add(FormatFloat('###,###,##0.00',qryConsII.FieldByName('TOTAL').AsFloat));
        fltTotalRendIsentos := fltTotalRendIsentos + qryConsII.FieldByName('TOTAL').AsFloat;
        qryConsII.Next;
      end;
      RelIRPF.mmRendIsentosTotalValor.Lines.Add(FormatFloat('###,###,##0.00',fltTotalRendIsentos));
    end;
  end;
{$ENDREGION}

{$REGION '04 - RendimentosSujeitosTributacao'}
  procedure RendimentosSujeitosTributacao(strIRPF_RENDIMENTOS_SUJEITOS_TRIB : String);
  var
    fltTotalRendSujeito : Real;
  begin
    if (Trim(strIRPF_RENDIMENTOS_SUJEITOS_TRIB) = '') then begin
      OcultaBanda('qr_04_Titulo','qr_04_Detalhes','qr_04_Rodape');
      Exit;
    end;
    fltTotalRendSujeito := 0;
    RelIRPF.mmRendSujeitoFonte.Lines.Clear; RelIRPF.mmRendSujeitoCNPJ.Lines.Clear;
    RelIRPF.mmRendSujeitoValor.Lines.Clear; RelIRPF.mmRendSujeitoTotalValor.Lines.Clear;
    RelIRPF.mmSujeitoOrigem.Lines.Clear;
    qryConsII.Close;
    qryConsII.sql.Clear;
    qryConsII.SQL.Add('SELECT CLIE.CLIE_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('       CLIE.CLIE_CNPJ_CPF,');
    qryConsII.SQL.Add('       PLCT.PLCT_DESCRICAO,');
    qryConsII.SQL.Add('       SUM(ACRE.ACRE_VALOR_DOC)             AS TOTAL');
    qryConsII.SQL.Add('  FROM CONTAS_RECEBER                       CREC');
    qryConsII.SQL.Add(' INNER JOIN PLANO_CONTAS                    PLCT');
    qryConsII.SQL.Add('    ON (PLCT.PLCT_ID                        = CREC.CREC_PLCT_ID');
    qryConsII.SQL.Add('   AND PLCT.PLCT_EMPR_ID                    = CREC.CREC_PLCT_EMPR_ID)');
    qryConsII.SQL.Add(' INNER JOIN CONTAS_RECEBER_ACERTOS          ACRE');
    qryConsII.SQL.Add('    ON (ACRE.ACRE_CREC_ID                   = CREC.CREC_ID');
    qryConsII.SQL.Add('   AND ACRE.ACRE_CREC_EMPR_ID               = CREC.CREC_EMPR_ID)');
    qryConsII.SQL.Add(' INNER JOIN CLIENTES                        CLIE');
    qryConsII.SQL.Add('    ON (CLIE.CLIE_ID                        = CREC.CREC_CLIE_ID');
    qryConsII.SQL.Add('   AND CLIE.CLIE_EMPR_ID                    = CREC.CREC_CLIE_EMPR_ID)');
    qryConsII.SQL.Add(' WHERE CREC.CREC_EMPR_ID                    = ' + IntToStr(funcBasico.Empr_ID));
    qryConsII.SQL.Add('   AND CREC.CREC_PLCT_ID                   IN ('+strIRPF_RENDIMENTOS_SUJEITOS_TRIB+')');
    qryConsII.SQL.Add('   AND CREC.CREC_PLCT_EMPR_ID               = 0');
    qryConsII.SQL.Add('   AND EXTRACT(YEAR FROM ACRE.ACRE_DTA_CADASTRO) = ' + cmbAnos.Text);
    qryConsII.SQL.Add(' GROUP BY');
    qryConsII.SQL.Add('       CLIE.CLIE_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('       CLIE.CLIE_CNPJ_CPF,');
    qryConsII.SQL.Add('       PLCT.PLCT_DESCRICAO');
    qryConsII.SQL.Add(' ORDER BY');
    qryConsII.SQL.Add('       CLIE.CLIE_RAZAO_SOCIAL');
    qryConsII.Open;
    if not qryConsII.IsEmpty then begin
      qryConsII.First;
      while not qryConsII.Eof do begin
        RelIRPF.mmRendSujeitoFonte.Lines.Add(Copy(qryConsII.FieldByName('CLIE_RAZAO_SOCIAL').AsString,1,47));
        RelIRPF.mmRendSujeitoCNPJ.Lines.Add(qryConsII.FieldByName('CLIE_CNPJ_CPF').AsString);
        RelIRPF.mmSujeitoOrigem.Lines.Add(qryConsII.FieldByName('PLCT_DESCRICAO').AsString);
        RelIRPF.mmRendSujeitoValor.Lines.Add(FormatFloat('###,###,##0.00',qryConsII.FieldByName('TOTAL').AsFloat));
        fltTotalRendSujeito := fltTotalRendSujeito + qryConsII.FieldByName('TOTAL').AsFloat;
        qryConsII.Next;
      end;
      RelIRPF.mmRendSujeitoTotalValor.Lines.Add(FormatFloat('###,###,##0.00',fltTotalRendSujeito));
    end;
  end;
{$ENDREGION}

{$REGION '05 - RendimentosExibilidadeSuspensa'}
  procedure RendimentosExibilidadeSuspensa(strIRPF_RENDIMENTOS_TRIBUTAVEIS_PJ,
                                           strIRPF_REND_TRIB_DEP_JUDICIAIS : String);
  var
    fltTotalRendSuspensa,
    fltTotalRendDepJudicial : Real;
  begin
    if (Trim(strIRPF_RENDIMENTOS_TRIBUTAVEIS_PJ) = '') and
       (Trim(strIRPF_REND_TRIB_DEP_JUDICIAIS)    = '') then begin
      OcultaBanda('qr_05_Titulo','qr_05_Detalhes','qr_05_Rodape');
      Exit;
    end;
    fltTotalRendSuspensa := 0; fltTotalRendDepJudicial := 0;
    RelIRPF.mmRendSuspensoFonte.Lines.Clear; RelIRPF.mmRendSuspensoCNPJ.Lines.Clear;
    RelIRPF.mmRendSuspensoValor.Lines.Clear; RelIRPF.mmRendSuspensoTotalValor.Lines.Clear;
    RelIRPF.mmRendSuspensoTotalDepJudicial.Lines.Clear; RelIRPF.mmRendSuspensoDepJudicial.Lines.Clear;
    qryConsII.Close;
    qryConsII.sql.Clear;
    qryConsII.SQL.Add('SELECT CLIE.CLIE_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('       CLIE.CLIE_CNPJ_CPF,');
    qryConsII.SQL.Add('       PLCT.PLCT_DESCRICAO,');
    qryConsII.SQL.Add('       SUM(ACRE.ACRE_VALOR_DOC)             AS TOTAL');
    qryConsII.SQL.Add('  FROM CONTAS_RECEBER                       CREC');
    qryConsII.SQL.Add(' INNER JOIN PLANO_CONTAS                    PLCT');
    qryConsII.SQL.Add('    ON (PLCT.PLCT_ID                        = CREC.CREC_PLCT_ID');
    qryConsII.SQL.Add('   AND PLCT.PLCT_EMPR_ID                    = CREC.CREC_PLCT_EMPR_ID)');
    qryConsII.SQL.Add(' INNER JOIN CONTAS_RECEBER_ACERTOS          ACRE');
    qryConsII.SQL.Add('    ON (ACRE.ACRE_CREC_ID                   = CREC.CREC_ID');
    qryConsII.SQL.Add('   AND ACRE.ACRE_CREC_EMPR_ID               = CREC.CREC_EMPR_ID)');
    qryConsII.SQL.Add(' INNER JOIN CLIENTES                        CLIE');
    qryConsII.SQL.Add('    ON (CLIE.CLIE_ID                        = CREC.CREC_CLIE_ID');
    qryConsII.SQL.Add('   AND CLIE.CLIE_EMPR_ID                    = CREC.CREC_CLIE_EMPR_ID)');
    qryConsII.SQL.Add(' WHERE CREC.CREC_EMPR_ID                    = ' + IntToStr(funcBasico.Empr_ID));
    qryConsII.SQL.Add('   AND CREC.CREC_PLCT_ID                   IN ('+strIRPF_RENDIMENTOS_TRIBUTAVEIS_PJ+')');
    qryConsII.SQL.Add('   AND CREC.CREC_PLCT_EMPR_ID               = 0');
    qryConsII.SQL.Add('   AND EXTRACT(YEAR FROM ACRE.ACRE_DTA_CADASTRO) = ' + cmbAnos.Text);
    qryConsII.SQL.Add(' GROUP BY');
    qryConsII.SQL.Add('       CLIE.CLIE_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('       CLIE.CLIE_CNPJ_CPF,');
    qryConsII.SQL.Add('       PLCT.PLCT_DESCRICAO');
    qryConsII.SQL.Add(' ORDER BY');
    qryConsII.SQL.Add('       CLIE.CLIE_RAZAO_SOCIAL');
    qryConsII.Open;
    if not qryConsII.IsEmpty then begin
      qryConsII.First;
      while not qryConsII.Eof do begin
        RelIRPF.mmRendSuspensoFonte.Lines.Add(Copy(qryConsII.FieldByName('CLIE_RAZAO_SOCIAL').AsString,1,47));
        RelIRPF.mmRendSuspensoCNPJ.Lines.Add(qryConsII.FieldByName('CLIE_CNPJ_CPF').AsString);
        RelIRPF.mmRendSuspensoValor.Lines.Add(FormatFloat('###,###,##0.00',qryConsII.FieldByName('TOTAL').AsFloat));
        fltTotalRendSuspensa := fltTotalRendSuspensa + qryConsII.FieldByName('TOTAL').AsFloat;
        qryConsIII.Close;
        qryConsIII.sql.Clear;
        qryConsIII.sql.Add('SELECT');
        qryConsIII.sql.Add('       FORN.FORN_RAZAO_SOCIAL,');
        qryConsIII.sql.Add('       FORN.FORN_CNPJ_CPF,');
        qryConsIII.sql.Add('       PLCT.PLCT_DESCRICAO,');
        qryConsIII.sql.Add('       SUM(COALESCE(ACPG.ACPG_VALOR_DOC*-1,0))    AS TOTAL');
        qryConsIII.sql.Add('  FROM CONTAS_PAGAR                               CPAG');
        qryConsIII.sql.Add(' INNER JOIN CONTAS_PAGAR_ACERTOS                  ACPG');
        qryConsIII.sql.Add('    ON (ACPG.ACPG_CPAG_ID                         = CPAG.CPAG_ID');
        qryConsIII.sql.Add('   AND ACPG.ACPG_CPAG_EMPR_ID                     = CPAG.CPAG_EMPR_ID)');
        qryConsIII.sql.Add(' INNER JOIN FORNECEDORES                          FORN');
        qryConsIII.sql.Add('    ON (FORN.FORN_ID                              = CPAG.CPAG_FORN_ID)');
        qryConsIII.sql.Add(' INNER JOIN PLANO_CONTAS                          PLCT');
        qryConsIII.sql.Add('    ON (PLCT.PLCT_ID                              = CPAG.CPAG_PLCT_ID');
        qryConsIII.sql.Add('   AND PLCT.PLCT_EMPR_ID                          = CPAG.CPAG_PLCT_EMPR_ID)');
        qryConsIII.sql.Add(' WHERE CPAG.CPAG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
        qryConsIII.sql.Add('   AND CPAG.CPAG_PLCT_ID                          IN ('+strIRPF_REND_TRIB_DEP_JUDICIAIS+')');
        qryConsIII.sql.Add('   AND CPAG.CPAG_PLCT_EMPR_ID                     = 0');
        qryConsIII.sql.Add('   AND EXTRACT(YEAR FROM ACPG.ACPG_DTA_CADASTRO)  = ' + cmbAnos.Text);
        qryConsIII.sql.Add('   AND FORN.FORN_CNPJ_CPF                         = ' + QuotedStr(qryConsII.FieldByName('CLIE_CNPJ_CPF').AsString));
        qryConsIII.sql.Add(' GROUP BY');
        qryConsIII.sql.Add('       FORN.FORN_RAZAO_SOCIAL,');
        qryConsIII.sql.Add('       FORN.FORN_CNPJ_CPF,');
        qryConsIII.sql.Add('       PLCT.PLCT_DESCRICAO');
        qryConsIII.Open;
        RelIRPF.mmRendSuspensoDepJudicial.Lines.Add(FormatFloat('###,###,##0.00',qryConsIII.FieldByName('TOTAL').AsFloat));
        fltTotalRendDepJudicial := fltTotalRendDepJudicial + qryConsIII.FieldByName('TOTAL').AsFloat;
        qryConsII.Next;
      end;
      RelIRPF.mmRendSuspensoTotalValor.Lines.Add(FormatFloat('###,###,##0.00',fltTotalRendSuspensa));
      RelIRPF.mmRendSuspensoTotalDepJudicial.Lines.Add(FormatFloat('###,###,##0.00',fltTotalRendDepJudicial));
    end;
  end;
{$ENDREGION}

{$REGION '06 - RendimentosAcumuladamente'}
  procedure RendimentosAcumuladamente(strIRPF_RENDIMENTOS_RECEB_ACUMUL : String);
  begin
    if (Trim(strIRPF_RENDIMENTOS_RECEB_ACUMUL) = '') then begin
      OcultaBanda('qr_06_Titulo','qr_06_Detalhes','qr_06_Rodape');
      Exit
    end;
  end;
{$ENDREGION}

{$REGION '07 - ImpostoPagoRetido'}
  procedure ImpostoPagoRetido(strIRPF_IMPOSTO_PAGO_RETIDO : String);
  var
    fltTotalImpPagoRetido : Real;
  begin
    if (Trim(strIRPF_IMPOSTO_PAGO_RETIDO) = '') then begin
      OcultaBanda('qr_07_Titulo','qr_07_Detalhes','qr_07_Rodape');
      Exit;
    end;
    fltTotalImpPagoRetido := 0;
    RelIRPF.mmImpPagoRetidoFonte.Lines.Clear; RelIRPF.mmImpPagoRetidoCNPJ.Lines.Clear;
    RelIRPF.mmImpPagoRetidoValor.Lines.Clear; RelIRPF.mmImpPagoRetidoTotalValor.Lines.Clear;
    RelIRPF.mmImpPagoRetidoOrigem.Lines.Clear;
    qryConsII.Close;
    qryConsII.sql.Clear;
    qryConsII.SQL.Add('SELECT FORN.FORN_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('       FORN.FORN_CNPJ_CPF,');
    qryConsII.SQL.Add('       PLCT.PLCT_DESCRICAO,');
    qryConsII.SQL.Add('       SUM(ACPG.ACPG_VALOR_DOC*-1)          AS TOTAL');
    qryConsII.SQL.Add('  FROM CONTAS_PAGAR                         CPAG');
    qryConsII.SQL.Add(' INNER JOIN PLANO_CONTAS                    PLCT');
    qryConsII.SQL.Add('    ON (PLCT.PLCT_ID                        = CPAG.CPAG_PLCT_ID');
    qryConsII.SQL.Add('   AND PLCT.PLCT_EMPR_ID                    = CPAG.CPAG_PLCT_EMPR_ID)');
    qryConsII.SQL.Add(' INNER JOIN CONTAS_PAGAR_ACERTOS            ACPG');
    qryConsII.SQL.Add('    ON (ACPG.ACPG_CPAG_ID                   = CPAG.CPAG_ID');
    qryConsII.SQL.Add('   AND ACPG.ACPG_CPAG_EMPR_ID               = CPAG.CPAG_EMPR_ID)');
    qryConsII.SQL.Add(' INNER JOIN FORNECEDORES                    FORN');
    qryConsII.SQL.Add('    ON (FORN.FORN_ID                        = CPAG.CPAG_FORN_ID)');
    qryConsII.SQL.Add(' WHERE CPAG.CPAG_EMPR_ID                    = ' + IntToStr(funcBasico.Empr_ID));
    qryConsII.SQL.Add('   AND CPAG.CPAG_PLCT_ID                   IN ('+strIRPF_IMPOSTO_PAGO_RETIDO+')');
    qryConsII.SQL.Add('   AND CPAG.CPAG_PLCT_EMPR_ID               = 0');
    qryConsII.sql.Add('   AND EXTRACT(YEAR FROM ACPG.ACPG_DTA_CADASTRO) = ' + cmbAnos.Text);
    qryConsII.SQL.Add(' GROUP BY');
    qryConsII.SQL.Add('       FORN.FORN_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('       FORN.FORN_CNPJ_CPF,');
    qryConsII.SQL.Add('       PLCT.PLCT_DESCRICAO');
    qryConsII.SQL.Add(' ORDER BY');
    qryConsII.SQL.Add('       PLCT.PLCT_DESCRICAO');
    qryConsII.Open;
    if not qryConsII.IsEmpty then begin
      qryConsII.First;
      while not qryConsII.Eof do begin
        RelIRPF.mmImpPagoRetidoFonte.Lines.Add(Copy( qryConsII.FieldByName('FORN_RAZAO_SOCIAL').AsString,1,47));
        RelIRPF.mmImpPagoRetidoCNPJ.Lines.Add(qryConsII.FieldByName('FORN_CNPJ_CPF').AsString);
        RelIRPF.mmImpPagoRetidoOrigem.Lines.Add(qryConsII.FieldByName('PLCT_DESCRICAO').AsString);
        RelIRPF.mmImpPagoRetidoValor.Lines.Add(FormatFloat('###,###,##0.00',qryConsII.FieldByName('TOTAL').AsFloat));
        fltTotalImpPagoRetido := fltTotalImpPagoRetido + qryConsII.FieldByName('TOTAL').AsFloat;
        qryConsII.Next;
      end;
      RelIRPF.mmImpPagoRetidoTotalValor.Lines.Add(FormatFloat('###,###,##0.00',fltTotalImpPagoRetido));
    end;
  end;
{$ENDREGION}

{$REGION '08 - PagamentosEfetuados'}
  procedure PagamentosEfetuados(strIRPF_PAGAMENTOS_EFETUADOS : String);
  var
    fltTotalPagamentos : Real;
  begin
    if (Trim(strIRPF_PAGAMENTOS_EFETUADOS) = '') then begin
      OcultaBanda('qr_08_Titulo','qr_08_Detalhes','qr_08_Rodape');
      Exit;
    end;
    fltTotalPagamentos := 0;
    RelIRPF.mmPagamentosFonte.Lines.Clear; RelIRPF.mmPagamentosCNPJ.Lines.Clear;
    RelIRPF.mmPagamentosValor.Lines.Clear; RelIRPF.mmPagamentosTotalValor.Lines.Clear;
    RelIRPF.mmPagamentosDestino.Lines.Clear;
    qryConsII.Close;
    qryConsII.sql.Clear;
    qryConsII.SQL.Add('SELECT FORN.FORN_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('       FORN.FORN_CNPJ_CPF,');
    qryConsII.SQL.Add('       PLCT.PLCT_DESCRICAO,');
    qryConsII.SQL.Add('       SUM(ACPG.ACPG_VALOR_DOC*-1)          AS TOTAL');
    qryConsII.SQL.Add('  FROM CONTAS_PAGAR                         CPAG');
    qryConsII.SQL.Add(' INNER JOIN PLANO_CONTAS                    PLCT');
    qryConsII.SQL.Add('    ON (PLCT.PLCT_ID                        = CPAG.CPAG_PLCT_ID');
    qryConsII.SQL.Add('   AND PLCT.PLCT_EMPR_ID                    = CPAG.CPAG_PLCT_EMPR_ID)');
    qryConsII.SQL.Add(' INNER JOIN CONTAS_PAGAR_ACERTOS            ACPG');
    qryConsII.SQL.Add('    ON (ACPG.ACPG_CPAG_ID                   = CPAG.CPAG_ID');
    qryConsII.SQL.Add('   AND ACPG.ACPG_CPAG_EMPR_ID               = CPAG.CPAG_EMPR_ID)');
    qryConsII.SQL.Add(' INNER JOIN FORNECEDORES                    FORN');
    qryConsII.SQL.Add('    ON (FORN.FORN_ID                        = CPAG.CPAG_FORN_ID)');
    qryConsII.SQL.Add(' WHERE CPAG.CPAG_EMPR_ID                    = ' + IntToStr(funcBasico.Empr_ID));
    qryConsII.SQL.Add('   AND CPAG.CPAG_PLCT_ID                   IN ('+strIRPF_PAGAMENTOS_EFETUADOS+')');
    qryConsII.SQL.Add('   AND CPAG.CPAG_PLCT_EMPR_ID               = 0');
    qryConsII.sql.Add('   AND EXTRACT(YEAR FROM ACPG.ACPG_DTA_CADASTRO) = ' + cmbAnos.Text);
    qryConsII.SQL.Add(' GROUP BY');
    qryConsII.SQL.Add('       FORN.FORN_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('       FORN.FORN_CNPJ_CPF,');
    qryConsII.SQL.Add('       PLCT.PLCT_DESCRICAO');
    qryConsII.SQL.Add('HAVING SUM(ACPG.ACPG_VALOR_DOC*-1) > 0');
    qryConsII.SQL.Add(' ORDER BY');
    qryConsII.SQL.Add('       PLCT.PLCT_DESCRICAO');
    qryConsII.Open;
    if not qryConsII.IsEmpty then begin
      qryConsII.First;
      while not qryConsII.Eof do begin
        RelIRPF.mmPagamentosFonte.Lines.Add(Copy( qryConsII.FieldByName('FORN_RAZAO_SOCIAL').AsString,1,45));
        RelIRPF.mmPagamentosCNPJ.Lines.Add(qryConsII.FieldByName('FORN_CNPJ_CPF').AsString);
        RelIRPF.mmPagamentosDestino.Lines.Add(qryConsII.FieldByName('PLCT_DESCRICAO').AsString);
        RelIRPF.mmPagamentosValor.Lines.Add(FormatFloat('###,###,##0.00',qryConsII.FieldByName('TOTAL').AsFloat));
        fltTotalPagamentos := fltTotalPagamentos + qryConsII.FieldByName('TOTAL').AsFloat;
        qryConsII.Next;
      end;
      RelIRPF.mmPagamentosTotalValor.Lines.Add(FormatFloat('###,###,##0.00',fltTotalPagamentos));
    end;
  end;
{$ENDREGION}

{$REGION '09 - DoacoesEfetuadas'}
  procedure DoacoesEfetuadas(strIRPF_DOACOES_EFETUADAS : String);
  var
    fltTotalDoacoes : Real;
  begin
    if (Trim(strIRPF_DOACOES_EFETUADAS) = '') then begin
      OcultaBanda('qr_09_Titulo','qr_09_Detalhes','qr_09_Rodape');
      Exit;
    end;
    fltTotalDoacoes := 0;
    RelIRPF.mmDoacoesFonte.Lines.Clear; RelIRPF.mmDoacoesCNPJ.Lines.Clear;
    RelIRPF.mmDoacoesValor.Lines.Clear; RelIRPF.mmDoacoesTotalValor.Lines.Clear;
    qryConsII.Close;
    qryConsII.sql.Clear;
    qryConsII.SQL.Add('SELECT FORN.FORN_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('       FORN.FORN_CNPJ_CPF,');
    qryConsII.SQL.Add('       PLCT.PLCT_DESCRICAO,');
    qryConsII.SQL.Add('       SUM(ACPG.ACPG_VALOR_DOC*-1)          AS TOTAL');
    qryConsII.SQL.Add('  FROM CONTAS_PAGAR                         CPAG');
    qryConsII.SQL.Add(' INNER JOIN PLANO_CONTAS                    PLCT');
    qryConsII.SQL.Add('    ON (PLCT.PLCT_ID                        = CPAG.CPAG_PLCT_ID');
    qryConsII.SQL.Add('   AND PLCT.PLCT_EMPR_ID                    = CPAG.CPAG_PLCT_EMPR_ID)');
    qryConsII.SQL.Add(' INNER JOIN CONTAS_PAGAR_ACERTOS            ACPG');
    qryConsII.SQL.Add('    ON (ACPG.ACPG_CPAG_ID                   = CPAG.CPAG_ID');
    qryConsII.SQL.Add('   AND ACPG.ACPG_CPAG_EMPR_ID               = CPAG.CPAG_EMPR_ID)');
    qryConsII.SQL.Add(' INNER JOIN FORNECEDORES                    FORN');
    qryConsII.SQL.Add('    ON (FORN.FORN_ID                        = CPAG.CPAG_FORN_ID)');
    qryConsII.SQL.Add(' WHERE CPAG.CPAG_EMPR_ID                    = ' + IntToStr(funcBasico.Empr_ID));
    qryConsII.SQL.Add('   AND CPAG.CPAG_PLCT_ID                   IN ('+strIRPF_DOACOES_EFETUADAS+')');
    qryConsII.SQL.Add('   AND CPAG.CPAG_PLCT_EMPR_ID               = 0');
    qryConsII.sql.Add('   AND EXTRACT(YEAR FROM ACPG.ACPG_DTA_CADASTRO) = ' + cmbAnos.Text);
    qryConsII.SQL.Add(' GROUP BY');
    qryConsII.SQL.Add('       FORN.FORN_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('       FORN.FORN_CNPJ_CPF,');
    qryConsII.SQL.Add('       PLCT.PLCT_DESCRICAO');
    qryConsII.SQL.Add(' ORDER BY');
    qryConsII.SQL.Add('       PLCT.PLCT_DESCRICAO');
    qryConsII.Open;
    if not qryConsII.IsEmpty then begin
      qryConsII.First;
      while not qryConsII.Eof do begin
        RelIRPF.mmDoacoesFonte.Lines.Add(Copy( qryConsII.FieldByName('FORN_RAZAO_SOCIAL').AsString,1,47));
        RelIRPF.mmDoacoesCNPJ.Lines.Add(qryConsII.FieldByName('FORN_CNPJ_CPF').AsString);
        RelIRPF.mmDoacoesValor.Lines.Add(FormatFloat('###,###,##0.00',qryConsII.FieldByName('TOTAL').AsFloat));
        fltTotalDoacoes := fltTotalDoacoes + qryConsII.FieldByName('TOTAL').AsFloat;
        qryConsII.Next;
      end;
      RelIRPF.mmDoacoesTotalValor.Lines.Add(FormatFloat('###,###,##0.00',fltTotalDoacoes));
    end;
  end;
{$ENDREGION}

{$REGION '10 - BensDireitos'}
  procedure BensDireitos(strIRPF_BENS_DIREITOS : String);
  var
    fltTotalVlrAnterior,
    fltTotalVlrAtual : Real;
  begin
    if (Trim(strIRPF_BENS_DIREITOS) = '') then begin
      OcultaBanda('qr_10_Titulo','qr_10_Detalhes','qr_10_Rodape');
      Exit;
    end;
    fltTotalVlrAtual := 0; fltTotalVlrAnterior := 0;
    RelIRPF.mmBensDireitoDestino.Lines.Clear; RelIRPF.mmBensDireitoVlrAnterior.Lines.Clear;
    RelIRPF.mmBensDireitoVlrAtual.Lines.Clear; RelIRPF.mmBensDireitoVlrTotalAtual.Lines.Clear;
    RelIRPF.mmBensDireitoVlrTotalAnterior.Lines.Clear;
    qryConsII.Close;
    qryConsII.sql.Clear;
    qryConsII.SQL.Add('SELECT FORN_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('       FORN_CNPJ_CPF,');
    qryConsII.SQL.Add('       PLCT_DESCRICAO,');
    qryConsII.SQL.Add('       SUM(VLRANTERIOR*-1)                  AS VLRANTERIOR,');
    qryConsII.SQL.Add('       SUM(VLRATUAL*-1)                     AS VLRATUAL');
    qryConsII.SQL.Add('  FROM (');
    qryConsII.SQL.Add('        SELECT FORN.FORN_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('               FORN.FORN_CNPJ_CPF,');
    qryConsII.SQL.Add('               PLCT.PLCT_DESCRICAO,');
    qryConsII.SQL.Add('               ACPG.ACPG_VALOR_DOC                  AS VLRANTERIOR,');
    qryConsII.SQL.Add('               0                                    AS VLRATUAL');
    qryConsII.SQL.Add('          FROM CONTAS_PAGAR                         CPAG');
    qryConsII.SQL.Add('         INNER JOIN PLANO_CONTAS                    PLCT');
    qryConsII.SQL.Add('            ON (PLCT.PLCT_ID                        = CPAG.CPAG_PLCT_ID');
    qryConsII.SQL.Add('           AND PLCT.PLCT_EMPR_ID                    = CPAG.CPAG_PLCT_EMPR_ID)');
    qryConsII.SQL.Add('         INNER JOIN CONTAS_PAGAR_ACERTOS            ACPG');
    qryConsII.SQL.Add('            ON (ACPG.ACPG_CPAG_ID                   = CPAG.CPAG_ID');
    qryConsII.SQL.Add('           AND ACPG.ACPG_CPAG_EMPR_ID               = CPAG.CPAG_EMPR_ID)');
    qryConsII.SQL.Add('         INNER JOIN FORNECEDORES                    FORN');
    qryConsII.SQL.Add('            ON (FORN.FORN_ID                        = CPAG.CPAG_FORN_ID)');
    qryConsII.SQL.Add('         WHERE CPAG.CPAG_EMPR_ID                    = ' + IntToStr(funcBasico.Empr_ID));
    qryConsII.SQL.Add('           AND CPAG.CPAG_PLCT_ID                   IN ('+strIRPF_BENS_DIREITOS+')');
    qryConsII.SQL.Add('           AND CPAG.CPAG_PLCT_EMPR_ID               = 0');
    qryConsII.sql.Add('           AND EXTRACT(YEAR FROM ACPG.ACPG_DTA_CADASTRO) = ' + cmbAnos.Text);
    qryConsII.SQL.Add('        ');
    qryConsII.SQL.Add('        UNION ALL');
    qryConsII.SQL.Add('        ');
    qryConsII.SQL.Add('        SELECT FORN.FORN_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('               FORN.FORN_CNPJ_CPF,');
    qryConsII.SQL.Add('               PLCT.PLCT_DESCRICAO,');
    qryConsII.SQL.Add('               0                                    AS VLRANTERIOR,');
    qryConsII.SQL.Add('               ACPG.ACPG_VALOR_DOC                  AS VLRATUAL');
    qryConsII.SQL.Add('          FROM CONTAS_PAGAR                         CPAG');
    qryConsII.SQL.Add('         INNER JOIN PLANO_CONTAS                    PLCT');
    qryConsII.SQL.Add('            ON (PLCT.PLCT_ID                        = CPAG.CPAG_PLCT_ID');
    qryConsII.SQL.Add('           AND PLCT.PLCT_EMPR_ID                    = CPAG.CPAG_PLCT_EMPR_ID)');
    qryConsII.SQL.Add('         INNER JOIN CONTAS_PAGAR_ACERTOS            ACPG');
    qryConsII.SQL.Add('            ON (ACPG.ACPG_CPAG_ID                   = CPAG.CPAG_ID');
    qryConsII.SQL.Add('           AND ACPG.ACPG_CPAG_EMPR_ID               = CPAG.CPAG_EMPR_ID)');
    qryConsII.SQL.Add('         INNER JOIN FORNECEDORES                    FORN');
    qryConsII.SQL.Add('            ON (FORN.FORN_ID                        = CPAG.CPAG_FORN_ID)');
    qryConsII.SQL.Add('         WHERE CPAG.CPAG_EMPR_ID                    = ' + IntToStr(funcBasico.Empr_ID));
    qryConsII.SQL.Add('           AND CPAG.CPAG_PLCT_ID                   IN ('+strIRPF_BENS_DIREITOS+')');
    qryConsII.SQL.Add('           AND CPAG.CPAG_PLCT_EMPR_ID               = 0');
    qryConsII.sql.Add('           AND EXTRACT(YEAR FROM ACPG.ACPG_DTA_CADASTRO) = ' + cmbAnos.Text);
    qryConsII.SQL.Add('       )');
    qryConsII.SQL.Add(' GROUP BY');
    qryConsII.SQL.Add('       FORN_RAZAO_SOCIAL,');
    qryConsII.SQL.Add('       FORN_CNPJ_CPF,');
    qryConsII.SQL.Add('       PLCT_DESCRICAO');
    qryConsII.SQL.Add(' ORDER BY');
    qryConsII.SQL.Add('       PLCT_DESCRICAO');
    qryConsII.Open;
    if not qryConsII.IsEmpty then begin
      qryConsII.First;
      while not qryConsII.Eof do begin
        RelIRPF.mmBensDireitoDestino.Lines.Add(qryConsII.FieldByName('PLCT_DESCRICAO').AsString);
        RelIRPF.mmBensDireitoVlrAnterior.Lines.Add(FormatFloat('###,###,##0.00',qryConsII.FieldByName('VLRANTERIOR').AsFloat));
        RelIRPF.mmBensDireitoVlrAtual.Lines.Add(FormatFloat('###,###,##0.00',qryConsII.FieldByName('VLRATUAL').AsFloat));
        fltTotalVlrAnterior := fltTotalVlrAnterior + qryConsII.FieldByName('VLRANTERIOR').AsFloat;
        fltTotalVlrAtual := fltTotalVlrAtual + qryConsII.FieldByName('VLRATUAL').AsFloat;
        qryConsII.Next;
      end;
      RelIRPF.mmBensDireitoVlrTotalAnterior.Lines.Add(FormatFloat('###,###,##0.00',fltTotalVlrAnterior));
      RelIRPF.mmBensDireitoVlrTotalAtual.Lines.Add(FormatFloat('###,###,##0.00',fltTotalVlrAtual));
    end;
  end;
{$ENDREGION}

{$REGION '11 - DividasOnusReais'}
  procedure DividasOnusReais(strIRPF_DIVIDAS_ONUS : String);
  begin
    if (Trim(strIRPF_DIVIDAS_ONUS) = '') then begin
      OcultaBanda('qr_11_Titulo','qr_11_Detalhes','qr_11_Rodape');
      Exit;
    end;
  end;
{$ENDREGION}

{$REGION '12 - DoacoesPartidos'}
  procedure DoacoesPartidos(strIRPF_DOACOES_PARTIDOS_POLITICOS : String);
  begin
    if (Trim(strIRPF_DOACOES_PARTIDOS_POLITICOS) = '') then begin
      OcultaBanda('qr_12_Titulo','qr_12_Detalhes','qr_12_Rodape');
      Exit;
    end;
  end;
{$ENDREGION}

begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    qryConsII := TSQLQuery.Create(nil);
    qryConsII.SQLConnection := funcBasico.Conexao;
    qryConsIII := TSQLQuery.Create(nil);
    qryConsIII.SQLConnection := funcBasico.Conexao;
    qryCons.Close;
    qryCons.SQL.Clear;
    qryCons.SQL.Add('SELECT');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_RENDIMENTOS_RECEBIDOS,0)           AS IRPF_RENDIMENTOS_RECEBIDOS,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_CONTRIBUICAO_PREVIDENCIA,0)        AS IRPF_CONTRIBUICAO_PREVIDENCIA,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_IMPOSTO_RETIDO_FONTE,0)            AS IRPF_IMPOSTO_RETIDO_FONTE,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_13_SALARIO,0)                      AS IRPF_13_SALARIO,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_RENDIMENTOS_PESSOA_FISICA,0)       AS IRPF_RENDIMENTOS_PESSOA_FISICA,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_REDIMENTOS_EXTERIOR,0)             AS IRPF_REDIMENTOS_EXTERIOR,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_PREVIDENCIA_OFICIAL,0)             AS IRPF_PREVIDENCIA_OFICIAL,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_PENSAO_ALIMENTICIA,0)              AS IRPF_PENSAO_ALIMENTICIA,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_LIVRO_CAIXA,0)                     AS IRPF_LIVRO_CAIXA,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_DARF_PAGO,0)                       AS IRPF_DARF_PAGO,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_RENDIMENTOS_ISENTOS,0)             AS IRPF_RENDIMENTOS_ISENTOS,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_RENDIMENTOS_SUJEITOS_TRIB,0)       AS IRPF_RENDIMENTOS_SUJEITOS_TRIB,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_RENDIMENTOS_TRIBUTAVEIS_PJ,0)      AS IRPF_RENDIMENTOS_TRIBUTAVEIS_PJ,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_REND_TRIB_DEP_JUDICIAIS,0)         AS IRPF_REND_TRIB_DEP_JUDICIAIS,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_RENDIMENTOS_RECEB_ACUMUL,0)        AS IRPF_RENDIMENTOS_RECEB_ACUMUL,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_IMPOSTO_PAGO_RETIDO,0)             AS IRPF_IMPOSTO_PAGO_RETIDO,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_PAGAMENTOS_EFETUADOS,0)            AS IRPF_PAGAMENTOS_EFETUADOS,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_DOACOES_EFETUADAS,0)               AS IRPF_DOACOES_EFETUADAS,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_BENS_DIREITOS,0)                   AS IRPF_BENS_DIREITOS,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_DIVIDAS_ONUS,0)                    AS IRPF_DIVIDAS_ONUS,');
    qryCons.SQL.Add('       COALESCE(IR.IRPF_DOACOES_PARTIDOS_POLITICOS,0)      AS IRPF_DOACOES_PARTIDOS_POLITICOS,');
    qryCons.SQL.Add('       IR.IRPF_DTA_CADASTRO,');
    qryCons.SQL.Add('       IR.IRPF_USER_ID');
    qryCons.SQL.Add('  FROM IRPF IR');
    qryCons.SQL.Add(' WHERE IR.IRPF_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
    qryCons.Open;

    RelIRPF.lbTit01.Caption  := '';
    RelIRPF.lbTit02.Caption  := 'Ano Ref.:';
    RelIRPF.lbTit03.Caption  := '';
    RelIRPF.lbFild01.Caption := '';
    RelIRPF.lbFild02.Caption := cmbAnos.Text;
    RelIRPF.lbFild03.Caption := '';

    ///Rendimentos Tributáveis Recebidos de PJ pelo Titular
    RendimentosTributaveis(qryCons.FieldByName('IRPF_RENDIMENTOS_RECEBIDOS').AsString,
                           qryCons.FieldByName('IRPF_CONTRIBUICAO_PREVIDENCIA').AsString,
                           qryCons.FieldByName('IRPF_IMPOSTO_RETIDO_FONTE').AsString,
                           qryCons.FieldByName('IRPF_13_SALARIO').AsString);

    ///Rendimentos Tributáveis Recebidos de Pessoa Juridica e do Exterior pelo Titular
    RendimentosPJExterior(qryCons.FieldByName('IRPF_RENDIMENTOS_PESSOA_FISICA').AsString,
                          qryCons.FieldByName('IRPF_REDIMENTOS_EXTERIOR').AsString,
                          qryCons.FieldByName('IRPF_PREVIDENCIA_OFICIAL').AsString,
                          qryCons.FieldByName('IRPF_PENSAO_ALIMENTICIA').AsString,
                          qryCons.FieldByName('IRPF_LIVRO_CAIXA').AsString,
                          qryCons.FieldByName('IRPF_DARF_PAGO').AsString);

    ///Rendimentos Isentos e Não Tributáveis
    RendimentosIsentosNaoTributaveis(qryCons.FieldByName('IRPF_RENDIMENTOS_ISENTOS').AsString);

    ///Rendimentos Sujeitos à Tributação Exclusiva/Definitiva
    RendimentosSujeitosTributacao(qryCons.FieldByName('IRPF_RENDIMENTOS_SUJEITOS_TRIB').AsString);

    ///Rendimentos Trib. Receb. de PJ pelo Titular com Exigilidade Suspensa
    RendimentosExibilidadeSuspensa(qryCons.FieldByName('IRPF_RENDIMENTOS_TRIBUTAVEIS_PJ').AsString,
                                   qryCons.FieldByName('IRPF_REND_TRIB_DEP_JUDICIAIS').AsString);

    ///Rendimentos Tributáveis de Pessoa Jurídica Recebidos Acumuladamente pelo Titular
    RendimentosAcumuladamente(qryCons.FieldByName('IRPF_RENDIMENTOS_RECEB_ACUMUL').AsString);

    ///Imposto Pago/Retido
    ImpostoPagoRetido(qryCons.FieldByName('IRPF_IMPOSTO_PAGO_RETIDO').AsString);

    ///Pagamentos Efetuados
    PagamentosEfetuados(qryCons.FieldByName('IRPF_PAGAMENTOS_EFETUADOS').AsString);

    ///DoacoesEfetuadas
    DoacoesEfetuadas(qryCons.FieldByName('IRPF_DOACOES_EFETUADAS').AsString);

    ///Bens e Direitos
    BensDireitos(qryCons.FieldByName('IRPF_BENS_DIREITOS').AsString);

    ///Dividas e Onus Reais
    DividasOnusReais(qryCons.FieldByName('IRPF_DIVIDAS_ONUS').AsString);

    ///Doacoes Partidos Politicos
    DoacoesPartidos(qryCons.FieldByName('IRPF_DOACOES_PARTIDOS_POLITICOS').AsString);

    RelIRPF.qrepRelatorio.Preview;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    qryConsII.Close;
    FreeAndNil(qryConsII);
    qryConsIII.Close;
    FreeAndNil(qryConsIII);
  end;
end;

procedure TfIRPF.CarregaCombo();
var
  qryCons : TSQLQuery;
  Dia, Mes, Ano : Word;
begin
  try
    DecodeDate(funcBasico.DataServidor(),Ano,Mes,Dia);
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT DISTINCT');
      sql.Add('       EXTRACT(YEAR FROM CREC_DTA_PGTO)');
      sql.Add('  FROM CONTAS_RECEBER');
      sql.Add(' WHERE CREC_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
      sql.Add('   AND CREC_DTA_PGTO IS NOT NULL');
      sql.Add(' ORDER BY');
      sql.Add('       EXTRACT(YEAR FROM CREC_DTA_PGTO)');
      Open;
      if not IsEmpty then begin
        while not Eof do begin
          cmbAnos.Items.Add(qryCons.Fields[0].AsString);
          Next;
        end;
        cmbAnos.ItemIndex := cmbAnos.Items.IndexOf(IntToStr(Ano-1));
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

initialization
  RegisterClass(TfIRPF);
finalization
  UnRegisterClass(TfIRPF);

end.
