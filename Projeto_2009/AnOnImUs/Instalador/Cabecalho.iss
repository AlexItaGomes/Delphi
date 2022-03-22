[Setup]
AppCopyRight=AR Sistemas e Consultoria Ltda.
AppPublisher=AR Sistemas e Consultoria Ltda.
DefaultDirName=C:\AnOnImUs.Info
DefaultGroupName=AnOnImUs.Info
WizardSmallImageFile=D:\Desenv\Projetos_2009\AnOnImUs\Instalador\Icone\AnOnImOs.bmp
WizardImageFile=D:\Desenv\Projetos_2009\AnOnImUs\Instalador\Icone\AnOnImOsI.bmp
SetupIconFile=D:\Desenv\Projetos_2009\AnOnImUs\Instalador\Icone\AnOnImUs.ico
ShowLanguageDialog=yes
AppPublisherUrl=http://www.arsistemaseconsultoria.com.br
Compression=lzma
SolidCompression=yes
PrivilegesRequired=none
LicenseFile=Licenca.txt
OutputDir=D:\Desenv\Projetos_2009\AnOnImUs\Instalador

[Languages]                                                                                  
Name: "portuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: Servidor; Description: Instalação completa - Servidor (Banco de Dados e Software); Flags: exclusive
Name: Cliente; Description: Instalação Mínima - Estações Cliente (Somente o software); Flags: exclusive