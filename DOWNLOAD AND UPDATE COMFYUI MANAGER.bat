@echo off
setlocal

REM Set target paths
set "TARGET_DIR=ComfyUI\custom_nodes"
set "REPO_NAME=ComfyUI-Manager"
set "PYTHON_PATH=..\..\..\python_embeded\python.exe"

REM Check if Git is available
git --version >nul 2>&1
if errorlevel 1 (
    echo Git is not installed or not in PATH.
    pause
    exit /b 1
)

REM Create target directory if it doesn't exist
if not exist "%TARGET_DIR%" (
    mkdir "%TARGET_DIR%"
)

REM Navigate to the target directory
cd /d "%TARGET_DIR%"

REM Clone the repository if it doesn't exist
if not exist "%REPO_NAME%" (
    echo Cloning repository...
    git clone https://github.com/Comfy-Org/ComfyUI-Manager.git
) else (
    echo Repository already exists. Skipping clone.
)

REM Install requirements if the file exists
if exist "%REPO_NAME%\requirements.txt" (
    echo Installing Python dependencies...
    pushd "%REPO_NAME%"
    "%PYTHON_PATH%" -m pip install -r requirements.txt
    popd
) else (
    echo No requirements.txt found in %REPO_NAME%
)

echo Done!
pause