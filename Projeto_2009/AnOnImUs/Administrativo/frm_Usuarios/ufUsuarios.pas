unit ufUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Grids, DBGrids, Buttons, ExtCtrls, Menus, StdCtrls, SQLExpr,
  Funcoes, DB, frxClass, frxDBSet, frxDesgn;

type
  TfUsuario = class(TfBasico)
    procedure FormCreate(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fUsuario: TfUsuario;

implementation

uses udmUsuarios, ufCad_Usuarios;

{$R *.dfm}


procedure TfUsuario.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmUsuarios.cdsUsuario;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro    := fCad_Usuario;
  with fCad_Usuario do begin
    cdsLocal      := dmUsuarios.cdsUsuario;
    funcLocal     := Self.funcBasico;
  end;
  btnImprimir.Tag := 0;
end;

procedure TfUsuario.OpenClientDataSet;
begin
  with dmUsuarios do begin
    with cdsUsuario do begin
      Close;
      Open;
    end;
  end;
end;

procedure TfUsuario.FormShow(Sender: TObject);
begin
  inherited;
  btnNovo.Enabled := funcBasico.GetLicenca(1) or
                     funcBasico.GetLicenca(2) or
                     funcBasico.GetLicenca(3) or
                     funcBasico.GetLicenca(4) or
                     funcBasico.GetLicenca(5);
  btnEditar.Enabled := btnNovo.Enabled;
end;

procedure TfUsuario.grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('USER_ATIVO') then begin
    if cdsGeral.FieldByName('USER_ATIVO').AsInteger = 1 then begin
      grdBasico.Canvas.Brush.Color := $008CFF8C;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Ativo          ');
    end;
    if cdsGeral.FieldByName('USER_ATIVO').AsInteger = 0 then begin
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

initialization
  RegisterClass(TfUsuario);
finalization
  UnRegisterClass(TfUsuario);

end.
