unit ufRel_Contas_Receber_X_Pagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, SQLExpr,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, DateUtils, Menus, uFrPesquisa, frxClass, frxDBSet, frxDesgn;

type
  TfRel_Contas_Receber_X_Pagar = class(TfBasico)
    Panel1: TPanel;
    frPesqPlanoContas: TfrPesquisa;
    frPesqTipoDoc: TfrPesquisa;
    frPesqFornecedores: TfrPesquisa;
    frPesqClientes: TfrPesquisa;
    frPesqContaBancaria: TfrPesquisa;
    GroupBox6: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    GroupBox5: TGroupBox;
    edtDt_Emissao_Inicio: TDateEdit;
    edtDt_Emissao_Fim: TDateEdit;
    GroupBox7: TGroupBox;
    edtDt_Vcto_Inicio: TDateEdit;
    edtDt_Vcto_Fim: TDateEdit;
    GroupBox8: TGroupBox;
    edtDt_Pagto_Inicio: TDateEdit;
    edtDt_Pagto_Fim: TDateEdit;
    GroupBox9: TGroupBox;
    edtDt_Canc_Inicio: TDateEdit;
    edtDt_Canc_Fim: TDateEdit;
    rdOrdena: TRadioGroup;
    rdOpcao_Impressao: TRadioGroup;
    rdTipo_Impressao: TRadioGroup;
    GroupBox1: TGroupBox;
    edtDtEfetivaInicio: TDateEdit;
    edtDtEfetivaFim: TDateEdit;
    ckSaldo: TCheckBox;
    dstRelatorioPagar: TfrxDBDataset;
    rdSepararTitulos: TRadioGroup;
    rdStatus: TRadioGroup;
    ckSaldoCaixa: TCheckBox;
    ckFundoReserva: TCheckBox;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure frPesqClientesbtnPesqClick(Sender: TObject);
  private
    function GeraSQLRec: String;
    function GeraSQLPag: String;
    procedure SetaValoresFrames;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Contas_Receber_X_Pagar: TfRel_Contas_Receber_X_Pagar;

implementation

uses udmRel_Contas_Receber_X_Pagar, ufRel_Contas_Receber_X_Pagar_Sintetico;

{$R *.dfm}

