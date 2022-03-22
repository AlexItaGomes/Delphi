unit uRel_Agenda;

interface

uses
  Winapi.Windows, ufBasico, Vcl.ExtCtrls, Vcl.StdCtrls, RxToolEdit,
  uFrPesquisa, frxDBSet, Vcl.Forms, Vcl.Mask, frxClass, frxExportPDF, Funcoes,
  Vcl.Menus, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Graphics, Vcl.Controls,
  Vcl.Buttons, System.Classes;

type
  TfRel_Agenda = class(TfBasico)
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    rdStatus: TRadioGroup;
    frPesqTecnico: TfrPesquisa;
    rdOpcao_Impressao: TRadioGroup;
    dstAcertos: TfrxDBDataset;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Agenda: TfRel_Agenda;

implementation

{$R *.dfm}

uses udmRel_Agenda, System.SysUtils;

procedure TfRel_Agenda.btnNovoClick(Sender: TObject);
var
  S      : String;
  sWhere : String;
  fltDin,
  fltCred,
  fltDeb,
  fltCheq,
  fltCart : Real;
begin

  sWhere := Format(' WHERE AGEN_EMPR_ID = %D ',[funcBasico.Empr_ID]);

  case rdStatus.ItemIndex of
    2 : begin
      if edtDtInicio.Date > 0 then begin
        sWhere := sWhere + '   AND AGEN_DTA_PAGTO    >= ''%S''            ';
        sWhere := Format(sWhere,[FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)]);
      end;
      if edtDtFim.Date > 0 then begin
        sWhere := sWhere + '   AND AGEN_DTA_PAGTO    <= ''%S''            ';
        sWhere := Format(sWhere,[FormatDateTime('mm/dd/yyyy',edtDtFim.Date)]);
      end;
    end else begin
      if edtDtInicio.Date > 0 then begin
        sWhere := sWhere + '   AND AGEN_DATA         >= ''%S''            ';
        sWhere := Format(sWhere,[FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)]);
      end;
      if edtDtFim.Date > 0 then begin
        sWhere := sWhere + '   AND AGEN_DATA         <= ''%S''            ';
        sWhere := Format(sWhere,[FormatDateTime('mm/dd/yyyy',edtDtFim.Date)]);
      end;
    end;
  end;
  if frPesqTecnico.TemRegistros then
    sWhere := sWhere +'   AND AGEN_USER_ID_ATENDENTE ' + frPesqTecnico.InGrid();
  case rdStatus.ItemIndex of
    0 : sWhere := sWhere + '   AND AGEN_STATUS = ''A''';
    1 : sWhere := sWhere + '   AND AGEN_STATUS = ''O''';
    2 : sWhere := sWhere + '   AND AGEN_STATUS = ''F''';
    3 : sWhere := sWhere + '   AND AGEN_STATUS = ''C''';
    4 : sWhere := sWhere + '   AND AGEN_STATUS = ''L''';
  end;

  S := 'SELECT AGEN_USER_ID_ATENDENTE,                                        '+
       '       USER_NOME_COMPLETO,                                            '+
       '       PROD_ID,                                                       '+
       '       PROD_DESCRICAO,                                                '+
       '       SUM(ODIT_QTDE)                   AS ODIT_QTDE,                 '+
       '       SUM(ODIT_QTDE*ODIT_VLR_UNITARIO) AS ODIT_VLR_TOTAL,            '+
       '       SUM(AGEN_VLR_DESCONTO)           AS AGEN_VLR_DESCONTO          '+
       '  FROM AGENDA                                                         '+
       '  JOIN ORDEM_SERVICO_ITENS                                            '+
       '    ON ODIT_ORDS_ID       = AGEN_ORDS_ID                              '+
       '   AND ODIT_ORDS_EMPR_ID  = AGEN_ORDS_EMPR_ID                         '+
       '  JOIN USUARIO                                                        '+
       '    ON USER_ID            = AGEN_USER_ID_ATENDENTE                    '+
       '  JOIN PRODUTOS                                                       '+
       '    ON PROD_ID            = ODIT_TPIT_PROD_ID                         '+
       '   AND PROD_EMPR_ID       = ODIT_TPIT_PROD_EMPR_ID                    '+
       sWhere                                                                  +
       ' GROUP BY                                                             '+
       '       AGEN_USER_ID_ATENDENTE,                                        '+
       '       USER_NOME_COMPLETO,                                            '+
       '       PROD_ID,                                                       '+
       '       PROD_DESCRICAO                                                 '+
       ' ORDER BY                                                             '+
       '       USER_NOME_COMPLETO                                             ';
  with dmRel_Agenda do begin
    qryRelAgenda.Close;
    qryRelAgenda.SQL.Clear;
    qryRelAgenda.SQL.Add(S);
    qryRelAgenda.Open;
    if qryRelAgenda.IsEmpty then begin
      funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Não há registros a serem impressos!',0);
      Exit;
    end;
    sWhere := sWhere + '   AND ACER_ORIGEM            = ''A''                 ';
    sWhere := sWhere + '   AND ACER_STATUS            = ''A''                 ';
    S := 'SELECT GENE_ID,                                                     '+
         '       AGEN_USER_ID_ATENDENTE,                                      '+
         '       SUM(ACER_VLR_DOC)      AS VALOR                              '+
         '  FROM ACERTOS                                                      '+
         '  JOIN GENERICA                                                     '+
         '    ON GENE_EMPR_ID           = ACER_GENE_EMPR_ID_TP_DOC            '+
         '   AND GENE_TGEN_ID           = ACER_GENE_TGEN_ID_TP_DOC            '+
         '   AND GENE_ID                = ACER_GENE_ID_TP_DOC                 '+
         '  JOIN AGENDA                                                       '+
         '    ON AGEN_ID                = ACER_ID_ORIGEM                      '+
         '   AND AGEN_EMPR_ID           = ACER_EMPR_ID_ORIGEM                 '+
         sWhere                                                                +
         ' GROUP BY                                                           '+
         '       GENE_ID,                                                     '+
         '       AGEN_USER_ID_ATENDENTE                                       ';
    qryAcertos.Close;
    qryAcertos.sql.Clear;
    qryAcertos.sql.Add(S);
    qryAcertos.Open;
    qryAcertos.First;
    fltDin :=0; fltCred := 0; fltDeb :=0; fltCheq := 0; fltCart:=0;
    while not qryAcertos.Eof do begin
      case qryAcertos.FieldByName('GENE_ID').AsInteger of
        1   : fltDin := fltDin + qryAcertos.FieldByName('VALOR').AsFloat;
        2,3 : fltCheq:= fltCheq+ qryAcertos.FieldByName('VALOR').AsFloat;
        4   : fltDeb := fltDeb + qryAcertos.FieldByName('VALOR').AsFloat;
        5   : fltCred:= fltCred+ qryAcertos.FieldByName('VALOR').AsFloat;
        6   : fltCart:= fltCart+ qryAcertos.FieldByName('VALOR').AsFloat;
      end;
      qryAcertos.Next;
    end;
  end;
  try
    with frRelatorio do begin
      TfrxMemoView(FindComponent('lbTit01')).Text    := 'Status:';
      TfrxMemoView(FindComponent('lbFild01')).Text   := rdStatus.Items[rdStatus.ItemIndex];
      TfrxMemoView(FindComponent('lbTit02')).Text    := 'Período:';
      TfrxMemoView(FindComponent('lbFild02')).Text   := '';
      TfrxMemoView(FindComponent('lbTit03')).Text    := '';
      TfrxMemoView(FindComponent('lbFild03')).Text   := '';
      if (edtDtInicio.Date > 0) then
        TfrxMemoView(FindComponent('lbFild02')).Text := edtDtInicio.Text;
      if (edtDtFim.Date > 0) then
        TfrxMemoView(FindComponent('lbFild02')).Text := edtDtInicio.Text + ' à ' + edtDtFim.Text;
      if (edtDtFim.Date <= 0) and (edtDtFim.Date <= 0) then begin
        TfrxMemoView(FindComponent('lbFild02')).Visible  := false;
        TfrxMemoView(FindComponent('lbTit02')).Visible   := false;
      end;
      Variables['Dinheiro']   := fltDin;
      Variables['CartaoCred'] := fltCred;
      Variables['CartaoDeb']  := fltDeb;
      Variables['Cheque']     := fltCheq;
      Variables['Carteira']   := fltCart;
      Self.SendToBack;
      case rdOpcao_Impressao.ItemIndex of
        0 : frRelatorio.ShowReport();
        1 : frRelatorio.Print;
      end;
    end;
  finally
  end;
end;

procedure TfRel_Agenda.FormShow(Sender: TObject);
begin
  inherited;
  edtDtInicio.Date := funcBasico.DataServidor();
  edtDtFim.Date    := funcBasico.DataServidor();
end;

initialization
  RegisterClass(TfRel_Agenda);
finalization
  UnRegisterClass(TfRel_Agenda);


end.
