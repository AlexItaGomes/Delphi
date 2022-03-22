unit udmRelPracas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmRelPracas = class(TdmBasico)
    qryPesqPraca: TSQLQuery;
    dspPesqPraca: TDataSetProvider;
    cdsPesqPraca: TClientDataSet;
    cdsPesqPracaGENE_ID: TIntegerField;
    cdsPesqPracaGENE_DESCR: TStringField;
    cdsPesqPracaGENE_PAR1: TStringField;
    qryRelPracas: TSQLQuery;
    dspRelPracas: TDataSetProvider;
    cdsRelPracas: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    dsRelPracas: TDataSource;
    cdsPesqPracaGENE_PAR2: TStringField;
    qryPesqPracaGENE_ID: TIntegerField;
    qryPesqPracaGENE_DESCR: TStringField;
    qryPesqPracaGENE_PAR1: TStringField;
    qryPesqPracaGENE_PAR2: TStringField;
    cdsRelPracasGENE_PAR2: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRelPracas: TdmRelPracas;

implementation

{$R *.dfm}

initialization
  dmRelPracas := TdmRelPracas.Create(nil);
finalization
  FreeAndNil(dmRelPracas);

end.