procedure TfRel_Contas_Receber_X_Pagar.btnNovoClick(Sender: TObject);
var
  Rec_Total_Titulos,
  Rec_Titulos_Aberto,
  Rec_Titulos_Recebidos,
  Rec_Titulos_Cancelados,
  Pag_Total_Titulos,
  Pag_Titulos_Aberto,
  Pag_Titulos_Recebidos,
  Pag_Titulos_Cancelados,
  Vlr_Fundo_Reserva_Livre,
  Vlr_Fundo_Reserva_Lucro,
  Vlr_Fundo_Reserva_Legal,
  Vlr_Fundo_Reserva_Estatutarias : Real;

  procedure GerarContasPagarReceber();
  begin
    with dmRel_Contas_Receber_X_Pagar do begin

      with cdsRel_Contas_Receber do begin
        First;
        while not Eof do begin
          Rec_Total_Titulos  := Rec_Total_Titulos + FieldByName('CREC_VALOR_DOC').AsFloat;

          case Trim(FieldByName('CREC_STATUS').AsString)[1] of
           'A' : begin
             Rec_Titulos_Aberto    := Rec_Titulos_Aberto + (FieldByName('CREC_VALOR_DOC').AsFloat-FieldByName('CREC_VALOR_PAGO').AsFloat);
             Rec_Titulos_Recebidos := Rec_Titulos_Recebidos + FieldByName('CREC_VALOR_PAGO').AsFloat;
           end;
           'F' : Rec_Titulos_Recebidos := Rec_Titulos_Recebidos + FieldByName('CREC_VALOR_PAGO').AsFloat;
           'C' : Rec_Titulos_Cancelados := Rec_Titulos_Cancelados + FieldByName('CREC_VALOR_DOC').AsFloat;
          end;

          Next;
        end;
        First;
      end;

      with cdsRel_Contas_Pagar do begin
        First;
        while not Eof do begin
          Pag_Total_Titulos  := Pag_Total_Titulos + FieldByName('CPAG_VALOR_DOC').AsFloat;

          case Trim(FieldByName('CPAG_STATUS').AsString)[1] of
            'A' : begin
              Pag_Titulos_Aberto := Pag_Titulos_Aberto + (FieldByName('CPAG_VALOR_DOC').AsFloat-FieldByName('CPAG_VALOR_PAGO').AsFloat);
              Pag_Titulos_Recebidos := Pag_Titulos_Recebidos + FieldByName('CPAG_VALOR_PAGO').AsFloat;
            end;
            'F' : Pag_Titulos_Recebidos := Pag_Titulos_Recebidos + FieldByName('CPAG_VALOR_PAGO').AsFloat;
            'C' : Pag_Titulos_Cancelados := Pag_Titulos_Cancelados + FieldByName('CPAG_VALOR_DOC').AsFloat;
          end;

          Next;
        end;
        First;
      end;

    end;
  end;

  function SaldoemCaixa : Real;
  var
    qryCons  : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT FIRST 1');
          sql.Add('       COALESCE(LCAX_VLR_SALDO,0)');
          sql.Add('  FROM LIVRO_CAIXA');
          sql.Add(' WHERE LCAX_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
          sql.Add(' ORDER BY');
          sql.Add('       LCAX_ID DESC');
          Open;
          if not IsEmpty then begin
            Result := qryCons.Fields[0].AsFloat;
          end;
        end;
      except on e: exception do
        funcBasico.ReportaErro(Caption,'SaldoemCaixa',e.Message);
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;

begin
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Contas_Receber_X_Pagar do begin
      with cdsRel_Contas_Receber do begin
        Close;
        CommandText := GeraSQLRec;
        Open;
      end;
      with cdsRel_Contas_Pagar do begin
        Close;
        CommandText := GeraSQLPag;
        Open;
      end;
      if (not cdsRel_Contas_Receber.IsEmpty) or (not cdsRel_Contas_Pagar.IsEmpty) then begin
        case rdSepararTitulos.ItemIndex of
          1 : begin
            try
              if fRel_Contas_Receber_X_Pagar_Sintetico = nil then
                fRel_Contas_Receber_X_Pagar_Sintetico := TfRel_Contas_Receber_X_Pagar_Sintetico.Create(nil);
              with fRel_Contas_Receber_X_Pagar_Sintetico do begin
                lbTit01.Caption  := 'Status:   ';
                lbFild01.Caption := rdStatus.Items[rdStatus.ItemIndex];
                lbTit02.Caption  := 'Ordenado: ';
                lbFild02.Caption := rdOrdena.Items[rdOrdena.ItemIndex];
                lbTit03.Caption  := 'Período:  ';
                lbFild03.Caption := '';
                if (edtDt_Vcto_Inicio.Date > 0) then
                  lbFild03.Caption := lbFild03.Caption + edtDt_Vcto_Inicio.Text;
                if (edtDt_Vcto_Fim.Date > 0) then
                  lbFild03.Caption := lbFild03.Caption + ' à ' + edtDt_Vcto_Fim.Text;
                if (edtDt_Vcto_Inicio.Date <= 0) and (edtDt_Vcto_Fim.Date <= 0) then begin
                  lbTit03.Enabled  := false;
                  lbFild03.Enabled := false;
                end;
                case ckSaldo.Checked of
                  true  : floatSaldBancario := funcLocal.Se(funcLocal.TemPermissao('319'),funcBasico.SaldoBancario,0);
                  false : floatSaldBancario := 0;
                end;
                case ckSaldoCaixa.Checked of
                  true : floatSaldoCaixa    := SaldoEmCaixa;
                  false: floatSaldoCaixa    := 0;
                end;
                Self.SendToBack;
                case rdOpcao_Impressao.ItemIndex of
                  0 : qrepRelatorio.Preview;
                  1 : qrepRelatorio.Print;
                end;
              end;
            finally
              FreeAndNil(fRel_Contas_Receber_X_Pagar_Sintetico);
            end;
          end;
          0 : begin
            try
              with frRelatorio do begin
                TfrxMemoView(FindComponent('lbTit01')).Text    := 'Status:';
                TfrxMemoView(FindComponent('lbFild01')).Text   := rdStatus.Items[rdStatus.ItemIndex];
                TfrxMemoView(FindComponent('lbTit02')).Text    := 'Ordenado:';
                TfrxMemoView(FindComponent('lbFild02')).Text   := rdOrdena.Items[rdOrdena.ItemIndex];
                TfrxMemoView(FindComponent('lbTit03')).Text    := 'Período:';
                TfrxMemoView(FindComponent('lbFild03')).Text   := '';
                if (edtDtInicio.Date > 0) then
                  TfrxMemoView(FindComponent('lbFild03')).Text := edtDtInicio.Text;
                if (edtDtFim.Date > 0) then
                  TfrxMemoView(FindComponent('lbFild03')).Text := edtDtInicio.Text + ' à ' + edtDtFim.Text;
                if (edtDtFim.Date <= 0) and (edtDtFim.Date <= 0) then begin
                  TfrxMemoView(FindComponent('lbFild03')).Visible  := false;
                  TfrxMemoView(FindComponent('lbTit03')).Visible   := false;
                end;

                TfrxMemoView(FindComponent('Memo89')).Text   := 'Fundos de Reserva Livre ( '+FormatFloat('0.00',funcBasico.PercFundoReserva)+' %)';
                TfrxMemoView(FindComponent('Memo115')).Text  := 'Fundos de Reserva Lucro ( '+FormatFloat('0.00',funcBasico.PercReservaLucro)+' %)';
                TfrxMemoView(FindComponent('Memo118')).Text  := 'Fundos de Reserva Legal ( '+FormatFloat('0.00',funcBasico.PercReservaLegal)+' %)';
                TfrxMemoView(FindComponent('Memo121')).Text  := 'Fundos de Reserva Estatutárias ( '+FormatFloat('0.00',funcBasico.PercReservaEstatutarias )+' %)';


                Rec_Total_Titulos := 0; Rec_Titulos_Aberto := 0; Rec_Titulos_Recebidos := 0;
                Rec_Titulos_Cancelados := 0; Pag_Total_Titulos := 0; Pag_Titulos_Aberto := 0;
                Pag_Titulos_Recebidos := 0; Pag_Titulos_Cancelados := 0;

                GerarContasPagarReceber();

                Variables['Rec_Total_Titulos']       := Rec_Total_Titulos;
                Variables['Rec_Titulos_Aberto']      := Rec_Titulos_Aberto;
                Variables['Rec_Titulos_Recebidos']   := Rec_Titulos_Recebidos;
                Variables['Rec_Titulos_Cancelados']  := Rec_Titulos_Cancelados;
                Variables['Pag_Total_Titulos']       := Pag_Total_Titulos;
                Variables['Pag_Titulos_Aberto']      := Pag_Titulos_Aberto;
                Variables['Pag_Titulos_Recebidos']   := Pag_Titulos_Recebidos;
                Variables['Pag_Titulos_Cancelados']  := Pag_Titulos_Cancelados;
                Vlr_Fundo_Reserva_Livre              := 0;
                Vlr_Fundo_Reserva_Lucro              := 0;
                Vlr_Fundo_Reserva_Legal              := 0;
                Vlr_Fundo_Reserva_Estatutarias       := 0;

                if funcBasico.PercFundoReserva > 0 then
                  Vlr_Fundo_Reserva_Livre            := funcBasico.Se(funcBasico.AplicFundoReservaRecLiq,((Rec_Total_Titulos-Pag_Total_Titulos)*funcBasico.PercFundoReserva)/100,(Rec_Total_Titulos*funcBasico.PercFundoReserva)/100);

                if funcBasico.PercReservaLucro >0 then
                  Vlr_Fundo_Reserva_Lucro            := ((Rec_Total_Titulos*funcBasico.PercReservaLucro)/100);

                if funcBasico.PercReservaLegal > 0 then
                  Vlr_Fundo_Reserva_Legal            := (((Rec_Total_Titulos-Pag_Total_Titulos)*funcBasico.PercReservaLegal)/100);

                if funcBasico.PercReservaEstatutarias>0 then
                  Vlr_Fundo_Reserva_Estatutarias     := funcBasico.Se(funcBasico.AplicFDERecLiq,((Rec_Total_Titulos-Pag_Total_Titulos)*funcBasico.PercReservaEstatutarias)/100,(Rec_Total_Titulos*funcBasico.PercReservaEstatutarias)/100);

                if not ckFundoReserva.Checked then begin
                  Vlr_Fundo_Reserva_Livre              := 0;
                  Vlr_Fundo_Reserva_Lucro              := 0;
                  Vlr_Fundo_Reserva_Legal              := 0;
                  Vlr_Fundo_Reserva_Estatutarias       := 0;
                end;

                Variables['FundoReservaLivre']       := funcBasico.Se(Vlr_Fundo_Reserva_Livre< 0,0,Vlr_Fundo_Reserva_Livre);
                Variables['FundoReservaLucro']       := funcBasico.Se(Vlr_Fundo_Reserva_Lucro< 0,0,Vlr_Fundo_Reserva_Lucro);
                Variables['FundoReservaLegal']       := funcBasico.Se(Vlr_Fundo_Reserva_Legal< 0,0,Vlr_Fundo_Reserva_Legal);
                Variables['FundoReservaEstatutarias']:= funcBasico.Se(Vlr_Fundo_Reserva_Estatutarias< 0,0,Vlr_Fundo_Reserva_Estatutarias);

                case ckSaldo.Checked of
                  true : begin
                    Variables['SaldoBanco'] := funcBasico.Se(funcBasico.TemPermissao('319'), funcBasico.SaldoBancario, 0);
                  end;
                  false : begin
                    Variables['SaldoBanco'] := 0;
                  end;
                end;
                case ckSaldoCaixa.Checked of
                  true : begin
                    Variables['SaldoCaixa'] := SaldoemCaixa;
                  end;
                  false : begin
                    Variables['SaldoCaixa'] := 0;
                  end;
                end;
                Self.SendToBack;
                case rdOpcao_Impressao.ItemIndex of
                  0 : frRelatorio.ShowReport();
                  1 : frRelatorio.Print;
                end;
              end;
            finally
            end;
          end;
        end;
      end else funcBasico.Alerta('Não há registros a serem impressos.',1);
    end;
  finally
    Self.BringToFront;
    funcBasico.MSGAguarde(false);
    btnImprimir.Enabled := true;
  end;
end;

function TfRel_Contas_Receber_X_Pagar.GeraSQLPag : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    try
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      ''Pagar'' AS TIPO,');
        Add('      CP.CPAG_ID,');
        Add('      CP.CPAG_EMPR_ID,');
        Add('      CP.CPAG_NR_DOC,');
        Add('      CP.CPAG_PROVENIENTE,');
        Add('      CP.CPAG_FORN_ID,');
        Add('      CP.CPAG_PLCT_ID,');
        Add('      CP.CPAG_PLCT_EMPR_ID,');
        Add('      CP.CPAG_DTA_EMISSAO,');
        Add('      CP.CPAG_DTA_VCTO,');
        Add('      CP.CPAG_DTA_PGTO,');
        Add('      CP.CPAG_VALOR_DOC,');
        Add('      CP.CPAG_VALOR_JUROS,');
        Add('      CP.CPAG_VALOR_MORA,');
        Add('      CP.CPAG_STATUS,');
        Add('      CP.CPAG_VALOR_PAGO,');
        Add('      CP.CPAG_GENE_EMPR_ID_TIPO_DOC,');
        Add('      CP.CPAG_GENE_TGEN_ID_TIPO_DOC,');
        Add('      CP.CPAG_GENE_ID_TIPO_DOC,');
        Add('      CP.CPAG_OBS,');
        Add('      CP.CPAG_USER_ID_CANC,');
        Add('      CP.CPAG_DTA_CANC,');
        Add('      CP.CPAG_MOTIVO_CANC,');
        Add('      CP.CPAG_DTA_CADASTRO,');
        Add('      CP.CPAG_USER_ID,');
        Add('      FN.FORN_NOME_FANTASIA,');
        Add('      PL.PLCT_COD_SIMPLIFICADO,');
        Add('      PL.PLCT_DESCRICAO,');
        Add('      PL.PLCT_TIPO,');
        Add('      CASE CP.CPAG_PREVISAO');
        Add('           WHEN 1 THEN ''Previsão''');
        Add('           ELSE CASE CP.CPAG_STATUS');
        Add('                     WHEN ''A'' THEN ''Aberto''');
        Add('                     WHEN ''F'' THEN ''Fechado''');
        Add('                     WHEN ''C'' THEN ''Cancelado''');
        Add('                 END');
        Add('      END AS STATUS,');
        Add('      CASE CP.CPAG_GENE_ID_TIPO_DOC');
        Add('           WHEN 1 THEN ''Dinheiro''');
        Add('           WHEN 2 THEN ''Cheque''');
        Add('           WHEN 3 THEN ''Ch Prazo''');
        Add('           WHEN 4 THEN ''C. Débito''');
        Add('           WHEN 5 THEN ''C. Crédito''');
        Add('           WHEN 6 THEN ''Carteira''');
        Add('           WHEN 7 THEN ''Boleto''');
        Add('           WHEN 8 THEN ''Duplicata''');
        Add('      END AS TIPO_DOC,');
        Add('      UC.USER_LOGIN USER_CANCEL,');
        Add('      CP.CPAG_DTA_EFETIVO');
        Add('FROM  CONTAS_PAGAR CP');
        Add('INNER JOIN FORNECEDORES FN');
        Add('ON (FN.FORN_ID = CP.CPAG_FORN_ID)');
        Add('INNER JOIN PLANO_CONTAS PL');
        Add('ON (PL.PLCT_ID      = CP.CPAG_PLCT_ID');
        Add('AND PL.PLCT_EMPR_ID = CP.CPAG_PLCT_EMPR_ID)');
        Add('INNER JOIN GENERICA TP');
        Add('ON (TP.GENE_EMPR_ID = CP.CPAG_GENE_EMPR_ID_TIPO_DOC');
        Add('AND TP.GENE_TGEN_ID = CP.CPAG_GENE_TGEN_ID_TIPO_DOC');
        Add('AND TP.GENE_ID      = CP.CPAG_GENE_ID_TIPO_DOC)');
        Add('LEFT OUTER JOIN USUARIO UC');
        Add('ON (UC.USER_ID = CP.CPAG_USER_ID_CANC)');
        Add('WHERE CP.CPAG_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));

        if frPesqPlanoContas.TemRegistros then
          Add('AND CP.CPAG_PLCT_ID ' + frPesqPlanoContas.InGrid());

        if frPesqTipoDoc.TemRegistros then
          Add('AND CP.CPAG_GENE_ID_TIPO_DOC ' + frPesqTipoDoc.InGrid());

        if frPesqFornecedores.TemRegistros then
          Add('AND CP.CPAG_FORN_ID ' + frPesqFornecedores.InGrid());

        if frPesqContaBancaria.TemRegistros then
          Add('AND CP.CPAG_CBCO_ID ' + frPesqContaBancaria.InGrid());

        if edtDtInicio.Date > 0 then
          Add('AND CP.CPAG_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)));
        if edtDtFim.Date > 0 then
          Add('AND CP.CPAG_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtFim.Date)));
        if edtDt_Emissao_Inicio.Date > 0 then
          Add('AND CP.CPAG_DTA_EMISSAO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Emissao_Inicio.Date)));
        if edtDt_Emissao_Fim.Date > 0 then
          Add('AND CP.CPAG_DTA_EMISSAO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Emissao_Fim.Date)));
        if edtDt_Vcto_Inicio.Date > 0 then
          Add('AND CP.CPAG_DTA_VCTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Vcto_Inicio.Date)));
        if edtDt_Vcto_Fim.Date > 0 then
          Add('AND CP.CPAG_DTA_VCTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Vcto_Fim.Date)));
        if edtDt_Pagto_Inicio.Date > 0 then
          Add('AND CP.CPAG_DTA_PGTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Pagto_Inicio.Date)));
        if edtDt_Pagto_Fim.Date > 0 then
          Add('AND CP.CPAG_DTA_PGTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Pagto_Fim.Date)));
        if edtDt_Canc_Inicio.Date > 0 then
          Add('AND CP.CPAG_DTA_CANC >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Canc_Inicio.Date)));
        if edtDt_Canc_Fim.Date > 0 then
          Add('AND CP.CPAG_DTA_CANC <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Canc_Fim.Date)));
        if edtDtEfetivaInicio.Date > 0 then
          Add('AND CP.CPAG_DTA_EFETIVO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtEfetivaInicio.Date)));
        if edtDtEfetivaFim.Date > 0 then
          Add('AND CP.CPAG_DTA_EFETIVO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtEfetivaFim.Date)));
        case rdStatus.ItemIndex of
          0 : Add('AND CP.CPAG_STATUS = ' + QuotedStr('A'));
          1 : Add('AND CP.CPAG_STATUS = ' + QuotedStr('F'));
          2 : Add('AND CP.CPAG_STATUS = ' + QuotedStr('C'));
          3 : Add('AND CP.CPAG_STATUS IN (' + QuotedStr('A') + ',' + QuotedStr('F') + ')');
          5 : Add('AND CP.CPAG_STATUS = ''A'' AND CP.CPAG_PREVISAO = 0');
          6 : Add('AND CP.CPAG_STATUS = ''A'' AND CP.CPAG_PREVISAO = 1');
        end;
        Add('ORDER BY CP.CPAG_DTA_VCTO,');
        case rdOrdena.ItemIndex of
          0  : Add('CP.CPAG_ID');
          1  : Add('CP.CPAG_NR_DOC');
          2  : Add('CP.CPAG_PROVENIENTE');
          3  : Add('FN.FORN_NOME_FANTASIA');
          4  : Add('PL.PLCT_DESCRICAO');
          5  : Add('CP.CPAG_DTA_CADASTRO');
          6  : Add('CP.CPAG_DTA_EMISSAO');
          7  : Add('CP.CPAG_DTA_VCTO');
          8  : Add('CP.CPAG_DTA_PGTO');
          9  : Add('CP.CPAG_DTA_CANC');
          10 : Add('STATUS');
          11 : Add('CP.CPAG_VALOR_DOC');
        end;
      end;
//      showmessage(sltTMP.Text);
      Result := sltTMP.Text;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'GeraSQL',funcBasico.User_Login,e.Message);
      funcBasico.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

function TfRel_Contas_Receber_X_Pagar.GeraSQLRec : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    try
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      ''Receber'' AS TIPO,');
        Add('      CR.CREC_ID,');
        Add('      CR.CREC_EMPR_ID,');
        Add('      CR.CREC_NR_DOC,');
        Add('      CR.CREC_PROVENIENTE,');
        Add('      CR.CREC_CLIE_ID,');
        Add('      CR.CREC_CLIE_EMPR_ID,');
        Add('      CR.CREC_PLCT_ID,');
        Add('      CR.CREC_PLCT_EMPR_ID,');
        Add('      CR.CREC_DTA_EMISSAO,');
        Add('      CR.CREC_DTA_VCTO,');
        Add('      CR.CREC_DTA_PGTO,');
        Add('      CR.CREC_VALOR_DOC,');
        Add('      CR.CREC_VALOR_JUROS,');
        Add('      CR.CREC_VALOR_MORA,');
        Add('      CR.CREC_STATUS,');
        Add('      CR.CREC_VALOR_PAGO,');
        Add('      CR.CREC_GENE_EMPR_ID_TIPO_DOC,');
        Add('      CR.CREC_GENE_TGEN_ID_TIPO_DOC,');
        Add('      CR.CREC_GENE_ID_TIPO_DOC,');
        Add('      CR.CREC_OBS,');
        Add('      CR.CREC_USER_ID_CANC,');
        Add('      CR.CREC_DTA_CANC,');
        Add('      CR.CREC_MOTIVO_CANC,');
        Add('      CR.CREC_DTA_CADASTRO,');
        Add('      CR.CREC_USER_ID,');
        Add('      CL.CLIE_FANTASIA,');
        Add('      PL.PLCT_COD_SIMPLIFICADO,');
        Add('      PL.PLCT_DESCRICAO,');
        Add('      CASE CR.CREC_PREVISAO');
        Add('           WHEN 1 THEN ''Previsão''');
        Add('           ELSE CASE CR.CREC_STATUS');
        Add('                     WHEN ''A'' THEN ''Aberto''');
        Add('                     WHEN ''F'' THEN ''Fechado''');
        Add('                     WHEN ''C'' THEN ''Cancelado''');
        Add('                 END');
        Add('      END AS STATUS,');
        Add('      CASE CR.CREC_GENE_ID_TIPO_DOC');
        Add('           WHEN 1 THEN ''Dinheiro''');
        Add('           WHEN 2 THEN ''Cheque''');
        Add('           WHEN 3 THEN ''Ch Prazo''');
        Add('           WHEN 4 THEN ''C. Débito''');
        Add('           WHEN 5 THEN ''C. Crédito''');
        Add('           WHEN 6 THEN ''Carteira''');
        Add('           WHEN 7 THEN ''Boleto''');
        Add('           WHEN 8 THEN ''Duplicata''');
        Add('      END AS TIPO_DOC,');
        Add('      UC.USER_LOGIN USER_CANC,');
        Add('      CR.CREC_DTA_EFETIVO');
        Add('FROM  CONTAS_RECEBER CR');
        Add('INNER JOIN CLIENTES CL');
        Add('ON (CL.CLIE_ID      = CR.CREC_CLIE_ID');
        Add('AND CL.CLIE_EMPR_ID = CR.CREC_CLIE_EMPR_ID)');
        Add('INNER JOIN PLANO_CONTAS PL');
        Add('ON (PL.PLCT_ID      = CR.CREC_PLCT_ID');
        Add('AND PL.PLCT_EMPR_ID = CR.CREC_PLCT_EMPR_ID)');
        Add('INNER JOIN GENERICA TP');
        Add('ON (TP.GENE_EMPR_ID = CR.CREC_GENE_EMPR_ID_TIPO_DOC');
        Add('AND TP.GENE_TGEN_ID = CR.CREC_GENE_TGEN_ID_TIPO_DOC');
        Add('AND TP.GENE_ID      = CR.CREC_GENE_ID_TIPO_DOC)');
        Add('LEFT OUTER JOIN USUARIO UC');
        Add('ON (UC.USER_ID      = CR.CREC_USER_ID_CANC)');
        Add('WHERE CR.CREC_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));

        if frPesqPlanoContas.TemRegistros then
          Add('AND CR.CREC_PLCT_ID ' + frPesqPlanoContas.InGrid());

        if frPesqTipoDoc.TemRegistros then
          Add('AND CR.CREC_GENE_ID_TIPO_DOC ' + frPesqTipoDoc.InGrid());

        if frPesqClientes.TemRegistros then
          Add('AND CR.CREC_CLIE_ID ' + frPesqClientes.InGrid());

        if frPesqContaBancaria.TemRegistros then
          Add('AND CR.CREC_CBCO_ID ' + frPesqContaBancaria.InGrid());

        if edtDtInicio.Date > 0 then
          Add('AND CR.CREC_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)));
        if edtDtFim.Date > 0 then
          Add('AND CR.CREC_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtFim.Date)));
        if edtDt_Emissao_Inicio.Date > 0 then
          Add('AND CR.CREC_DTA_EMISSAO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Emissao_Inicio.Date)));
        if edtDt_Emissao_Fim.Date > 0 then
          Add('AND CR.CREC_DTA_EMISSAO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Emissao_Fim.Date)));
        if edtDt_Vcto_Inicio.Date > 0 then
          Add('AND CR.CREC_DTA_VCTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Vcto_Inicio.Date)));
        if edtDt_Vcto_Fim.Date > 0 then
          Add('AND CR.CREC_DTA_VCTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Vcto_Fim.Date)));
        if edtDt_Pagto_Inicio.Date > 0 then
          Add('AND CR.CREC_DTA_PGTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Pagto_Inicio.Date)));
        if edtDt_Pagto_Fim.Date > 0 then
          Add('AND CR.CREC_DTA_PGTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Pagto_Fim.Date)));
        if edtDt_Canc_Inicio.Date > 0 then
          Add('AND CR.CREC_DTA_CANC >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Canc_Inicio.Date)));
        if edtDt_Canc_Fim.Date > 0 then
          Add('AND CR.CREC_DTA_CANC <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Canc_Fim.Date)));
        if edtDtEfetivaInicio.Date > 0 then
          Add('AND CR.CREC_DTA_EFETIVO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtEfetivaInicio.Date)));
        if edtDtEfetivaFim.Date > 0 then
          Add('AND CR.CREC_DTA_EFETIVO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtEfetivaFim.Date)));

        case rdStatus.ItemIndex of
          0 : Add('AND CR.CREC_STATUS = ' + QuotedStr('A'));
          1 : Add('AND CR.CREC_STATUS = ' + QuotedStr('F'));
          2 : Add('AND CR.CREC_STATUS = ' + QuotedStr('C'));
          3 : Add('AND CR.CREC_STATUS IN ('+ QuotedStr('A') + ',' + QuotedStr('F') +')');
          5 : Add('AND CR.CREC_STATUS = ''A'' AND CR.CREC_PREVISAO = 0');
          6 : Add('AND CR.CREC_STATUS = ''A'' AND CR.CREC_PREVISAO = 1');
        end;

        case rdSepararTitulos.ItemIndex of
          0 : Add('ORDER BY CR.CREC_DTA_VCTO,');
          1 : Add('ORDER BY ');
        end;

        case rdOrdena.ItemIndex of
          0  : Add('CR.CREC_ID');
          1  : Add('CR.CREC_NR_DOC');
          2  : Add('CR.CREC_PROVENIENTE');
          3  : Add('CL.CLIE_FANTASIA');
          4  : Add('PL.PLCT_DESCRICAO');
          5  : Add('CR.CREC_DTA_CADASTRO');
          6  : Add('CR.CREC_DTA_EMISSAO');
          7  : Add('CR.CREC_DTA_VCTO');
          8  : Add('CR.CREC_DTA_PGTO');
          9  : Add('CR.CREC_DTA_CANC');
          10 : Add('STATUS');
          11 : Add('CR.CREC_VALOR_DOC');
        end;
      end;
      //sltTMP.SaveToFile('C:\Text.txt');
      Result := sltTMP.Text;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'GeraSQL',funcBasico.User_Login,e.Message);
      funcBasico.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfRel_Contas_Receber_X_Pagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(dmRel_Contas_Receber_X_Pagar);
  FreeAndNil(fRel_Contas_Receber_X_Pagar_Sintetico);
end;

procedure TfRel_Contas_Receber_X_Pagar.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  if dmRel_Contas_Receber_X_Pagar = nil then
    dmRel_Contas_Receber_X_Pagar := TdmRel_Contas_Receber_X_Pagar.Create(NIl);
  cdsGeral     := dmRel_Contas_Receber_X_Pagar.cdsRel_Contas_Receber;
  inherited;
  edtDt_Vcto_Inicio.Date := StartOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  edtDt_Vcto_Fim.Date    := EndOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  SetaValoresFrames();
  dstRelatorio.DataSource := dmRel_Contas_Receber_X_Pagar.dsRel_Contas_Receber;
  dstRelatorioPagar.DataSource := dmRel_Contas_Receber_X_Pagar.dsRel_Contas_Pagar;
end;

procedure TfRel_Contas_Receber_X_Pagar.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfRel_Contas_Receber_X_Pagar.SetaValoresFrames();
var
  intI  : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TfrPesquisa) then begin
      (Components[intI] as TfrPesquisa).Limpar;
      (Components[intI] as TfrPesquisa).funcLocal := Self.funcBasico;
      (Components[intI] as TfrPesquisa).ckPlanoContas.Checked := funcBasico.FiltrarPlanoContasPAI;
    end;
  end;
end;

procedure TfRel_Contas_Receber_X_Pagar.frPesqClientesbtnPesqClick(
  Sender: TObject);
begin
  inherited;
  frPesqClientes.btnPesqClick(Sender);
end;

procedure TfRel_Contas_Receber_X_Pagar.Timer1Timer(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Contas_Receber_X_Pagar.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Contas_Receber_X_Pagar.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Contas_Receber_X_Pagar.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Contas_Receber_X_Pagar);
finalization
  UnRegisterClass(TfRel_Contas_Receber_X_Pagar);

end.
