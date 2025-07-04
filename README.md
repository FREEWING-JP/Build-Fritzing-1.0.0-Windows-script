# Build-Fritzing-1.0.5-Windows-script
Build Fritzing 1.0.5 Windows script

2025/05/17 Update Build Fritzing 1.0.5  
2024/10/28 Update Build Fritzing 1.0.4 (Reconfirmed on 2025/01/05)  
2024/07/14 Update Build Fritzing 1.0.3  
2024/01/11 Update Build Fritzing 1.0.2 (Reconfirmed on 2024/05/05)  
2023/11/18 Update Build Fritzing 1.0.1  

* How to Build Fritzing 1.0.5 from Source code in Windows with Visual Studio 2019  
http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/    

* Build Step  
```
* Open Command Prompt

bitsadmin /TRANSFER hoge https://raw.githubusercontent.com/FREEWING-JP/Build-Fritzing-1.0.0-Windows-script/main/00_Download_Script.bat %cd%\00_Download_Script.bat  

# Optional: Set custom directories  
# set QT_INSTALL_DIR=D:\CustomQtPath  
# set FRITZING_WORKSPACE_DIR=D:\FritzingBuild  
# set VS_INSTALL_DIR=D:\VisualStudio\2019\BuildTools  
00_Download_Script.bat

00_Execute_Script.bat

* Wait an hour
```

## Directory Configuration

The build scripts use a central configuration file called `directories_config.bat` to store all directory paths. This file is persistent and can be edited manually to customize your build environment.

### Default Configuration

The default configuration in `directories_config.bat` looks like this:  

```batch
@echo off
rem directories_config.bat
rem Configuration file for directory paths used in Fritzing build scripts
rem This file is meant to be persistent and can be edited manually

rem Qt installation directory
set QT_INSTALL_DIR=F:\Qt

rem Fritzing workspace directory
set FRITZING_WORKSPACE_DIR=\00_fritzing

rem Visual Studio installation directory
set VS_INSTALL_DIR=C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools
```

### Setting Custom Directories

You can customize the directories in two ways:

#### Method 1: Set environment variables before running the scripts

```batch
set QT_INSTALL_DIR=D:\CustomQtPath
set FRITZING_WORKSPACE_DIR=D:\FritzingBuild
set VS_INSTALL_DIR=D:\VisualStudio\2019\BuildTools
00_Download_Script.bat
```

#### Method 2: Edit the `directories_config.bat` file directly (recommended)  

After running the scripts once, you can edit the `directories_config.bat` file directly to change any of the directory paths. This is the recommended approach as your settings will be preserved between builds.  

### How It Works  

When you run `00_Download_Script.bat` for the first time, it checks if `directories_config.bat` exists:  

- If it exists, the script loads the configuration from it  
- If it doesn't exist, the script creates it with default values  

All other scripts in the build process load this configuration file before executing their tasks, ensuring consistent settings across the entire build process.  

### Important Notes  

- The file is created automatically by `00_Download_Script.bat` if it doesn't exist
- Manual edits to this file will be preserved  
- If you delete this file, it will be recreated with default values the next time you run `00_Download_Script.bat`  
- Make sure the directories you specify exist or can be created by the script  
- The workspace directory should be empty when you start the build process  

![ClipImage_20241028_142712_529](https://github.com/user-attachments/assets/e5e4fbf4-d4c5-42b7-8580-83737367361d)  
![ClipImage_20241028_142942_938](https://github.com/user-attachments/assets/7fc6c5e8-69a7-400e-867e-ec8a69823dcc)  


* Tested  
Windows 11 Real  
Windows 11 Windows Sandbox  
Windows 10 Windows Sandbox  

* Fritzing 1.0.0を合法的に無料で使用する方法、Windows環境 VS2019でビルドする方法  
http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/  

* Donation Button  
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=T79HPJ5H79PBU)  

* Youtube  
[<img src="https://img.youtube.com/vi/cC82PULJq6g/maxresdefault.jpg" alt="How to get Fritzing 1.0.0 for free - Compile Fritzing on Windows" title="How to get Fritzing 1.0.0 for free - Compile Fritzing on Windows" width="320" height="180"> YouTube https://youtu.be/cC82PULJq6g](https://youtu.be/cC82PULJq6g)  

* Youtube  
[<img src="https://img.youtube.com/vi/wLDuyNqms_g/maxresdefault.jpg" alt="Fritzing 1.0.0を無料でゲットする方法" title="Fritzing 1.0.0を無料でゲットする方法" width="320" height="180"> YouTube https://youtu.be/wLDuyNqms_g](https://youtu.be/wLDuyNqms_g)  

