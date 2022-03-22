unit udmRel_Agenda;

interface

uses
  System.SysUtils, System.Classes, udmBasico, Data.FMTBcd, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr;

type
  TdmRel_Agenda = class(TdmBasico)
    qryRelAgenda: TSQLQuery;
    dsRelAgenda: TDataSource;
    qryAcertos: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRel_Agenda: TdmRel_Agenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

initialization
  dmRel_Agenda := TdmRel_Agenda.Create(nil);
finalization
  FreeAndNil(dmRel_Agenda);

end.
