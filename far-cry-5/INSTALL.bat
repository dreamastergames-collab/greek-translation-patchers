@echo off
chcp 65001 >nul
title Far Cry 5 - Ελληνική Μετάφραση (dreamasters)
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
if "%PC%"=="" ( echo Δεν βρέθηκε το data_final\pc. Βάλε τον φάκελο FC5_Greek_Translation μέσα στον φάκελο του παιχνιδιού. & pause & exit /b )
echo Φάκελος παιχνιδιού: %PC%
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
 "$dat=Join-Path '%PC%' 'patch.dat'; $orig=8967915634; $blob=[IO.File]::ReadAllBytes('%DATA%greek_data.bin');" ^
 "$len=(Get-Item -LiteralPath $dat).Length;" ^
 "if($len -ne $orig -and $len -ne ($orig+$blob.Length)){Write-Host ('Μη συμβατή έκδοση παιχνιδιού (patch.dat = '+$len+'). Δεν έγινε καμία αλλαγή.') -ForegroundColor Red; exit 1}" ^
 "$fs=[IO.File]::Open($dat,'Open','ReadWrite'); $fs.SetLength($orig); $fs.Seek(0,'End')|Out-Null; $fs.Write($blob,0,$blob.Length); $fs.Close(); Write-Host 'patch.dat OK'"
if errorlevel 1 ( pause & exit /b )
copy /y "%DATA%patch.fat.greek" "%PC%\patch.fat" >nul
echo.
echo ===== Η εγκατάσταση ολοκληρώθηκε! Γλώσσα παιχνιδιού: English =====
pause
exit /b

:nofiles
echo Δεν βρέθηκαν τα αρχεία της μετάφρασης (greek_data.bin, patch.fat.greek, patch.fat.original).
echo Βάλε το %~nx0 μέσα στον φάκελο FC5_Greek_Translation που κατέβασες από το Nexus (δίπλα στο greek_data.bin).
pause
exit /b
