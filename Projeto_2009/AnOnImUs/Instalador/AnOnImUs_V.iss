[Setup]
AppName=AnOnImUs.Info - Orçamento e Venda
AppVerName=AnOnImUs.Info 2.1.0.57 Orçamento e Venda
OutPutBaseFileName=AnOnImUsV
UninstallDisplayIcon={app}\AnOnImUsV.exe

;Cabecalho
#include "Cabecalho.iss"

;Executaveis e banco de dados
#include "Executaveis.iss"

;Banco de Dados expecifico
[Files]
Source: C:\Desenv\Projetos_2009\AnOnImUs\Instalador\DBVendas\ANONIMUS.GDB; DestDir: {app}\DataBase\; Flags: onlyifdoesntexist
Source: C:\Desenv\Projetos_2009\AnOnImUs\Instalador\System\versionV.bpl;   DestDir: {app}\bin\;      Flags: ignoreversion

;Rotinas
#include "Arquivos.iss"

;System
#include "System.iss"

;Instalador Banco de Dados
#include "ScryptDB.iss"

[UninstallRun]
Filename: {app}\bin\versionF.bpl;
Filename: {app}\bin\versionO.bpl;
Filename: {app}\bin\versionE.bpl;
Filename: {app}\bin\versionV.bpl;

