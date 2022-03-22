unit ufRel_Ordem_Servicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, ComCtrls, Menus, uFrPesquisa, frxClass, frxDBSet, frxDesgn,
  frxExportPDF;

type
  TfRel_Ordem_Servico = class(TfBasico)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox6: TGroupBox;
    GroupBox5: TGroupBox;
    edtDtAgendaInicio: TDateEdit;
    edtDtAgendaFim: TDateEdit;
    rdOpcao_Impressao: TRadioGroup;
    rdStatus: TRadioGroup;
    rdTipoRel: TRadioGroup;
    TabSheet3: TTabSheet;
    frPesqCliente: TfrPesquisa;
    frPesqTecnico: TfrPesquisa;
    frPesqProduto: TfrPesquisa;
    frPesqEquipamento: TfrPesquisa;
    frPesqTipoOS: TfrPesquisa;
    frPesqTabPreco: TfrPesquisa;
    frPesqUsuario: TfrPesquisa;
    frPesqTipoProduto: TfrPesquisa;
    frPesqStatusOS: TfrPesquisa;
    frPesqTipoAgendamento: TfrPesquisa;
    GroupBox1: TGroupBox;
    edtDtAnivInicio: TDateEdit;
    edtDtAnivFim: TDateEdit;
    dstRelatorioOS: TfrxDBDataset;
    frRelatorioOSPorProfissional: TfrxReport;
    dstRelatorioOSItens: TfrxDBDataset;
    dstRelatorioPecasServicos: TfrxDBDataset;
    frRelatorioOSPorAtendente: TfrxReport;
    frRelatorioAtendente: TfrxReport;
    GroupBox2: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    edtDtCadInicio: TDateEdit;
    edtDtCadFim: TDateEdit;
    frPesqPracas: TfrPesquisa;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtDtInicioKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure frPesqTecnicobtnPesqClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    LimitarProfTodoSistema : Boolean;
    function GeraSQL: String;
    function GeraComissao: String;
  public
    { Public declarations }
  end;

var
  fRel_Ordem_Servico: TfRel_Ordem_Servico;

implementation

uses udmRel_Ordem_Servicos, ufRel_Ordem_Servico_Analitico,
  ufRel_Ordem_Servico_Tecnico,
  ufRel_Produtos_Servicos, ufRelEtiquetas;

{$R *.dfm}

procedure TfRel_Ordem_Servico.btnNovoClick(Sender: TObject);
begin
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Ordem_Servico do begin
      if not (rdTipoRel.ItemIndex in [3,4,5]) then begin
        with cdsRel_Ordem_Servico do begin
          Close;
          CommandText := GeraSQL;
          Open;
          if not IsEmpty then begin
            case rdTipoRel.ItemIndex of
              6: begin
                try
                  fRelEtiquetas := TfRelEtiquetas.Create(nil);
                  with fRelEtiquetas do begin
                    cdsRel_Ordem_Servico.First;
                    case rdOpcao_Impressao.ItemIndex of
                      0: qrepRelatorio.Preview;
                      1: qrepRelatorio.Print;
                    end;
                  end;
                finally
                  FreeAndNil(fRelEtiquetas);
                end;
              end;
              0: begin
                try
                  if fRel_Ordem_Servico_Analitico = nil then
                    fRel_Ordem_Servico_Analitico := TfRel_Ordem_Servico_Analitico.Create(nil);
                  with fRel_Ordem_Servico_Analitico do begin
                    lbTit01.Caption := '';
                    lbFild01.Caption := '';
                    lbTit02.Caption := '';
                    lbFild02.Caption := '';
                    lbTit03.Caption := '';
                    lbFild03.Caption := '';
                    if (edtDtInicio.Date > 0) or (edtDtFim.Date > 0) then begin
                      lbTit01.Caption := 'Dt. Cadastro:';
                      lbFild01.Caption := '';
                      if edtDtInicio.Date > 0 then
                        lbFild01.Caption := edtDtInicio.Text;
                      if edtDtFim.Date > 0 then
                        lbFild01.Caption := lbFild01.Caption + ' à ' +
                          edtDtFim.Text;
                    end;
                    if (edtDtAgendaInicio.Date > 0) or (edtDtAgendaFim.Date > 0) then begin
                      lbTit02.Caption := 'Dt. Agenda:';
                      lbFild02.Caption := '';
                      if edtDtAgendaInicio.Date > 0 then
                        lbFild02.Caption := edtDtAgendaInicio.Text;
                      if edtDtAgendaFim.Date > 0 then
                        lbFild02.Caption := lbFild02.Caption + ' à ' + edtDtAgendaFim.Text;
                    end;
                    lbTit03.Caption := 'Status:';
                    lbFild03.Caption := rdStatus.Items[rdStatus.ItemIndex];
                    case rdOpcao_Impressao.ItemIndex of
                      0: qrepRelatorio.Preview;
                      1: qrepRelatorio.Print;
                    end;
                  end;
                finally
                  FreeAndNil(fRel_Ordem_Servico_Analitico);
                end;
              end;
              1 : begin
                try
                  with frRelatorioOSPorProfissional do begin
                    TfrxMemoView(FindComponent('lbTit01')).Text    := 'Tipo:';
                    TfrxMemoView(FindComponent('lbFild01')).Text   := rdTipoRel.Items[rdTipoRel.ItemIndex];
                    TfrxMemoView(FindComponent('lbTit02')).Text    := 'Status:';
                    TfrxMemoView(FindComponent('lbFild02')).Text   := rdStatus.Items[rdStatus.ItemIndex];
                    Self.SendToBack;
                    case rdOpcao_Impressao.ItemIndex of
                      0 : frRelatorioOSPorProfissional.ShowReport();
                      1 : frRelatorioOSPorProfissional.Print;
                    end;
                  end;
                finally
                end;
              end;
              2 : begin
                try
                  with frRelatorioOSPorAtendente do begin
                    TfrxMemoView(FindComponent('lbTit01')).Text    := 'Tipo:';
                    TfrxMemoView(FindComponent('lbFild01')).Text   := rdTipoRel.Items[rdTipoRel.ItemIndex];
                    TfrxMemoView(FindComponent('lbTit02')).Text    := 'Status:';
                    TfrxMemoView(FindComponent('lbFild02')).Text   := rdStatus.Items[rdStatus.ItemIndex];
                    Self.SendToBack;
                    case rdOpcao_Impressao.ItemIndex of
                      0 : frRelatorioOSPorAtendente.ShowReport();
                      1 : frRelatorioOSPorAtendente.Print;
                    end;
                  end;
                finally
                end;
              end;
            end;
          end else begin
            funcLocal.Alerta('Não há registros a serem impressos.', 0);
          end;
        end;
      end else begin
        with cdsComissao_Pecas_Servicos do begin
          Close;
          CommandText := GeraComissao;
          Open;
          if IsEmpty then begin
            funcLocal.Alerta('Não há registros a serem impressos.', 0);
            Exit;
          end;
          case rdTipoRel.ItemIndex of
            3,4 : begin
              try
                with frRelatorio do begin
                  TfrxMemoView(FindComponent('lbTit01')).Text    := 'Tipo:';
                  TfrxMemoView(FindComponent('lbFild01')).Text   := rdTipoRel.Items[rdTipoRel.ItemIndex];
                  TfrxMemoView(FindComponent('lbTit02')).Text    := 'Status:';
                  TfrxMemoView(FindComponent('lbFild02')).Text   := rdStatus.Items[rdStatus.ItemIndex];
                  Self.SendToBack;
                  case rdOpcao_Impressao.ItemIndex of
                    0 : frRelatorio.ShowReport();
                    1 : frRelatorio.Print;
                  end;
                end;
              finally
              end;
            end;
            5 : begin
              try
                with frRelatorioAtendente do begin
                  TfrxMemoView(FindComponent('lbTit01')).Text    := 'Tipo:';
                  TfrxMemoView(FindComponent('lbFild01')).Text   := rdTipoRel.Items[rdTipoRel.ItemIndex];
                  TfrxMemoView(FindComponent('lbTit02')).Text    := 'Status:';
                  TfrxMemoView(FindComponent('lbFild02')).Text   := rdStatus.Items[rdStatus.ItemIndex];
                  Self.SendToBack;
                  case rdOpcao_Impressao.ItemIndex of
                    0 : frRelatorioAtendente.ShowReport();
                    1 : frRelatorioAtendente.Print;
                  end;
                end;
              finally
              end;
            end;
          end;
        end;
      end;
    end;
  finally
    btnImprimir.Enabled := true;
    funcBasico.MSGAguarde(false);
  end;
