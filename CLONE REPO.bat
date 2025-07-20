@echo off
setlocal

:: Get the folder where the batch script is located
set "script_dir=%~dp0"
cd /d "%script_dir%"

:loop
:: Ask the user to paste the Git repository URL
echo Please paste the Git repository URL and press Enter (or type 'exit' to quit):
set /p repo_url=

:: If the user types 'exit', break the loop and close the script
if /i "%repo_url%"=="exit" (
    echo Exiting the script...
    exit /b
)

:: Clone the repository into the current directory
git clone %repo_url%

:: Repeat the process
echo.
goto loop
