# Local Repository Installation Script

This guide provides step-by-step instructions for using the `install_tools.sh` script to install various repositories locally without requiring `sudo` or root access.

## Features
1. **No Root Access Required**: All installations occur within the user's home directory.
2. **User Choice**: Select specific tools or install all of them.
3. **Vps-Bot Configuration**: Prompt for bot token and configuration.
4. **Local `sources.list`**: Created in `~/.local/apt/sources.list`.
5. **Error Handling**: Skips cloning if the directory exists and skips installation if `install.sh` is not found.

## Prerequisites
Ensure that `git` is installed. If not, either install it locally or seek assistance from your system administrator.

## Step-by-Step Guide

### 1. Save the Script
Save the provided script as `install_tools.sh` in your desired directory.

### 2. Make the Script Executable
```bash
chmod +x install_tools.sh
```

### 3. Run the Script
```bash
./install_tools.sh
```

### 4. Select Tools to Install
Upon running the script, you will be prompted with the following options:
```
Which tools would you like to install?
1. FoxTools
2. freeroot (katy-the-kat)
3. freeroot (Mytai20100)
4. freeroot-all-installer (nics-cyber)
5. All of the above
```
Enter the corresponding number for your choice.

### 5. Configure Vps-Bot (Optional)
If you choose option `3` or `5`, you will be prompted to provide the bot token and any other necessary configurations:
```
Enter your bot token: YOUR_BOT_TOKEN
Enter any other required configuration for Vps-Bot: YOUR_CONFIG
```

## Script Output Example
```
Installing FoxTools locally...
Installing freeroot-katy locally...
Installing freeroot-mytai locally...
Installing freeroot-all-installer locally...
Installing Vps-Bot locally...
Script completed successfully!
```

## Script Logic
1. **Clone the repository**: Skips cloning if the directory already exists.
2. **Run `install.sh`**: If present, makes the script executable and runs it.
3. **Local `sources.list`**: Creates a local `sources.list` for personal use.
4. **Environment variable**: Updates the environment to use the local `sources.list`.

## Troubleshooting
- Ensure `git` is installed.
- Verify that the repositories contain an `install.sh` script if the installation step is skipped.
- Check for any error messages and address them accordingly.

## Conclusion
The script effectively manages the installation of multiple repositories locally without requiring administrative privileges. If you encounter any issues, feel free to reach out for further assistance.

