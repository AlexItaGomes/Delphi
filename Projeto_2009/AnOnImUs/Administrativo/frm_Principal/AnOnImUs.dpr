program AnOnImUs;

uses
  Vcl.Forms,
  Funcoes,
  IniFiles,
  SysUtils,
  Windows,
  Dialogs,
  ComObj,
  Variants,
  PidUtils in 'PidUtils.pas',
  udmConexao in 'udmConexao.pas' {dmConexao: TDataModule},
  ufConfDataBase in 'ufConfDataBase.pas' {fConfDataBase},
  ufHelp in 'ufHelp.pas' {fHelp},
  ufLicenca in 'ufLicenca.pas' {fLicenca},
  ufLogin in 'ufLogin.pas' {fLogin},
  ufMensagens in 'ufMensagens.pas' {fMensagens},
  ufPrincipal in 'ufPrincipal.pas' {fPrincipal},
  ufRegistro in 'ufRegistro.pas' {fRegistro},
  ufSplash in 'ufSplash.pas' {fSplash},
  uUpdate in 'uUpdate.pas',
  ufVersao in 'ufVersao.pas' {fVersao},
  ufAtualizacao in 'ufAtualizacao.pas' {fAtualizacao};

{$R *.res}

var
  intMutex : Integer;

function IsAppActive : Boolean;
begin
  intMutex := CreateMutex(nil, true, PChar('#35254583'));
  if (intMutex <> 0) and (GetLastError = 0) then begin
    Result := false;
  end else Result := true;
end;

procedure PrimaryExecute;
var
  iniTMP     : TIniFile;
  strCaminho : String;
begin
  try
    try
      iniTMP := TIniFile.Create(ExtractFilePath(Application.ExeName)+'AnOnImUs.ini');
      if iniTMP.ReadBool('DBConfig','PrimaryExec',true) then begin
        strCaminho := ExtractFilePath(Application.ExeName);
        strCaminho := Copy(strCaminho,1,length(strCaminho)-4)+'DataBase\ANONIMUS.GDB';
        if FileExists(strCaminho) then begin
          iniTMP.WriteString('DBConfig','DataBase','localhost:'+strCaminho);
          iniTMP.WriteBool('DBConfig','PrimaryExec',false);
        end else begin
          iniTMP.WriteString('DBConfig','DataBase',strCaminho);
        end;
      end else begin
        iniTMP.WriteBool('DBConfig','PrimaryExec',false);
      end;
    except
      try
        iniTMP.WriteBool('DBConfig','PrimaryExec',false);
      except
      end;
    end;
  finally
    FreeAndNil(iniTMP);
  end;
end;

begin
  PrimaryExecute;
  if not IsAppActive then begin
    try
      if fSplash = nil then
        fSplash := TfSplash.Create(nil);
      fSplash.Show;
      fSplash.Repaint;
      fSplash.LabelProgress.Caption := 'Bem-Vindo ao sistema AnOnImUs.Info';
      fSplash.LabelProgress.Repaint;
      Sleep(500);
      fSplash.LabelProgress.Caption := 'Carregando configurações... Aguarde !!';
      fSplash.LabelProgress.Repaint;
      fSplash.Repaint;
      Application.Initialize;
      FormatSettings.ThousandSeparator:= '.';
      FormatSettings.DecimalSeparator := ',';
      FormatSettings.DateSeparator    := '/';
      FormatSettings.ShortDateFormat  := 'DD/MM/YYYY';
      FormatSettings.LongDateFormat   := 'DD/MM/YYYY';
      FormatSettings.CurrencyDecimals := 2;
      FormatSettings.CurrencyString   := '';
      FormatSettings.NegCurrFormat    := 2 ;
      Application.MainFormOnTaskbar := True;
      Application.Title := 'AR Sistemas & Consultoria Ltda.';
  fPrincipal.DownloadLicenca;
      Application.CreateForm(TfPrincipal, fPrincipal);
      Application.CreateForm(TdmConexao, dmConexao);
      Sleep(500);
      FreeAndNil(fSplash);
      Application.Run;
      try
        CloseHandle(intMutex);
      except
      end;
    finally
      try
        CloseHandle(intMutex);
      except
      end;
    end;
  end else begin
    ShowMessage('A T E N Ç Ã O ! !'+#13+#13+
                'Foi detectado que já existe uma cópia do sistema AnOnImUs em execução!'+#13+#13+
                'Certifique-se de que o sistema esteja realmente em execução, '+
                'caso contrario finalize-o utilizando [ Ctrl + Alt + Delete ].'+#13+#13+
                'Se o problema persistir entre em contato com a AnOnImUs.Info através '+
                'de nosso site ou através de nosso suporte técnico:'+#13+#13+
                'www.anonimus.info');
    Application.Terminate;
  end;
end.
