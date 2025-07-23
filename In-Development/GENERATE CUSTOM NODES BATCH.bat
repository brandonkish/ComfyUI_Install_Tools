@echo off
setlocal

:: Get the folder where the batch script is located
set "script_dir=%~dp0"
cd /d "%script_dir%"

:: Create a new batch file to store the commands for cloning and installing dependencies
set "new_batch_file=%script_dir%\update_repos.bat"
echo @echo off > "%new_batch_file%"
echo echo Updating Repositories... >> "%new_batch_file%"

:: Iterate through all subfolders in the current directory
for /d %%i in (*) do (
    :: Check if the folder contains a .git or .github directory (Git repository)
    if exist "%%i\.git" (
        echo Found Git repository: %%i
        :: Get the Git repository URL
        for /f "delims=" %%u in ('git -C "%%i" config --get remote.origin.url') do (
            echo Found Git repository URL: %%u
            :: Append the command to clone and update the repository into the new batch file
            echo git clone %%u >> "%new_batch_file%"
            echo ..\..\python_embeded\python.exe -m pip install -r "%%i\requirements.txt" >> "%new_batch_file%"
            echo. >> "%new_batch_file%"
        )
    ) else if exist "%%i\.github" (
        echo Found .github folder in %%i
        :: Attempt to extract the repository URL from the folder
        for /f "delims=" %%u in ('git -C "%%i" config --get remote.origin.url') do (
            echo Found Git repository URL: %%u
            :: Append the command to clone and update the repository into the new batch file
            echo git clone %%u >> "%new_batch_file%"
            echo ..\..\python_embeded\python.exe -m pip install -r "%%i\requirements.txt" >> "%new_batch_file%"
            echo. >> "%new_batch_file%"
        )
    )
)

:: Inform the user that the new batch file has been created
echo Batch file "%new_batch_file%" has been created with the repository URLs and pip commands.
pause