unit ufCartaoCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, frxClass, frxDBSet, frxDesgn, Menus, Funcoes, ExtCtrls, DB,
  Grids, DBGrids, StdCtrls, Buttons;

type
  TfCartaoCredito = class(TfBasico)
    procedure FormCreate(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnNovoClick(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCartaoCredito: TfCartaoCredito;

implementation

uses udmCartaoCredito, ufCadCartaoCredito;

{$R *.dfm}

procedure TfCartaoCredito.btnNovoClick(Sender: TObject);
begin
  inherited;
  OpenClientDataSet();
end;

procedure TfCartaoCredito.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral := dmCartaoCredito.cdsCartaoCredito;
  cdsGeral.Open;
  Inherited;
  OpenClientDataSet;
  formCadastro := fCadCartaoCredito;
  with fCadCartaoCredito do begin
    cdsLocal  := dmCartaoCredito.cdsCartaoCredito;
    funcLocal := Self.funcBasico;
  end;
end;

procedure TfCartaoCredito.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
//var
//  imgTMP      : TImage;
//  bmpIMG      : TBitmap;
//  BS          : TStream;
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('STATUS') then begin
    if cdsGeral.FieldByName('Status').AsString = 'Sim' then begin
      grdBasico.Canvas.Brush.Color := $008CFF8C;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
    end else begin
      grdBasico.Canvas.Brush.Color := $006666FF;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
  end;
end;

procedure TfCartaoCredito.OpenClientDataSet();
begin
  with dmCartaoCredito.cdsCartaoCredito do begin
    Close;
    Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
    Open;
  end;
end;

initialization
  RegisterClass(TfCartaoCredito);
finalization
  UnRegisterClass(TfCartaoCredito);

end.
