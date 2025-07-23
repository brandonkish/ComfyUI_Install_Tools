@echo off
setlocal

REM Set target paths (relative to the batch file's location)
set "TARGET_DIR=ComfyUI\custom_nodes"
set "PYTHON_PATH=..\..\..\python_embeded\python.exe"

REM Check if Git is available
git --version >nul 2>&1
if errorlevel 1 (
    echo Git is not installed or not in PATH.
    pause
    exit /b 1
)

:LOOP
REM Prompt user for the repository URL
echo CLONE AND UPDATE
echo Please paste the Git repository URL and press Enter (or type 'exit' to quit):
set /p REPO_URL=

REM Exit the loop if the user types "exit"
if /i "%REPO_URL%"=="exit" (
    echo Exiting...
    exit /b
)

REM Create target directory if it doesn't exist
if not exist "%TARGET_DIR%" (
    mkdir "%TARGET_DIR%"
)

echo.
echo ================================================================
echo CLONING REPO TO "%TARGET_DIR%...
echo ================================================================
echo.
cd "%TARGET_DIR%"
git clone "%REPO_URL%"

REM Find the most recently created folder in the TARGET_DIR
for /f "delims=" %%a in ('dir /b /ad /o:-d') do (
    set "NEWEST_FOLDER=%%a"
    goto :found
)

:found
REM Install requirements if the file exists in the newly created folder
cd %NEWEST_FOLDER%

if exist "requirements.txt" (
echo.
echo ================================================================
echo Installing Python dependencies in "%TARGET_DIR%\%NEWEST_FOLDER%"...
echo ================================================================
echo.

    "%PYTHON_PATH%" -m pip install -r requirements.txt"
) else (

echo.
echo ================================================================
echo No requirements.txt found in "%TARGET_DIR%\%NEWEST_FOLDER%"
echo ================================================================
echo.
)
cd ..\..\..\

echo.
echo ================================================================
echo Cloned and Updated:  %REPO_URL%
echo To: "%TARGET_DIR%\%NEWEST_FOLDER%"...
echo ================================================================
echo.
pause
@echo off
cls
goto LOOP

