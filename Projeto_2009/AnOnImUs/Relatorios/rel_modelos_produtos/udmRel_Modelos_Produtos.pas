unit udmRel_Modelos_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmRel_Modelos_Produtos = class(TdmBasico)
    qryRelModelos: TSQLQuery;
    dspRelModelos: TDataSetProvider;
    cdsRelModelos: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    dsRelModelos: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRel_Modelos_Produtos: TdmRel_Modelos_Produtos;

implementation

{$R *.dfm}

initialization
  dmRel_Modelos_Produtos := TdmRel_Modelos_Produtos.Create(nil);
finalization
  FreeAndNil(dmRel_Modelos_Produtos);

end.
