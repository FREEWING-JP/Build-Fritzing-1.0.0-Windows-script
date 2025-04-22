# Changing the Qt Installation Directory

By default, the Fritzing build scripts will install Qt to `C:\Qt`. If you want to install Qt to a different directory, you can set the `QT_INSTALL_DIR` environment variable before running the scripts.

## Method 1: Set the environment variable temporarily in the command prompt

```
set QT_INSTALL_DIR=D:\CustomQtPath
00_Download_Script.bat
```

## Method 2: Set the environment variable permanently in Windows

1. Right-click on "This PC" or "My Computer" and select "Properties"
2. Click on "Advanced system settings"
3. Click on the "Environment Variables" button
4. Under "System variables" or "User variables", click "New"
5. Variable name: `QT_INSTALL_DIR`
6. Variable value: Your custom Qt path (e.g., `D:\CustomQtPath`)
7. Click "OK" to save

After setting the environment variable, run the scripts as usual. The Qt installation and all related operations will use your custom directory instead of the default `C:\Qt`.

## How It Works

All the build scripts have been modified to:

1. Read the `qt_config.bat` file created by `00_Download_Script.bat`
2. Use the `QT_INSTALL_DIR` environment variable for all Qt-related operations

This includes:
- Installing Qt to your custom directory
- Building with the Qt libraries from your custom directory
- Copying Qt DLLs from your custom directory

## Verifying the Qt Directory

When you run `00_Download_Script.bat`, it will display the Qt installation directory it's using:

```
Using Qt installation directory: D:\CustomQtPath
```

This confirms that your custom directory is being used correctly.