end;

function TfRel_Ordem_Servico.GeraComissao: String;
var
  sltTMP: TStringList;
begin
  try
    Result := '';
    sltTMP := TStringList.Create;
    try
      with sltTMP do
      begin
        Clear;
        Add('SELECT');
        Add('      ORDS_ID,');
        Add('      ORDS_EMPR_ID,');
        Add('      ORDS_CLIE_ID,');
        Add('      CLIE_RAZAO_SOCIAL,');
        Add('      ORDS_TPRC_ID,');
        Add('      TPRC_DESCRICAO,');
        Add('      ORDS_DTA_INSTALACAO,');
        Add('      ORDS_GENE_ID_TIPO_OS,');
        Add('      DESCR_TIPO_OS,');
        Add('      ORDS_STATUS,');
        Add('      STATUS_OS,');
        Add('      ORDS_PROD_ID_EQUIP,');
        Add('      EQUIP_DESCRICAO,');
        Add('      EQUIP_UNIDADE,');
        Add('      EQUIP_MARCA,');
        Add('      EQUIP_MODELO,');
        Add('      EQUIP_FORNECEDOR,');
        Add('      ORDS_DTA_CADASTRO,');
        Add('      ORDS_USER_ID,');
        Add('      USER_ATENDENTE,');
        Add('      ORDS_VLR_PAGO,');
        Add('      ORDS_VLR_DESCONTO,');
        Add('      ORDS_VLR_TOTAL_OS,');
        Add('      CASE');
        Add('           WHEN ORDS_VLR_DESCONTO > 0 THEN ((COALESCE(ORDS_VLR_DESCONTO,0)*100)/COALESCE(ORDS_VLR_TOTAL_OS,1))');
        Add('           ELSE 0');
        Add('      END                                                                       AS VLR_PERC_DESC,');
        Add('      ORDS_USER_ID_TEC,');
        Add('      USER_NOME_TECNICO,');
        Add('      FILTRO,');
        Add('      ATENDENTE,');
        Add('      SUM(VLRCOMISSAOINTERNO)                                                   AS VLRCOMISSAOINTERNO,');
        Add('      SUM(VLRCOMISSAOEXTERNO)                                                   AS VLRCOMISSAOEXTERNO,');
        Add('      SUM(VLRCOMISSAOBALCAO)                                                    AS VLRCOMISSAOBALCAO,');
        Add('      ORDS_HORARIO,');
        Add('      CLIE_TELEFONE1,');
        Add('      CLIE_TELEFONE2,');
        Add('      PRACA');
        Add('FROM');
        Add('    (SELECT');
        Add('           OS.ORDS_ID,');
        Add('           OS.ORDS_EMPR_ID,');
        Add('           OS.ORDS_CLIE_ID,');
        Add('           CL.CLIE_RAZAO_SOCIAL,');
        Add('           OS.ORDS_TPRC_ID,');
        Add('           TP.TPRC_DESCRICAO,');
        Add('           OS.ORDS_DTA_INSTALACAO,');
        Add('           OS.ORDS_GENE_ID_TIPO_OS,');
        Add('           OT.GENE_DESCR                                                        AS DESCR_TIPO_OS,');
        Add('           OS.ORDS_STATUS,');
        Add('           CASE OS.ORDS_STATUS');
        Add('                WHEN 0 THEN ''Agendado''');
        Add('                WHEN 1 THEN ''Realizado''');
        Add('                WHEN 2 THEN ''Real./Pago''');
        Add('                WHEN 3 THEN ''Cancelado''');
        Add('           END                                                                  AS STATUS_OS,');
        Add('           OS.ORDS_PROD_ID_EQUIP,');
        Add('           EP.PROD_DESCRICAO                                                    AS EQUIP_DESCRICAO,');
        Add('           UEP.GENE_PAR1                                                       AS EQUIP_UNIDADE,');
        Add('           EM.GENE_DESCR                                                        AS EQUIP_MARCA,');
        Add('           ME.GENE_DESCR                                                        AS EQUIP_MODELO,');
        Add('           FE.FORN_RAZAO_SOCIAL                                                 AS EQUIP_FORNECEDOR,');
        Add('           OS.ORDS_DTA_CADASTRO,');
        Add('           OS.ORDS_USER_ID,');
        Add('           UA.USER_NOME_COMPLETO                                                AS USER_ATENDENTE,');
        Add('           OI.ODIT_TPIT_PROD_ID,');
        Add('           PR.PROD_DESCRICAO,');
        Add('           UN.GENE_PAR1 AS PROD_UNIDADE,');
        Add('           MC.GENE_DESCR                                                        AS MARCA_PROD,');
        Add('           MD.GENE_DESCR                                                        AS MODELO_PROD,');
        Add('           PR.PROD_TIPO_COMISSAO,');
        Add('           CASE PR.PROD_TIPO_COMISSAO');
        Add('                WHEN 0 THEN ''%''');
        Add('                WHEN 1 THEN ''R$''');
        Add('           END                                                                  AS TIPO_COMISSAO,');
        Add('           PR.PROD_COMISSAO_VEND_INTERNA,');
        Add('           PR.PROD_COMISSAO_VEND_EXTERNO,');
        Add('           PR.PROD_COMISSAO_VEND_BALCAO,');
        Add('           OI.ODIT_VLR_UNITARIO,');
        Add('           OI.ODIT_QTDE,');
        Add('           OI.ODIT_VLR_TOTAL,');
        Add('           OS.ORDS_VLR_PAGO,');
        Add('           OS.ORDS_VLR_DESCONTO,');
        Add('           OS.ORDS_VLR_TOTAL_OS,');
        Add('           OS.ORDS_USER_ID_TEC,');
        Add('           UT.USER_NOME_COMPLETO                                                AS USER_NOME_TECNICO,');
        Add('           FI.GENE_DESCR                                                        AS FILTRO,');
        Add('           ATE.USER_NOME_COMPLETO                                               AS ATENDENTE,');
        Add('           CASE PR.PROD_TIPO_COMISSAO');
        Add('                WHEN 0 THEN OI.ODIT_VLR_TOTAL*(PR.PROD_COMISSAO_VEND_INTERNA/100)');
        Add('                ELSE OI.ODIT_QTDE * PR.PROD_COMISSAO_VEND_INTERNA');
        Add('           END                                                                  AS VLRCOMISSAOINTERNO,');
        Add('           CASE PR.PROD_TIPO_COMISSAO');
        Add('                WHEN 0 THEN OI.ODIT_VLR_TOTAL*(PR.PROD_COMISSAO_VEND_EXTERNO/100)');
        Add('                ELSE OI.ODIT_QTDE * PR.PROD_COMISSAO_VEND_EXTERNO');
        Add('           END                                                                  AS VLRCOMISSAOEXTERNO,');
        Add('           CASE PR.PROD_TIPO_COMISSAO');
        Add('                WHEN 0 THEN OI.ODIT_VLR_TOTAL*(PR.PROD_COMISSAO_VEND_BALCAO/100)');
        Add('                ELSE OI.ODIT_QTDE * PR.PROD_COMISSAO_VEND_BALCAO');
        Add('           END                                                                  AS VLRCOMISSAOBALCAO,');
        Add('           OS.ORDS_HORARIO,');
        Add('           CL.CLIE_TELEFONE1,');
        Add('           CL.CLIE_TELEFONE2,');
        Add('           CL.CLIE_GENE_ID_PRACA AS PRACA');
        Add('     FROM  ORDEM_SERVICO OS');
        Add('     INNER JOIN ORDEM_SERVICO_ITENS OI');
        Add('     ON (OI.ODIT_ORDS_ID            = OS.ORDS_ID');
        Add('     AND OI.ODIT_ORDS_EMPR_ID       = OS.ORDS_EMPR_ID');
        Add('     AND OI.ODIT_ORDS_CLIE_ID       = OS.ORDS_CLIE_ID');
        Add('     AND OI.ODIT_ORDS_CLIE_EMPR_ID  = OS.ORDS_CLIE_EMPR_ID)');
        Add('     LEFT OUTER JOIN GENERICA FI');
        Add('     ON (FI.GENE_EMPR_ID            = OS.ORDS_GENE_EMPR_ID_FILTRO');
        Add('     AND FI.GENE_TGEN_ID            = OS.ORDS_GENE_TGEN_ID_FILTRO');
        Add('     AND FI.GENE_ID                 = OS.ORDS_GENE_ID_FILTRO)');
        Add('     INNER JOIN CLIENTES CL');
        Add('     ON (CL.CLIE_ID                 = OS.ORDS_CLIE_ID');
        Add('     AND CL.CLIE_EMPR_ID            = OS.ORDS_CLIE_EMPR_ID)');
        Add('     INNER JOIN TABELA_PRECO TP');
        Add('     ON (TP.TPRC_ID                 = OS.ORDS_TPRC_ID');
        Add('     AND TP.TPRC_EMPR_ID            = OS.ORDS_TPRC_EMPR_ID)');
        Add('     INNER JOIN GENERICA OT');
        Add('     ON (OT.GENE_EMPR_ID            = OS.ORDS_GENE_EMPR_ID_TIPO_OS');
        Add('     AND OT.GENE_TGEN_ID            = OS.ORDS_GENE_TGEN_ID_TIPO_OS');
        Add('     AND OT.GENE_ID                 = OS.ORDS_GENE_ID_TIPO_OS)');
        Add('     LEFT OUTER JOIN PRODUTOS EP');
        Add('     ON (EP.PROD_ID                 = OS.ORDS_PROD_ID_EQUIP');
        Add('     AND EP.PROD_EMPR_ID            = OS.ORDS_PROD_EMPR_ID_EQUIP)');
        Add('     LEFT OUTER JOIN GENERICA UEP');
        Add('     ON (UEP.GENE_EMPR_ID = EP.PROD_GENE_EMPR_ID_UNID');
        Add('     AND UEP.GENE_TGEN_ID = EP.PROD_GENE_TGEN_ID_UNID');
        Add('     AND UEP.GENE_ID = EP.PROD_GENE_ID_UNID)');
        Add('     LEFT OUTER JOIN GENERICA EM');
        Add('     ON (EM.GENE_EMPR_ID            = EP.PROD_GENE_EMPR_ID_MARCA');
        Add('     AND EM.GENE_TGEN_ID            = EP.PROD_GENE_TGEN_ID_MARCA');
        Add('     AND EM.GENE_ID                 = EP.PROD_GENE_ID_MARCA)');
        Add('     LEFT OUTER JOIN GENERICA ME');
        Add('     ON (ME.GENE_EMPR_ID            = EP.PROD_GENE_EMPR_ID_MODELO');
        Add('     AND ME.GENE_TGEN_ID            = EP.PROD_GENE_TGEN_ID_MODELO');
        Add('     AND ME.GENE_ID                 = EP.PROD_GENE_ID_MODELO)');
        Add('     LEFT OUTER JOIN FORNECEDORES FE');
        Add('     ON (FE.FORN_ID                 = EP.PROD_FORN_ID)');
        Add('     INNER JOIN USUARIO UA');
        Add('     ON (UA.USER_ID                 = OS.ORDS_USER_ID)');
        Add('     INNER JOIN PRODUTOS PR');
        Add('     ON (PR.PROD_ID                 = OI.ODIT_TPIT_PROD_ID');
        Add('     AND PR.PROD_EMPR_ID            = OI.ODIT_TPIT_PROD_EMPR_ID)');
        Add('     LEFT OUTER JOIN GENERICA UN');
        Add('     ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID');
        Add('     AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID');
        Add('     AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)');
        Add('     LEFT OUTER JOIN GENERICA MC');
        Add('     ON (MC.GENE_EMPR_ID            = PR.PROD_GENE_EMPR_ID_MARCA');
        Add('     AND MC.GENE_TGEN_ID            = PR.PROD_GENE_TGEN_ID_MARCA');
        Add('     AND MC.GENE_ID                 = PR.PROD_GENE_ID_MARCA)');
        Add('     LEFT OUTER JOIN GENERICA MD');
        Add('     ON (MD.GENE_EMPR_ID            = PR.PROD_GENE_EMPR_ID_MODELO');
        Add('     AND MD.GENE_TGEN_ID            = PR.PROD_GENE_TGEN_ID_MODELO');
        Add('     AND MD.GENE_ID                 = PR.PROD_GENE_ID_MODELO)');
        Add('     INNER JOIN USUARIO UT');
        case rdTipoRel.ItemIndex of
          3,5 : Add('     ON (UT.USER_ID                 = OS.ORDS_USER_ID_TEC)');
          4 :   Add('     ON (UT.USER_ID                 = OI.ODIT_USER_ID_TEC)');
        end;
        Add('     INNER JOIN USUARIO ATE');
        Add('     ON (ATE.USER_ID  = OS.ORDS_USER_ID)');
        Add('     WHERE OI.ODIT_TPIT_PROD_ID NOT IN (SELECT');
        Add('                                              OT.OSTI_ODIT_TPIT_PROD_ID');
        Add('                                        FROM  ORDEM_SERVICO_TRANSF_ITENS OT');
        Add('                                        WHERE OT.OSTI_EMPR_ID                = OS.ORDS_EMPR_ID');
        Add('                                        AND   OT.OSTI_OSTF_ORDS_ID           = OS.ORDS_ID');
        Add('                                        AND   OT.OSTI_OSTF_ORDS_EMPR_ID      = OS.ORDS_EMPR_ID');
        Add('                                        AND   OT.OSTI_OSTF_ORDS_CLIE_ID      = OS.ORDS_CLIE_ID');
        Add('                                        AND   OT.OSTI_OSTF_ORDS_CLIE_EMPR_ID = OS.ORDS_CLIE_EMPR_ID)');
        Add('     UNION');
        Add('     SELECT');
        Add('           OT.OSTF_ORDS_ID                                                      AS ORDS_ID,');
        Add('           OT.OSTF_ORDS_EMPR_ID                                                 AS ORDS_EMPR_ID,');
        Add('           OT.OSTF_ORDS_CLIE_ID                                                 AS ORDS_CLIE_ID,');
        Add('           CL.CLIE_RAZAO_SOCIAL,');
        Add('           OS.ORDS_TPRC_ID,');
        Add('           TP.TPRC_DESCRICAO,');
        Add('           OS.ORDS_DTA_INSTALACAO,');
        Add('           OS.ORDS_GENE_ID_TIPO_OS,');
        Add('           TS.GENE_DESCR                                                        AS DESCR_TIPO_OS,');
        Add('           OS.ORDS_STATUS,');
        Add('           CASE OS.ORDS_STATUS');
        Add('                WHEN 0 THEN ''Agendado''');
        Add('                WHEN 1 THEN ''Realizado''');
        Add('                WHEN 2 THEN ''Real./Pago''');
        Add('                WHEN 3 THEN ''Cancelado''');
        Add('           END                                                                  AS STATUS_OS,');
        Add('           OS.ORDS_PROD_ID_EQUIP,');
        Add('           EP.PROD_DESCRICAO                                                    AS EQUIP_DESCRICAO,');
        Add('           UEP.GENE_PAR1                                                       AS EQUIP_UNIDADE,');
        Add('           EM.GENE_DESCR                                                        AS EQUIP_MARCA,');
        Add('           ME.GENE_DESCR                                                        AS EQUIP_MODELO,');
        Add('           FE.FORN_RAZAO_SOCIAL                                                 AS EQUIP_FORNECEDOR,');
        Add('           OS.ORDS_DTA_CADASTRO,');
        Add('           OS.ORDS_USER_ID,');
        Add('           UA.USER_NOME_COMPLETO                                                AS USER_ATENDENTE,');
        Add('           OI.OSTI_ODIT_TPIT_PROD_ID                                            AS ODIT_TPIT_PROD_ID,');
        Add('           PR.PROD_DESCRICAO,');
        Add('           UN.GENE_PAR1 AS PROD_UNIDADE,');
        Add('           MC.GENE_DESCR                                                        AS MARCA_PROD,');
        Add('           MD.GENE_DESCR                                                        AS MODELO_PROD,');
        Add('           PR.PROD_TIPO_COMISSAO,');
        Add('           CASE PR.PROD_TIPO_COMISSAO');
        Add('                WHEN 0 THEN ''%''');
        Add('                WHEN 1 THEN ''R$''');
        Add('           END                                                                  AS TIPO_COMISSAO,');
        Add('           OI.OSTI_COMISSAO_VENDA_INTERNA                                       AS PROD_COMISSAO_VEND_INTERNA,');
        Add('           OI.OSTI_COMISSAO_VENDA_EXTERNA                                       AS PROD_COMISSAO_VEND_EXTERNO,');
        Add('           OI.OSTI_COMISSAO_VENDA_BALCAO                                        AS PROD_COMISSAO_VEND_BALCAO,');
        Add('           OI.OSTI_ODIT_VLR_UNITARIO                                            AS ODIT_VLR_UNITARIO,');
        Add('           OI.OSTI_ODIT_QTDE                                                    AS ODIT_QTDE,');
        Add('           OI.OSTI_ODIT_VLR_TOTAL                                               AS ODIT_VLR_TOTAL,');
        Add('           OS.ORDS_VLR_PAGO,');
        Add('           OS.ORDS_VLR_DESCONTO,');
        Add('           OS.ORDS_VLR_TOTAL_OS,');
        Add('           OT.OSTF_USER_ID_TEC_DEST                                             AS ODIT_USER_ID_TEC,');
        Add('           UT.USER_NOME_COMPLETO                                                AS USER_NOME_TECNICO,');
        Add('           FI.GENE_DESCR                                                        AS FILTRO,');
        Add('           ATE.USER_NOME_COMPLETO                                               AS ATENDENTE,');
        Add('           CASE PR.PROD_TIPO_COMISSAO');
        Add('                WHEN 0 THEN OI.OSTI_ODIT_VLR_TOTAL*(OI.OSTI_COMISSAO_VENDA_INTERNA/100)');
        Add('                ELSE OI.OSTI_ODIT_QTDE * OI.OSTI_COMISSAO_VENDA_INTERNA');
        Add('           END                                                                  AS VLRCOMISSAOINTERNO,');
        Add('           CASE PR.PROD_TIPO_COMISSAO');
        Add('                WHEN 0 THEN OI.OSTI_ODIT_VLR_TOTAL*(OI.OSTI_COMISSAO_VENDA_EXTERNA/100)');
        Add('                ELSE OI.OSTI_ODIT_QTDE * OI.OSTI_COMISSAO_VENDA_EXTERNA');
        Add('           END                                                                  AS VLRCOMISSAOEXTERNO,');
        Add('           CASE PR.PROD_TIPO_COMISSAO');
        Add('                WHEN 0 THEN OI.OSTI_ODIT_VLR_TOTAL*(OI.OSTI_COMISSAO_VENDA_BALCAO/100)');
        Add('                ELSE OI.OSTI_ODIT_QTDE * OI.OSTI_COMISSAO_VENDA_BALCAO');
        Add('           END                                                                  AS VLRCOMISSAOBALCAO,');
        Add('           OS.ORDS_HORARIO,');
        Add('           CL.CLIE_TELEFONE1,');
        Add('           CL.CLIE_TELEFONE2,');
        Add('           CL.CLIE_GENE_ID_PRACA AS PRACA');
        Add('     FROM  ORDEM_SERVICO_TRANSF OT');
        Add('     INNER JOIN ORDEM_SERVICO_TRANSF_ITENS OI');
        Add('     ON (OI.OSTI_OSTF_ID                   = OT.OSTF_ID');
        Add('     AND OI.OSTI_OSTF_EMPR_ID              = OT.OSTF_EMPR_ID');
        Add('     AND OI.OSTI_OSTF_ORDS_ID              = OT.OSTF_ORDS_ID');
        Add('     AND OI.OSTI_OSTF_ORDS_EMPR_ID         = OT.OSTF_ORDS_EMPR_ID');
        Add('     AND OI.OSTI_OSTF_ORDS_CLIE_ID         = OT.OSTF_ORDS_CLIE_ID');
        Add('     AND OI.OSTI_OSTF_ORDS_CLIE_EMPR_ID    = OT.OSTF_ORDS_CLIE_EMPR_ID)');
        Add('     INNER JOIN ORDEM_SERVICO OS');
        Add('     ON (OS.ORDS_ID                        = OT.OSTF_ORDS_ID');
        Add('     AND OS.ORDS_EMPR_ID                   = OT.OSTF_ORDS_EMPR_ID');
        Add('     AND OS.ORDS_CLIE_ID                   = OT.OSTF_ORDS_CLIE_ID');
        Add('     AND OS.ORDS_CLIE_EMPR_ID              = OT.OSTF_ORDS_CLIE_EMPR_ID)');
        Add('     LEFT OUTER JOIN GENERICA FI');
        Add('     ON (FI.GENE_EMPR_ID                   = OS.ORDS_GENE_EMPR_ID_FILTRO');
        Add('     AND FI.GENE_TGEN_ID                   = OS.ORDS_GENE_TGEN_ID_FILTRO');
        Add('     AND FI.GENE_ID                        = OS.ORDS_GENE_ID_FILTRO)');
        Add('     INNER JOIN CLIENTES CL');
        Add('     ON (CL.CLIE_ID                        = OT.OSTF_ORDS_CLIE_ID');
        Add('     AND CL.CLIE_EMPR_ID                   = OT.OSTF_ORDS_CLIE_EMPR_ID)');
        Add('     INNER JOIN TABELA_PRECO TP');
        Add('     ON (TP.TPRC_ID                        = OS.ORDS_TPRC_ID');
        Add('     AND TP.TPRC_EMPR_ID                   = OS.ORDS_TPRC_EMPR_ID)');
        Add('     INNER JOIN GENERICA TS');
        Add('     ON (TS.GENE_EMPR_ID                   = OS.ORDS_GENE_EMPR_ID_TIPO_OS');
        Add('     AND TS.GENE_TGEN_ID                   = OS.ORDS_GENE_TGEN_ID_TIPO_OS');
        Add('     AND TS.GENE_ID                        = OS.ORDS_GENE_ID_TIPO_OS)');
        Add('     INNER JOIN PRODUTOS EP');
        Add('     ON (EP.PROD_ID                        = OS.ORDS_PROD_ID_EQUIP');
        Add('     AND EP.PROD_EMPR_ID                   = OS.ORDS_PROD_EMPR_ID_EQUIP)');
        Add('     LEFT OUTER JOIN GENERICA UEP');
        Add('     ON (UEP.GENE_EMPR_ID = EP.PROD_GENE_EMPR_ID_UNID');
        Add('     AND UEP.GENE_TGEN_ID = EP.PROD_GENE_TGEN_ID_UNID');
        Add('     AND UEP.GENE_ID    = EP.PROD_GENE_ID_UNID)');
        Add('     LEFT OUTER JOIN GENERICA EM');
        Add('     ON (EM.GENE_EMPR_ID                   = EP.PROD_GENE_EMPR_ID_MARCA');
        Add('     AND EM.GENE_TGEN_ID                   = EP.PROD_GENE_TGEN_ID_MARCA');
        Add('     AND EM.GENE_ID                        = EP.PROD_GENE_ID_MARCA)');
        Add('     LEFT OUTER JOIN GENERICA ME');
        Add('     ON (ME.GENE_EMPR_ID                   = EP.PROD_GENE_EMPR_ID_MODELO');
        Add('     AND ME.GENE_TGEN_ID                   = EP.PROD_GENE_TGEN_ID_MODELO');
        Add('     AND ME.GENE_ID                        = EP.PROD_GENE_ID_MODELO)');
        Add('     INNER JOIN FORNECEDORES FE');
        Add('     ON (FE.FORN_ID                        = EP.PROD_FORN_ID)');
        Add('     INNER JOIN USUARIO UA');
        Add('     ON (UA.USER_ID                        = OS.ORDS_USER_ID)');
        Add('     INNER JOIN PRODUTOS PR');
        Add('     ON (PR.PROD_ID                        = OI.OSTI_ODIT_TPIT_PROD_ID');
        Add('     AND PR.PROD_EMPR_ID                   = OI.OSTI_ODIT_TPIT_PROD_EMPR_ID)');
        Add('     LEFT OUTER JOIN GENERICA UN');
        Add('     ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID');
        Add('     AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID');
        Add('     AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)');
        Add('     LEFT OUTER JOIN GENERICA MC');
        Add('     ON (MC.GENE_EMPR_ID                   = PR.PROD_GENE_EMPR_ID_MARCA');
        Add('     AND MC.GENE_TGEN_ID                   = PR.PROD_GENE_TGEN_ID_MARCA');
        Add('     AND MC.GENE_ID                        = PR.PROD_GENE_ID_MARCA)');
        Add('     LEFT OUTER JOIN GENERICA MD');
        Add('     ON (MD.GENE_EMPR_ID                   = PR.PROD_GENE_EMPR_ID_MODELO');
        Add('     AND MD.GENE_TGEN_ID                   = PR.PROD_GENE_TGEN_ID_MODELO');
        Add('     AND MD.GENE_ID                        = PR.PROD_GENE_ID_MODELO)');
        Add('     INNER JOIN USUARIO UT');
        Add('     ON (UT.USER_ID                        = OT.OSTF_USER_ID_TEC_DEST)');
        Add('     INNER JOIN USUARIO ATE');
        Add('     ON (ATE.USER_ID  = OS.ORDS_USER_ID)');
        Add('     )');
        Add('WHERE ORDS_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));

        if frPesqCliente.TemRegistros then
          Add('AND ORDS_CLIE_ID ' + frPesqCliente.InGrid());
        if frPesqTecnico.TemRegistros then
          Add('AND ORDS_USER_ID_TEC ' + frPesqTecnico.InGrid());
        if frPesqProduto.TemRegistros then
          Add('AND ORDS_ID IN (SELECT ODIT_ORDS_ID FROM ORDEM_SERVICO_ITENS WHERE ODIT_TPIT_PROD_ID' + frPesqProduto.InGrid()+')');
        if frPesqEquipamento.TemRegistros then
          Add('AND ORDS_PROD_ID_EQUIP ' + frPesqEquipamento.InGrid());
        if frPesqTipoOS.TemRegistros then
          Add('AND ORDS_GENE_ID_TIPO_OS ' + frPesqTipoOS.InGrid());
        if frPesqTabPreco.TemRegistros then
          Add('AND ORDS_TPRC_ID ' + frPesqTabPreco.InGrid());
        if frPesqUsuario.TemRegistros then
          Add('AND ORDS_USER_ID ' + frPesqUsuario.InGrid());
        if frPesqPracas.TemRegistros then
          Add('AND PRACA '+ frPesqPracas.InGrid());


        if edtDtInicio.Date > 0 then
          Add('AND ORDS_DTA_CADASTRO >= ' +
            QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtInicio.Date)));
        if edtDtFim.Date > 0 then
          Add('AND ORDS_DTA_CADASTRO <= ' +
            QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtFim.Date)));
        if edtDtAgendaInicio.Date > 0 then
          Add('AND ORDS_DTA_INSTALACAO >= ' +
            QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtAgendaInicio.Date)));
        if edtDtAgendaFim.Date > 0 then
          Add('AND ORDS_DTA_INSTALACAO <= ' +
            QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtAgendaFim.Date)));
        case rdStatus.ItemIndex of
          0:
            Add('AND ORDS_STATUS = 0');
          1:
            Add('AND ORDS_STATUS = 1');
          2:
            Add('AND ORDS_STATUS = 2');
          3:
            Add('AND ORDS_STATUS = 3');
        end;
        Add('GROUP BY');
        Add('      ORDS_ID,');
        Add('      ORDS_EMPR_ID,');
        Add('      ORDS_CLIE_ID,');
        Add('      CLIE_RAZAO_SOCIAL,');
        Add('      ORDS_TPRC_ID,');
        Add('      TPRC_DESCRICAO,');
        Add('      ORDS_DTA_INSTALACAO,');
        Add('      ORDS_GENE_ID_TIPO_OS,');
        Add('      DESCR_TIPO_OS,');
        Add('      ORDS_STATUS,');
        Add('      STATUS_OS,');
        Add('      ORDS_PROD_ID_EQUIP,');
        Add('      EQUIP_DESCRICAO,');
        Add('      EQUIP_UNIDADE,');
        Add('      EQUIP_MARCA,');
        Add('      EQUIP_MODELO,');
        Add('      EQUIP_FORNECEDOR,');
        Add('      ORDS_DTA_CADASTRO,');
        Add('      ORDS_USER_ID,');
        Add('      USER_ATENDENTE,');
        Add('      ORDS_VLR_PAGO,');
        Add('      ORDS_VLR_DESCONTO,');
        Add('      ORDS_VLR_TOTAL_OS,');
        Add('      CASE');
        Add('           WHEN ORDS_VLR_DESCONTO > 0 THEN ((COALESCE(ORDS_VLR_DESCONTO,0)*100)/COALESCE(ORDS_VLR_TOTAL_OS,1))');
        Add('           ELSE 0');
        Add('      END,');
        Add('      ORDS_USER_ID_TEC,');
        Add('      USER_NOME_TECNICO,');
        Add('      FILTRO,');
        Add('      ATENDENTE,');
        Add('      ORDS_HORARIO,');
        Add('      CLIE_TELEFONE1,');
        Add('      CLIE_TELEFONE2,');
        Add('      PRACA');
        Add('ORDER BY');
        case rdTipoRel.ItemIndex of
          3 : Add('      USER_NOME_TECNICO,');
          4 : Add('      ATENDENTE,');
        end;
        Add('      ORDS_DTA_INSTALACAO,');
        Add('      ORDS_ID');
      end;
      //sltTMP.SaveToFile('C:\temp\Comissao.txt');
      Result := sltTMP.Text;
    except on e: exception do begin
        funcBasico.ReportaErro('TfRel_Ordem_Servico', 'GeraComissao', e.Message);
        funcBasico.Alerta('Erro no processo de geração do relatório.' + '[' +e.Message + ']', 1);
      end;
    end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

