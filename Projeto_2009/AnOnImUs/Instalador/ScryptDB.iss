[Files]
Source: D:\Desenv\Projetos_2009\AnOnImUs\Instalador\Firebird\DataBase.exe;         DestDir: {tmp};          Flags: onlyifdoesntexist

[Run]
Filename: {tmp}\DataBase.exe;                                                      Parameters: "/VERYSILENT /NOICONS /COMPONENTS=""SuperServerComponent, ServerComponent, DevAdminComponent, ClientComponent"" /FORCE /NOGDS32 /COPYFBCLIENT"
Filename: {sys}\netsh.exe; Parameters: "firewall add portopening protocol=TCP port=3050 name=""Firebird"" mode=ENABLE scope=SUBNET"; Flags: nowait runhidden; MinVersion: 0,5.01.2600;

[Code]
function CheckNT2000XP(): Boolean;
begin
  Result := UsingWinNT();
end;

function CheckWin9x(): Boolean;
begin
  Result := not UsingWinNT();
end;

function ModPathDir(): TArrayOfString;
var
  Dir: TArrayOfString;
begin
  setArrayLength(Dir, 1)
  Dir[0] := ExpandConstant('{app}')+'\AnOnImUs\System';
  Result := Dir;
end;

[Icons]
Name: {userdesktop}\AnOnImUs.Info;        Filename: {app}\bin\AnOnImUs.exe;
Name: {group}\AnOnImUs.Info;              Filename: {app}\bin\AnOnImUs.exe;               IconIndex: 0

[UninstallRun]
Filename: {pf}\Firebird\Firebird_2_1\bin\instsvc.exe; Parameters: sto;  Check: CheckNT2000XP; WorkingDir: {pf}\Firebird\Firebird_2_1\bin\; Flags: waituntilidle runhidden
Filename: {pf}\Firebird\Firebird_2_1\bin\instsvc.exe; Parameters: r;    Check: CheckNT2000XP; WorkingDir: {pf}\Firebird\Firebird_2_1\bin\; Flags: waituntilidle runhidden
Filename: {pf}\Firebird\Firebird_2_1\unis000.exe;     WorkingDir: {pf}\Firebird\Firebird_2_1\; Tasks: ; Languages:
