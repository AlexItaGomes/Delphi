unit uDmGeradorKey;

interface

uses
  System.SysUtils, System.Classes, udmBasico, Data.FMTBcd, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr;

type
  TdmGeradorKey = class(TdmBasico)
    qryRelClientes: TSQLQuery;
    dspRelClientes: TDataSetProvider;
    cdsRelClientes: TClientDataSet;
    dsRelClientes: TDataSource;
    cdsRelClientesCLIE_CNPJ_CPF: TStringField;
    cdsRelClientesCLIE_RAZAO_SOCIAL: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmGeradorKey: TdmGeradorKey;

implementation

{$R *.dfm}

procedure TdmGeradorKey.DataModuleCreate(Sender: TObject);
begin
  inherited;
  cdsRelClientes.Open;
end;

initialization
  dmGeradorKey := TdmGeradorKey.Create(nil);
finalization
  FreeAndNil(dmGeradorKey);

end.
