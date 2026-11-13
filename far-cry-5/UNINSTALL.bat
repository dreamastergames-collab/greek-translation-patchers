@echo off
chcp 65001 >nul
title Far Cry 5 - Απεγκατάσταση Ελληνικών
cd /d "%~dp0"
set "DATA="
if exist "%~dp0greek_data.bin" set "DATA=%~dp0"
if not defined DATA if exist "%~dp0..\greek_data.bin" for %%I in ("%~dp0..") do set "DATA=%%~fI\"
if not defined DATA goto nofiles
if not exist "%DATA%patch.fat.greek" goto nofiles
if not exist "%DATA%patch.fat.original" goto nofiles
set "PC="
if exist "%DATA%..\data_final\pc\patch.dat" set "PC=%DATA%..\data_final\pc"
if exist "%DATA%..\FarCry5\data_final\pc\patch.dat" set "PC=%DATA%..\FarCry5\data_final\pc"
if "%PC%"=="" ( echo Δεν βρέθηκε το data_final\pc. & pause & exit /b )
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
 "$dat=Join-Path '%PC%' 'patch.dat'; $orig=8967915634; if((Get-Item -LiteralPath $dat).Length -gt $orig){$fs=[IO.File]::Open($dat,'Open','ReadWrite'); $fs.SetLength($orig); $fs.Close()}"
copy /y "%DATA%patch.fat.original" "%PC%\patch.fat" >nul
echo Επαναφέρθηκαν τα αρχικά αρχεία.
pause
exit /b

:nofiles
echo Δεν βρέθηκαν τα αρχεία της μετάφρασης (greek_data.bin, patch.fat.greek, patch.fat.original).
echo Βάλε το %~nx0 μέσα στον φάκελο FC5_Greek_Translation που κατέβασες από το Nexus (δίπλα στο greek_data.bin).
pause
exit /b
