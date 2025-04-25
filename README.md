# Build-Fritzing-1.0.4-Windows-script
Build Fritzing 1.0.4 Windows script

2024/10/28 Update Build Fritzing 1.0.4 (Reconfirmed on 2025/01/05)
2024/07/14 Update Build Fritzing 1.0.3
2024/01/11 Update Build Fritzing 1.0.2 (Reconfirmed on 2024/05/05)
2023/11/18 Update Build Fritzing 1.0.1

* How to Build Fritzing 1.0.4 from Source code in Windows with Visual Studio 2019
http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/

* Build Step
```
* Open Command Prompt

bitsadmin /TRANSFER hoge https://raw.githubusercontent.com/FREEWING-JP/Build-Fritzing-1.0.0-Windows-script/main/00_Download_Script.bat %cd%\00_Download_Script.bat

# Optional: Set custom directories
# set QT_INSTALL_DIR=D:\CustomQtPath
# set FRITZING_WORKSPACE_DIR=D:\FritzingBuild

00_Download_Script.bat

00_Execute_Script.bat

* Wait an hour
```

* Customization Options
  * You can change the Qt installation directory by setting the `QT_INSTALL_DIR` environment variable
  * You can change the Fritzing workspace directory by setting the `FRITZING_WORKSPACE_DIR` environment variable
  * See `README_QT_DIRECTORY.md` and `README_WORKSPACE_DIRECTORY.md` for details

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
