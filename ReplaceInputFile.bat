@echo off
setlocal EnableDelayedExpansion
(set \n=^
%==%
)

Chcp 65001>Nul

for /f "tokens=3,*" %%d in ('REG QUERY "HKCU\Control Panel\International\User Profile" /v Languages') do set LANG=%%d

if %LANG:~0,2% == fr (goto Français)
goto English


:Français

set /p launcher="Quel launcher utilises-tu pour lancer Paladins ?!\n![1] Steam!\n![2] Epic Games!\n![3] Les deux!\n!Tappes le bon numéro puis fais entrée : "
if %launcher% == 1 (goto SteamFr)
if %launcher% == 2 (goto EpicFr)
if %launcher% == 3 (goto SteamFr)

echo S'il te plait n'entres que des nombres entre 1 et 3 ^^!
goto Français

:SteamFr
copy /y "./DefaultInput.ini" "C:\Program Files (x86)\Steam\steamapps\common\Paladins\ChaosGame\Config\" > TmpFile
set /p SteamResult= < TmpFile
del TmpFile
if %SteamResult:~8,1% == 1 (echo !\n!Le fichier par défaut a été remplacé avec succès dans le dossier de configuration de Paladins pour Steam.) else (echo Erreur de répertoire Steam ^^!)
goto EpicFr

:EpicFr
if %launcher% == 1 (goto End)
copy /y "./DefaultInput.ini" "C:\Program Files\Epic Games\Paladins\ChaosGame\Config\" > TmpFile
set /p EpicResult= < TmpFile
del TmpFile
if %EpicResult:~8,1% == 1 (echo !\n!Le fichier par défaut a été remplacé avec succès dans le dossier de configuration de Paladins pour Epic Games.) else (echo Erreur de répertoire Epic Games ^^!)

goto End


:English

set /p launcher="Which launcher are you starting Paladins with ?!\n![1] Steam!\n![2] Epic Games!\n![3] Both!\n!!\n!Type the right number, then press enter : "
if %launcher% == 1 (goto SteamEn)
if %launcher% == 2 (goto EpicEn)
if %launcher% == 3 (goto SteamEn)

echo Please type only a number between 1 and 3 ^^!
goto English

:SteamEn
copy /y "./DefaultInput.ini" "C:\Program Files (x86)\Steam\steamapps\common\Paladins\ChaosGame\Config\" > TmpFile
set /p SteamResult= < TmpFile
del TmpFile
echo %SteamResult:~8,1%
if %SteamResult:~8,1% == 1 (echo !\n!The default file has been successfully replaced by the custom one in the Paladins config folder for Steam.) else (echo Steam directory Error ^^!)
goto EpicEn

:EpicEn
if %launcher% == 1 (goto End)
copy /y "./DefaultInput.ini" "C:\Program Files\Epic Games\Paladins\ChaosGame\Config\" > TmpFile
set /p EpicResult= < TmpFile
del TmpFile
if %EpicResult:~8,1% == 1 (echo !\n!The default file has been successfully replaced by the custom one in the Paladins config folder for Epic Games.) else (echo Epic Game directory Error ^^!)


:End
echo.
pause