@echo off
setlocal

rem Standardpfade für 7-Zip prüfen
set "seven_zip_path="
if exist "C:\Program Files\7-Zip\7z.exe" (
    set "seven_zip_path=C:\Program Files\7-Zip\7z.exe"
) else if exist "C:\Program Files (x86)\7-Zip\7z.exe" (
    set "seven_zip_path=C:\Program Files (x86)\7-Zip\7z.exe"
)

rem Überprüfen, ob 7-Zip gefunden wurde
if not defined seven_zip_path (
    echo 7-Zip wurde nicht gefunden. Bitte installieren Sie 7-Zip oder geben Sie den Pfad manuell an.
    exit /b
)

rem Ordner auf den Speicherort des Skripts setzen
set "folder_path=%~dp0"
cd /d "%folder_path%"

rem Schleife durch alle .bsp-Dateien
for %%f in (*.bsp) do (
    echo Archivieren von %%f...
    "%seven_zip_path%" a -tbzip2 "%%~nf.bzip2" "%%f"
)

echo Alle Dateien wurden archiviert.
endlocal
