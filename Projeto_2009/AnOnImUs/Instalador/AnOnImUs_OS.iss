[Setup]
AppName=AnOnImUs.Info - Financeiro, Estoque e Ordem de Serviço
AppVerName=AnOnImUs.Info 2.1.3.03 Financeiro, Estoque e Ordem de Serviço
OutPutBaseFileName=AnOnImUsOS
UninstallDisplayIcon={app}\AnOnImUsOS.exe

;Cabecalho
 #include "Cabecalho.iss"

;Executaveis e banco de dados
#include "Executaveis.iss"

;Banco de Dados expecifico
[Files]
Source: C:\Desenv\Projetos_2009\AnOnImUs\Instalador\DBOrdemServico\ANONIMUS.GDB; DestDir: {app}\DataBase\; Flags: onlyifdoesntexist
Source: C:\Desenv\Projetos_2009\AnOnImUs\Instalador\System\versionO.bpl;         DestDir: {app}\bin\;      Flags: ignoreversion

;Rotinas
#include "Arquivos.iss"

;System
#include "System.iss"

;Instalador Banco de Dados
#include "ScryptDB.iss"

[UninstallRun]
Filename: {app}\bin\versionE.bpl;
Filename: {app}\bin\versionF.bpl;
