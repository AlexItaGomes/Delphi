unit ufEmpresas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  Menus, ImgList, frxClass, frxDesgn, frxDBSet;

type
  TfEmpresas = class(TfBasico)
    procedure FormCreate(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEmpresas: TfEmpresas;

implementation

uses udmEmpresas, ufCad_Empresas;

{$R *.dfm}

procedure TfEmpresas.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmEmpresas.cdsEmpresas;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro      := fCad_Empresas;
  with fCad_Empresas do begin
    cdsLocal        := dmEmpresas.cdsEmpresas;
    funcLocal       := Self.funcBasico;
  end;
end;

procedure TfEmpresas.grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('EMPR_ATIVO') then begin
    if cdsGeral.FieldByName('EMPR_ATIVO').AsInteger = 1 then begin
      grdBasico.Canvas.Brush.Color := $008CFF8C;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Ativo          ');
    end;
    if cdsGeral.FieldByName('EMPR_ATIVO').AsInteger = 0 then begin
      grdBasico.Canvas.Brush.Color := $006666FF;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Inativo        ');
    end;
    if cdsGeral.IsEmpty then begin
      grdBasico.Canvas.Brush.Color := clWhite;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Sem Reg.       ');
    end;
  end;
end;

procedure TfEmpresas.OpenClientDataSet;
begin
  with dmEmpresas do begin
    with cdsEmpresas do begin
      Close;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfEmpresas);
finalization
  UnRegisterClass(TfEmpresas);

end.
