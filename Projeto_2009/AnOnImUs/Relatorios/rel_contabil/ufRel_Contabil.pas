unit ufRel_Contabil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, Menus, frxClass, frxDBSet, frxDesgn, DateUtils;

type
  TfRel_Contabil = class(TfBasico)
    Panel1: TPanel;
    rdOpcao_Impressao: TRadioGroup;
    GroupBox3: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    rdTipo: TRadioGroup;
    rdOrdenacao: TRadioGroup;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    function ValidaDados: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Contabil: TfRel_Contabil;

implementation

uses ufRel_Contabil_Analitico;

{$R *.dfm}

procedure TfRel_Contabil.btnNovoClick(Sender: TObject);
begin
  if funcBasico.EmpresasBloqueada() then Exit;
  if ValidaDados then begin
    try
      funcBasico.MSGAguarde();
      btnImprimir.Enabled := false;
      if fRel_Contabil_Analitico = nil then
        fRel_Contabil_Analitico := TfRel_Contabil_Analitico.Create(nil);
      with fRel_Contabil_Analitico do begin
        lbTit01.Caption  := 'Tipo:';
        lbFild01.Caption := rdTipo.Items[rdTipo.ItemIndex];
        lbTit02.Caption  := 'Período:';
        lbFild02.Caption := edtDtInicio.Text + ' à ' + edtDtFim.Text;
        lbTit03.Enabled  := false;
        lbFild03.Enabled := false;
        dtInicio         := edtDtInicio.Date;
        dtFim            := edtDtFim.Date;
        intTipo          := rdTipo.ItemIndex;
        intOrder         := rdOrdenacao.ItemIndex;
        case rdOpcao_Impressao.ItemIndex of
          0 : qrepRelatorio.Preview;
          1 : qrepRelatorio.Print;
        end;
      end;
    finally
      funcBasico.MSGAguarde(false);
      funcBasico.MSGAguarde(false);
      FreeAndNil(fRel_Contabil_Analitico);
      btnImprimir.Enabled := true;
    end;
  end;
end;

function TfRel_Contabil.ValidaDados : Boolean;
begin
  Result := true;
  if edtDtInicio.Date <= 0 then begin
    funcBasico.Alerta('Informe um período inicial antes de continuar.',1);
    edtDtInicio.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDtFim.Date <= 0 then begin
    funcBasico.Alerta('Informe um período final antes de continuar.',1);
    edtDtFim.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDtFim.Date < edtDtInicio.Date then begin
    funcBasico.Alerta('Informe uma data corretamente antes de continuar.',1);
    edtDtInicio.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfRel_Contabil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(fRel_Contabil_Analitico);
end;

procedure TfRel_Contabil.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//  inherited;
end;

procedure TfRel_Contabil.FormCreate(Sender: TObject);
begin
  inherited;
  edtDtInicio.Date := StartOfTheYear(funcBasico.DataServidor(funcBasico.Conexao));
  edtDtFim.Date    := EndOfTheYear(funcBasico.DataServidor(funcBasico.Conexao));
end;

procedure TfRel_Contabil.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  end;
  if key = #27 then begin
    Key := #0;
    Self.Close;
  end;
end;

procedure TfRel_Contabil.FormShow(Sender: TObject);
begin
  inherited;
  edtDtInicio.SetFocus;
end;

procedure TfRel_Contabil.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Contabil.grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Contabil.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Contabil);
finalization
  UnRegisterClass(TfRel_Contabil);

end.
