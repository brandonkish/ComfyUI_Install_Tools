Create a ReadMe.md file that is well laid out. The file should have the following info In order:

HowTo video: Install Comfy UI From Scratch:
https://youtu.be/apbXrQ4pcrg

Cuda Version Check:
nvcc --version

Nvidia Cuda 12.8 Installer:
https://developer.nvidia.com/cuda-12-8-0-download-archive

Python 3.10.9:
https://www.python.org/downloads/release/python-3109/

All Python Versions:
https://www.python.org/downloads/

Upgrade PIP Command (From python_embeded):
python.exe -m pip install --upgrade pip

Clone ComfyUI (From ComfyUI_portable_win_nvidia folder)
git clone https://github.com/comfyanonymous/ComfyUI.git

PyTorch 2.8.0.dev20250627 Install Command (From python_embeded):
python.exe -m pip install --pre torch==2.8.0.dev20250627 torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu128

Triton 3.0.1.post19 Install Command (From python_embeded)
python.exe -m pip install "triton-windows==3.3.1.post19"

SageAttention 2.2 Wheel Repo:
https://github.com/woct0rdho/SageAttention/

Sage Attention 2.2 (Cuda 12.8, PyTorch 2.0.8, Python 3.10.9) version:
https://github.com/woct0rdho/SageAttention/releases/download/v2.2.0-windows/sageattention-2.2.0+cu128torch2.8.0-cp311-cp311-win_amd64.whl

Clone ComfyUI Manager Command (In custom_nodes):
git clone https://github.com/Comfy-Org/ComfyUI-Manager.git

Update custom_node requirements batch / command (From inside the nodes folder i.e. custom_nodes\node_folder\)
..\..\..\python_embeded\python.exe -m pip install -r requirements.txt
pause

custom_nodes auto repo cloner:
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


RUN AI Batch / Command:
python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build --fast fp16_accumulation --use-sage-attention
pause