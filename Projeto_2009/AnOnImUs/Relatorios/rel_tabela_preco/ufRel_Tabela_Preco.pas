unit ufRel_Tabela_Preco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, Menus, uFrPesquisa, frxClass, frxDBSet, frxDesgn;

type
  TfRel_Tabela_Preco = class(TfBasico)
    Panel1: TPanel;
    rdAtivo: TRadioGroup;
    GroupBox1: TGroupBox;
    edtDtCadInicio: TDateEdit;
    edtDtCadFim: TDateEdit;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    rdOpcao_Impressao: TRadioGroup;
    frPesqTabPreco: TfrPesquisa;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function GeraSQL: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Tabela_Preco: TfRel_Tabela_Preco;

implementation

uses ufRel_Tabela_Preco_Analitico, udmRel_Tabela_Preco;

{$R *.dfm}

procedure TfRel_Tabela_Preco.btnNovoClick(Sender: TObject);
begin
  try
    btnImprimir.Enabled := false;
    funcBasico.MSGAguarde();
    with dmRel_Tabela_Preco do begin
      with cdsTabelaPreco do begin
        Close;
        CommandText := GeraSQL;
        Open;
        if not IsEmpty then begin
          try
            if fRel_Tabela_Preco_Analitco = nil then
              fRel_Tabela_Preco_Analitco := TfRel_Tabela_Preco_Analitco.Create(nil);
            with fRel_Tabela_Preco_Analitco do begin
              arrayVisual[1]   := CheckBox1.Checked;
              arrayVisual[2]   := CheckBox2.Checked;
              arrayVisual[3]   := CheckBox3.Checked;
              arrayVisual[4]   := CheckBox4.Checked;
              arrayVisual[5]   := CheckBox5.Checked;
              arrayVisual[6]   := CheckBox6.Checked;
              lbTit01.Caption  := rdAtivo.Caption;
              lbFild01.Caption := rdAtivo.Items[rdAtivo.ItemIndex];
              case rdOpcao_Impressao.ItemIndex of
                0 : qrepRelatorio.Preview;
                1 : qrepRelatorio.Print;
              end;
            end;
          finally
            FreeAndNil(fRel_Tabela_Preco_Analitco);
          end;
        end else begin
          funcLocal.Alerta('Não há registros a serem impressos.',0);
        end;
      end;
    end;
  finally
    btnImprimir.Enabled := true;
    funcBasico.MSGAguarde(false);
  end;
end;

procedure TfRel_Tabela_Preco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    Self.Close;
    key := #0
  end;
end;

procedure TfRel_Tabela_Preco.FormShow(Sender: TObject);
begin
  inherited;
  frPesqTabPreco.SetFocus;
end;

function TfRel_Tabela_Preco.GeraSQL : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      Add('SELECT');
      Add('      TPRC_ID,');
      Add('      TPRC_EMPR_ID,');
      Add('      TPRC_DESCRICAO,');
      Add('      CASE TPRC_ATIVO');
      Add('           WHEN 1 THEN ' + QuotedStr('Ativo'));
      Add('           WHEN 0 THEN ' + QuotedStr('Inativo'));
      Add('      END AS TPRC_ATIVO,');
      Add('      TPRC_DTA_CADASTRO,');
      Add('      TPRC_USER_ID');
      Add('FROM  TABELA_PRECO');
      Add('WHERE TPRC_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
      if frPesqTabPreco.TemRegistros then
        Add('AND TPRC_ID ' + frPesqTabPreco.InGrid());
      case rdAtivo.ItemIndex of
        0 : Add('AND TPRC_ATIVO = 1');
        1 : Add('AND TPRC_ATIVO = 0');
      end;
      if edtDtCadInicio.Date > 0 then
        Add('AND TPRC_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtCadInicio.Date)));
      if edtDtCadFim.Date > 0 then
        Add('AND TPRC_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtCadFim.Date)));
      Add('ORDER BY');
      Add('      TPRC_DESCRICAO');
    end;
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfRel_Tabela_Preco.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;

end;

procedure TfRel_Tabela_Preco.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;

end;

procedure TfRel_Tabela_Preco.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Tabela_Preco);
finalization
  UnRegisterClass(TfRel_Tabela_Preco);
  
end.
