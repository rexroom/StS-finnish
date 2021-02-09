@echo off

REM Slay the Spire data package extractor

set "SLS_DIR=C:\Program Files (x86)\Steam\steamapps\common\SlayTheSpire\"
set "SLS_JAR=desktop-1.0"

set "ZIP_BIN=7z"
set "ZIP_OPT=x -o%SLS_JAR%"

echo Extracting %SLS_JAR%

%ZIP_BIN% %ZIP_OPT% "%SLS_DIR%%SLS_JAR%.jar"

pause
