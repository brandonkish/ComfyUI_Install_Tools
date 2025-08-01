# Custom Nodes Workflow Automation

## Overview

The **"GENERATE CUSTOM NODES BATCH.bat"** file automates the process of collecting custom node repositories for your workflow and generating a new batch file that will automatically download and install the required custom nodes from GitHub.

This is useful for streamlining custom workflows where you need to automatically fetch and update specific custom nodes related to a project. The new batch file generated by this process will handle the downloading and updating of the repositories and their dependencies, helping to save time and ensure that the correct nodes are installed.

---

## Description of "GENERATE CUSTOM NODES BATCH.bat"

The **"GENERATE CUSTOM NODES BATCH.bat"** file performs the following actions:

1. **Collect Custom Node GitHub Links**: 
   - It goes through the `custom_nodes` folder in your current directory and collects each custom node's GitHub repository link. 
   
2. **Generate Batch File**: 
   - The script then generates a new batch file that contains commands to:
     - Clone each GitHub repository.
     - Update the repository's Python dependencies by running `pip install` on its `requirements.txt` file.
     
   This allows you to quickly download and install custom nodes for your workflow without having to manually clone or install each one.

---

## How to Use

1. **Prepare the `custom_nodes` Folder**:
   - The `custom_nodes` folder should contain only the custom nodes that are relevant to your current workflow.
   - It is highly recommended to **remove all custom nodes** from the `custom_nodes` folder that are not part of the workflow you are using.
   - **Manually copy** or **install** only the nodes for the current workflow you intend to work with.

2. **Run the "GENERATE CUSTOM NODES BATCH.bat" File**:
   - After the `custom_nodes` folder is populated with only the relevant custom nodes, run the **"GENERATE CUSTOM NODES BATCH.bat"** file.
   - This will automatically scan the folder, gather the GitHub repository links, and generate a new batch file to handle the downloading and updating process.

3. **Use the Generated Batch File**:
   - The new batch file will be created in the same directory. It will contain the `git clone` and `pip install` commands for each custom node repository.
   - Simply run the newly generated batch file to download and update the nodes.

---

## Known Issues

- **Requirements Update Not Working**: Currently, updating the `requirements.txt` for each repository is not fully functional. Each repository has a unique name, which complicates the process of automatically finding and updating the dependencies. This will require further investigation to automate fully.
  
- **Solution in Progress**: The issue with updating requirements is under investigation. However, the batch file still performs its main function—cloning the repositories—effectively, and manual updates to `requirements.txt` can still be performed by the user.

Despite the current limitations, this tool remains highly useful for automating the downloading of custom nodes, and we do not intend to scrap this idea.

---

## Additional Notes

- This script works best when the `custom_nodes` folder is organized and only contains the nodes you need for your current workflow.
- After running the batch file and generating the new one, you can easily reuse it to update or download the nodes as needed.
  
---

## License

This project is open source. Feel free to contribute, modify, or fork this repository.

