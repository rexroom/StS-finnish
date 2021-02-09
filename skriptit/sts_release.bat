@echo off

REM Package localization files for submission

set "JQ_BIN=jq-win64"
set "ZIP_BIN=7z"

REM getting date
REM source: https://stackoverflow.com/questions/11037831/filename-timestamp-in-windows-cmd-batch-script-getting-truncated

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"

set "filename=fin-%YYYY%%MM%%DD%.zip"

REM checking files
REM using jq (https://stedolan.github.io/jq/)

cd "Suomalaiset *"

echo Now checking json structures:

for %%i in (*.json) do (
  echo Checking %%i...
  type %%i | %JQ_BIN% . > NUL
)

REM creating archive

%ZIP_BIN% a -bd %filename% "*.json"

move %filename% ..

cd ..

pause
