@echo off

REM Package localization files for submission

set filename="fin-enterdatehere.zip"

cd "Suomalaiset *"

7z a %filename% "*.json"

move %filename% ..

cd ..
