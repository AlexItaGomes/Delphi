[Setup]
AppName=AnOnImUs.Info - Controle Financeiro e Estoque
AppVerName=AnOnImUs.Info 2.1.3.03 Controle Financeiro e Estoque
OutPutBaseFileName=AnOnImUsE
UninstallDisplayIcon={app}\AnOnImUsE.exe

;Cabecalho
#include "Cabecalho.iss"

;Executaveis e banco de dados
#include "Executaveis.iss"

;Banco de Dados expecifico
[Files]
Source: C:\Desenv\Projetos_2009\AnOnImUs\Instalador\DBEstoque\ANONIMUS.GDB; DestDir: {app}\DataBase\; Flags: onlyifdoesntexist
Source: C:\Desenv\Projetos_2009\AnOnImUs\Instalador\System\versionE.bpl;    DestDir: {app}\bin\;      Flags: ignoreversion

;Rotinas
#include "Arquivos.iss"

;System
#include "System.iss"

;Instalador Banco de Dados
#include "ScryptDB.iss"

[UninstallRun]
Filename: {app}\bin\versionF.bpl;
Filename: {app}\bin\versionO.bpl;