function TfRel_Ordem_Servico.GeraSQL: String;
var
  sltTMP: TStringList;
begin
  try
    sltTMP := TStringList.Create;
    try
      with sltTMP do
      begin
        Clear;
        Add('SELECT');
        Add('      ''ETIQUETA'' AS ETIQUETA,');
        Add('      OS.ORDS_ID,');
        Add('      OS.ORDS_EMPR_ID,');
        Add('      OS.ORDS_CLIE_ID,');
        Add('      OS.ORDS_CLIE_EMPR_ID,');
        Add('      OS.ORDS_TPRC_ID,');
        Add('      OS.ORDS_TPRC_EMPR_ID,');
        Add('      OS.ORDS_DTA_INSTALACAO,');
        Add('      OS.ORDS_GENE_EMPR_ID_TIPO_OS,');
        Add('      OS.ORDS_GENE_TGEN_ID_TIPO_OS,');
        Add('      OS.ORDS_GENE_ID_TIPO_OS,');
        Add('      OS.ORDS_STATUS,');
        Add('      OS.ORDS_USER_ID_TEC,');
        Add('      OS.ORDS_PROD_ID_EQUIP,');
        Add('      OS.ORDS_PROD_EMPR_ID_EQUIP,');
        Add('      OS.ORDS_FORN_ID_EQUIP,');
        Add('      OS.ORDS_NR_PEDIDO_SERIE,');
        Add('      OS.ORDS_VLR_TOTAL_OS,');
        Add('      OS.ORDS_VLR_DESCONTO,');
        Add('      OS.ORDS_VLR_PAGO,');
        Add('      OS.ORDS_OBSERVACAO,');
        Add('      OS.ORDS_INFORMACOES,');
        Add('      OS.ORDS_USER_ID_CANC,');
        Add('      OS.ORDS_MOTIVO_CANC,');
        Add('      OS.ORDS_DTA_CANC,');
        Add('      OS.ORDS_DTA_ENTREGA,');
        Add('      OS.ORDS_USER_ID_ENTREG,');
        Add('      OS.ORDS_BAIXADO_ESTOQUE,');
        Add('      OS.ORDS_GENE_EMPR_ID_TP_AGEND,');
        Add('      OS.ORDS_GENE_TGEN_ID_TP_AGEND,');
        Add('      OS.ORDS_GENE_ID_TP_AGEND,');
        Add('      OS.ORDS_DTA_CADASTRO,');
        Add('      OS.ORDS_USER_ID,');
        Add('      CL.CLIE_ID,');
        Add('      CL.CLIE_RAZAO_SOCIAL,');
        Add('      CL.CLIE_FANTASIA,');
        Add('      CL.CLIE_CNPJ_CPF,');
        Add('      CL.CLIE_RG,');
        Add('      CL.CLIE_CEP,');
        Add('      CL.CLIE_ENDERECO,');
        Add('      CL.CLIE_BAIRRO,');
        Add('      CL.CLIE_TELEFONE1,');
        Add('      CL.CLIE_TELEFONE2,');
        Add('      CL.CLIE_TELEFONE3,');
        Add('      CL.CLIE_TELEFONE4,');
        Add('      CL.CLIE_REFERENCIA,');
        Add('      PC.GENE_DESCR PRACA,');
        Add('      PC.GENE_PAR1  UF,');
        Add('      TP.GENE_DESCR TIPO_OS,');
        Add('      CASE OS.ORDS_STATUS');
        Add('           WHEN 0 THEN ' + QuotedStr('Agendado'));
        Add('           WHEN 1 THEN ' + QuotedStr('Realizado'));
        Add('           WHEN 2 THEN ' + QuotedStr('Real./Pago'));
        Add('           WHEN 3 THEN ' + QuotedStr('Cancelado'));
        Add('      END AS ORDS_STATUS,');
        Add('      TC.USER_NOME_COMPLETO,');
        Add('      PR.PROD_DESCRICAO,');
        Add('      PR.PROD_GARANTIA,');
        Add('      UN.GENE_PAR1 AS PROD_UNIDADE,');
        Add('      MC.GENE_DESCR MARCA_PROD,');
        Add('      MD.GENE_DESCR MODELO_PROD,');
        Add('      US.USER_NOME_COMPLETO AS ATENDENTE,');
        Add('      FN.FORN_ID,');
        Add('      FN.FORN_RAZAO_SOCIAL,');
        Add('      ST.GENE_DESCR         AS STATUS_OS,');
        Add('      TA.GENE_DESCR         AS TIPO_AGENDAMENTO,');
        Add('      FI.GENE_DESCR         AS FILTRO,');
        Add('      OS.ORDS_HORARIO');
        Add('FROM  ORDEM_SERVICO OS');
        Add('INNER JOIN CLIENTES CL');
        Add('ON (CL.CLIE_ID      = COALESCE(OS.ORDS_CLIE_ID_GARANTIA,OS.ORDS_CLIE_ID)');
        Add('AND CL.CLIE_EMPR_ID = COALESCE(OS.ORDS_CLIE_EMPR_ID_GARANTIA,OS.ORDS_CLIE_EMPR_ID))');
        Add('INNER JOIN GENERICA PC');
        Add('ON (PC.GENE_EMPR_ID = CL.CLIE_GENE_EMPR_ID_PRACA');
        Add('AND PC.GENE_TGEN_ID = CL.CLIE_GENE_TGEN_ID_PRACA');
        Add('AND PC.GENE_ID      = CL.CLIE_GENE_ID_PRACA)');
        Add('LEFT OUTER JOIN GENERICA TP');
        Add('ON (TP.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_TIPO_OS');
        Add('AND TP.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_TIPO_OS');
        Add('AND TP.GENE_ID      = OS.ORDS_GENE_ID_TIPO_OS)');
        Add('INNER JOIN USUARIO TC');
        Add('ON (TC.USER_ID      = OS.ORDS_USER_ID_TEC)');
        Add('LEFT OUTER JOIN PRODUTOS PR');
        Add('ON (PR.PROD_ID      = OS.ORDS_PROD_ID_EQUIP');
        Add('AND PR.PROD_EMPR_ID = OS.ORDS_PROD_EMPR_ID_EQUIP)');
        Add('LEFT OUTER JOIN GENERICA UN');
        Add('ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID');
        Add('AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID');
        Add('AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)');
        Add('LEFT OUTER JOIN GENERICA FI');
        Add('ON (FI.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_FILTRO');
        Add('AND FI.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_FILTRO');
        Add('AND FI.GENE_ID      = OS.ORDS_GENE_ID_FILTRO)');
        Add('LEFT OUTER JOIN GENERICA MC');
        Add('ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA');
        Add('AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA');
        Add('AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)');
        Add('LEFT OUTER JOIN GENERICA MD');
        Add('ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO');
        Add('AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO');
        Add('AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)');
        Add('INNER JOIN USUARIO US');
        Add('ON (US.USER_ID      = OS.ORDS_USER_ID)');
        Add('LEFT OUTER JOIN FORNECEDORES FN');
        Add('ON (FN.FORN_ID      = OS.ORDS_FORN_ID_EQUIP)');
        Add('LEFT OUTER JOIN GENERICA ST');
        Add('ON (ST.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_STATUS_OS');
        Add('AND ST.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_STATUS_OS');
        Add('AND ST.GENE_ID      = OS.ORDS_GENE_ID_STATUS_OS)');
        Add('LEFT OUTER JOIN GENERICA TA');
        Add('ON (TA.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_TP_AGEND');
        Add('AND TA.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_TP_AGEND');
        Add('AND TA.GENE_ID      = OS.ORDS_GENE_ID_TP_AGEND)');
        if (frPesqProduto.TemRegistros) or (frPesqTipoProduto.TemRegistros) then
        begin
          Add('INNER JOIN ORDEM_SERVICO_ITENS OI');
          Add('ON (OI.ODIT_ORDS_ID            = OS.ORDS_ID');
          Add('AND OI.ODIT_ORDS_EMPR_ID       = OS.ORDS_EMPR_ID');
          Add('AND OI.ODIT_ORDS_CLIE_ID       = OS.ORDS_CLIE_ID');
          Add('AND OI.ODIT_ORDS_CLIE_EMPR_ID  = OS.ORDS_CLIE_EMPR_ID)');
        end;
        if frPesqTipoProduto.TemRegistros then
        begin
          Add('INNER JOIN PRODUTOS PI');
          Add('   ON (PI.PROD_ID     = OI.ODIT_TPIT_PROD_ID');
          Add('  AND PI.PROD_EMPR_ID = OI.ODIT_TPIT_PROD_EMPR_ID)');
        end;
        Add('WHERE OS.ORDS_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));

        if frPesqTipoProduto.TemRegistros then
          Add('AND PI.PROD_GENE_ID_TP_PROD ' + frPesqTipoProduto.InGrid());
        if frPesqCliente.TemRegistros then
          Add('AND OS.ORDS_CLIE_ID ' + frPesqCliente.InGrid());
        if frPesqTecnico.TemRegistros then
          Add('AND OS.ORDS_USER_ID_TEC ' + frPesqTecnico.InGrid());
        if frPesqProduto.TemRegistros then
          Add('AND OI.ODIT_TPIT_PROD_ID ' + frPesqProduto.InGrid());
        if frPesqEquipamento.TemRegistros then
          Add('AND OS.ORDS_PROD_ID_EQUIP ' + frPesqEquipamento.InGrid());
        if frPesqTipoOS.TemRegistros then
          Add('AND OS.ORDS_GENE_ID_TIPO_OS ' + frPesqTipoOS.InGrid());
        if frPesqTabPreco.TemRegistros then
          Add('AND OS.ORDS_TPRC_ID ' + frPesqTabPreco.InGrid());
        if frPesqUsuario.TemRegistros then
          Add('AND OS.ORDS_USER_ID ' + frPesqUsuario.InGrid());
        if frPesqStatusOS.TemRegistros then
          Add('AND OS.ORDS_GENE_ID_STATUS_OS ' + frPesqStatusOS.InGrid());
        if frPesqTipoAgendamento.TemRegistros then
          Add('AND OS.ORDS_GENE_ID_TP_AGEND ' + frPesqTipoAgendamento.InGrid());

        if edtDtInicio.Date > 0 then
          Add('AND OS.ORDS_DTA_CADASTRO >= ' +
            QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtInicio.Date)));
        if edtDtFim.Date > 0 then
          Add('AND OS.ORDS_DTA_CADASTRO <= ' +
            QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtFim.Date)));
        if edtDtAgendaInicio.Date > 0 then
          Add('AND OS.ORDS_DTA_INSTALACAO >= ' +
            QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtAgendaInicio.Date)));
        if edtDtAgendaFim.Date > 0 then
          Add('AND OS.ORDS_DTA_INSTALACAO <= ' +
            QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtAgendaFim.Date)));
        if edtDtAnivInicio.Date > 0 then
          Add('AND CL.CLIE_DT_NASCIMENTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtAnivInicio.Date)));
        if edtDtAnivFim.Date > 0 then
          Add('AND CL.CLIE_DT_NASCIMENTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtAnivFim.Date)));
        if edtDtCadInicio.Date > 0 then
          Add('AND CL.CLIE_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtCadInicio.Date)));
        if edtDtCadFim.Date > 0 then
          Add('AND CL.CLIE_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtCadFim.Date)));

        case rdStatus.ItemIndex of
          0: Add('AND OS.ORDS_STATUS = 0');
          1: Add('AND OS.ORDS_STATUS = 1');
          2: Add('AND OS.ORDS_STATUS = 2');
          3: Add('AND OS.ORDS_STATUS = 3');
        end;
        case rdTipoRel.ItemIndex of
          0: Add('ORDER BY OS.ORDS_ID');
          1: Add('ORDER BY USER_NOME_COMPLETO,ORDS_CLIE_ID');
          2: Add('ORDER BY ATENDENTE,ORDS_CLIE_ID');
          5: Add('ORDER BY ETIQUETA,CLIE_RAZAO_SOCIAL');
        end;
      end;
//      sltTMP.SaveToFile('C:\SQL.text');
      Result := sltTMP.Text;
    except
      on e: exception do
      begin
        funcBasico.Alerta('Erro no processo de geração do relatório.' + #13 +
          '[' + e.Message + ']', 1);
        funcBasico.ReportaErro('TfRel_Ordem_Servico', 'GeraSQL', e.Message);
      end;
    end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfRel_Ordem_Servico.edtDtInicioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #27 then
  begin
    Self.Close;
    Key := #0;
  end;
end;

procedure TfRel_Ordem_Servico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  funcBasico.LimitarProfNoSistema := LimitarProfTodoSistema;
end;

procedure TfRel_Ordem_Servico.FormCreate(Sender: TObject);
begin
  inherited;
  dstRelatorioOS.DataSource := dmRel_Ordem_Servico.dsRel_Ordem_Servico;
  dstRelatorioOSItens.DataSource := dmRel_Ordem_Servico.dsOrdemServicoItens;
  dstRelatorio.DataSource := dmRel_Ordem_Servico.dsComissao_Pecas_Servicos;
  dstRelatorioPecasServicos.DataSource := dmRel_Ordem_Servico.dsPecas_Servicos;
  Self.LimitarProfTodoSistema := funcBasico.LimitarProfNoSistema;
  funcBasico.LimitarProfNoSistema := true;
end;

procedure TfRel_Ordem_Servico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 27 then
  begin
    Self.Close;
    Key := 0;
  end;
end;

procedure TfRel_Ordem_Servico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then
  begin
    Self.Close;
    Key := #0;
  end;
end;

procedure TfRel_Ordem_Servico.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.Pages[0].Show;
  frPesqCliente.SetFocus;
  funcBasico.CarregaInfoOrdemServico;
  frPesqUsuario.Enabled := true;
  if (funcBasico.RetornaListadeProfissionaisBloqueados().Length > 1) then begin
    frPesqUsuario.edtCodigo.Text := IntToStr( funcBasico.User_ID );
    frPesqUsuario.edtCodigo.Modified := true;
    frPesqUsuario.edtCodigoExit(Self);
    frPesqUsuario.Enabled := false;
  end;
end;

procedure TfRel_Ordem_Servico.frPesqTecnicobtnPesqClick(Sender: TObject);
begin
  inherited;
  frPesqTecnico.btnPesqClick(Sender);

end;

procedure TfRel_Ordem_Servico.grdBasicoDblClick(Sender: TObject);
begin
  // inherited;
end;

procedure TfRel_Ordem_Servico.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // inherited;
end;

procedure TfRel_Ordem_Servico.grdBasicoTitleClick(Column: TColumn);
begin
  // inherited;
end;

initialization

RegisterClass(TfRel_Ordem_Servico);

finalization

UnRegisterClass(TfRel_Ordem_Servico);

end.
