@echo off
cd /d "%~dp0"
echo Installing dependencies from offline wheels...
python\python.exe -m pip install --no-index --find-links wheels -r requirements.txt
if %ERRORLEVEL% NEQ 0 (
    echo Installation failed.
    pause
    exit /b %ERRORLEVEL%
)
echo Installation successful.
pause
