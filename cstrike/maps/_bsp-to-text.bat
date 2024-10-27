@echo off
setlocal

rem Pfad zum Speicherort der Batch-Datei
set "folder_path=%~dp0"

rem Textdatei, in die die Dateinamen geschrieben werden
set "output_file=%folder_path%_bsp_files.txt"

rem Löscht die Textdatei, falls sie bereits existiert, um Dopplungen zu vermeiden
if exist "%output_file%" del "%output_file%"

rem Durchsuche alle .bsp-Dateien im Ordner der .bat-Datei
for %%f in (*.bsp) do (
    echo %%~nf >> "%output_file%"
)

echo Alle Dateinamen wurden in %output_file% gespeichert.
endlocal
