[Setup]
AppName=AR Sistemas - Controle Financeiro
AppVerName=AR Sistemas 4.0.2.17 Controle Financeiro
OutPutBaseFileName=AnOnImUs
UninstallDisplayIcon={app}\AnOnImUs.exe

;Cabecalho
#include "Cabecalho.iss"

;Executaveis e banco de dados
#include "Executaveis.iss"

;Banco de Dados expecifico
[Files]
Source: D:\Desenv\Projetos_2009\AnOnImUs\Instalador\DBFinanceiro\ANONIMUS.GDB; DestDir: {app}\DataBase\; Flags: onlyifdoesntexist

;Rotinas
#include "Arquivos.iss"

;System
#include "System.iss"

;Instalador Banco de Dados
#include "ScryptDB.iss"

[UninstallRun]
Filename: {app}\bin\versionE.bpl;
Filename: {app}\bin\versionO.bpl;
