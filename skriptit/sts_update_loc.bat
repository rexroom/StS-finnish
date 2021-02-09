CHCP 65001
@echo off

REM update Slay the Spire localizations

set "STS_DIR=C:\Program Files (x86)\Steam\steamapps\common\SlayTheSpire\"
set "STS_JAR=desktop-1.0"

set "FIN_LANG=Suomalaiset käännökset"
set "FIN_ART=Taide"

REM replace this with the language you want to use
set "STS_LANG=deu"

set "ZIP_BIN=7z"
set "ZIP_OPT=a -r"

echo Updating %SLS_JAR%

copy /Y "%FIN_LANG%\"*.json "%STS_JAR%\localization\%STS_LANG%\"
copy /Y "%FIN_ART%\purge\fin.png" "%STS_JAR%\images\npcs\purge\%STS_LANG%.png"
copy /Y "%FIN_ART%\rug\fin.png" "%STS_JAR%\images\npcs\rug\%STS_LANG%.png"
copy /Y "%FIN_ART%\sale_tag\fin.png" "%STS_JAR%\images\npcs\sale_tag\%STS_LANG%.png"
copy /Y "%FIN_ART%\sold_out\fin.png" "%STS_JAR%\images\npcs\sold_out\%STS_LANG%.png"

echo Creating new %STS_JAR%.jar

cd %STS_JAR%

%ZIP_BIN% %ZIP_OPT% %STS_JAR%.jar

move %STS_JAR%.jar ..

cd ..

echo File %STS_JAR%.jar created, copy this to the StS directory (make a backup of the old file)

pause
