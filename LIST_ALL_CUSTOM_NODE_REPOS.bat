@echo off
setlocal enabledelayedexpansion

:: Output file for repository list with .csv extension
set "output_file=repositories.csv"
set "comfyui_output=comfyui_repositories.csv"
set "github_output=github_repositories.csv"
set "git_output=git_repositories.csv"

:: Create or clear the output files
echo. > %comfyui_output%
echo. > %github_output%
echo. > %git_output%

:: Iterate over each folder in the current directory (top level only)
for /d %%D in (*) do (
    if exist "%%D\.github" (
        :: This is a .github folder
        pushd "%%D" >nul
        for /f "tokens=2 delims=:" %%r in ('git config --get remote.origin.url') do (
            :: Check if the repository is https://github.com/comfyanonymous/ComfyUI.git
            if "%%r"=="https://github.com/comfyanonymous/ComfyUI.git" (
                echo comfyui, %%r, %%D >> ..\%comfyui_output%
            ) else (
                :: Add "github" in front and folder name at the end for .github folder
                echo github, %%r, %%D >> ..\%github_output%
            )
        )
        popd >nul
    )
    if exist "%%D\.git" (
        :: This is a .git folder
        pushd "%%D" >nul
        for /f "tokens=2 delims=:" %%r in ('git config --get remote.origin.url') do (
            :: Check if the repository is https://github.com/comfyanonymous/ComfyUI.git
            if "%%r"=="https://github.com/comfyanonymous/ComfyUI.git" (
                echo comfyui, %%r, %%D >> ..\%comfyui_output%
            ) else (
                :: Add "git" in front and folder name at the end for .git folder
                echo git, %%r, %%D >> ..\%git_output%
            )
        )
        popd >nul
    )
)

:: Sort the output files alphabetically
sort %comfyui_output% > %output_file%
sort %github_output% >> %output_file%
sort %git_output% >> %output_file%

:: Delete temporary files
del %comfyui_output%
del %github_output%
del %git_output%

:: Inform the user the task is complete
echo Repository list saved to %output_file%.
endlocal
