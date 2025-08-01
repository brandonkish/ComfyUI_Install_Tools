# ComfyUI Installation Guide

## 🔧 Batch File Tools
**RUN_AI**  
Runs ComfyUI with Sage Attention (Place in same folder as "ComfyUI" and "python_embeded" folders)

**DOWNLOAD AND UPDATE COMFYUI MANAGER**  
Downloads ComfyUI manager into ComfyUI folder and installs requirements (Place in same folder as "ComfyUI" and "python_embeded" folders)

**CLONE & UPDATE REPO**  
Clones git repositories to "ComfyUI\custom_nodes" and updates their requirements using a GitHub repository link (Place in same folder as "ComfyUI" and "python_embeded" folders)

---

## 📺 How-To Video
**Install ComfyUI From Scratch:**  
[Watch on YouTube](https://youtu.be/AkuE9NmP0qc)

**Manual Custom Node Install (When ComfyUI Manager Fails):**  
[Watch on YouTube](https://youtu.be/ds_JYS_cUFI)

---

## 🖥️ CUDA Version Check
```bash
nvcc --version
```

## 🔧 Installers & Downloads

- **NVIDIA CUDA 12.8 Installer:**  
  [Download from NVIDIA](https://developer.nvidia.com/cuda-12-8-0-download-archive)

- **Python 3.10.9:**  
  [Download Python 3.10.9](https://www.python.org/downloads/release/python-3109/)

- **All Python Versions:**  
  [Browse All Versions](https://www.python.org/downloads/)

---

## 📦 Python & Pip Setup

- **Upgrade pip (from `python_embeded` folder):**
```bash
python.exe -m pip install --upgrade pip
```

---

## 📁 Clone Repositories

- **Clone ComfyUI (from `ComfyUI_portable_win_nvidia` folder):**
```bash
git clone https://github.com/comfyanonymous/ComfyUI.git
```

- **Clone ComfyUI Manager (inside `custom_nodes` folder):**
```bash
git clone https://github.com/Comfy-Org/ComfyUI-Manager.git
```

---

## 🧠 Install Required Packages

- **PyTorch 2.8.0.dev20250627 (from `python_embeded`):**
```bash
python.exe -m pip install --pre torch==2.8.0.dev20250627 torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu128
```

- **Triton 3.0.1.post19 (from `python_embeded`):**
```bash
python.exe -m pip install "triton-windows==3.3.1.post19"
```

- **SageAttention 2.2 Repo:**  
  [GitHub Repository](https://github.com/woct0rdho/SageAttention/)

- **SageAttention 2.2.0 Wheel (CUDA 12.8, PyTorch 2.8.0, Python 3.10.9):**  
  [Download Wheel](https://github.com/woct0rdho/SageAttention/releases/download/v2.2.0-windows/sageattention-2.2.0+cu128torch2.8.0-cp311-cp311-win_amd64.whl)
  
## LIST_ALL_CUSTOM_NODE_REPOS.bat overview

This batch file is designed to scan the top-level directories in the current folder for `.git` or `.github` folders (indicating Git repositories). It retrieves the repository URL using `git config` and organizes the repositories into three categories based on their type:

1. **ComfyUI Repositories**: Repositories that have the link `https://github.com/comfyanonymous/ComfyUI.git`.
2. **GitHub Repositories**: Repositories with a `.github` folder.
3. **Git Repositories**: Repositories with a `.git` folder.

The script generates a **CSV file** named `repositories.csv` containing the repository URLs along with the type of folder they were found in and the folder name. The CSV file is sorted in the following order:

1. Repositories with `https://github.com/comfyanonymous/ComfyUI.git` (ComfyUI repositories).
2. Repositories containing a `.github` folder.
3. Repositories containing a `.git` folder.

Each row in the CSV file follows this format:  
folder_type, repository_url, folder_name

The output file is sorted alphabetically within each category and can be opened in spreadsheet programs like **Microsoft Excel** or **Google Sheets** for easy viewing and further manipulation.  
The batch file is easy to use: simply run it in a folder containing your repositories, and it will generate the `repositories.csv` file.  